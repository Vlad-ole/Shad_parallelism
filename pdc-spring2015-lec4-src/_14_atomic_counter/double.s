	.file	"pi_spmd_for.cpp"
	.text
.Ltext0:
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.section	.text.unlikely
.Ltext_cold0:
	.text
	.type	main._omp_fn.0, @function
main._omp_fn.0:
.LFB512:
	.file 1 "pi_spmd_for.cpp"
	.loc 1 11 0
	.cfi_startproc
.LVL0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	call	omp_get_num_threads
.LVL1:
	movl	%eax, %ebp
	call	omp_get_thread_num
.LVL2:
	movl	%eax, %ecx
	movl	$1000, %eax
	cltd
	idivl	%ebp
	cmpl	%edx, %ecx
	jge	.L7
	addl	$1, %eax
	.loc 1 11 0
	xorl	%edx, %edx
.L7:
	imull	%eax, %ecx
	leal	(%rcx,%rdx), %r8d
	leal	(%r8,%rax), %r9d
	cmpl	%r9d, %r8d
	jge	.L1
	.p2align 4,,10
	.p2align 3
.L9:
.LVL3:
.LBB2:
.LBB3:
	.loc 1 14 0
	pxor	%xmm0, %xmm0
	movq	(%rbx), %rcx
	cvtsi2sd	%r8d, %xmm0
	movq	(%rcx), %rdx
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L8:
	movq	%rax, %rdx
.L4:
	.loc 1 14 0 is_stmt 0 discriminator 1
	movq	%rdx, 8(%rsp)
	movq	%rdx, %rax
	movsd	8(%rsp), %xmm1
	addsd	%xmm0, %xmm1
	movq	%xmm1, %rsi
	lock cmpxchgq	%rsi, (%rcx)
	cmpq	%rax, %rdx
	jne	.L8
	addl	$1, %r8d
.LVL4:
	cmpl	%r9d, %r8d
	jne	.L9
.LVL5:
.L1:
.LBE3:
.LBE2:
	.loc 1 11 0 is_stmt 1
	addq	$24, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
.LVL6:
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE512:
	.size	main._omp_fn.0, .-main._omp_fn.0
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"counter = %.2f\n"
	.section	.text.unlikely
.LCOLDB3:
	.section	.text.startup,"ax",@progbits
.LHOTB3:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB511:
	.loc 1 8 0
	.cfi_startproc
.LVL7:
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	xorl	%ecx, %ecx
	xorl	%edx, %edx
.LBB4:
.LBB5:
	.loc 1 11 0
	leaq	8(%rsp), %rax
	movq	%rsp, %rsi
.LVL8:
	movl	$main._omp_fn.0, %edi
.LVL9:
.LBE5:
	.loc 1 9 0
	movq	$0, 8(%rsp)
.LBB6:
	.loc 1 11 0
	movq	%rax, (%rsp)
	call	GOMP_parallel
.LVL10:
.LBE6:
	.loc 1 16 0
	movsd	8(%rsp), %xmm0
	movl	$.LC2, %edi
	movl	$1, %eax
	call	printf
.LVL11:
.LBE4:
	.loc 1 17 0
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE511:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE3:
	.section	.text.startup
.LHOTE3:
	.text
.Letext0:
	.section	.text.unlikely
