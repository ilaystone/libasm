section	.text
	global	_ft_strcmp

;int		ft_strcmp(const char *, const char *)
;rdi holds	const char *s1
;rsi holds	const char *s2
_ft_strcmp:
			push	rcx
			xor		rax, rax		; rax = 0
			jmp		compare			; start loop
increment:
			cmp		BYTE[rdi], 0	; if (rdi[rax] == 0)
			je		exit			; break;
			inc		rdi				; rdi++
			inc		rsi				; rsi++
compare:
			mov		dl, BYTE [rdi]	; dl = *rdi
			mov		cl, BYTE [rsi]	; cl = *rsi
			movzx	rdx, dl			; convert to 64-bit unsigned value
			movzx	rcx, cl			; convert to 64-bit unsigned value
			cmp		rdx, rcx
			je		increment		; if (rdx == rcx)	increment
			jl		inferior		; if (rdx < rcx)	return -1
			jg		superior		; if (rdx > rcx)	return 1
inferior:
			mov		rax, -1
			jmp		exit
superior:
			mov		rax, 1
			jmp		exit
exit:
			pop		rcx
			ret