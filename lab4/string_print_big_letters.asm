%include "stud_io.inc"
global _start

section .data
string 	db "my string, my nIFIGa nonPUTCHARable string lippp top top"
LENGTH equ $ - string

section .bss
arr	resd LENGTH

section .text
_start:
	mov	edi, arr		;Адрес массива в EDI
	mov	esi, string		;Адрес строки в ESI
	mov	ecx, LENGTH		;Длина строки на счетчик - ECX
	mov edx, 1			;Внимание! Счетчик слов в EDX

	mov [edi], esi			;Адрес первого слова в первый элемент массива
	add edi, 4

lp:	mov eax, [esi]			;Элемент строки на EAX
	;inc bh
	PUTCHAR al			;Печать	
	cmp 	al, 32			;Сравниваем элемент с пробелом
	jz	new_str			;На перенос строки
	inc esi				;Инкремент адреса строки
next:	loop lp				
;-------------------------------------;вывод 
	PUTCHAR 10
	PRINT "Первые буквы слов в строке:"
	PUTCHAR 10
	mov ecx, edx
	mov esi, arr

label:	mov ebx, [esi]
	mov eax, [ebx]
	
	sub eax, 32
	PUTCHAR al
	add esi, 4
	loop label

	PUTCHAR 10
	FINISH
;---------------------------------------
new_str:PUTCHAR 10			;Перенос строки
	inc edx				;Увеличиваем счетчик слов
	inc esi
	mov [edi], esi 			
	add edi, 4			;Смещение в 4
	jmp next

;В строке хотя бы одно слово, строка не нач. и не зак. пробелом, слова разд. одним пробелом