.Letext_cold0:
	.file 2 "/usr/lib/gcc/x86_64-redhat-linux/4.9.2/include/stddef.h"
	.file 3 "/usr/include/bits/types.h"
	.file 4 "/usr/include/stdio.h"
	.file 5 "/usr/include/libio.h"
	.file 6 "/usr/include/wchar.h"
	.file 7 "/usr/include/_G_config.h"
	.file 8 "/usr/include/c++/4.9.2/cstdio"
	.file 9 "/usr/include/c++/4.9.2/cstdlib"
	.file 10 "/usr/include/c++/4.9.2/cmath"
	.file 11 "/usr/include/c++/4.9.2/type_traits"
	.file 12 "/usr/include/c++/4.9.2/cstdint"
	.file 13 "/usr/include/c++/4.9.2/ctime"
	.file 14 "/usr/include/c++/4.9.2/ratio"
	.file 15 "/usr/include/bits/stdio.h"
	.file 16 "/usr/include/stdlib.h"
	.file 17 "/usr/include/time.h"
	.file 18 "/usr/include/sys/types.h"
	.file 19 "/usr/include/bits/stdlib-float.h"
	.file 20 "/usr/include/bits/stdlib-bsearch.h"
	.file 21 "/usr/include/c++/4.9.2/chrono"
	.file 22 "/usr/include/bits/mathdef.h"
	.file 23 "/usr/include/stdint.h"
	.file 24 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1451
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF222
	.byte	0x4
	.long	.LASF223
	.long	.LASF224
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x2
	.byte	0xd4
	.long	0x34
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x3
	.byte	0x83
	.long	0x65
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x84
	.long	0x65
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x2
	.long	.LASF11
	.byte	0x3
	.byte	0x87
	.long	0x65
	.uleb128 0x2
	.long	.LASF12
	.byte	0x3
	.byte	0x8b
	.long	0x65
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0xa7
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0x2
	.long	.LASF14
	.byte	0x4
	.byte	0x30
	.long	0xb9
	.uleb128 0x7
	.long	.LASF54
	.byte	0xd8
	.byte	0x5
	.byte	0xf5
	.long	0x239
	.uleb128 0x8
	.long	.LASF15
	.byte	0x5
	.byte	0xf6
	.long	0x5e
	.byte	0
	.uleb128 0x8
	.long	.LASF16
	.byte	0x5
	.byte	0xfb
	.long	0xa1
	.byte	0x8
	.uleb128 0x8
	.long	.LASF17
	.byte	0x5
	.byte	0xfc
	.long	0xa1
	.byte	0x10
	.uleb128 0x8
	.long	.LASF18
	.byte	0x5
	.byte	0xfd
	.long	0xa1
	.byte	0x18
	.uleb128 0x8
	.long	.LASF19
	.byte	0x5
	.byte	0xfe
	.long	0xa1
	.byte	0x20
	.uleb128 0x8
	.long	.LASF20
	.byte	0x5
	.byte	0xff
	.long	0xa1
	.byte	0x28
	.uleb128 0x9
	.long	.LASF21
	.byte	0x5
	.value	0x100
	.long	0xa1
	.byte	0x30
	.uleb128 0x9
	.long	.LASF22
	.byte	0x5
	.value	0x101
	.long	0xa1
	.byte	0x38
	.uleb128 0x9
	.long	.LASF23
	.byte	0x5
	.value	0x102
	.long	0xa1
	.byte	0x40
	.uleb128 0x9
	.long	.LASF24
	.byte	0x5
	.value	0x104
	.long	0xa1
	.byte	0x48
	.uleb128 0x9
	.long	.LASF25
	.byte	0x5
	.value	0x105
	.long	0xa1
	.byte	0x50
	.uleb128 0x9
	.long	.LASF26
	.byte	0x5
	.value	0x106
	.long	0xa1
	.byte	0x58
	.uleb128 0x9
	.long	.LASF27
	.byte	0x5
	.value	0x108
	.long	0x300
	.byte	0x60
	.uleb128 0x9
	.long	.LASF28
	.byte	0x5
	.value	0x10a
	.long	0x306
	.byte	0x68
	.uleb128 0x9
	.long	.LASF29
	.byte	0x5
	.value	0x10c
	.long	0x5e
	.byte	0x70
	.uleb128 0x9
	.long	.LASF30
	.byte	0x5
	.value	0x110
	.long	0x5e
	.byte	0x74
	.uleb128 0x9
	.long	.LASF31
	.byte	0x5
	.value	0x112
	.long	0x6c
	.byte	0x78
	.uleb128 0x9
	.long	.LASF32
	.byte	0x5
	.value	0x116
	.long	0x42
	.byte	0x80
	.uleb128 0x9
	.long	.LASF33
	.byte	0x5
	.value	0x117
	.long	0x50
	.byte	0x82
	.uleb128 0x9
	.long	.LASF34
	.byte	0x5
	.value	0x118
	.long	0x30c
	.byte	0x83
	.uleb128 0x9
	.long	.LASF35
	.byte	0x5
	.value	0x11c
	.long	0x31c
	.byte	0x88
	.uleb128 0x9
	.long	.LASF36
	.byte	0x5
	.value	0x125
	.long	0x77
	.byte	0x90
	.uleb128 0x9
	.long	.LASF37
	.byte	0x5
	.value	0x12e
	.long	0x9f
	.byte	0x98
	.uleb128 0x9
	.long	.LASF38
	.byte	0x5
	.value	0x12f
	.long	0x9f
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF39
	.byte	0x5
	.value	0x130
	.long	0x9f
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF40
	.byte	0x5
	.value	0x131
	.long	0x9f
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF41
	.byte	0x5
	.value	0x132
	.long	0x29
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF42
	.byte	0x5
	.value	0x134
	.long	0x5e
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF43
	.byte	0x5
	.value	0x136
	.long	0x322
	.byte	0xc4
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.byte	0x6
	.byte	0x53
	.long	.LASF49
	.long	0x27d
	.uleb128 0xb
	.byte	0x4
	.byte	0x6
	.byte	0x56
	.long	0x264
	.uleb128 0xc
	.long	.LASF44
	.byte	0x6
	.byte	0x58
	.long	0x49
	.uleb128 0xc
	.long	.LASF45
	.byte	0x6
	.byte	0x5c
	.long	0x27d
	.byte	0
	.uleb128 0x8
	.long	.LASF46
	.byte	0x6
	.byte	0x54
	.long	0x5e
	.byte	0
	.uleb128 0x8
	.long	.LASF47
	.byte	0x6
	.byte	0x5d
	.long	0x245
	.byte	0x4
	.byte	0
	.uleb128 0xd
	.long	0xa7
	.long	0x28d
	.uleb128 0xe
	.long	0x82
	.byte	0x3
	.byte	0
	.uleb128 0x2
	.long	.LASF48
	.byte	0x6
	.byte	0x5e
	.long	0x239
	.uleb128 0xa
	.byte	0x10
	.byte	0x7
	.byte	0x16
	.long	.LASF50
	.long	0x2bd
	.uleb128 0x8
	.long	.LASF51
	.byte	0x7
	.byte	0x17
	.long	0x6c
	.byte	0
	.uleb128 0x8
	.long	.LASF52
	.byte	0x7
	.byte	0x18
	.long	0x28d
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.long	.LASF53
	.byte	0x7
	.byte	0x19
	.long	0x298
	.uleb128 0xf
	.long	.LASF225
	.byte	0x5
	.byte	0x9a
	.uleb128 0x7
	.long	.LASF55
	.byte	0x18
	.byte	0x5
	.byte	0xa0
	.long	0x300
	.uleb128 0x8
	.long	.LASF56
	.byte	0x5
	.byte	0xa1
	.long	0x300
	.byte	0
	.uleb128 0x8
	.long	.LASF57
	.byte	0x5
	.byte	0xa2
	.long	0x306
	.byte	0x8
	.uleb128 0x8
	.long	.LASF58
	.byte	0x5
	.byte	0xa6
	.long	0x5e
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2cf
	.uleb128 0x6
	.byte	0x8
	.long	0xb9
	.uleb128 0xd
	.long	0xa7
	.long	0x31c
	.uleb128 0xe
	.long	0x82
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2c8
	.uleb128 0xd
	.long	0xa7
	.long	0x332
	.uleb128 0xe
	.long	0x82
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x338
	.uleb128 0x10
	.long	0xa7
	.uleb128 0x2
	.long	.LASF59
	.byte	0x4
	.byte	0x6e
	.long	0x2bd
	.uleb128 0x11
	.string	"std"
	.byte	0x18
	.byte	0
	.long	0x85b
	.uleb128 0x12
	.byte	0x8
	.byte	0x62
	.long	0xae
	.uleb128 0x12
	.byte	0x8
	.byte	0x63
	.long	0x33d
	.uleb128 0x12
	.byte	0x8
	.byte	0x65
	.long	0x85b
	.uleb128 0x12
	.byte	0x8
	.byte	0x66
	.long	0x873
	.uleb128 0x12
	.byte	0x8
	.byte	0x67
	.long	0x888
	.uleb128 0x12
	.byte	0x8
	.byte	0x68
	.long	0x89e
	.uleb128 0x12
	.byte	0x8
	.byte	0x69
	.long	0x8b4
	.uleb128 0x12
	.byte	0x8
	.byte	0x6a
	.long	0x8c9
	.uleb128 0x12
	.byte	0x8
	.byte	0x6b
	.long	0x8df
	.uleb128 0x12
	.byte	0x8
	.byte	0x6c
	.long	0x900
	.uleb128 0x12
	.byte	0x8
	.byte	0x6d
	.long	0x920
	.uleb128 0x12
	.byte	0x8
	.byte	0x71
	.long	0x93b
	.uleb128 0x12
	.byte	0x8
	.byte	0x72
	.long	0x960
	.uleb128 0x12
	.byte	0x8
	.byte	0x74
	.long	0x980
	.uleb128 0x12
	.byte	0x8
	.byte	0x75
	.long	0x9a0
	.uleb128 0x12
	.byte	0x8
	.byte	0x76
	.long	0x9c6
	.uleb128 0x12
	.byte	0x8
	.byte	0x78
	.long	0x9dc
	.uleb128 0x12
	.byte	0x8
	.byte	0x79
	.long	0x9f2
	.uleb128 0x12
	.byte	0x8
	.byte	0x7c
	.long	0x9fd
	.uleb128 0x12
	.byte	0x8
	.byte	0x7e
	.long	0xa13
	.uleb128 0x12
	.byte	0x8
	.byte	0x83
	.long	0xa25
	.uleb128 0x12
	.byte	0x8
	.byte	0x84
	.long	0xa3a
	.uleb128 0x12
	.byte	0x8
	.byte	0x85
	.long	0xa54
	.uleb128 0x12
	.byte	0x8
	.byte	0x87
	.long	0xa66
	.uleb128 0x12
	.byte	0x8
	.byte	0x88
	.long	0xa7d
	.uleb128 0x12
	.byte	0x8
	.byte	0x8b
	.long	0xaa2
	.uleb128 0x12
	.byte	0x8
	.byte	0x8d
	.long	0xaad
	.uleb128 0x12
	.byte	0x8
	.byte	0x8f
	.long	0xac2
	.uleb128 0x12
	.byte	0x9
	.byte	0x76
	.long	0xb02
	.uleb128 0x12
	.byte	0x9
	.byte	0x77
	.long	0xb32
	.uleb128 0x12
	.byte	0x9
	.byte	0x7b
	.long	0xbea
	.uleb128 0x12
	.byte	0x9
	.byte	0x7e
	.long	0xc07
	.uleb128 0x12
	.byte	0x9
	.byte	0x81
	.long	0xc21
	.uleb128 0x12
	.byte	0x9
	.byte	0x82
	.long	0xc3d
	.uleb128 0x12
	.byte	0x9
	.byte	0x83
	.long	0xc53
	.uleb128 0x12
	.byte	0x9
	.byte	0x84
	.long	0xc69
	.uleb128 0x12
	.byte	0x9
	.byte	0x86
	.long	0xc92
	.uleb128 0x12
	.byte	0x9
	.byte	0x89
	.long	0xcad
	.uleb128 0x12
	.byte	0x9
	.byte	0x8b
	.long	0xcc3
	.uleb128 0x12
	.byte	0x9
	.byte	0x8e
	.long	0xcde
	.uleb128 0x12
	.byte	0x9
	.byte	0x8f
	.long	0xcf9
	.uleb128 0x12
	.byte	0x9
	.byte	0x90
	.long	0xd26
	.uleb128 0x12
	.byte	0x9
	.byte	0x92
	.long	0xd46
	.uleb128 0x12
	.byte	0x9
	.byte	0x95
	.long	0xd67
	.uleb128 0x12
	.byte	0x9
	.byte	0x98
	.long	0xd79
	.uleb128 0x12
	.byte	0x9
	.byte	0x9a
	.long	0xd85
	.uleb128 0x12
	.byte	0x9
	.byte	0x9b
	.long	0xd97
	.uleb128 0x12
	.byte	0x9
	.byte	0x9c
	.long	0xdb7
	.uleb128 0x12
	.byte	0x9
	.byte	0x9d
	.long	0xdd6
	.uleb128 0x12
	.byte	0x9
	.byte	0x9e
	.long	0xdf5
	.uleb128 0x12
	.byte	0x9
	.byte	0xa0
	.long	0xe0b
	.uleb128 0x12
	.byte	0x9
	.byte	0xa1
	.long	0xe36
	.uleb128 0x12
	.byte	0x9
	.byte	0xf1
	.long	0xb69
	.uleb128 0x12
	.byte	0x9
	.byte	0xf6
	.long	0xe8d
	.uleb128 0x12
	.byte	0x9
	.byte	0xf7
	.long	0xea8
	.uleb128 0x12
	.byte	0x9
	.byte	0xf9
	.long	0xec3
	.uleb128 0x12
	.byte	0x9
	.byte	0xfa
	.long	0xf17
	.uleb128 0x12
	.byte	0x9
	.byte	0xfb
	.long	0xed9
	.uleb128 0x12
	.byte	0x9
	.byte	0xfc
	.long	0xef8
	.uleb128 0x12
	.byte	0x9
	.byte	0xfd
	.long	0xf38
	.uleb128 0x13
	.byte	0xa
	.value	0x40e
	.long	0xf64
	.uleb128 0x13
	.byte	0xa
	.value	0x40f
	.long	0xf59
	.uleb128 0x7
	.long	.LASF60
	.byte	0x1
	.byte	0xb
	.byte	0x45
	.long	0x55a
	.uleb128 0x14
	.long	.LASF63
	.byte	0xb
	.byte	0x47
	.long	0xf6f
	.uleb128 0x2
	.long	.LASF61
	.byte	0xb
	.byte	0x48
	.long	0xf74
	.uleb128 0x15
	.long	.LASF64
	.byte	0xb
	.byte	0x4a
	.long	.LASF66
	.long	0x51e
	.long	0x540
	.long	0x546
	.uleb128 0x16
	.long	0xf7b
	.byte	0
	.uleb128 0x17
	.string	"_Tp"
	.long	0xf74
	.uleb128 0x18
	.string	"__v"
	.long	0xf74
	.byte	0
	.byte	0
	.uleb128 0x10
	.long	0x507
	.uleb128 0x7
	.long	.LASF62
	.byte	0x1
	.byte	0xb
	.byte	0x45
	.long	0x5b2
	.uleb128 0x14
	.long	.LASF63
	.byte	0xb
	.byte	0x47
	.long	0xf6f
	.uleb128 0x2
	.long	.LASF61
	.byte	0xb
	.byte	0x48
	.long	0xf74
	.uleb128 0x15
	.long	.LASF65
	.byte	0xb
	.byte	0x4a
	.long	.LASF67
	.long	0x576
	.long	0x598
	.long	0x59e
	.uleb128 0x16
	.long	0xf81
	.byte	0
	.uleb128 0x17
	.string	"_Tp"
	.long	0xf74
	.uleb128 0x18
	.string	"__v"
	.long	0xf74
	.byte	0x1
	.byte	0
	.uleb128 0x10
	.long	0x55f
	.uleb128 0x12
	.byte	0xc
	.byte	0x30
	.long	0xb8a
	.uleb128 0x12
	.byte	0xc
	.byte	0x31
	.long	0xb95
	.uleb128 0x12
	.byte	0xc
	.byte	0x32
	.long	0xba0
	.uleb128 0x12
	.byte	0xc
	.byte	0x33
	.long	0xbab
	.uleb128 0x12
	.byte	0xc
	.byte	0x35
	.long	0x100b
	.uleb128 0x12
	.byte	0xc
	.byte	0x36
	.long	0x1016
	.uleb128 0x12
	.byte	0xc
	.byte	0x37
	.long	0x1021
	.uleb128 0x12
	.byte	0xc
	.byte	0x38
	.long	0x102c
	.uleb128 0x12
	.byte	0xc
	.byte	0x3a
	.long	0xfb3
	.uleb128 0x12
	.byte	0xc
	.byte	0x3b
	.long	0xfbe
	.uleb128 0x12
	.byte	0xc
	.byte	0x3c
	.long	0xfc9
	.uleb128 0x12
	.byte	0xc
	.byte	0x3d
	.long	0xfd4
	.uleb128 0x12
	.byte	0xc
	.byte	0x3f
	.long	0x1079
	.uleb128 0x12
	.byte	0xc
	.byte	0x40
	.long	0x1063
	.uleb128 0x12
	.byte	0xc
	.byte	0x42
	.long	0xf87
	.uleb128 0x12
	.byte	0xc
	.byte	0x43
	.long	0xf92
	.uleb128 0x12
	.byte	0xc
	.byte	0x44
	.long	0xf9d
	.uleb128 0x12
	.byte	0xc
	.byte	0x45
	.long	0xfa8
	.uleb128 0x12
	.byte	0xc
	.byte	0x47
	.long	0x1037
	.uleb128 0x12
	.byte	0xc
	.byte	0x48
	.long	0x1042
	.uleb128 0x12
	.byte	0xc
	.byte	0x49
	.long	0x104d
	.uleb128 0x12
	.byte	0xc
	.byte	0x4a
	.long	0x1058
	.uleb128 0x12
	.byte	0xc
	.byte	0x4c
	.long	0xfdf
	.uleb128 0x12
	.byte	0xc
	.byte	0x4d
	.long	0xfea
	.uleb128 0x12
	.byte	0xc
	.byte	0x4e
	.long	0xff5
	.uleb128 0x12
	.byte	0xc
	.byte	0x4f
	.long	0x1000
	.uleb128 0x12
	.byte	0xc
	.byte	0x51
	.long	0x1084
	.uleb128 0x12
	.byte	0xc
	.byte	0x52
	.long	0x106e
	.uleb128 0x12
	.byte	0xd
	.byte	0x3c
	.long	0xb74
	.uleb128 0x12
	.byte	0xd
	.byte	0x3d
	.long	0xb7f
	.uleb128 0x12
	.byte	0xd
	.byte	0x3e
	.long	0x109d
	.uleb128 0x12
	.byte	0xd
	.byte	0x40
	.long	0x112d
	.uleb128 0x12
	.byte	0xd
	.byte	0x41
	.long	0x1138
	.uleb128 0x12
	.byte	0xd
	.byte	0x42
	.long	0x1152
	.uleb128 0x12
	.byte	0xd
	.byte	0x43
	.long	0x116d
	.uleb128 0x12
	.byte	0xd
	.byte	0x44
	.long	0x1188
	.uleb128 0x12
	.byte	0xd
	.byte	0x45
	.long	0x11a9
	.uleb128 0x12
	.byte	0xd
	.byte	0x46
	.long	0x11ca
	.uleb128 0x12
	.byte	0xd
	.byte	0x47
	.long	0x11df
	.uleb128 0x12
	.byte	0xd
	.byte	0x48
	.long	0x11f4
	.uleb128 0x19
	.long	.LASF68
	.byte	0x15
	.byte	0x3c
	.long	0x6eb
	.uleb128 0x1a
	.string	"_V2"
	.byte	0x15
	.value	0x2c5
	.uleb128 0x1b
	.byte	0x15
	.value	0x2c5
	.long	0x6da
	.byte	0
	.uleb128 0x7
	.long	.LASF69
	.byte	0x1
	.byte	0xb
	.byte	0x45
	.long	0x73e
	.uleb128 0x14
	.long	.LASF63
	.byte	0xb
	.byte	0x47
	.long	0x1218
	.uleb128 0x2
	.long	.LASF61
	.byte	0xb
	.byte	0x48
	.long	0x65
	.uleb128 0x15
	.long	.LASF70
	.byte	0xb
	.byte	0x4a
	.long	.LASF71
	.long	0x702
	.long	0x724
	.long	0x72a
	.uleb128 0x16
	.long	0x121d
	.byte	0
	.uleb128 0x17
	.string	"_Tp"
	.long	0x65
	.uleb128 0x18
	.string	"__v"
	.long	0x65
	.byte	0x1
	.byte	0
	.uleb128 0x10
	.long	0x6eb
	.uleb128 0x7
	.long	.LASF72
	.byte	0x1
	.byte	0xb
	.byte	0x45
	.long	0x799
	.uleb128 0x14
	.long	.LASF63
	.byte	0xb
	.byte	0x47
	.long	0x1218
	.uleb128 0x2
	.long	.LASF61
	.byte	0xb
	.byte	0x48
	.long	0x65
	.uleb128 0x15
	.long	.LASF73
	.byte	0xb
	.byte	0x4a
	.long	.LASF74
	.long	0x75a
	.long	0x77c
	.long	0x782
	.uleb128 0x16
	.long	0x1223
	.byte	0
	.uleb128 0x17
	.string	"_Tp"
	.long	0x65
	.uleb128 0x1c
	.string	"__v"
	.long	0x65
	.long	0x3b9aca00
	.byte	0
	.uleb128 0x10
	.long	0x743
	.uleb128 0x1d
	.long	.LASF75
	.byte	0x1
	.byte	0xe
	.value	0x107
	.long	0x7e0
	.uleb128 0x1e
	.string	"num"
	.byte	0xe
	.value	0x10e
	.long	0x1229
	.byte	0x1
	.uleb128 0x1f
	.string	"den"
	.byte	0xe
	.value	0x111
	.long	0x1229
	.long	0x3b9aca00
	.uleb128 0x20
	.long	.LASF76
	.long	0x65
	.byte	0x1
	.uleb128 0x21
	.long	.LASF77
	.long	0x65
	.long	0x3b9aca00
	.byte	0
	.uleb128 0x1d
	.long	.LASF78
	.byte	0x1
	.byte	0xe
	.value	0x107
	.long	0x822
	.uleb128 0x1f
	.string	"num"
	.byte	0xe
	.value	0x10e
	.long	0x1229
	.long	0x3b9aca00
	.uleb128 0x1e
	.string	"den"
	.byte	0xe
	.value	0x111
	.long	0x1229
	.byte	0x1
	.uleb128 0x21
	.long	.LASF76
	.long	0x65
	.long	0x3b9aca00
	.uleb128 0x20
	.long	.LASF77
	.long	0x65
	.byte	0x1
	.byte	0
	.uleb128 0x22
	.long	.LASF226
	.byte	0x1
	.byte	0xe
	.value	0x107
	.uleb128 0x1e
	.string	"num"
	.byte	0xe
	.value	0x10e
	.long	0x1229
	.byte	0x1
	.uleb128 0x1e
	.string	"den"
	.byte	0xe
	.value	0x111
	.long	0x1229
	.byte	0x1
	.uleb128 0x20
	.long	.LASF76
	.long	0x65
	.byte	0x1
	.uleb128 0x23
	.long	.LASF77
	.long	0x65
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x24
	.long	.LASF94
	.byte	0x4
	.value	0x33a
	.long	0x86d
	.uleb128 0x25
	.long	0x86d
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xae
	.uleb128 0x26
	.long	.LASF79
	.byte	0x4
	.byte	0xed
	.long	0x5e
	.long	0x888
	.uleb128 0x25
	.long	0x86d
	.byte	0
	.uleb128 0x27
	.long	.LASF80
	.byte	0x4
	.value	0x33c
	.long	0x5e
	.long	0x89e
	.uleb128 0x25
	.long	0x86d
	.byte	0
	.uleb128 0x27
	.long	.LASF81
	.byte	0x4
	.value	0x33e
	.long	0x5e
	.long	0x8b4
	.uleb128 0x25
	.long	0x86d
	.byte	0
	.uleb128 0x26
	.long	.LASF82
	.byte	0x4
	.byte	0xf2
	.long	0x5e
	.long	0x8c9
	.uleb128 0x25
	.long	0x86d
	.byte	0
	.uleb128 0x27
	.long	.LASF83
	.byte	0x4
	.value	0x213
	.long	0x5e
	.long	0x8df
	.uleb128 0x25
	.long	0x86d
	.byte	0
	.uleb128 0x27
	.long	.LASF84
	.byte	0x4
	.value	0x31e
	.long	0x5e
	.long	0x8fa
	.uleb128 0x25
	.long	0x86d
	.uleb128 0x25
	.long	0x8fa
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x33d
	.uleb128 0x27
	.long	.LASF85
	.byte	0x4
	.value	0x26e
	.long	0xa1
	.long	0x920
	.uleb128 0x25
	.long	0xa1
	.uleb128 0x25
	.long	0x5e
	.uleb128 0x25
	.long	0x86d
	.byte	0
	.uleb128 0x27
	.long	.LASF86
	.byte	0x4
	.value	0x110
	.long	0x86d
	.long	0x93b
	.uleb128 0x25
	.long	0x332
	.uleb128 0x25
	.long	0x332
	.byte	0
	.uleb128 0x27
	.long	.LASF87
	.byte	0x4
	.value	0x2c5
	.long	0x29
	.long	0x960
	.uleb128 0x25
	.long	0x9f
	.uleb128 0x25
	.long	0x29
	.uleb128 0x25
	.long	0x29
	.uleb128 0x25
	.long	0x86d
	.byte	0
	.uleb128 0x27
	.long	.LASF88
	.byte	0x4
	.value	0x116
	.long	0x86d
	.long	0x980
	.uleb128 0x25
	.long	0x332
	.uleb128 0x25
	.long	0x332
	.uleb128 0x25
	.long	0x86d
	.byte	0
	.uleb128 0x27
	.long	.LASF89
	.byte	0x4
	.value	0x2ed
	.long	0x5e
	.long	0x9a0
	.uleb128 0x25
	.long	0x86d
	.uleb128 0x25
	.long	0x65
	.uleb128 0x25
	.long	0x5e
	.byte	0
	.uleb128 0x27
	.long	.LASF90
	.byte	0x4
	.value	0x323
	.long	0x5e
	.long	0x9bb
	.uleb128 0x25
	.long	0x86d
	.uleb128 0x25
	.long	0x9bb
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x9c1
	.uleb128 0x10
	.long	0x33d
	.uleb128 0x27
	.long	.LASF91
	.byte	0x4
	.value	0x2f2
	.long	0x65
	.long	0x9dc
	.uleb128 0x25
	.long	0x86d
	.byte	0
	.uleb128 0x27
	.long	.LASF92
	.byte	0x4
	.value	0x214
	.long	0x5e
	.long	0x9f2
	.uleb128 0x25
	.long	0x86d
	.byte	0
	.uleb128 0x28
	.long	.LASF101
	.byte	0xf
	.byte	0x2c
	.long	0x5e
	.uleb128 0x27
	.long	.LASF93
	.byte	0x4
	.value	0x27e
	.long	0xa1
	.long	0xa13
	.uleb128 0x25
	.long	0xa1
	.byte	0
	.uleb128 0x24
	.long	.LASF95
	.byte	0x4
	.value	0x34e
	.long	0xa25
	.uleb128 0x25
	.long	0x332
	.byte	0
	.uleb128 0x26
	.long	.LASF96
	.byte	0x4
	.byte	0xb2
	.long	0x5e
	.long	0xa3a
	.uleb128 0x25
	.long	0x332
	.byte	0
	.uleb128 0x26
	.long	.LASF97
	.byte	0x4
	.byte	0xb4
	.long	0x5e
	.long	0xa54
	.uleb128 0x25
	.long	0x332
	.uleb128 0x25
	.long	0x332
	.byte	0
	.uleb128 0x24
	.long	.LASF98
	.byte	0x4
	.value	0x2f7
	.long	0xa66
	.uleb128 0x25
	.long	0x86d
	.byte	0
	.uleb128 0x24
	.long	.LASF99
	.byte	0x4
	.value	0x14c
	.long	0xa7d
	.uleb128 0x25
	.long	0x86d
	.uleb128 0x25
	.long	0xa1
	.byte	0
	.uleb128 0x27
	.long	.LASF100
	.byte	0x4
	.value	0x150
	.long	0x5e
	.long	0xaa2
	.uleb128 0x25
	.long	0x86d
	.uleb128 0x25
	.long	0xa1
	.uleb128 0x25
	.long	0x5e
	.uleb128 0x25
	.long	0x29
	.byte	0
	.uleb128 0x28
	.long	.LASF102
	.byte	0x4
	.byte	0xc3
	.long	0x86d
	.uleb128 0x26
	.long	.LASF103
	.byte	0x4
	.byte	0xd1
	.long	0xa1
	.long	0xac2
	.uleb128 0x25
	.long	0xa1
	.byte	0
	.uleb128 0x27
	.long	.LASF104
	.byte	0x4
	.value	0x2be
	.long	0x5e
	.long	0xadd
	.uleb128 0x25
	.long	0x5e
	.uleb128 0x25
	.long	0x86d
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.byte	0x10
	.byte	0x62
	.long	.LASF105
	.long	0xb02
	.uleb128 0x8
	.long	.LASF106
	.byte	0x10
	.byte	0x63
	.long	0x5e
	.byte	0
	.uleb128 0x29
	.string	"rem"
	.byte	0x10
	.byte	0x64
	.long	0x5e
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.long	.LASF107
	.byte	0x10
	.byte	0x65
	.long	0xadd
	.uleb128 0xa
	.byte	0x10
	.byte	0x10
	.byte	0x6a
	.long	.LASF108
	.long	0xb32
	.uleb128 0x8
	.long	.LASF106
	.byte	0x10
	.byte	0x6b
	.long	0x65
	.byte	0
	.uleb128 0x29
	.string	"rem"
	.byte	0x10
	.byte	0x6c
	.long	0x65
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.long	.LASF109
	.byte	0x10
	.byte	0x6d
	.long	0xb0d
	.uleb128 0xa
	.byte	0x10
	.byte	0x10
	.byte	0x76
	.long	.LASF110
	.long	0xb62
	.uleb128 0x8
	.long	.LASF106
	.byte	0x10
	.byte	0x77
	.long	0xb62
	.byte	0
	.uleb128 0x29
	.string	"rem"
	.byte	0x10
	.byte	0x78
	.long	0xb62
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF111
	.uleb128 0x2
	.long	.LASF112
	.byte	0x10
	.byte	0x79
	.long	0xb3d
	.uleb128 0x2
	.long	.LASF113
	.byte	0x11
	.byte	0x3b
	.long	0x89
	.uleb128 0x2
	.long	.LASF114
	.byte	0x11
	.byte	0x4b
	.long	0x94
	.uleb128 0x2
	.long	.LASF115
	.byte	0x12
	.byte	0xc2
	.long	0x50
	.uleb128 0x2
	.long	.LASF116
	.byte	0x12
	.byte	0xc3
	.long	0x57
	.uleb128 0x2
	.long	.LASF117
	.byte	0x12
	.byte	0xc4
	.long	0x5e
	.uleb128 0x2
	.long	.LASF118
	.byte	0x12
	.byte	0xc5
	.long	0x65
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF119
	.uleb128 0x2a
	.long	.LASF120
	.byte	0x10
	.value	0x2e5
	.long	0xbc9
	.uleb128 0x6
	.byte	0x8
	.long	0xbcf
	.uleb128 0x2b
	.long	0x5e
	.long	0xbe3
	.uleb128 0x25
	.long	0xbe3
	.uleb128 0x25
	.long	0xbe3
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xbe9
	.uleb128 0x2c
	.uleb128 0x27
	.long	.LASF121
	.byte	0x10
	.value	0x207
	.long	0x5e
	.long	0xc00
	.uleb128 0x25
	.long	0xc00
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xc06
	.uleb128 0x2d
	.uleb128 0x2e
	.long	.LASF227
	.byte	0x10
	.value	0x20c
	.long	.LASF227
	.long	0x5e
	.long	0xc21
	.uleb128 0x25
	.long	0xc00
	.byte	0
	.uleb128 0x26
	.long	.LASF122
	.byte	0x13
	.byte	0x1a
	.long	0xc36
	.long	0xc36
	.uleb128 0x25
	.long	0x332
	.byte	0
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF123
	.uleb128 0x27
	.long	.LASF124
	.byte	0x10
	.value	0x116
	.long	0x5e
	.long	0xc53
	.uleb128 0x25
	.long	0x332
	.byte	0
	.uleb128 0x27
	.long	.LASF125
	.byte	0x10
	.value	0x11b
	.long	0x65
	.long	0xc69
	.uleb128 0x25
	.long	0x332
	.byte	0
	.uleb128 0x26
	.long	.LASF126
	.byte	0x14
	.byte	0x14
	.long	0x9f
	.long	0xc92
	.uleb128 0x25
	.long	0xbe3
	.uleb128 0x25
	.long	0xbe3
	.uleb128 0x25
	.long	0x29
	.uleb128 0x25
	.long	0x29
	.uleb128 0x25
	.long	0xbbd
	.byte	0
	.uleb128 0x2f
	.string	"div"
	.byte	0x10
	.value	0x314
	.long	0xb02
	.long	0xcad
	.uleb128 0x25
	.long	0x5e
	.uleb128 0x25
	.long	0x5e
	.byte	0
	.uleb128 0x27
	.long	.LASF127
	.byte	0x10
	.value	0x234
	.long	0xa1
	.long	0xcc3
	.uleb128 0x25
	.long	0x332
	.byte	0
	.uleb128 0x27
	.long	.LASF128
	.byte	0x10
	.value	0x316
	.long	0xb32
	.long	0xcde
	.uleb128 0x25
	.long	0x65
	.uleb128 0x25
	.long	0x65
	.byte	0
	.uleb128 0x27
	.long	.LASF129
	.byte	0x10
	.value	0x35e
	.long	0x5e
	.long	0xcf9
	.uleb128 0x25
	.long	0x332
	.uleb128 0x25
	.long	0x29
	.byte	0
	.uleb128 0x27
	.long	.LASF130
	.byte	0x10
	.value	0x369
	.long	0x29
	.long	0xd19
	.uleb128 0x25
	.long	0xd19
	.uleb128 0x25
	.long	0x332
	.uleb128 0x25
	.long	0x29
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xd1f
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.long	.LASF131
	.uleb128 0x27
	.long	.LASF132
	.byte	0x10
	.value	0x361
	.long	0x5e
	.long	0xd46
	.uleb128 0x25
	.long	0xd19
	.uleb128 0x25
	.long	0x332
	.uleb128 0x25
	.long	0x29
	.byte	0
	.uleb128 0x24
	.long	.LASF133
	.byte	0x10
	.value	0x2fc
	.long	0xd67
	.uleb128 0x25
	.long	0x9f
	.uleb128 0x25
	.long	0x29
	.uleb128 0x25
	.long	0x29
	.uleb128 0x25
	.long	0xbbd
	.byte	0
	.uleb128 0x24
	.long	.LASF134
	.byte	0x10
	.value	0x225
	.long	0xd79
	.uleb128 0x25
	.long	0x5e
	.byte	0
	.uleb128 0x30
	.long	.LASF135
	.byte	0x10
	.value	0x176
	.long	0x5e
	.uleb128 0x24
	.long	.LASF136
	.byte	0x10
	.value	0x178
	.long	0xd97
	.uleb128 0x25
	.long	0x49
	.byte	0
	.uleb128 0x26
	.long	.LASF137
	.byte	0x10
	.byte	0xa4
	.long	0xc36
	.long	0xdb1
	.uleb128 0x25
	.long	0x332
	.uleb128 0x25
	.long	0xdb1
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xa1
	.uleb128 0x26
	.long	.LASF138
	.byte	0x10
	.byte	0xb7
	.long	0x65
	.long	0xdd6
	.uleb128 0x25
	.long	0x332
	.uleb128 0x25
	.long	0xdb1
	.uleb128 0x25
	.long	0x5e
	.byte	0
	.uleb128 0x26
	.long	.LASF139
	.byte	0x10
	.byte	0xbb
	.long	0x34
	.long	0xdf5
	.uleb128 0x25
	.long	0x332
	.uleb128 0x25
	.long	0xdb1
	.uleb128 0x25
	.long	0x5e
	.byte	0
	.uleb128 0x27
	.long	.LASF140
	.byte	0x10
	.value	0x2cc
	.long	0x5e
	.long	0xe0b
	.uleb128 0x25
	.long	0x332
	.byte	0
	.uleb128 0x27
	.long	.LASF141
	.byte	0x10
	.value	0x36c
	.long	0x29
	.long	0xe2b
	.uleb128 0x25
	.long	0xa1
	.uleb128 0x25
	.long	0xe2b
	.uleb128 0x25
	.long	0x29
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xe31
	.uleb128 0x10
	.long	0xd1f
	.uleb128 0x27
	.long	.LASF142
	.byte	0x10
	.value	0x365
	.long	0x5e
	.long	0xe51
	.uleb128 0x25
	.long	0xa1
	.uleb128 0x25
	.long	0xd1f
	.byte	0
	.uleb128 0x19
	.long	.LASF143
	.byte	0x8
	.byte	0x9e
	.long	0xea8
	.uleb128 0x12
	.byte	0x9
	.byte	0xc9
	.long	0xb69
	.uleb128 0x12
	.byte	0x9
	.byte	0xd9
	.long	0xea8
	.uleb128 0x12
	.byte	0x9
	.byte	0xe4
	.long	0xec3
	.uleb128 0x12
	.byte	0x9
	.byte	0xe5
	.long	0xed9
	.uleb128 0x12
	.byte	0x9
	.byte	0xe6
	.long	0xef8
	.uleb128 0x12
	.byte	0x9
	.byte	0xe8
	.long	0xf17
	.uleb128 0x12
	.byte	0x9
	.byte	0xe9
	.long	0xf38
	.uleb128 0x31
	.string	"div"
	.byte	0x9
	.byte	0xd6
	.long	.LASF228
	.long	0xb69
	.uleb128 0x25
	.long	0xb62
	.uleb128 0x25
	.long	0xb62
	.byte	0
	.byte	0
	.uleb128 0x27
	.long	.LASF144
	.byte	0x10
	.value	0x31c
	.long	0xb69
	.long	0xec3
	.uleb128 0x25
	.long	0xb62
	.uleb128 0x25
	.long	0xb62
	.byte	0
	.uleb128 0x27
	.long	.LASF145
	.byte	0x10
	.value	0x124
	.long	0xb62
	.long	0xed9
	.uleb128 0x25
	.long	0x332
	.byte	0
	.uleb128 0x26
	.long	.LASF146
	.byte	0x10
	.byte	0xd1
	.long	0xb62
	.long	0xef8
	.uleb128 0x25
	.long	0x332
	.uleb128 0x25
	.long	0xdb1
	.uleb128 0x25
	.long	0x5e
	.byte	0
	.uleb128 0x26
	.long	.LASF147
	.byte	0x10
	.byte	0xd6
	.long	0xbb6
	.long	0xf17
	.uleb128 0x25
	.long	0x332
	.uleb128 0x25
	.long	0xdb1
	.uleb128 0x25
	.long	0x5e
	.byte	0
	.uleb128 0x26
	.long	.LASF148
	.byte	0x10
	.byte	0xac
	.long	0xf31
	.long	0xf31
	.uleb128 0x25
	.long	0x332
	.uleb128 0x25
	.long	0xdb1
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF149
	.uleb128 0x26
	.long	.LASF150
	.byte	0x10
	.byte	0xaf
	.long	0xf52
	.long	0xf52
	.uleb128 0x25
	.long	0x332
	.uleb128 0x25
	.long	0xdb1
	.byte	0
	.uleb128 0x3
	.byte	0x10
	.byte	0x4
	.long	.LASF151
	.uleb128 0x2
	.long	.LASF152
	.byte	0x16
	.byte	0x1c
	.long	0xf31
	.uleb128 0x2
	.long	.LASF153
	.byte	0x16
	.byte	0x1d
	.long	0xc36
	.uleb128 0x10
	.long	0xf74
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF154
	.uleb128 0x6
	.byte	0x8
	.long	0x55a
	.uleb128 0x6
	.byte	0x8
	.long	0x5b2
	.uleb128 0x2
	.long	.LASF155
	.byte	0x17
	.byte	0x30
	.long	0x3b
	.uleb128 0x2
	.long	.LASF156
	.byte	0x17
	.byte	0x31
	.long	0x42
	.uleb128 0x2
	.long	.LASF157
	.byte	0x17
	.byte	0x33
	.long	0x49
	.uleb128 0x2
	.long	.LASF158
	.byte	0x17
	.byte	0x37
	.long	0x34
	.uleb128 0x2
	.long	.LASF159
	.byte	0x17
	.byte	0x41
	.long	0x50
	.uleb128 0x2
	.long	.LASF160
	.byte	0x17
	.byte	0x42
	.long	0x57
	.uleb128 0x2
	.long	.LASF161
	.byte	0x17
	.byte	0x43
	.long	0x5e
	.uleb128 0x2
	.long	.LASF162
	.byte	0x17
	.byte	0x45
	.long	0x65
	.uleb128 0x2
	.long	.LASF163
	.byte	0x17
	.byte	0x4c
	.long	0x3b
	.uleb128 0x2
	.long	.LASF164
	.byte	0x17
	.byte	0x4d
	.long	0x42
	.uleb128 0x2
	.long	.LASF165
	.byte	0x17
	.byte	0x4e
	.long	0x49
	.uleb128 0x2
	.long	.LASF166
	.byte	0x17
	.byte	0x50
	.long	0x34
	.uleb128 0x2
	.long	.LASF167
	.byte	0x17
	.byte	0x5a
	.long	0x50
	.uleb128 0x2
	.long	.LASF168
	.byte	0x17
	.byte	0x5c
	.long	0x65
	.uleb128 0x2
	.long	.LASF169
	.byte	0x17
	.byte	0x5d
	.long	0x65
	.uleb128 0x2
	.long	.LASF170
	.byte	0x17
	.byte	0x5e
	.long	0x65
	.uleb128 0x2
	.long	.LASF171
	.byte	0x17
	.byte	0x67
	.long	0x3b
	.uleb128 0x2
	.long	.LASF172
	.byte	0x17
	.byte	0x69
	.long	0x34
	.uleb128 0x2
	.long	.LASF173
	.byte	0x17
	.byte	0x6a
	.long	0x34
	.uleb128 0x2
	.long	.LASF174
	.byte	0x17
	.byte	0x6b
	.long	0x34
	.uleb128 0x2
	.long	.LASF175
	.byte	0x17
	.byte	0x77
	.long	0x65
	.uleb128 0x2
	.long	.LASF176
	.byte	0x17
	.byte	0x7a
	.long	0x34
	.uleb128 0x2
	.long	.LASF177
	.byte	0x17
	.byte	0x86
	.long	0x65
	.uleb128 0x2
	.long	.LASF178
	.byte	0x17
	.byte	0x87
	.long	0x34
	.uleb128 0x3
	.byte	0x2
	.byte	0x10
	.long	.LASF179
	.uleb128 0x3
	.byte	0x4
	.byte	0x10
	.long	.LASF180
	.uleb128 0x32
	.string	"tm"
	.byte	0x38
	.byte	0x11
	.byte	0x85
	.long	0x112d
	.uleb128 0x8
	.long	.LASF181
	.byte	0x11
	.byte	0x87
	.long	0x5e
	.byte	0
	.uleb128 0x8
	.long	.LASF182
	.byte	0x11
	.byte	0x88
	.long	0x5e
	.byte	0x4
	.uleb128 0x8
	.long	.LASF183
	.byte	0x11
	.byte	0x89
	.long	0x5e
	.byte	0x8
	.uleb128 0x8
	.long	.LASF184
	.byte	0x11
	.byte	0x8a
	.long	0x5e
	.byte	0xc
	.uleb128 0x8
	.long	.LASF185
	.byte	0x11
	.byte	0x8b
	.long	0x5e
	.byte	0x10
	.uleb128 0x8
	.long	.LASF186
	.byte	0x11
	.byte	0x8c
	.long	0x5e
	.byte	0x14
	.uleb128 0x8
	.long	.LASF187
	.byte	0x11
	.byte	0x8d
	.long	0x5e
	.byte	0x18
	.uleb128 0x8
	.long	.LASF188
	.byte	0x11
	.byte	0x8e
	.long	0x5e
	.byte	0x1c
	.uleb128 0x8
	.long	.LASF189
	.byte	0x11
	.byte	0x8f
	.long	0x5e
	.byte	0x20
	.uleb128 0x8
	.long	.LASF190
	.byte	0x11
	.byte	0x92
	.long	0x65
	.byte	0x28
	.uleb128 0x8
	.long	.LASF191
	.byte	0x11
	.byte	0x93
	.long	0x332
	.byte	0x30
	.byte	0
	.uleb128 0x28
	.long	.LASF192
	.byte	0x11
	.byte	0xbd
	.long	0xb74
	.uleb128 0x26
	.long	.LASF193
	.byte	0x11
	.byte	0xc3
	.long	0xc36
	.long	0x1152
	.uleb128 0x25
	.long	0xb7f
	.uleb128 0x25
	.long	0xb7f
	.byte	0
	.uleb128 0x26
	.long	.LASF194
	.byte	0x11
	.byte	0xc7
	.long	0xb7f
	.long	0x1167
	.uleb128 0x25
	.long	0x1167
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x109d
	.uleb128 0x26
	.long	.LASF195
	.byte	0x11
	.byte	0xc0
	.long	0xb7f
	.long	0x1182
	.uleb128 0x25
	.long	0x1182
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xb7f
	.uleb128 0x27
	.long	.LASF196
	.byte	0x11
	.value	0x105
	.long	0xa1
	.long	0x119e
	.uleb128 0x25
	.long	0x119e
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x11a4
	.uleb128 0x10
	.long	0x109d
	.uleb128 0x27
	.long	.LASF197
	.byte	0x11
	.value	0x108
	.long	0xa1
	.long	0x11bf
	.uleb128 0x25
	.long	0x11bf
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x11c5
	.uleb128 0x10
	.long	0xb7f
	.uleb128 0x26
	.long	.LASF198
	.byte	0x11
	.byte	0xef
	.long	0x1167
	.long	0x11df
	.uleb128 0x25
	.long	0x11bf
	.byte	0
	.uleb128 0x26
	.long	.LASF199
	.byte	0x11
	.byte	0xf3
	.long	0x1167
	.long	0x11f4
	.uleb128 0x25
	.long	0x11bf
	.byte	0
	.uleb128 0x26
	.long	.LASF200
	.byte	0x11
	.byte	0xcd
	.long	0x29
	.long	0x1218
	.uleb128 0x25
	.long	0xa1
	.uleb128 0x25
	.long	0x29
	.uleb128 0x25
	.long	0x332
	.uleb128 0x25
	.long	0x119e
	.byte	0
	.uleb128 0x10
	.long	0x65
	.uleb128 0x6
	.byte	0x8
	.long	0x73e
	.uleb128 0x6
	.byte	0x8
	.long	0x799
	.uleb128 0x10
	.long	0x1079
	.uleb128 0x33
	.long	.LASF229
	.quad	.LFB512
	.quad	.LFE512-.LFB512
	.uleb128 0x1
	.byte	0x9c
	.long	0x12a4
	.uleb128 0x34
	.long	0x12a4
	.uleb128 0x35
	.long	0x12c1
	.long	.LLST0
	.uleb128 0x36
	.long	.LASF201
	.byte	0x1
	.byte	0x9
	.long	0xc36
	.long	.LLST1
	.uleb128 0x37
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.long	0x1289
	.uleb128 0x38
	.string	"i"
	.byte	0x1
	.byte	0xc
	.long	0x5e
	.long	.LLST2
	.byte	0
	.uleb128 0x39
	.quad	.LVL1
	.long	0x13f4
	.uleb128 0x39
	.quad	.LVL2
	.long	0x1401
	.byte	0
	.uleb128 0x3a
	.byte	0x8
	.long	.LASF230
	.long	0x12bb
	.uleb128 0x8
	.long	.LASF201
	.byte	0x1
	.byte	0x9
	.long	0x12bb
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0xc36
	.uleb128 0x6
	.byte	0x8
	.long	0x1249
	.uleb128 0x3b
	.long	.LASF231
	.byte	0x1
	.byte	0x7
	.long	0x5e
	.quad	.LFB511
	.quad	.LFE511-.LFB511
	.uleb128 0x1
	.byte	0x9c
	.long	0x1371
	.uleb128 0x3c
	.long	.LASF202
	.byte	0x1
	.byte	0x7
	.long	0x5e
	.long	.LLST3
	.uleb128 0x3c
	.long	.LASF203
	.byte	0x1
	.byte	0x7
	.long	0xdb1
	.long	.LLST4
	.uleb128 0x37
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.long	0x1345
	.uleb128 0x3d
	.long	.LASF201
	.byte	0x1
	.byte	0x9
	.long	0xc36
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x3e
	.quad	.LVL11
	.long	0x140e
	.uleb128 0x3f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.byte	0
	.byte	0
	.uleb128 0x3e
	.quad	.LVL10
	.long	0x1425
	.uleb128 0x3f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	main._omp_fn.0
	.uleb128 0x3f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x3f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x3f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x40
	.long	.LASF204
	.byte	0x4
	.byte	0xa8
	.long	0x306
	.uleb128 0x40
	.long	.LASF205
	.byte	0x4
	.byte	0xa9
	.long	0x306
	.uleb128 0x41
	.long	0x513
	.long	.LASF206
	.byte	0
	.uleb128 0x41
	.long	0x56b
	.long	.LASF207
	.byte	0x1
	.uleb128 0x41
	.long	0x7ab
	.long	.LASF208
	.byte	0x1
	.uleb128 0x42
	.long	0x7b8
	.long	.LASF209
	.long	0x3b9aca00
	.uleb128 0x41
	.long	0x6f7
	.long	.LASF210
	.byte	0x1
	.uleb128 0x42
	.long	0x74f
	.long	.LASF211
	.long	0x3b9aca00
	.uleb128 0x42
	.long	0x7ed
	.long	.LASF212
	.long	0x3b9aca00
	.uleb128 0x41
	.long	0x7fd
	.long	.LASF213
	.byte	0x1
	.uleb128 0x41
	.long	0x82b
	.long	.LASF214
	.byte	0x1
	.uleb128 0x41
	.long	0x838
	.long	.LASF215
	.byte	0x1
	.uleb128 0x43
	.long	.LASF216
	.long	.LASF218
	.long	0x5e
	.uleb128 0x43
	.long	.LASF217
	.long	.LASF219
	.long	0x5e
	.uleb128 0x27
	.long	.LASF220
	.byte	0x4
	.value	0x16a
	.long	0x5e
	.long	0x1425
	.uleb128 0x25
	.long	0x332
	.uleb128 0x44
	.byte	0
	.uleb128 0x45
	.long	.LASF221
	.long	.LASF232
	.long	0x1447
	.uleb128 0x25
	.long	0x1447
	.uleb128 0x25
	.long	0x9f
	.uleb128 0x25
	.long	0x49
	.uleb128 0x25
	.long	0x49
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x144d
	.uleb128 0x46
	.uleb128 0x25
	.long	0x9f
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x8
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x8
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2f
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x30
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x39
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x3a
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x30
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x30
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x30
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x30
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1e
	.uleb128 0x19
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x15
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0x16
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3c
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x3d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3e
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3f
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x40
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x41
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x42
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x43
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x44
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x45
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x46
	.uleb128 0x15
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LVL0
	.quad	.LVL1-1
	.value	0x1
	.byte	0x55
	.quad	.LVL1-1
	.quad	.LVL6
	.value	0x1
	.byte	0x53
	.quad	.LVL6
	.quad	.LFE512
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL0
	.quad	.LVL1-1
	.value	0x3
	.byte	0x75
	.sleb128 0
	.byte	0x6
	.quad	.LVL1-1
	.quad	.LVL6
	.value	0x3
	.byte	0x73
	.sleb128 0
	.byte	0x6
	.quad	.LVL6
	.quad	.LFE512
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x6
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL3
	.quad	.LVL5
	.value	0x1
	.byte	0x58
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL7
	.quad	.LVL9
	.value	0x1
	.byte	0x55
	.quad	.LVL9
	.quad	.LFE511
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL7
	.quad	.LVL8
	.value	0x1
	.byte	0x54
	.quad	.LVL8
	.quad	.LFE511
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x3c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.LFB511
	.quad	.LFE511-.LFB511
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.LFB511
	.quad	.LFE511
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF220:
	.string	"printf"
