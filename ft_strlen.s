			global	_ft_strlen
			section	.text
_ft_strlen:
			xor		rax, rax			;making rax 0
			jmp		compare				;jump to compare label
increment:
			inc		rax					;rax value incrementing
compare:
			cmp		BYTE [rdi + rax], 0	;comparing rdi + rax byte with 0
										;used BYTE because expecting a char
										;	data
										;[reg + number] is a memory operand
			jne		increment			;jumping to increment if its false
done:
			ret