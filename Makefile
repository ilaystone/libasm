# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ikhadem <ikhadem@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/10 08:39:23 by ikhadem           #+#    #+#              #
#    Updated: 2021/02/25 15:00:29 by ikhadem          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

SRC =	ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s \
		ft_strdup.s\
		ft_read.s \

OBJ = $(SRC:.s=.o)

NA = nasm
NA_FLAGS = -f macho64
FLAGS = -Wall -Wextra -Werror

%.o : %.s
	$(NA) $(NA_FLAGS) $<

all : $(NAME)

$(NAME) : $(OBJ)
	ar rcs $(NAME) $(OBJ)

clean :
	rm -rf $(OBJ)

fclean : clean
	rm -rf $(NAME)

re : fclean all

test: re
	gcc main.c libasm.a
