[BITS 64]

	global	memset:function
	section	.text

memset:
	push	rbp
	mov	rbp, rsp
	mov	rax, 0			; Idx set a 0

loop:
	cmp	rax, rdx		; Cmp entre idx et nb de char a setter
	je	end_fct
	mov	[rdi + rax], sil	; Mov char dans *ptr
	inc	rax			; ++idx
	jmp	loop

end_fct:
	mov	rax, rdi		; Mov ptr pour le return
	mov	rsp, rbp
	pop	rbp
	ret	0
