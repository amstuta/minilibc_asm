[BITS 64]

	global	strcmp:function
	section	.text

strcmp:
	push	rbp
	mov	rbp, rsp

loop:
	mov	r8b, [rdi]	; Cpy *rdi (s1) dans r8b
	mov	r9b, [rsi]	; Cpy *rsi (s2) dans r9b
	cmp	r8b, r9b	; Jump end si differents
	jne	end_fct
	cmp	r8b, 0
	je	end_fct
	cmp	r9b, 0		; Jmp end si char de fin dans une des chaines
	je 	end_fct
	inc	rdi
	inc	rsi
	jmp	loop

end_fct:
	sub	r8b, r9b	; Calcul r8b - r9b (deux derniers chars compares)
	movsx	rax, r8b	; Cpy signee dans rax
	mov	rsp, rbp
	pop	rbp
	ret	0
