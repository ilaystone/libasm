# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ikhadem <ikhadem@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/10 08:39:23 by ikhadem           #+#    #+#              #
#    Updated: 2021/03/22 15:56:31 by ikhadem          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

SRC =			ft_strlen.s \
				ft_strcpy.s \
				ft_strcmp.s \
				ft_write.s \
				ft_strdup.s\
				ft_read.s \

BONUS_SRC =		ft_atoi_base_bonus.s \
				ft_list_push_front_bonus.s \
				ft_list_size_bonus.s \
				ft_list_sort_bonus.s \
				ft_list_remove_if_bonus.s \

OBJ = $(SRC:.s=.o)

BONUS_OBJ = $(BONUS_SRC:.s=.o)

NA = nasm
NA_FLAGS = -f macho64
FLAGS = -Wall -Wextra -Werror

%.o : %.s
	$(NA) $(NA_FLAGS) $<

all : $(NAME)

$(NAME) : $(OBJ)
	ar rcs $(NAME) $(OBJ)

clean :
	rm -rf $(OBJ) $(BONUS_OBJ)

fclean : clean
	rm -rf $(NAME)

re : fclean all

%.o : %.s
	$(NA) $(NA_FLAGS) $<

bonus : $(OBJ) $(BONUS_OBJ)
	ar rcs $(NAME) $(OBJ) $(BONUS_OBJ)

re_bonus : fclean bonus