                    global  _ft_list_push_front
                    section .text
                    extern	_malloc


;rdi has head of list
;rsi has the data
_ft_list_push_front:
                    push    rdi
                    push    rsi
                    mov     rdi, 16
                    call    _malloc
                    pop     rsi
                    pop     rdi
                    cmp     rax, 0
                    je      exit
                    mov     [rax], rsi
                    mov     rcx, [rdi]
                    mov     [rax + 8], rcx
                    mov     [rdi], rax
exit:
                    ret