.LASF145:
	.string	"atoll"
.LASF227:
	.string	"at_quick_exit"
.LASF199:
	.string	"localtime"
.LASF16:
	.string	"_IO_read_ptr"
.LASF28:
	.string	"_chain"
.LASF183:
	.string	"tm_hour"
.LASF106:
	.string	"quot"
.LASF7:
	.string	"size_t"
.LASF176:
	.string	"uintptr_t"
.LASF170:
	.string	"int_fast64_t"
.LASF209:
	.string	"_ZNSt5ratioILl1ELl1000000000EE3denE"
.LASF34:
	.string	"_shortbuf"
.LASF22:
	.string	"_IO_buf_base"
.LASF141:
	.string	"wcstombs"
.LASF110:
	.string	"7lldiv_t"
.LASF119:
	.string	"long long unsigned int"
.LASF200:
	.string	"strftime"
.LASF96:
	.string	"remove"
.LASF48:
	.string	"__mbstate_t"
.LASF173:
	.string	"uint_fast32_t"
.LASF226:
	.string	"ratio<1l, 1l>"
.LASF195:
	.string	"time"
.LASF121:
	.string	"atexit"
.LASF107:
	.string	"div_t"
.LASF89:
	.string	"fseek"
.LASF111:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF129:
	.string	"mblen"
