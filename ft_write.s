# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ikhadem <ikhadem@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/10 18:54:36 by ikhadem           #+#    #+#              #
#    Updated: 2020/01/10 20:02:12 by ikhadem          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

			global	_ft_write
			section	.text
_ft_write:
			cmp		rsi, 0
			je		error
			mov		rax, 0x2000004	; need to add 0x200000 in the mix
									; (havent figured why)
			syscall
			ret

error:
			mov		rax, -1
			ret