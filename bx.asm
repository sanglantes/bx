section .data

section .bss
	STDIN 	resb 10
	lol	resb 10

section .text

global _start
extern stoi, itos, print

_start:
	mov	rsi, [rsp + 8*2]
	mov	rdi, rsi
	call 	stoi
	mov	r10, rax

	mov	rsi, [rsp + 8*3]
	mov	rdi, rsi
	call	stoi
	mov	r11, rax

	mov	rax, r10
	mov	rbx, r11
	call	bexp

	mov	rdi, rax
	call	itos
	mov	rsi, rax
	call	print
	
	mov	rsi, rax
	mov	rax, 0x1
	mov	rdi, 0x1
	mov	rdx, rcx
	syscall

	jmp	exit

bexp:
; base (rax)
; exponent (rbx)
	cmp	rbx, 0x1
	je	_bexp_fin

	test	rbx, 0x1
	jz	_bexp_is_even
	
_bexp_is_odd:
	push	rax

	dec	rbx
	shr	rbx, 1

	imul	rax, rax
	call	bexp

	pop	r8
	imul	rax, r8
	jmp	bexp

_bexp_is_even:
	shr	rbx, 1	
	imul	rax, rax

	jmp	bexp

_bexp_fin:
	ret

exit:
	mov	rax, 0x3c
	mov	rdi, 0x0
	syscall
