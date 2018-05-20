%include "stud_io.inc"
%include "syscall_io.inc"
global _start

section .data
string 	db "my string, my nIFIGa nonPUTCHARable string lippp top top"
LENGTH equ $ - string
st	db 32

section .bss
arr	resd LENGTH
stt	resb 1	

section .text
_start:
	PRINT "1)ввести строку до 15 симв.(1)"
	PUTCHAR 10
	PRINT "2)ввести строку до 25 симв.(2)"
	mov edi, st
	GETCHAR
	cmp eax, "1"
	jz str15
	cmp eax, "2"
	jz str25

str15:	mov ecx, 15
	jmp enter
str25:	mov ecx, 25

enter:	GETCHAR
	mov [edi], eax
	cmp eax, 10
	jz endstr
	inc edi
	loop enter
;endstr:	mov byte [edi], 0
	mov byte [edi], 0

	mov esi, st
print:	mov eax, [esi]
	PUTCHAR al
	inc esi
	cmp eax, 0
	jnz print
	
	FINISH






