%include "stud_io.inc"
%include "syscall_io.inc"
global _start

section .data
ans	db ""
st	db ""
w_addr	db "yyyy"


section .bss
arr	resd 20
aar	resd 10

section .text
_start:

menu:	PRINT "а)ввести строку длиной до 30 симв. (1)"
	PUTCHAR 10
	PRINT "б)ввести строку длиной до 60 симв. (2)"
	PUTCHAR 10
	PRINT "v)Выход (4)"
	PUTCHAR 10

	syscall	3, 0, ans, 2			;Нужно два байта, 2й для переноса стр
	mov bl, [ans]

	;mov ebx, 20				;Можно из регистра подать на syscall

	cmp bl, "1"
	jz str20
	cmp bl, "2"
	jz str40
	cmp bl, "3"
	jz fwrite
	cmp bl, "4"
	jz exit
	

str20:	PRINT "Предложение до 30ти букв:"
	syscall	3, 0, st, 30
	jmp output
str40:	PRINT "Предложение до 60ти букв:"
	syscall	3, 0, st, 60
	jmp output
				
fwrite:	syscall	3, 0, st, 60
	syscall 5, w_addr, 241h, 0666q			;запись в файл
	syscall 4, eax, st, 20
	syscall 6, eax
	jmp exit

proc:	syscall 4, 1, st, 60
	jmp exit	

output:	mov edi, aar
	mov esi, st
	mov ecx, 60			;Длина строки на счетчик - ECX
	mov edx, 1

	mov [edi], esi
	add edi, 4	

	PRINT "Слова из введенного предложения:"
	PUTCHAR 10

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
	add edi, 4			;Смещение в 4
	jmp next

letrs:	PRINT "Первые буквы слов:"
	PUTCHAR 10
	mov esi, aar
	mov ecx, edx
nxtlet:	mov ebx, [esi]
	mov eax, [ebx]
	PUTCHAR al
	add esi, 4
	loop nxtlet	


exit:	PUTCHAR 10
	FINISH



	






