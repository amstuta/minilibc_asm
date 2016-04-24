[BITS 64]

	global	strcspn:function
	section	.text

strcspn:
	push	rbp
	mov	rbp, rsp
	mov	rcx, 0

loop:
	mov	r8b, [rdi]
	cmp	r8b, 0		; Fin de chaine: fail
	je	end_fct
	mov	r9, rdi		; Save des pointeurs
	mov	r10, rsi
	jmp	compare		; Comparaison a chaque charactere

loop_end:
	mov	rdi, r9		; Reset des pointeurs
	mov	rsi, r10
	inc	rdi
	inc	rcx
	jmp	loop

compare:
	mov	r11b, [rsi]
	cmp	r11b, 0		; Pas trouve: retour boucle principale
	je	loop_end
	cmp	r11b, [rdi]	; Char trouve: return
	je	end_fct
	inc	rsi
	jmp	compare

end_fct:
	mov	rax, rcx
	mov	rsp, rbp
	pop	rbp
	ret
