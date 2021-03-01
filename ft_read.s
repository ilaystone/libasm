			global	_ft_read
			section	.text
			extern	___error

_ft_read:
			mov		rax, 0x2000003; adding 0x200000 to mark it for the BSD layer
									; get the call number from asm/unistd.h
			syscall
			jc 		error
			ret

error:
			push	rax
			call	___error
			pop		rdx
			mov		[rax], rdx
			mov		rax, -1
			ret