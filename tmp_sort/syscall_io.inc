%macro syscall 1-*
%rep %0
%rotate -1
	push dword %1
%endrep
%ifdef OS_FREEBSD
	mov eax, [esp]
	int 80h
	jnc %%sc_ok
	neg eax
%%sc_ok:
	add esp, (%0-1)*4
%elifdef OS_LINUX
	pop eax
 %if %0 > 1
	pop ebx
  %if %0 > 2
	pop ecx
   %if %0 > 3
	pop edx
    %if %0 > 4
	pop esi
     %if %0 > 5
	pop edi
      %if %0 > 6
       %error "Too many params for Linux syscall"
      %endif
     %endif
    %endif
   %endif
  %endif
 %endif
	int 80h
%else
%error Please define either OS_LINUX or OS_FREEBSD
%endif
%endmacro
