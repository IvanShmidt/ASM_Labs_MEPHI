;print_al - выводит младший байт регистра RAX, то есть AL
;rax_to_bin - выводит регистр RAX в бинарном виде
;rax_to_hex  - выводит регистр RAX в шестнадцатиричной системе
;rax_to_udec  - выводит регистр RAX в десятичном виде, считая,  что там записано беззнаковое число
;rax_to_sdec  - выводит регистр RAX в десятичном виде, считая,  что там записано знаковое число




print_al:
    push rbx
    push rcx
    push rdx
    push rax
       
	
	mov rdx, 1
	mov [one_num], al
	mov rcx, one_num
	mov rbx, 1	
	mov rax, 4
	int 80h

	
	pop rax
	pop rdx
	pop rcx
	pop rbx
ret



ax_to_bin:
    push rax
	push rcx
	push rbx
	
	mov rcx, 16
	rol rax, 48
	xor rbx, rbx
	.etb_bit_lp:
		rol rax, 1
		jc .etb_print_one
		.etb_print_zero:
			push rax
			mov al, '0'
			call print_al
			pop rax
			
			jmp .etb_end_print	
		.etb_print_one:
			
			push rax
			mov al, '1'
			call print_al
			pop rax
			
			inc rbx
		.etb_end_print:
	loop .etb_bit_lp
	
	push rax
	mov al, 'b'
	call print_al
	mov al, 0x0A
	call print_al
	pop rax
	
	
	pop rbx
	pop rcx
	pop rax
ret


rax_to_bin:
    push rax
	push rcx
	push rbx
	
	mov rcx, 64
	xor rbx, rbx
		.etb_bit_lp:
		rol rax, 1
		jc .etb_print_one
		.etb_print_zero:
		    test rbx, rbx
			jz .etb_end_print
		    
			push rax
			mov al, '0'
			call print_al
			pop rax
			
			jmp .etb_end_print	
		.etb_print_one:
			
			push rax
			mov al, '1'
			call print_al
			pop rax
			
			inc rbx
		.etb_end_print:
	loop .etb_bit_lp

	
	push rax
	mov al, 'b'
	call print_al
	mov al, 0x0A
	call print_al
	pop rax
	
	
	pop rbx
	pop rcx
	pop rax
ret

rax_to_hex:
    push rax
	push rcx
	push rbx
	
	push rax
	mov al, '0'
	call print_al
	mov al, 'x'
	call print_al
	pop rax
	
	mov rcx, 16
	.eth_lp:
		rol rax, 4
		mov rbx, rax
		and rbx, 0Fh
		
		cmp rbx, 10
		jl .eth_print
			add rbx, 39
		.eth_print:
		
		add rbx, 30h		
	    
	    push rax
	    mov al, bl
	    call print_al
	    pop rax    
	    
	loop .eth_lp
	
	push rax
	mov al, 0x0A
	call print_al
	pop rax
	
	pop rbx
	pop rcx
	pop rax
ret

    


rax_to_udec:
	push rax; делимое, аргумент функции
	push rcx; счетчик цикла
	push rbx; делитель
	push rdx; остаток
	
	mov rbx, 10
	xor rcx, rcx
	
	.etu_lp_div:
		div rbx
		push rdx
		xor rdx, rdx
		inc rcx
	cmp rax, 0
	jnz .etu_lp_div
	
	.etu_lp_print:
		pop rax
		add rax, '0'
		call print_al
	    
	loop .etu_lp_print
	
	mov rax, 0x0A
	call print_al
		
	
	pop rdx
	pop rbx
	pop rcx
	pop rax
ret

rax_to_sdec:
	push rax
	
	test rax, rax
	jns .ets_unsidned
	
		push rax
        mov al, '-'
        call print_al
        pop rax

		neg rax
	.ets_unsidned:
	call rax_to_udec
	
	pop rax
ret





section .data
    one_num  db '*'
