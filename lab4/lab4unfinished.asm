%include "stud_io.inc"
global _start

section .data
string 	db "My string, my NIFIGA nonPUTCHARable string"
LENGTH equ $ - string

section .bss
arr	resb 5

section .text
_start:
	mov edi, arr
	mov esi, string		;Адрес строки в ESI

	mov [edi], esi		;Адрес начала строки в первый элемент массива
	mov ebx, [edi]		;Перв. элем массива в регистр EBX
	mov eax, [ebx]		;Значение, хранячщееся по адресу EBX в EAX
	PUTCHAR al	

	inc  edi
	mov ecx, LENGTH		;Длина строки на счетчик - ECX

lp:	mov eax, [esi]			;Элемент печати на EAX
	PUTCHAR al			;Печать	
	cmp  al, 32			;Сравниваем элемент с пробелом
	jz new_str			;На перенос строки
next:	inc esi				;Инкремент адреса
	loop lp				

	PUTCHAR 10	
	PUTCHAR 33


	PUTCHAR 10
	FINISH

new_str:PUTCHAR 10			;Перенос строки
	inc esi
	mov [edi], esi
	mov ebx, [edi]		;Перв. элем массива в регистр EBX
	mov eax, [ebx]		;Значение, хранячщееся по адресу EBX в EAX
	PUTCHAR al
	inc edi			
	dec esi
	jmp next









