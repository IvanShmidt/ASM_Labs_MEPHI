%include "stud_io.inc"
%include "syscall_io.inc"

section .data
msg	db "hello world, hey my dear,I love you", 10
msg_len	equ $-msg
st	db ""

section	.text
global _start

_start	;syscall 4, 1, msg, msg_len	;вывод строки msg
	
	syscall	5, r_addr, 0		;открытие на чтение
	syscall	3, eax, st, 25		;чтение
	syscall 6, eax			;закрытие

	syscall	4, 1, st, 25
	PRINT "Теперь запись"
	PUTCHAR 10

	syscall 5, w_addr, 241h, 0666q			;запись в файл
	syscall 4, eax, msg, msg_len
	syscall 6, eax



;	mov ecx, 20
;	mov esi, st
;print:	mov eax, [esi]
;	PUTCHAR al
;	inc esi
;	loop print
	
	PRINT "Завершение"
	PUTCHAR 10
	FINISH

section .data
w_addr	db "yyy"
r_addr	db "xxx"
