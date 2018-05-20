%include "stud_io.inc"
%include "syscall_io.inc"
global _start

section .data
;string 	db "my string, my nIFIGa nonPUTCHARable string lippp top top"
;LENGTH equ $ - string
st	db ""
ans	db ""
tex	db ""

section .bss
arr	resd 20
aar	resd 10

section .text
_start:

menu:	PRINT "а)ввести строку до 30 симв.(1)"
	PUTCHAR 10
	PRINT "б)ввести строку до 50 симв.(2)"
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
	syscall	3, 0, st, 30
	jmp output
str40:	PRINT "Предл. из 40ка букв:"
	syscall	3, 0, st, 50
	jmp output				


;-----------------------------
proc:	syscall 4, 1, st, 50
	jmp exit	


;----------------------------

output:	mov edi, aar
	mov esi, st
	mov ecx, 50			;Длина строки на счетчик - ECX
	mov edx, 1

	mov [edi], esi
	add edi, 4	
	;mov ebx, [edi]
	;mov eax, [ebx]
	;PUTCHAR al 
	;PUTCHAR10

			;Адрес строки в ESI

print:	mov eax, [esi]
	PUTCHAR al
	cmp al, 32
	jz new_str
	inc esi
next:	loop print
	jmp letrs


new_str:PUTCHAR 10			;Перенос строки
	inc edx				;Увеличиваем счетчик слов
	inc esi
	mov [edi], esi

	mov ebx, [edi]
	mov eax, [ebx]
	PUTCHAR al 
			
	add edi, 4			;Смещение в 4
	jmp next
;-------------------------------

letrs:	mov esi, aar
	mov ecx, edx
nxtlet:	mov ebx, [esi]
	mov eax, [ebx]
	PUTCHAR al
	add esi, 4
	loop nxtlet	


exit:
	FINISH






	






