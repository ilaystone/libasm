section .text
    global  _ft_list_size

;size_t     ft_list_size(t_list *)
;rdi holds  t_list *lst
_ft_list_size:
    mov     rsi, rdi        ; rsi = *lst
    xor     rax, rax        ; rax = 0
loop_again:
    cmp     rdi, 0          ; if (rdi == null)
    je      exit            ; return
    inc     rax             ; rax++
    mov     rdi, [rdi + 8]  ; rdi = rdi->next
    jmp     loop_again      ; while (1)
exit:
    mov     rdi, rsi        ; restore lst
    ret