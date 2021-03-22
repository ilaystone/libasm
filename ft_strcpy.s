section	.text
	global	_ft_strcpy

;char        *ft_strcpy(char *, const char *)
;rdi holds	char *dst
;rsi holds	char *src
_ft_strcpy:
			push	rcx
			xor		rcx, rcx			; rcx = 0
			jmp		copy				; go to copy
copy:
			cmp		BYTE [rsi + rcx], 0	; if (rsi[rcx] == 0)
			je		done				; 	break
			mov		dl, BYTE[rsi + rcx]	; dl = rsi[rcx]
			mov		BYTE[rdi + rcx], dl ; rdi[rcx] = dl
			inc		rcx					; rcx += 1
			jmp		copy				; while (true)
done:
			mov		BYTE[rdi + rcx], 0	; rdi[rcx] = '\0'
			mov		rax, rdi			; return (rdi)
			pop		rcx
			ret