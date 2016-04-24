[BITS 64]

	global 	strlen:function
	section .text

strlen:
	push	rbp
	mov	rbp, rsp

	mov	rcx, 0		; Init de rcx a 0

loop:
	mov	r8b, [rdi]	; Mov du char courant dans r8b (mem volatile) 
	cmp	r8b, 0		; Comparaison avec 0
	je	end_fct		; SI 0: jump a la fin
	inc	rcx		; ++rcx
	inc	rdi		; ++rdi (Increment du pointeur)
	jmp	loop		; Jump debut boucle

end_fct:
	mov	rax, rcx	; Move du return dans rax
	mov	rsp, rbp
	pop	rbp
	ret	0
