# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ikhadem <ikhadem@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/10 18:21:14 by ikhadem           #+#    #+#              #
#    Updated: 2020/01/10 18:40:02 by ikhadem          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

				global	_ft_strdup
				extern	_malloc
				section	.text

_ft_strdup:
				cmp		rdi, 0
				je		error

count:
				mov		rcx, 0
				jmp		len_count

increment:
				inc		rcx

len_count:
				cmp		BYTE [rdi + rcx], 0
				jne		increment

malloc_call:
				inc		rcx
				push	rdi
				mov		rdi, rcx
				call	_malloc
				pop		rdi
				cmp		rax, 0
				je		error

copy_start:
				mov		rcx, 0
				jmp		copy_str

copy_increment:
				inc		rcx

copy_str:
				mov		dl, BYTE [rdi + rcx]
				mov		BYTE [rax + rcx], dl
				cmp		dl, 0
				jne		copy_increment
				jmp		exit

error:
			mov		rax, 0

exit:
			ret