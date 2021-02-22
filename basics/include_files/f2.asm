section .code
  global _start
_start:
  call print_msg 

%include 'f1.asm'

.exit:
  mov eax, 0x1
  mov ebx, 0
  int 0x80

