  .global _start

  .equ stdin, 0
  .equ stdout, 1
  .equ sys_read, 63
  .equ sys_write, 64
  .equ sys_exit, 93

  .data
helloworld: 
  .ascii "Hello World!\n"
  .equ helloworld_size, .-helloworld
  .balign 8

  .text
_start: 

  mov x0, #stdout
  ldr x1, =helloworld
  mov x2, #helloworld_size
  mov x8, #sys_write
  svc #0
  b 1f

1:
  mov x0, #0
  mov x8, #sys_exit
  svc #0

