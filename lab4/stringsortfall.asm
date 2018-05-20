%include "stud_io.inc"
global _start

section .data
string 	db "My string, my NIFIGA nonPUTCHARable string lippp top top"
LENGTH equ $ - string

section .bss
arr	resd 15

section .text
_start:
	mov	edi, arr		;Адрес массива в EDI
	mov	esi, string		;Адрес строки в ESI
	mov	ecx, LENGTH		;Длина строки на счетчик - ECX
	mov edx, 1			;Внимание! Счетчик слов в EDX

	

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

	mov ecx, edx
	mov edx, 1			;Счетчик букв в слове

	mov esi, arr
sortstr:mov ebx, [esi]
	add ebx, edx
	PRINT "_Now2_"
	mov eax, [ebx]
	PUTCHAR al
	cmp eax, 32
	jz write
	inc esi
	PRINT "_loop_"
	loop sortstr

nextw:	inc edx
	cmp edx, LENGTH
	jz afteral
	jmp sortstr

write:	sub ebx, edx
nextlet:mov eax, [ebx]
	PUTCHAR al
	inc ebx
	cmp al, 32
	jz nextw
	jmp nextlet
	


;----------------
;	PUTCHAR 10			;Был вывод первых букв слов, пока EDX не затерся
;	mov ecx, edx
;	mov esi, arr
;
;label:	mov ebx, [esi]
;	mov eax, [ebx]
;	PUTCHAR al
;	add esi, 4
;	loop label

;afteral:PUTCHAR 10
	FINISH
;-----------------------------------------
new_str:PUTCHAR 10			;Перенос строки
	inc edx				;Увеличиваем счетчик слов
	inc esi
	mov [edi], esi 			
	
	add edi, 4			;Смещение в 4
	jmp next

;В строке хотя бы одно слово, строка не нач. и не зак. пробелом, слова разд. одним пробелом








