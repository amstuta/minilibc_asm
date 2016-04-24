[BITS 64]

	global	strncmp:function
	section	.text

strncmp:
	push	rbp
	mov	rbp, rsp
	mov	rcx, 0

loop:
	cmp	rcx, rdx	; Fin nombre de char a comparer
	je	end_fct
	mov	r8b, [rdi]
	mov	r9b, [rsi]
	cmp	r8b, 0		; Fin de chaine: return
	je	end_fct
	cmp	r9b, 0
	je	end_fct
	cmp	r8b, r9b	; Si diff: return
	jne	end_fct
	inc	rcx
	inc	rdi
	inc	rsi
	jmp	loop

end_fct:
	sub	r8b, r9b
	movsx	rax, r8b

	mov	rsp, rbp
	pop	rbp
	ret	0
