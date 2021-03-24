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
			movzx	rdx, BYTE [rdi]	; rdx = *rdi
			movzx	rcx, BYTE [rsi]	; rcx = *rsi
			cmp		rdx, rcx
			je		increment		; if (rdx == rcx)	increment
			sub		rdx, rcx
			mov		rax, rdx
exit:
			pop		rcx
			ret