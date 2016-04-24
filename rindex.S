[BITS 64]

	global	rindex:function
	section	.text

rindex:
	push	rbp
	mov	rbp, rsp
	mov	rax, 0		; Retour initialise a null

loop:
	mov	r8b, [rdi]
	cmp	r8b, sil	; Si char trouve: jmp a equal
	je	equal

loop_next:
	cmp	r8b, 0		; Si fin de chaine: jmp end
	je	end_fct
	inc	rdi
	jmp	loop

equal:
	mov	rax, rdi	; Sauvegarde du pointeur trouve
	jmp	loop_next

end_fct:
	mov	rsp, rbp
	pop	rbp
	ret
