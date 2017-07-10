
.global _Reset
_Reset:
 LDR sp, =stack_top
 BL c_entry
 B .

print_uart0:
   str	r11, [sp, #-4]!
   add	r11, sp, #0
   sub	sp, sp, #12
   str	r0, [r11, #-8]
   b	#24 <print_uart0+0x30>
   ldr	r2, [pc, #52]
   ldr	r3, [r11, #-8]
   ldrb	r3, [r3]
   str	r3, [r2]
   ldr	r3, [r11, #-8]
   add	r3, r3, #1
   str	r3, [r11, #-8]
   ldr	r3, [r11, #-8]
   ldrb	r3, [r3]
   cmp	r3, #0
   bne	#-48 print_uart0+0x14
   mov	r0, r0
   add	sp, r11, #0
   ldr	r11, [sp], #4
   
c_entry:
   push	{r11, lr}
   add	r11, sp, #4
   ldr	r0, [pc, #8]
   bl	#-104 print_uart0
   mov	r0, r0
   pop	{r11, pc}

