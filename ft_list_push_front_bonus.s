section .text
    global  _ft_list_push_front
    extern	_malloc

;void       ft_list_push_front(t_list **, void *)
;rdi has head of list
;rsi has the data
_ft_list_push_front:
    push    rcx
    push    rdi
    push    rsi
    mov     rdi, 16         ; rdi = 16
    call    _malloc         ; rax = malloc(rdi)
    pop     rsi
    pop     rdi
    cmp     rax, 0          ; if (rax == null)
    je      exit            ; return
    mov     [rax], rsi      ; rax->data = rsi
    mov     rdx, 0
    mov     [rax + 8], rdx    ; rax->next = null
    mov     rcx, [rdi]      ; rcx = *begin_list
    mov     [rax + 8], rcx  ; rax->next = rcx
    mov     [rdi], rax      ; *begin_list = rax
exit:
    pop     rcx
    ret