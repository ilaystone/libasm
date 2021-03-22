section	.text
	global	_ft_strdup
	extern	_malloc

;char		*ft_strdup(const char *)
;rdi holds	const char *s1
_ft_strdup:
	cmp		rdi, 0				; if (s1 == null)
	je		error				; exit error
count:
	xor		rcx, rcx			; rcx = 0
	jmp		length_count
count_increment:
	inc		rcx					; rcx++
length_count:
	cmp		BYTE[rdi + rcx], 0	; if (rdi[rcx] == 0)
	jne		count_increment		; break
malloc_call:
	inc		rcx					; rcx++
	push	rdi
	mov		rdi, rcx			; rdi = rcx (size of s1)
	call	_malloc				; rax = malloc(size of s1)
	pop		rdi
	cmp		rax, 0				; if malloc fails
	je		error				; exit error
copy_start:
	xor		rcx, rcx			; rcx = 0
	jmp		copy_string
copy_increment:
	inc		rcx					; rcx++
copy_string:
	mov		dl, BYTE[rdi + rcx]	; dl = rdi[rcx]
	mov		BYTE[rax + rcx], dl	; rax[rcx] = dl
	cmp		dl, 0
	jne		copy_increment		; if (!dl == '\0')	increment
	je		exit				; if (dl == '\0')	exit
error:
	mov		rax, 0
exit:
	ret