.LASF178:
	.string	"uintmax_t"
.LASF222:
	.string	"GNU C++ 4.9.2 20150212 (Red Hat 4.9.2-6) -fpreprocessed -mtune=generic -march=x86-64 -g -O2 -std=c++11 -fopenmp"
.LASF65:
	.string	"operator std::integral_constant<bool, true>::value_type"
.LASF29:
	.string	"_fileno"
.LASF17:
	.string	"_IO_read_end"
.LASF216:
	.string	"__builtin_omp_get_num_threads"
.LASF159:
	.string	"int_least8_t"
.LASF148:
	.string	"strtof"
.LASF6:
	.string	"long int"
.LASF152:
	.string	"float_t"
.LASF179:
	.string	"char16_t"
.LASF15:
	.string	"_flags"
.LASF161:
	.string	"int_least32_t"
.LASF180:
	.string	"char32_t"
.LASF32:
	.string	"_cur_column"
.LASF167:
	.string	"int_fast8_t"
.LASF156:
	.string	"uint16_t"
.LASF214:
	.string	"_ZNSt5ratioILl1ELl1EE3numE"
.LASF123:
	.string	"double"
.LASF31:
	.string	"_old_offset"
.LASF36:
	.string	"_offset"
.LASF164:
	.string	"uint_least16_t"
