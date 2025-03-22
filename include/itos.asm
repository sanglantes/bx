section .bss
	temp_buffer resb 100

section .text
global itos

itos:
; value		(rdi)
; buffer	(rsi)

	xor	rcx, rcx
	mov	rax, rdi
	mov	rbx, 10

_itos_loop:
	xor	rdx, rdx
	div	rbx

	add	rdx, 0x30
	mov	BYTE [rsi + rcx], dl

	cmp	rax, 0
	jle	_itos_reverse

	inc	rcx
	jmp	_itos_loop

_itos_reverse:
	lea	rax, [temp_buffer]
	xor	r8, r8

_itos_reverse_loop:
	mov	r9b, BYTE [rsi + rcx]
	mov	BYTE [rax + r8], r9b

	cmp	rcx, 0
	jle	_ret
	
	inc 	r8
	dec 	rcx
	jmp	_itos_reverse_loop

_ret:
	ret
