section .text
global stoi

stoi:
	xor	rax, rax
	xor	rcx, rcx

_stoi_loop:
	mov	r9b, BYTE [rdi + rcx]
	cmp	r9, 0x30 ; '0'
	jl	_ret
	cmp	r9, 0x39 ; '9'
	ja	_ret

	sub	r9, 0x30
	imul	rax, 10
	add	rax, r9

	inc	rcx
	jmp	_stoi_loop

_ret:
	ret