.LASF53:
	.string	"_G_fpos_t"
.LASF131:
	.string	"wchar_t"
.LASF132:
	.string	"mbtowc"
.LASF133:
	.string	"qsort"
.LASF113:
	.string	"clock_t"
.LASF51:
	.string	"__pos"
.LASF125:
	.string	"atol"
.LASF165:
	.string	"uint_least32_t"
.LASF74:
	.string	"_ZNKSt17integral_constantIlLl1000000000EEcvlEv"
.LASF56:
	.string	"_next"
.LASF193:
	.string	"difftime"
.LASF55:
	.string	"_IO_marker"
.LASF204:
	.string	"stdin"
.LASF186:
	.string	"tm_year"
.LASF90:
	.string	"fsetpos"
.LASF45:
	.string	"__wchb"
.LASF92:
	.string	"getc"
.LASF73:
	.string	"operator std::integral_constant<long int, 1000000000l>::value_type"
.LASF229:
	.string	"main._omp_fn.0"
.LASF0:
	.string	"long unsigned int"
.LASF81:
	.string	"ferror"
.LASF215:
	.string	"_ZNSt5ratioILl1ELl1EE3denE"
.LASF135:
	.string	"rand"
.LASF20:
	.string	"_IO_write_ptr"
.LASF93:
	.string	"gets"
