# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ikhadem <ikhadem@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/10 12:09:07 by ikhadem           #+#    #+#              #
#    Updated: 2020/01/10 18:57:37 by ikhadem          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

			global	_ft_strcpy
			section	.text
_ft_strcpy:
			xor		rcx, rcx ; rsi = src / rdi = dst
			xor		rdx, rdx
			cmp		rsi, 0
			jz		return
			jmp		copy
increment:
			inc		rcx
copy:
			mov		dl, BYTE [rsi + rcx]
			mov		BYTE [rdi + rcx], dl
			cmp		dl, 0
			jnz		increment

return:
			mov		rax, rdi
			ret