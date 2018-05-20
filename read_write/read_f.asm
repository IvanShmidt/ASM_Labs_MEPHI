%include "stud_io.inc"
%include "syscall_io.inc"

section .data
msg	db "hello world, nice day to go to to univer", 10
msg_len	equ $-msg
st	db ""
r_addr	db "read_file"

section	.text
global _start

_start	PRINT "Читаем из файла строку:"
	PUTCHAR 10

	syscall 5, r_addr, 0		;открытие на чтение
	syscall 3, eax, st, 60		;чтение
	syscall 6, eax			;закрытие
	syscall 4, 1, st, 55
	

	PRINT "Завершение"
	PUTCHAR 10
	FINISH