.LASF57:
	.string	"_sbuf"
.LASF224:
	.string	"/home/mkurnosov/shad_yandex/pdc-spring2015/lecture4/pdc-spring2015-lec4-src/_14_atomic_counter"
.LASF105:
	.string	"5div_t"
.LASF103:
	.string	"tmpnam"
.LASF137:
	.string	"strtod"
.LASF189:
	.string	"tm_isdst"
.LASF102:
	.string	"tmpfile"
.LASF78:
	.string	"ratio<1000000000l, 1l>"
.LASF144:
	.string	"lldiv"
.LASF97:
	.string	"rename"
.LASF44:
	.string	"__wch"
.LASF83:
	.string	"fgetc"
.LASF174:
	.string	"uint_fast64_t"
.LASF219:
	.string	"omp_get_thread_num"
.LASF11:
	.string	"__clock_t"
.LASF175:
	.string	"intptr_t"
.LASF35:
	.string	"_lock"
.LASF169:
	.string	"int_fast32_t"
.LASF30:
	.string	"_flags2"
.LASF42:
	.string	"_mode"
.LASF85:
	.string	"fgets"
.LASF205:
	.string	"stdout"
.LASF197:
	.string	"ctime"
.LASF230:
	.string	"13.omp_data_s.1"
.LASF196:
	.string	"asctime"
