%include "stud_io.inc"
global _start

section .data
string 	db "The string, my NIFIGA nonPUTCHARable"
LENGTH equ $ - string
lenarr	db 5

section .bss
arr	resd 15

section .text
_start:
	mov	edi, arr		;Адрес массива в EDI
	mov	esi, string		;Адрес строки в ESI
	mov	ecx, LENGTH		;Длина строки на счетчик - ECX
	mov edx, 1			;Внимание! Счетчик слов в EDX

	
	PRINT "Слова из введенной строки:"
	PUTCHAR 10
	mov [edi], esi			;Адрес первого слова в первый элемент массива
	add edi, 4

lp	mov eax, [esi]			;Элемент строки на EAX
	PUTCHAR al			;Печать	
	cmp 	al, 32			;Сравниваем элемент с пробелом
	jz	new_str			;На перенос строки
	inc esi				;Инкремент адреса строки
next:	loop lp				
;----------------------------------------
	PUTCHAR 10
	PRINT "Now an Experiment:"
	PUTCHAR 10
	
	mov [lenarr], edx

	mov ecx, [lenarr]
	mov edx, 1			;Счетчик букв в слове

begsrt:	mov esi, arr
sortstr:mov ebx, [esi]
	add ebx, edx
	mov eax, [ebx]
	cmp al, 32
	jz write
	add esi, 4
	loop sortstr

nextw:	inc edx
	cmp edx, LENGTH
	jz afteral
	mov ecx, [lenarr]
	jmp begsrt

write:	;PRINT "печатаем слово:"
	PUTCHAR 32
	sub ebx, edx
nextlet:mov eax, [ebx]
	PUTCHAR al
	inc ebx
	cmp al, 32
	jz nextw
	jmp nextlet
	

afteral:PUTCHAR 10
	FINISH

new_str:PUTCHAR 10			;Перенос строки
	inc edx				;Увеличиваем счетчик слов
	inc esi
	mov [edi], esi 			
	
	add edi, 4			;Смещение в 4
	jmp next









