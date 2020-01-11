# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ikhadem <ikhadem@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/10 11:02:27 by ikhadem           #+#    #+#              #
#    Updated: 2020/01/10 20:46:04 by ikhadem          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

			global	_ft_strlen
			section	.text
_ft_strlen:
			mov		rax, 0				;making rax 0
			cmp		rdi, 0
			je		done
			jmp		compare				;jump to compare label
increment:
			inc		rax					;rax value incrementing
compare:
			cmp		BYTE [rdi + rax], 0	;comparing rdi + rax byte with 0
											;[reg + number] is a memory operand
			jne		increment			;jumping to increment if its false
done:
			ret