.LASF185:
	.string	"tm_mon"
.LASF95:
	.string	"perror"
.LASF127:
	.string	"getenv"
.LASF69:
	.string	"integral_constant<long int, 1l>"
.LASF162:
	.string	"int_least64_t"
.LASF211:
	.string	"_ZNSt17integral_constantIlLl1000000000EE5valueE"
.LASF10:
	.string	"sizetype"
.LASF210:
	.string	"_ZNSt17integral_constantIlLl1EE5valueE"
.LASF188:
	.string	"tm_yday"
.LASF126:
	.string	"bsearch"
.LASF94:
	.string	"clearerr"
.LASF24:
	.string	"_IO_save_base"
.LASF76:
	.string	"_Num"
.LASF21:
	.string	"_IO_write_end"
.LASF158:
	.string	"uint64_t"
.LASF104:
	.string	"ungetc"
.LASF50:
	.string	"9_G_fpos_t"
.LASF128:
	.string	"ldiv"
.LASF177:
	.string	"intmax_t"
.LASF225:
	.string	"_IO_lock_t"
.LASF54:
	.string	"_IO_FILE"
.LASF172:
	.string	"uint_fast16_t"
.LASF60:
	.string	"integral_constant<bool, false>"
.LASF8:
	.string	"__off_t"
