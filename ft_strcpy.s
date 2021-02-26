			global	_ft_strcpy
			section	.text

_ft_strcpy:
			xor		rcx, rcx
			jmp		copy
copy:
			cmp		BYTE [rsi + rcx], 0
			je		done
			mov		dl, BYTE[rsi + rcx]
			mov		BYTE[rdi + rcx], dl
			inc		rcx
			jmp		copy
done:
			mov		BYTE[rdi + rcx], 0
			mov		rax, rdi
			ret