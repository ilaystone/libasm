                global  _ft_list_size
                section .text

_ft_list_size:
                mov     rsi, rdi
                xor     rax, rax
loop_again:
                cmp     rdi, 0
                je      exit
                inc     rax
                mov     rdi, [rdi + 8]
                jmp     loop_again
exit:
                mov     rdi, rsi
                ret