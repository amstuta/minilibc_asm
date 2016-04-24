[BITS 64]

	global	strcasecmp:function
	section	.text

strcasecmp:
	push	rbp
	mov	rbp, rsp

loop_begin:
	mov	r8b, [rdi]
	mov	r9b, [rsi]
	cmp	r8b, 0		; Compare avec char de fin de chaine
	je	end_fct
	cmp	r9b, 0
	je	end_fct

loop_mid_1:
	cmp	r8b, 90		; Si char <= 'Z': downcase
	jle	to_down_1

loop_mid_2:
	cmp	r9b, 90
	jle	to_down_2

loop_end:
	cmp	r8b, r9b	; Si diff entre les chars: jump end
	jne	end_fct
	inc	rdi
	inc	rsi
	jmp	loop_begin

to_down_1:
	cmp	r8b, 65		; Si char < 'A': return
	jl	loop_mid_2
	add	r8b, 32		; Sinon: char += 32
	jmp	loop_mid_2

to_down_2:
	cmp	r9b, 65
	jl	loop_end
	add	r9b, 32
	jmp	loop_end

end_fct:
	sub	r8b, r9b
	movsx	rax, r8b
	mov	rsp, rbp
	pop	rbp
	ret	0
