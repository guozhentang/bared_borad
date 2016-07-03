
inter.elf:     file format elf32-littlearm

Disassembly of section .text:

00000000 <init_led>:
   0:	e1a0c00d 	mov	ip, sp
   4:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
   8:	e24cb004 	sub	fp, ip, #4	; 0x4
   c:	e3a02456 	mov	r2, #1442840576	; 0x56000000
  10:	e2822050 	add	r2, r2, #80	; 0x50
  14:	e3a03456 	mov	r3, #1442840576	; 0x56000000
  18:	e2833050 	add	r3, r3, #80	; 0x50
  1c:	e5933000 	ldr	r3, [r3]
  20:	e3c33c3f 	bic	r3, r3, #16128	; 0x3f00
  24:	e5823000 	str	r3, [r2]
  28:	e3a02456 	mov	r2, #1442840576	; 0x56000000
  2c:	e2822050 	add	r2, r2, #80	; 0x50
  30:	e3a03456 	mov	r3, #1442840576	; 0x56000000
  34:	e2833050 	add	r3, r3, #80	; 0x50
  38:	e5933000 	ldr	r3, [r3]
  3c:	e3833c15 	orr	r3, r3, #5376	; 0x1500
  40:	e5823000 	str	r3, [r2]
  44:	e89da800 	ldmia	sp, {fp, sp, pc}

00000048 <init_irq>:
  48:	e1a0c00d 	mov	ip, sp
  4c:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
  50:	e24cb004 	sub	fp, ip, #4	; 0x4
  54:	e3a02456 	mov	r2, #1442840576	; 0x56000000
  58:	e2822050 	add	r2, r2, #80	; 0x50
  5c:	e3a03456 	mov	r3, #1442840576	; 0x56000000
  60:	e2833050 	add	r3, r3, #80	; 0x50
  64:	e5933000 	ldr	r3, [r3]
  68:	e3c33003 	bic	r3, r3, #3	; 0x3
  6c:	e5823000 	str	r3, [r2]
  70:	e3a02456 	mov	r2, #1442840576	; 0x56000000
  74:	e2822050 	add	r2, r2, #80	; 0x50
  78:	e3a03456 	mov	r3, #1442840576	; 0x56000000
  7c:	e2833050 	add	r3, r3, #80	; 0x50
  80:	e5933000 	ldr	r3, [r3]
  84:	e3833002 	orr	r3, r3, #2	; 0x2
  88:	e5823000 	str	r3, [r2]
  8c:	e3a0244a 	mov	r2, #1241513984	; 0x4a000000
  90:	e282200c 	add	r2, r2, #12	; 0xc
  94:	e3a0344a 	mov	r3, #1241513984	; 0x4a000000
  98:	e283300c 	add	r3, r3, #12	; 0xc
  9c:	e5933000 	ldr	r3, [r3]
  a0:	e3c33001 	bic	r3, r3, #1	; 0x1
  a4:	e5823000 	str	r3, [r2]
  a8:	e3a0244a 	mov	r2, #1241513984	; 0x4a000000
  ac:	e2822008 	add	r2, r2, #8	; 0x8
  b0:	e3a0344a 	mov	r3, #1241513984	; 0x4a000000
  b4:	e2833008 	add	r3, r3, #8	; 0x8
  b8:	e5933000 	ldr	r3, [r3]
  bc:	e3c33001 	bic	r3, r3, #1	; 0x1
  c0:	e5823000 	str	r3, [r2]
  c4:	e89da800 	ldmia	sp, {fp, sp, pc}

