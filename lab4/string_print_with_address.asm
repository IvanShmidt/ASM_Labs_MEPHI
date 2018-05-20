%include "stud_io.inc"
global _start

section .data
string 	db "My string, my favourite string"
LENGTH equ $ - string

section .bss
arr	resd 5

section .text
_start:
	mov edi, arr
	mov esi, string	

	mov [edi], esi

	add esi, 14
	add edi, 4

	mov [edi], esi	

	mov ebx, [arr]
	mov eax, [ebx]
	PUTCHAR al

	mov ebx, [arr+4]
	mov eax, [ebx]
	PUTCHAR al

	PUTCHAR 10
	FINISH









