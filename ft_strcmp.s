			global	_ft_strcmp
			section	.text
_ft_strcmp:
			xor		rax, rax
			jmp		compare

increment:
			cmp		BYTE[rdi], 0
			je		exit
			inc		rdi
			inc		rsi

compare:
			mov		dl, BYTE [rdi]
			mov		cl, BYTE [rsi]
			movzx	rdx, dl
			movzx	rcx, cl
			cmp		rdx, rcx
			je		increment
			jl		inferior
			jg		superior

inferior:
			mov		rax, -1
			jmp		exit
superior:
			mov		rax, 1
			jmp		exit

exit:
			ret