[BITS 64]

	global	strpbrk:function
	section	.text

strpbrk:
	push	rbp
	mov	rbp, rsp

loop:
	mov	r8b, [rdi]
	cmp	r8b, 0		; Fin de chaine: fail
	je	end_failure
	mov	r9, rdi		; Save des pointeurs
	mov	r10, rsi
	jmp	compare		; Comparaison a chaque charactere

loop_end:
	mov	rdi, r9		; Reset des pointeurs
	mov	rsi, r10
	inc	rdi
	jmp	loop

compare:
	mov	r11b, [rsi]
	cmp	r11b, 0		; Pas trouve: retour boucle principale
	je	loop_end
	cmp	r11b, [rdi]	; Char trouve: return
	je	end_success
	inc	rsi
	jmp	compare

end_success:
	mov	rax, rdi
	mov	rsp, rbp
	pop	rbp
	ret	0

end_failure:
	mov	rax, 0
	mov	rsp, rbp
	pop	rbp
	ret	0
