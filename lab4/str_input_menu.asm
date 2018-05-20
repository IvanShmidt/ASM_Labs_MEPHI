%include "stud_io.inc"
%include "syscall_io.inc"
global _start

section .data
string 	db "my string, my nIFIGa nonPUTCHARable string lippp top top"
LENGTH equ $ - string
st	db ""
ans	db ""
tex	db ""
section .bss
arr	resd LENGTH


section .text
_start:

menu:	PRINT "а)ввести строку до 20 симв.(1)"
	PUTCHAR 10
	PRINT "б)ввести строку до 40 симв.(2)"
	PUTCHAR 10
	PRINT "в)Вывести строку из файла(3)"
	PUTCHAR 10
	PRINT "v)Выход.(4)"
	PUTCHAR 10

	syscall	3, 0, ans, 2			;Нужно два байта, 2й для переноса стр
	mov bl, [ans]

	;mov ebx, 20				;Можно из регистра подать на syscall

	cmp bl, "1"
	jz str20
	cmp bl, "2"
	jz str40
	cmp bl, "3"
	;
	cmp bl, "4"
	jz exit
	

str20:	PRINT "Предл. из 20ти букв:"
	syscall	3, 0, st, 20
	jmp output
str40:	PRINT "Предл. из 40ка букв:"
	syscall	3, 0, st, 40
	jmp output


output:	mov ecx, 40
	mov esi, st
print:	mov eax, [esi]
	PUTCHAR al
	inc esi
	loop print
	;jmp menu


exit:
	FINISH






	






