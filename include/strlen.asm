section .text
global strlen

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
