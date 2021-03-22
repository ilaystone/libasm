    global  _ft_list_remove_if
    section .text

;void   ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)())
;rdi	t_list **begin_list
;rsi	void *data_ref
;rdx	int (*cmp)(void *, void *)
;rcx	int (*free_fct)(void *)
_ft_list_remove_if:
	push	r15				; r15 => current
	push	r14				; r14 => previous
	push	r13				; tmp
	mov		r15, [rdi]		; r15 = *begin
	mov		r14, 0			; r14 = null
list_loop:
	cmp		r15, 0			; if (current == null)
	je		return			;		break;
	push	rdi
	push	rsi
	push	rdx
	push	rcx
	mov		rdi, [r15]		; rdi = current->data
	call	rdx				; rax = (cmp)(current->data, data_ref)
	pop		rcx
	pop		rdx
	pop		rsi
	pop		rdi
	cmp		rax, 0			; if (rax == 0)
	je		ref_exits
	mov		r14, r15		; previous = current
	mov		r15, [r15 + 8]	; current = current->next
	jmp		list_loop
ref_exits:
	cmp		r14, 0			; if (previous == 0)
	je		has_no_previous
has_previous:
	mov		r13, [r15 + 8]	; r13 = current->next
	mov		[r14 + 8], r13	; previous->next = r13
	push	rdi
	push	rsi
	push	rdx
	push	rcx
	mov		rdi, r15		; rdi = current
	call	rcx				; free_fct(current)
	pop		rcx
	pop		rdx
	pop		rsi
	pop		rdi
	mov		r15, [r14 + 8]	; current = previous->next
	jmp		list_loop
has_no_previous:
	mov		r13, [r15 + 8]	; r13 = current->next
	mov		[rdi], r13		; *begin_list = r13
	push	rdi
	push	rsi
	push	rdx
	push	rcx
	mov		rdi, r15		; rdi = current
	call	rcx				; free_fct(current)
	pop		rcx
	pop		rdx
	pop		rsi
	pop		rdi
	mov		r15, [rdi]		; current = *begin_list
	jmp		list_loop
return:
	pop		r13
	pop		r14
	pop		r15
	ret