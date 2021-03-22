section	.text
	global	_ft_strlen

;size_t    	ft_strlen(char *)
;rdi holds	char *
_ft_strlen:
			xor		rax, rax			; rax = 0
			jmp		compare				; go to compare
increment:
			inc		rax					; rax += 1
compare:
			cmp		BYTE [rdi + rax], 0	; if (!(rdi[rax] == 0))
			jne		increment			; got to increment if it not a zero
done:
			ret