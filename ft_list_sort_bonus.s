section .text
	global  _ft_list_sort

;void	ft_list_sort(t_list **begin_list, int (*cmp)())
;rdi	t_list	**begin_list
;rsi	int (*cmp)(void *, void *)
section .text
_ft_list_sort:
	push	r12
	push	r11
	push	r10
	push	r8
	mov		rcx, rsi
	cmp		qword [rdi], 0		; if (begin_list == null)
	je		return
	mov		r12, rdi			; store head of list
	mov		rdi, [r12]			; rdi = *begin_list
	cmp		rdi, 0				; if (*begin_list == null)
	je		return
	cmp		rsi, 0				; if (cmp == null)
	je		return
while:
	mov		r8, [rdi + 8]		; r8 = rdi->next
	cmp		r8, 0				; if (!rdi->next)
	je		return
	push	rcx
	push	rdi
	push	rsi
	mov		rdi, [rdi]			; rdi = rdi->data
	mov		rsi, [r8]			; rsi = rdi->next->data
	call	rcx					; rax = (*cmp)(rdi->data, rdi->next->data)
	pop		rsi
	pop		rdi
	pop 	rcx
	jg		swap				; if (rax > 0) swap
	mov		rdi, [rdi + 8]		; rdi = rdi->next
	jmp		while
swap:
	mov		r10, [rdi]			; r10 = rdi->data
	mov		r11, [r8]			; r11 = rdi->next->data
	mov		[r8], r10			; rdi->next->data = r10
	mov		[rdi], r11			; rdi->data= r11
	mov		rdi, [r12]			; rdi = *begin_list
	jmp		while
return:
	mov		rdi, r12			; restore head
	pop		r8
	pop		r10
	pop		r11
	pop		r12
	ret