000000c8 <EINT_Handle>:
  c8:	e1a0c00d 	mov	ip, sp
  cc:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
  d0:	e24cb004 	sub	fp, ip, #4	; 0x4
  d4:	e24dd004 	sub	sp, sp, #4	; 0x4
  d8:	e3a0344a 	mov	r3, #1241513984	; 0x4a000000
  dc:	e2833014 	add	r3, r3, #20	; 0x14
  e0:	e5933000 	ldr	r3, [r3]
  e4:	e50b3010 	str	r3, [fp, #-16]
  e8:	e51b3010 	ldr	r3, [fp, #-16]
  ec:	e3530000 	cmp	r3, #0	; 0x0
  f0:	1a00000d 	bne	12c <EINT_Handle+0x64>
  f4:	e3a02456 	mov	r2, #1442840576	; 0x56000000
  f8:	e2822054 	add	r2, r2, #84	; 0x54
  fc:	e3a03456 	mov	r3, #1442840576	; 0x56000000
 100:	e2833054 	add	r3, r3, #84	; 0x54
 104:	e5933000 	ldr	r3, [r3]
 108:	e3833070 	orr	r3, r3, #112	; 0x70
 10c:	e5823000 	str	r3, [r2]
 110:	e3a02456 	mov	r2, #1442840576	; 0x56000000
 114:	e2822054 	add	r2, r2, #84	; 0x54
 118:	e3a03456 	mov	r3, #1442840576	; 0x56000000
 11c:	e2833054 	add	r3, r3, #84	; 0x54
 120:	e5933000 	ldr	r3, [r3]
 124:	e3c33010 	bic	r3, r3, #16	; 0x10
 128:	e5823000 	str	r3, [r2]
 12c:	e3a0144a 	mov	r1, #1241513984	; 0x4a000000
 130:	e3a02001 	mov	r2, #1	; 0x1
 134:	e51b3010 	ldr	r3, [fp, #-16]
 138:	e1a03312 	mov	r3, r2, lsl r3
 13c:	e5813000 	str	r3, [r1]
 140:	e3a0244a 	mov	r2, #1241513984	; 0x4a000000
 144:	e2822010 	add	r2, r2, #16	; 0x10
 148:	e3a01001 	mov	r1, #1	; 0x1
 14c:	e51b3010 	ldr	r3, [fp, #-16]
 150:	e1a03311 	mov	r3, r1, lsl r3
 154:	e5823000 	str	r3, [r2]
 158:	e89da808 	ldmia	sp, {r3, fp, sp, pc}

0000015c <main>:
 15c:	e1a0c00d 	mov	ip, sp
 160:	e92dd800 	stmdb	sp!, {fp, ip, lr, pc}
 164:	e24cb004 	sub	fp, ip, #4	; 0x4
 168:	e24dd004 	sub	sp, sp, #4	; 0x4
 16c:	e3a03000 	mov	r3, #0	; 0x0
 170:	e50b3010 	str	r3, [fp, #-16]
 174:	e51b3010 	ldr	r3, [fp, #-16]
 178:	e3530063 	cmp	r3, #99	; 0x63
 17c:	cafffffa 	bgt	16c <main+0x10>
 180:	e51b3010 	ldr	r3, [fp, #-16]
 184:	e2833001 	add	r3, r3, #1	; 0x1
 188:	e50b3010 	str	r3, [fp, #-16]
 18c:	eafffff8 	b	174 <main+0x18>

00000190 <_start>:
 190:	ea000006 	b	1b0 <Reset>

00000194 <HandleUndef>:
 194:	eafffffe 	b	194 <HandleUndef>

00000198 <HandleSWI>:
 198:	eafffffe 	b	198 <HandleSWI>

0000019c <HandlePrefetchAbort>:
 19c:	eafffffe 	b	19c <HandlePrefetchAbort>

000001a0 <HandleDataAbort>:
 1a0:	eafffffe 	b	1a0 <HandleDataAbort>

000001a4 <HandleNotUsed>:
 1a4:	eafffffe 	b	1a4 <HandleNotUsed>
 1a8:	ea00000d 	b	1e4 <_inter_handle>

000001ac <HandleFIQ>:
 1ac:	eafffffe 	b	1ac <HandleFIQ>

000001b0 <Reset>:
 1b0:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
 1b4:	e3a0db03 	mov	sp, #3072	; 0xc00
 1b8:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
 1bc:	eb000004 	bl	1d4 <_close_watch_dog>
 1c0:	e3a0da01 	mov	sp, #4096	; 0x1000
 1c4:	ebffff8d 	bl	0 <init_led>
 1c8:	ebffff9e 	bl	48 <init_irq>
 1cc:	e321f053 	msr	CPSR_c, #83	; 0x53
 1d0:	ebffffe1 	bl	15c <main>

000001d4 <_close_watch_dog>:
 1d4:	e3a00453 	mov	r0, #1392508928	; 0x53000000
 1d8:	e3a01000 	mov	r1, #0	; 0x0
 1dc:	e5801000 	str	r1, [r0]
 1e0:	e1a0f00e 	mov	pc, lr

000001e4 <_inter_handle>:
 1e4:	e24ee004 	sub	lr, lr, #4	; 0x4
 1e8:	e92d5fff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
 1ec:	e59fe004 	ldr	lr, [pc, #4]	; 1f8 <.text+0x1f8>
 1f0:	e59ff004 	ldr	pc, [pc, #4]	; 1fc <.text+0x1fc>

000001f4 <int_return>:
 1f4:	e8fd9fff 	ldmia	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}^
 1f8:	000001f4 	streqd	r0, [r0], -r4
 1fc:	000000c8 	andeq	r0, r0, r8, asr #1
Disassembly of section .comment:

00000000 <.comment>:
   0:	43434700 	cmpmi	r3, #0	; 0x0
   4:	4728203a 	undefined
   8:	2029554e 	eorcs	r5, r9, lr, asr #10
   c:	2e342e33 	mrccs	14, 1, r2, cr4, cr3, {1}
  10:	47000035 	smladxmi	r0, r5, r0, r0
  14:	203a4343 	eorcss	r4, sl, r3, asr #6
  18:	554e4728 	strplb	r4, [lr, #-1832]
  1c:	2e332029 	cdpcs	0, 3, cr2, cr3, cr9, {1}
  20:	00352e34 	eoreqs	r2, r5, r4, lsr lr
