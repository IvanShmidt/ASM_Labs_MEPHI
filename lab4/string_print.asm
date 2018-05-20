%include "stud_io.inc"
global _start

section .data
string 	db "My string, my NIFIGA nonPUTCHARable string"
LENGTH equ $ - string

section .text
_start:
	mov	ebx, 0
	mov	al, [string]
	mov	ecx, LENGTH
again:

	;PUTCHAR [string + eax]		leave it here, because it works!

	mov al, [string+ebx]
	PUTCHAR al
	cmp 	al, 32
	jz	new_str	
next:	inc 	ebx
	
	loop again
	FINISH

new_str:PUTCHAR 10
	jmp next












