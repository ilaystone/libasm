section	.text
			global	_ft_write
			extern	___error

_ft_write:
			mov		rax, 0x2000004	;0x200000 to mark it for the BSD layer
									;and the las t digit marks the call and it s
									;refrense is in <unistd.h>
			syscall
			jc		error
			ret

error:
			push	rax
			call	___error
			pop		rdi
			mov		[rax], rdi
			mov		rax, -1
			ret