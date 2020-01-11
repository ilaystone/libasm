# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ikhadem <ikhadem@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/10 12:09:09 by ikhadem           #+#    #+#              #
#    Updated: 2020/01/10 19:00:33 by ikhadem          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

			global	_ft_strcmp
			section	.text
_ft_strcmp:
			xor		rcx, rcx
			cmp		rdi, 0
			je		equals
			cmp		rsi, 0
			je		equals
			jne		compare

increment:
			cmp		BYTE [rdi + rcx], 0
			je		equals
			inc		rcx

compare:
			mov		dl, BYTE [rsi + rcx]
			cmp		BYTE [rdi + rcx], dl
			je		increment
			jl		inferior

superior:
			mov		rax, 1
			ret

equals:
			mov		rax, 0
			ret

inferior:
			mov		rax, -1
			ret