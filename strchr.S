[BITS 64]

	global	strchr:function
	section	.text

strchr:
	push	rbp
	mov	rbp, rsp
	push	rdi

loop:
	mov	r8b, [rdi]	; Mov char courant dans r8b
	cmp	r8b, 0		; Si fin de chaine: jump end_null
	je	end_null
	cmp	r8b, sil	; Si char trouve: jump end_fct (sil = 2eme arg, 8bits)
	je	end_fct
	inc	rdi		; Increment pointeur
	jmp	loop		; Jump debut de boucle

end_null:
	mov	rax, 0		; Mov null dans rax
	jmp	end

end_fct:
	mov	rax, rdi	; Mov le pointeur dans rax
	jmp	end

end:
	pop	rdi
	mov	rsp, rbp
	pop	rbp
	ret	0
