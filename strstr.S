[BITS 64]

	global	strstr:function
	section	.text

strstr:
	push	rbp
	mov	rbp, rsp
	mov	rax, 0		; Return a null par default
	mov	r12, rsi	; Save du pointeur de debut
	jmp	loop

reset_pointers:
	sub	rdi, rcx	; Reset des pointeurs au debut des chaines
	mov	rsi, r12

loop:
	mov	r8b, [rdi]
	cmp	r8b, 0		; Fin de chaine: sub pas trouvee
	je	end_failure
	cmp	r8b, [rsi]	; Char == rsi[0]
	je	first_equal
	inc	rdi
	jmp	loop

first_equal:
	mov	rcx, 0		; Set de l'index de la sous chaine

equal_loop:
	mov	r8b, [rdi]
	mov	r9b, [rsi]
	cmp	r9b, 0		; Fin de la sous chaine: success
	je	end_success
	cmp	r8b, 0		; Fin de la chaine: echec
	je	end_failure
	cmp	r8b, r9b
	jne	reset_pointers	; Diff entre les chars: retour boucle principale
	inc	rdi
	inc	rsi
	inc	rcx
	jmp	equal_loop

end_success:
	mov	rax, rdi
	sub	rax, rcx	; Pointeur - index
	mov	rsp, rbp
	pop	rbp
	ret

end_failure:
	mov	rsp, rbp
	pop	rbp
	ret
