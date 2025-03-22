section .bss
	temp_buffer resb 100

section .text
global stoi, itos, print

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

print:
	call	strlen
	mov	rdx, rax

	mov	rax, 1
	mov	rdi, 1

	syscall

strlen:
	xor	rcx, rcx
	
_strlen_loop:
	cmp	BYTE [rsi + rcx], 0x20
	jl	_strlen_ret
	cmp	BYTE [rsi + rcx], 0x7F
	jg	_strlen_ret

	inc	rcx
	jmp	_strlen_loop

_strlen_ret:
	mov	rax, rcx
	ret
