%include "stud_io.inc"
global _start

section .data
string 	db "My string, my NIFIGA nonPUTCHARable string"
LENGTH equ $ - string

section .bss
arr	resw 5

section .text
_start:
	mov	edi, arr		;Адрес массива на EDI
	mov	ebx, 0			;Смещение 0 в EBX
	;mov	al, [string]		;
	mov	ecx, LENGTH		;Длина строки на счетчик - ECX
again:
	mov al, [string+ebx]		;Элемент для печати на AL
	PUTCHAR al			;Пчать AL
	cmp 	al, 32			;Сравниваем элемент с пробелом
	jz	new_str			;На перенос строки
next:	inc 	ebx			;Уменьш. счетчик

	loop again

	;mov eax, edi
	;PUTCHAR ah

	PUTCHAR 10
	FINISH

new_str:PUTCHAR 10			;Перенос строки
	mov edi, [string+ebx]		;Элемент строки в массив
	add edi, 2			;Смещение в 2
	jmp next			;Возврат












