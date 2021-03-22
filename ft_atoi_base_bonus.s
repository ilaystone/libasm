				global	_ft_atoi_base
				section	.text

;rdi will hold str
;rsi will hold base
_ft_atoi_base:
				xor		rax, rax
atoi_get_base_length:
				xor		rcx, rcx
				jmp		get_base_length
atoi_skip_ws:
				jmp		skip_white_spaces
atoi_find_sign:
				jmp		determine_sign
atoi_get_nbr:
				xor		rdx, rdx
				xor		rax, rax
				jmp		get_nbr
atoi_exit_nbr:
				imul	rax, r14
				jmp		exit


; gets nbr from base and convert it to base 10
; if nbr doesn't exist in base exit error
; returns result in rax
inc_get_nbr:
				imul	rax, rcx
				add		rax, rdx
				inc		rdi
get_nbr:
				cmp		BYTE[rdi], 0
				je		atoi_exit_nbr
				xor		rdx, rdx
				jmp		get_nbr_from_base
inc_get_nbr_from_base:
				inc		rdx
get_nbr_from_base:
				cmp		BYTE[rsi + rdx], 0
				je		atoi_exit_nbr
				mov		r15b, BYTE[rdi]
				cmp		r15b, BYTE[rsi + rdx]
				je		inc_get_nbr
				jmp		inc_get_nbr_from_base


;sets the return sign
determine_sign:
				mov		r14, 1
				cmp		BYTE[rdi], '-'
				je		negative_sign
				cmp		BYTE[rdi], '+'
				je		positive_sign
				jmp		atoi_get_nbr
positive_sign:
				inc		rdi
				jmp		atoi_get_nbr
negative_sign:
				inc		rdi
				mov		r14, -1
				jmp		atoi_get_nbr


; skip White Spaces
; exit if reached end
inc_white_space:
				inc		rdi
skip_white_spaces:
				cmp		BYTE[rdi], 9	;\h
				je		inc_white_space
				cmp		BYTE[rdi], 10	;\n
				je		inc_white_space
				cmp		BYTE[rdi], 11	;\v
				je		inc_white_space
				cmp		BYTE[rdi], 12	;\f
				je		inc_white_space
				cmp		BYTE[rdi], 13	;\n
				je		inc_white_space
				cmp		BYTE[rdi], 32	;space ' '
				je		inc_white_space
				cmp		BYTE[rdi], 0	;\0
				je		exit_error
				jmp		atoi_find_sign


;checks base length and store it in rcx
;exits if length is 0 or 1
;exits if base has + or -
;exits if base has duplicate elements
get_base_length:
				cmp		BYTE[rsi], 0
				je		exit_error
				cmp		BYTE[rsi + 1], 0
				je		exit_error
				cmp		BYTE[rsi + rcx], 9	;\h
				je		exit_error
				cmp		BYTE[rsi + rcx], 10	;\n
				je		exit_error
				cmp		BYTE[rsi + rcx], 11	;\v
				je		exit_error
				cmp		BYTE[rsi + rcx], 12	;\f
				je		exit_error
				cmp		BYTE[rsi + rcx], 13	;\n
				je		exit_error
				cmp		BYTE[rsi + rcx], 32	;space ' '
				je		exit_error
				cmp		BYTE[rsi + rcx], '+'
				je		exit_error
				cmp		BYTE[rsi + rcx], '-'
				je		exit_error
				xor		rax, rax
				xor		r9, r9
				jmp		count_duplicates
inc_get_base_length:
				cmp		rax, 1
				jne		exit_error
				inc		rcx
				cmp		BYTE[rsi + rcx], 0
				jne		get_base_length
				jmp		atoi_skip_ws
counter_duplicates:
				inc		rax
inc_count_duplicates:
				inc		r9
count_duplicates:
				mov		dl, BYTE[rsi + r9]
				cmp		dl, BYTE[rsi + rcx]
				je		counter_duplicates
				cmp		dl, 0
				jne		inc_count_duplicates
				jmp		inc_get_base_length

exit_error:
				xor		rax, rax
exit:
				ret