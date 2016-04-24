[BITS 64]

	global	memcpy:function
	section	.text

memcpy:
	push	rbp
	mov	rbp, rsp
	mov	rax, 0

loop:
	cmp	rax, rdx		; Cmp idx et nb char a setter
	je	end_fct
	mov	r8b, [rsi + rax]     	; Cpy du char dans mem volatile
	mov	[rdi + rax], r8b     	; Mov du char dans l'autre mem
	inc	rax
	jmp	loop

end_fct:
	mov	rax, rdi
	mov	rsp, rbp
	pop	rbp
	ret	0
