			global	_ft_strdup
			section	.text
			extern	_malloc

_ft_strdup:
			cmp		rdi, 0
			je		error

count:
			xor		rcx, rcx
			jmp		length_count

count_increment:
			inc		rcx

length_count:
			cmp		BYTE[rdi + rcx], 0
			jne		count_increment

malloc_call:
			inc		rcx
			push	rdi
			mov		rdi, rcx
			call	_malloc
			pop		rdi
			cmp		rax, 0
			je		error

copy_start:
			xor		rcx, rcx
			jmp		copy_string

copy_increment:
			inc		rcx

copy_string:
			mov		dl, BYTE[rdi + rcx]
			mov		BYTE[rax + rcx], dl
			cmp		dl, 0
			jne		copy_increment
			je		exit

error:
			mov		rax, 0

exit:
			ret