.LASF114:
	.string	"time_t"
.LASF62:
	.string	"integral_constant<bool, true>"
.LASF228:
	.string	"_ZN9__gnu_cxx3divExx"
.LASF149:
	.string	"float"
.LASF86:
	.string	"fopen"
.LASF58:
	.string	"_pos"
.LASF221:
	.string	"__builtin_GOMP_parallel"
.LASF218:
	.string	"omp_get_num_threads"
.LASF166:
	.string	"uint_least64_t"
.LASF212:
	.string	"_ZNSt5ratioILl1000000000ELl1EE3numE"
.LASF27:
	.string	"_markers"
.LASF130:
	.string	"mbstowcs"
.LASF52:
	.string	"__state"
.LASF136:
	.string	"srand"
.LASF87:
	.string	"fread"
.LASF154:
	.string	"bool"
.LASF122:
	.string	"atof"
.LASF124:
	.string	"atoi"
.LASF138:
	.string	"strtol"
.LASF117:
	.string	"int32_t"
.LASF1:
	.string	"unsigned char"
.LASF108:
	.string	"6ldiv_t"
.LASF217:
	.string	"__builtin_omp_get_thread_num"
.LASF112:
	.string	"lldiv_t"
.LASF153:
	.string	"double_t"
.LASF23:
	.string	"_IO_buf_end"
.LASF5:
	.string	"short int"
.LASF67:
	.string	"_ZNKSt17integral_constantIbLb1EEcvbEv"
.LASF201:
	.string	"counter"
.LASF150:
	.string	"strtold"
.LASF171:
	.string	"uint_fast8_t"
.LASF146:
	.string	"strtoll"
.LASF33:
	.string	"_vtable_offset"
.LASF109:
	.string	"ldiv_t"
.LASF99:
	.string	"setbuf"
.LASF194:
	.string	"mktime"
.LASF142:
	.string	"wctomb"
.LASF190:
	.string	"tm_gmtoff"
.LASF160:
	.string	"int_least16_t"
.LASF63:
	.string	"value"
.LASF72:
	.string	"integral_constant<long int, 1000000000l>"
.LASF168:
	.string	"int_fast16_t"
.LASF37:
	.string	"__pad1"
.LASF198:
	.string	"gmtime"
.LASF46:
	.string	"__count"
.LASF213:
	.string	"_ZNSt5ratioILl1000000000ELl1EE3denE"
.LASF47:
	.string	"__value"
.LASF206:
	.string	"_ZNSt17integral_constantIbLb0EE5valueE"
.LASF71:
	.string	"_ZNKSt17integral_constantIlLl1EEcvlEv"
.LASF207:
	.string	"_ZNSt17integral_constantIbLb1EE5valueE"
.LASF134:
	.string	"quick_exit"
.LASF151:
	.string	"long double"
.LASF13:
	.string	"char"
.LASF3:
	.string	"unsigned int"
.LASF147:
	.string	"strtoull"
.LASF232:
	.string	"GOMP_parallel"
.LASF59:
	.string	"fpos_t"
.LASF163:
	.string	"uint_least8_t"
.LASF80:
	.string	"feof"
.LASF182:
	.string	"tm_min"
.LASF187:
	.string	"tm_wday"
.LASF79:
	.string	"fclose"
.LASF88:
	.string	"freopen"
.LASF116:
	.string	"int16_t"
.LASF70:
	.string	"operator std::integral_constant<long int, 1l>::value_type"
.LASF9:
	.string	"__off64_t"
.LASF223:
	.string	"pi_spmd_for.cpp"
.LASF18:
	.string	"_IO_read_base"
.LASF26:
	.string	"_IO_save_end"
.LASF2:
	.string	"short unsigned int"
.LASF101:
	.string	"getchar"
.LASF184:
	.string	"tm_mday"
.LASF115:
	.string	"int8_t"
.LASF38:
	.string	"__pad2"
.LASF39:
	.string	"__pad3"
.LASF40:
	.string	"__pad4"
.LASF41:
	.string	"__pad5"
.LASF49:
	.string	"11__mbstate_t"
.LASF12:
	.string	"__time_t"
.LASF43:
	.string	"_unused2"
.LASF181:
	.string	"tm_sec"
.LASF203:
	.string	"argv"
.LASF75:
	.string	"ratio<1l, 1000000000l>"
.LASF139:
	.string	"strtoul"
.LASF191:
	.string	"tm_zone"
.LASF77:
	.string	"_Den"
.LASF155:
	.string	"uint8_t"
.LASF25:
	.string	"_IO_backup_base"
.LASF100:
	.string	"setvbuf"
.LASF208:
	.string	"_ZNSt5ratioILl1ELl1000000000EE3numE"
.LASF140:
	.string	"system"
.LASF120:
	.string	"__compar_fn_t"
.LASF202:
	.string	"argc"
.LASF98:
	.string	"rewind"
.LASF64:
	.string	"operator std::integral_constant<bool, false>::value_type"
.LASF118:
	.string	"int64_t"
.LASF91:
	.string	"ftell"
.LASF14:
	.string	"FILE"
.LASF84:
	.string	"fgetpos"
.LASF192:
	.string	"clock"
.LASF231:
	.string	"main"
.LASF19:
	.string	"_IO_write_base"
.LASF68:
	.string	"chrono"
.LASF61:
	.string	"value_type"
.LASF157:
	.string	"uint32_t"
.LASF82:
	.string	"fflush"
.LASF143:
	.string	"__gnu_cxx"
.LASF66:
	.string	"_ZNKSt17integral_constantIbLb0EEcvbEv"
	.ident	"GCC: (GNU) 4.9.2 20150212 (Red Hat 4.9.2-6)"
	.section	.note.GNU-stack,"",@progbits
