%include "stud_io.inc"
%include "syscall_io.inc"

section .data
msg	db "hello world, nice day to go to to univer", 10
msg_len	equ $-msg
st	db ""
r_addr	db "read_file"

section	.text
global _start

_start	PRINT "Строка для записи в файл:"
	PUTCHAR 10

	syscall 4, 1, msg, msg_len	;вывод строки msg
	PUTCHAR 10	

	;syscall 5, r_addr, 0		;открытие на чтение
	;syscall 3, eax, st, 30		;чтение
	;syscall 6, eax			;закрытие
	;syscall 4, 1, st, 30
	


	PRINT "Производится запись"
	PUTCHAR 10

	syscall 5, w_addr, 241h, 0666q			;запись в файл
	syscall 4, eax, msg, msg_len
	syscall 6, eax

	PRINT "Завершение"
	PUTCHAR 10
	FINISH

;	mov ecx, 20
;	mov esi, st
;print:	mov eax, [esi]
;	PUTCHAR al
;	inc esi
;	loop print


section .data
w_addr	db "write_file"

