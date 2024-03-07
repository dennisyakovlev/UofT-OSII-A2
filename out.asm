
a.out:     file format elf64-x86-64


Disassembly of section .init:

0000000000002000 <_init>:
    2000:	f3 0f 1e fa          	endbr64 
    2004:	48 83 ec 08          	sub    $0x8,%rsp
    2008:	48 8b 05 c9 4f 00 00 	mov    0x4fc9(%rip),%rax        # 6fd8 <__gmon_start__@Base>
    200f:	48 85 c0             	test   %rax,%rax
    2012:	74 02                	je     2016 <_init+0x16>
    2014:	ff d0                	call   *%rax
    2016:	48 83 c4 08          	add    $0x8,%rsp
    201a:	c3                   	ret    

Disassembly of section .plt:

0000000000002020 <.plt>:
    2020:	ff 35 1a 4f 00 00    	push   0x4f1a(%rip)        # 6f40 <_GLOBAL_OFFSET_TABLE_+0x8>
    2026:	f2 ff 25 1b 4f 00 00 	bnd jmp *0x4f1b(%rip)        # 6f48 <_GLOBAL_OFFSET_TABLE_+0x10>
    202d:	0f 1f 00             	nopl   (%rax)
    2030:	f3 0f 1e fa          	endbr64 
    2034:	68 00 00 00 00       	push   $0x0
    2039:	f2 e9 e1 ff ff ff    	bnd jmp 2020 <_init+0x20>
    203f:	90                   	nop
    2040:	f3 0f 1e fa          	endbr64 
    2044:	68 01 00 00 00       	push   $0x1
    2049:	f2 e9 d1 ff ff ff    	bnd jmp 2020 <_init+0x20>
    204f:	90                   	nop
    2050:	f3 0f 1e fa          	endbr64 
    2054:	68 02 00 00 00       	push   $0x2
    2059:	f2 e9 c1 ff ff ff    	bnd jmp 2020 <_init+0x20>
    205f:	90                   	nop
    2060:	f3 0f 1e fa          	endbr64 
    2064:	68 03 00 00 00       	push   $0x3
    2069:	f2 e9 b1 ff ff ff    	bnd jmp 2020 <_init+0x20>
    206f:	90                   	nop
    2070:	f3 0f 1e fa          	endbr64 
    2074:	68 04 00 00 00       	push   $0x4
    2079:	f2 e9 a1 ff ff ff    	bnd jmp 2020 <_init+0x20>
    207f:	90                   	nop
    2080:	f3 0f 1e fa          	endbr64 
    2084:	68 05 00 00 00       	push   $0x5
    2089:	f2 e9 91 ff ff ff    	bnd jmp 2020 <_init+0x20>
    208f:	90                   	nop
    2090:	f3 0f 1e fa          	endbr64 
    2094:	68 06 00 00 00       	push   $0x6
    2099:	f2 e9 81 ff ff ff    	bnd jmp 2020 <_init+0x20>
    209f:	90                   	nop
    20a0:	f3 0f 1e fa          	endbr64 
    20a4:	68 07 00 00 00       	push   $0x7
    20a9:	f2 e9 71 ff ff ff    	bnd jmp 2020 <_init+0x20>
    20af:	90                   	nop
    20b0:	f3 0f 1e fa          	endbr64 
    20b4:	68 08 00 00 00       	push   $0x8
    20b9:	f2 e9 61 ff ff ff    	bnd jmp 2020 <_init+0x20>
    20bf:	90                   	nop
    20c0:	f3 0f 1e fa          	endbr64 
    20c4:	68 09 00 00 00       	push   $0x9
    20c9:	f2 e9 51 ff ff ff    	bnd jmp 2020 <_init+0x20>
    20cf:	90                   	nop
    20d0:	f3 0f 1e fa          	endbr64 
    20d4:	68 0a 00 00 00       	push   $0xa
    20d9:	f2 e9 41 ff ff ff    	bnd jmp 2020 <_init+0x20>
    20df:	90                   	nop
    20e0:	f3 0f 1e fa          	endbr64 
    20e4:	68 0b 00 00 00       	push   $0xb
    20e9:	f2 e9 31 ff ff ff    	bnd jmp 2020 <_init+0x20>
    20ef:	90                   	nop
    20f0:	f3 0f 1e fa          	endbr64 
    20f4:	68 0c 00 00 00       	push   $0xc
    20f9:	f2 e9 21 ff ff ff    	bnd jmp 2020 <_init+0x20>
    20ff:	90                   	nop
    2100:	f3 0f 1e fa          	endbr64 
    2104:	68 0d 00 00 00       	push   $0xd
    2109:	f2 e9 11 ff ff ff    	bnd jmp 2020 <_init+0x20>
    210f:	90                   	nop
    2110:	f3 0f 1e fa          	endbr64 
    2114:	68 0e 00 00 00       	push   $0xe
    2119:	f2 e9 01 ff ff ff    	bnd jmp 2020 <_init+0x20>
    211f:	90                   	nop
    2120:	f3 0f 1e fa          	endbr64 
    2124:	68 0f 00 00 00       	push   $0xf
    2129:	f2 e9 f1 fe ff ff    	bnd jmp 2020 <_init+0x20>
    212f:	90                   	nop
    2130:	f3 0f 1e fa          	endbr64 
    2134:	68 10 00 00 00       	push   $0x10
    2139:	f2 e9 e1 fe ff ff    	bnd jmp 2020 <_init+0x20>
    213f:	90                   	nop

Disassembly of section .plt.got:

0000000000002140 <__cxa_finalize@plt>:
    2140:	f3 0f 1e fa          	endbr64 
    2144:	f2 ff 25 a5 4e 00 00 	bnd jmp *0x4ea5(%rip)        # 6ff0 <__cxa_finalize@GLIBC_2.2.5>
    214b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000002150 <__asan_init@plt>:
    2150:	f3 0f 1e fa          	endbr64 
    2154:	f2 ff 25 f5 4d 00 00 	bnd jmp *0x4df5(%rip)        # 6f50 <__asan_init@Base>
    215b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002160 <__asan_report_load8@plt>:
    2160:	f3 0f 1e fa          	endbr64 
    2164:	f2 ff 25 ed 4d 00 00 	bnd jmp *0x4ded(%rip)        # 6f58 <__asan_report_load8@Base>
    216b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002170 <__asan_report_store2@plt>:
    2170:	f3 0f 1e fa          	endbr64 
    2174:	f2 ff 25 e5 4d 00 00 	bnd jmp *0x4de5(%rip)        # 6f60 <__asan_report_store2@Base>
    217b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002180 <__assert_fail@plt>:
    2180:	f3 0f 1e fa          	endbr64 
    2184:	f2 ff 25 dd 4d 00 00 	bnd jmp *0x4ddd(%rip)        # 6f68 <__assert_fail@GLIBC_2.2.5>
    218b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002190 <__asan_report_load4@plt>:
    2190:	f3 0f 1e fa          	endbr64 
    2194:	f2 ff 25 d5 4d 00 00 	bnd jmp *0x4dd5(%rip)        # 6f70 <__asan_report_load4@Base>
    219b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000021a0 <__asan_report_store_n@plt>:
    21a0:	f3 0f 1e fa          	endbr64 
    21a4:	f2 ff 25 cd 4d 00 00 	bnd jmp *0x4dcd(%rip)        # 6f78 <__asan_report_store_n@Base>
    21ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000021b0 <malloc@plt>:
    21b0:	f3 0f 1e fa          	endbr64 
    21b4:	f2 ff 25 c5 4d 00 00 	bnd jmp *0x4dc5(%rip)        # 6f80 <malloc@Base>
    21bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000021c0 <__asan_handle_no_return@plt>:
    21c0:	f3 0f 1e fa          	endbr64 
    21c4:	f2 ff 25 bd 4d 00 00 	bnd jmp *0x4dbd(%rip)        # 6f88 <__asan_handle_no_return@Base>
    21cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000021d0 <__asan_stack_malloc_3@plt>:
    21d0:	f3 0f 1e fa          	endbr64 
    21d4:	f2 ff 25 b5 4d 00 00 	bnd jmp *0x4db5(%rip)        # 6f90 <__asan_stack_malloc_3@Base>
    21db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000021e0 <__stack_chk_fail@plt>:
    21e0:	f3 0f 1e fa          	endbr64 
    21e4:	f2 ff 25 ad 4d 00 00 	bnd jmp *0x4dad(%rip)        # 6f98 <__stack_chk_fail@GLIBC_2.4>
    21eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000021f0 <__asan_report_store4@plt>:
    21f0:	f3 0f 1e fa          	endbr64 
    21f4:	f2 ff 25 a5 4d 00 00 	bnd jmp *0x4da5(%rip)        # 6fa0 <__asan_report_store4@Base>
    21fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002200 <__asan_report_load2@plt>:
    2200:	f3 0f 1e fa          	endbr64 
    2204:	f2 ff 25 9d 4d 00 00 	bnd jmp *0x4d9d(%rip)        # 6fa8 <__asan_report_load2@Base>
    220b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002210 <__asan_report_store8@plt>:
    2210:	f3 0f 1e fa          	endbr64 
    2214:	f2 ff 25 95 4d 00 00 	bnd jmp *0x4d95(%rip)        # 6fb0 <__asan_report_store8@Base>
    221b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002220 <__asan_unregister_globals@plt>:
    2220:	f3 0f 1e fa          	endbr64 
    2224:	f2 ff 25 8d 4d 00 00 	bnd jmp *0x4d8d(%rip)        # 6fb8 <__asan_unregister_globals@Base>
    222b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002230 <__asan_register_globals@plt>:
    2230:	f3 0f 1e fa          	endbr64 
    2234:	f2 ff 25 85 4d 00 00 	bnd jmp *0x4d85(%rip)        # 6fc0 <__asan_register_globals@Base>
    223b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002240 <__asan_stack_malloc_0@plt>:
    2240:	f3 0f 1e fa          	endbr64 
    2244:	f2 ff 25 7d 4d 00 00 	bnd jmp *0x4d7d(%rip)        # 6fc8 <__asan_stack_malloc_0@Base>
    224b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000002250 <__asan_version_mismatch_check_v8@plt>:
    2250:	f3 0f 1e fa          	endbr64 
    2254:	f2 ff 25 75 4d 00 00 	bnd jmp *0x4d75(%rip)        # 6fd0 <__asan_version_mismatch_check_v8@Base>
    225b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000002260 <_start>:
    2260:	f3 0f 1e fa          	endbr64 
    2264:	31 ed                	xor    %ebp,%ebp
    2266:	49 89 d1             	mov    %rdx,%r9
    2269:	5e                   	pop    %rsi
    226a:	48 89 e2             	mov    %rsp,%rdx
    226d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    2271:	50                   	push   %rax
    2272:	54                   	push   %rsp
    2273:	45 31 c0             	xor    %r8d,%r8d
    2276:	31 c9                	xor    %ecx,%ecx
    2278:	48 8d 3d 68 1d 00 00 	lea    0x1d68(%rip),%rdi        # 3fe7 <main>
    227f:	ff 15 73 4d 00 00    	call   *0x4d73(%rip)        # 6ff8 <__libc_start_main@GLIBC_2.34>
    2285:	f4                   	hlt    
    2286:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    228d:	00 00 00 

0000000000002290 <deregister_tm_clones>:
    2290:	48 8d 3d c9 50 00 00 	lea    0x50c9(%rip),%rdi        # 7360 <__asan_option_detect_stack_use_after_return@@Base>
    2297:	48 8d 05 c2 50 00 00 	lea    0x50c2(%rip),%rax        # 7360 <__asan_option_detect_stack_use_after_return@@Base>
    229e:	48 39 f8             	cmp    %rdi,%rax
    22a1:	74 15                	je     22b8 <deregister_tm_clones+0x28>
    22a3:	48 8b 05 36 4d 00 00 	mov    0x4d36(%rip),%rax        # 6fe0 <_ITM_deregisterTMCloneTable@Base>
    22aa:	48 85 c0             	test   %rax,%rax
    22ad:	74 09                	je     22b8 <deregister_tm_clones+0x28>
    22af:	ff e0                	jmp    *%rax
    22b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    22b8:	c3                   	ret    
    22b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000022c0 <register_tm_clones>:
    22c0:	48 8d 3d 99 50 00 00 	lea    0x5099(%rip),%rdi        # 7360 <__asan_option_detect_stack_use_after_return@@Base>
    22c7:	48 8d 35 92 50 00 00 	lea    0x5092(%rip),%rsi        # 7360 <__asan_option_detect_stack_use_after_return@@Base>
    22ce:	48 29 fe             	sub    %rdi,%rsi
    22d1:	48 89 f0             	mov    %rsi,%rax
    22d4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    22d8:	48 c1 f8 03          	sar    $0x3,%rax
    22dc:	48 01 c6             	add    %rax,%rsi
    22df:	48 d1 fe             	sar    %rsi
    22e2:	74 14                	je     22f8 <register_tm_clones+0x38>
    22e4:	48 8b 05 fd 4c 00 00 	mov    0x4cfd(%rip),%rax        # 6fe8 <_ITM_registerTMCloneTable@Base>
    22eb:	48 85 c0             	test   %rax,%rax
    22ee:	74 08                	je     22f8 <register_tm_clones+0x38>
    22f0:	ff e0                	jmp    *%rax
    22f2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    22f8:	c3                   	ret    
    22f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000002300 <__do_global_dtors_aux>:
    2300:	f3 0f 1e fa          	endbr64 
    2304:	80 3d 59 50 00 00 00 	cmpb   $0x0,0x5059(%rip)        # 7364 <completed.0>
    230b:	75 2b                	jne    2338 <__do_global_dtors_aux+0x38>
    230d:	55                   	push   %rbp
    230e:	48 83 3d da 4c 00 00 	cmpq   $0x0,0x4cda(%rip)        # 6ff0 <__cxa_finalize@GLIBC_2.2.5>
    2315:	00 
    2316:	48 89 e5             	mov    %rsp,%rbp
    2319:	74 0c                	je     2327 <__do_global_dtors_aux+0x27>
    231b:	48 8b 3d e6 4c 00 00 	mov    0x4ce6(%rip),%rdi        # 7008 <__dso_handle>
    2322:	e8 19 fe ff ff       	call   2140 <__cxa_finalize@plt>
    2327:	e8 64 ff ff ff       	call   2290 <deregister_tm_clones>
    232c:	c6 05 31 50 00 00 01 	movb   $0x1,0x5031(%rip)        # 7364 <completed.0>
    2333:	5d                   	pop    %rbp
    2334:	c3                   	ret    
    2335:	0f 1f 00             	nopl   (%rax)
    2338:	c3                   	ret    
    2339:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000002340 <frame_dummy>:
    2340:	f3 0f 1e fa          	endbr64 
    2344:	e9 77 ff ff ff       	jmp    22c0 <register_tm_clones>

0000000000002349 <table_need>:
    2349:	f3 0f 1e fa          	endbr64 
    234d:	55                   	push   %rbp
    234e:	48 89 e5             	mov    %rsp,%rbp
    2351:	89 7d fc             	mov    %edi,-0x4(%rbp)
    2354:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2357:	48 98                	cltq   
    2359:	c1 e0 04             	shl    $0x4,%eax
    235c:	83 c0 04             	add    $0x4,%eax
    235f:	5d                   	pop    %rbp
    2360:	c3                   	ret    

0000000000002361 <table_init>:
    2361:	f3 0f 1e fa          	endbr64 
    2365:	55                   	push   %rbp
    2366:	48 89 e5             	mov    %rsp,%rbp
    2369:	48 83 ec 20          	sub    $0x20,%rsp
    236d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    2371:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    2374:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2378:	48 89 c2             	mov    %rax,%rdx
    237b:	48 89 d0             	mov    %rdx,%rax
    237e:	48 c1 e8 03          	shr    $0x3,%rax
    2382:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    2388:	0f b6 00             	movzbl (%rax),%eax
    238b:	84 c0                	test   %al,%al
    238d:	0f 95 c1             	setne  %cl
    2390:	3c 03                	cmp    $0x3,%al
    2392:	0f 9e c0             	setle  %al
    2395:	21 c8                	and    %ecx,%eax
    2397:	84 c0                	test   %al,%al
    2399:	74 08                	je     23a3 <table_init+0x42>
    239b:	48 89 d7             	mov    %rdx,%rdi
    239e:	e8 4d fe ff ff       	call   21f0 <__asan_report_store4@plt>
    23a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    23a7:	8b 55 e4             	mov    -0x1c(%rbp),%edx
    23aa:	89 10                	mov    %edx,(%rax)
    23ac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    23b0:	48 8d 48 04          	lea    0x4(%rax),%rcx
    23b4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    23b8:	48 83 c0 08          	add    $0x8,%rax
    23bc:	48 89 c2             	mov    %rax,%rdx
    23bf:	48 c1 ea 03          	shr    $0x3,%rdx
    23c3:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    23ca:	0f b6 12             	movzbl (%rdx),%edx
    23cd:	84 d2                	test   %dl,%dl
    23cf:	74 08                	je     23d9 <table_init+0x78>
    23d1:	48 89 c7             	mov    %rax,%rdi
    23d4:	e8 37 fe ff ff       	call   2210 <__asan_report_store8@plt>
    23d9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    23dd:	48 89 48 08          	mov    %rcx,0x8(%rax)
    23e1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    23e8:	eb 71                	jmp    245b <table_init+0xfa>
    23ea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    23ee:	48 83 c0 08          	add    $0x8,%rax
    23f2:	48 89 c2             	mov    %rax,%rdx
    23f5:	48 c1 ea 03          	shr    $0x3,%rdx
    23f9:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2400:	0f b6 12             	movzbl (%rdx),%edx
    2403:	84 d2                	test   %dl,%dl
    2405:	74 08                	je     240f <table_init+0xae>
    2407:	48 89 c7             	mov    %rax,%rdi
    240a:	e8 51 fd ff ff       	call   2160 <__asan_report_load8@plt>
    240f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2413:	48 8b 50 08          	mov    0x8(%rax),%rdx
    2417:	8b 45 fc             	mov    -0x4(%rbp),%eax
    241a:	48 98                	cltq   
    241c:	48 c1 e0 04          	shl    $0x4,%rax
    2420:	48 01 c2             	add    %rax,%rdx
    2423:	48 89 d0             	mov    %rdx,%rax
    2426:	48 89 c1             	mov    %rax,%rcx
    2429:	48 89 c8             	mov    %rcx,%rax
    242c:	48 c1 e8 03          	shr    $0x3,%rax
    2430:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    2436:	0f b6 00             	movzbl (%rax),%eax
    2439:	84 c0                	test   %al,%al
    243b:	40 0f 95 c6          	setne  %sil
    243f:	3c 01                	cmp    $0x1,%al
    2441:	0f 9e c0             	setle  %al
    2444:	21 f0                	and    %esi,%eax
    2446:	84 c0                	test   %al,%al
    2448:	74 08                	je     2452 <table_init+0xf1>
    244a:	48 89 cf             	mov    %rcx,%rdi
    244d:	e8 1e fd ff ff       	call   2170 <__asan_report_store2@plt>
    2452:	66 c7 02 03 00       	movw   $0x3,(%rdx)
    2457:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    245b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    245e:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
    2461:	75 87                	jne    23ea <table_init+0x89>
    2463:	90                   	nop
    2464:	90                   	nop
    2465:	c9                   	leave  
    2466:	c3                   	ret    

0000000000002467 <table_lookup>:
    2467:	f3 0f 1e fa          	endbr64 
    246b:	55                   	push   %rbp
    246c:	48 89 e5             	mov    %rsp,%rbp
    246f:	48 83 ec 20          	sub    $0x20,%rsp
    2473:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    2477:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    247a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    2481:	e9 09 01 00 00       	jmp    258f <table_lookup+0x128>
    2486:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    248a:	48 83 c0 08          	add    $0x8,%rax
    248e:	48 89 c2             	mov    %rax,%rdx
    2491:	48 c1 ea 03          	shr    $0x3,%rdx
    2495:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    249c:	0f b6 12             	movzbl (%rdx),%edx
    249f:	84 d2                	test   %dl,%dl
    24a1:	74 08                	je     24ab <table_lookup+0x44>
    24a3:	48 89 c7             	mov    %rax,%rdi
    24a6:	e8 b5 fc ff ff       	call   2160 <__asan_report_load8@plt>
    24ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    24af:	48 8b 50 08          	mov    0x8(%rax),%rdx
    24b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
    24b6:	48 98                	cltq   
    24b8:	48 c1 e0 04          	shl    $0x4,%rax
    24bc:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
    24c0:	48 8d 41 04          	lea    0x4(%rcx),%rax
    24c4:	48 89 c2             	mov    %rax,%rdx
    24c7:	48 c1 ea 03          	shr    $0x3,%rdx
    24cb:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    24d2:	0f b6 12             	movzbl (%rdx),%edx
    24d5:	84 d2                	test   %dl,%dl
    24d7:	40 0f 95 c7          	setne  %dil
    24db:	48 89 c6             	mov    %rax,%rsi
    24de:	83 e6 07             	and    $0x7,%esi
    24e1:	83 c6 03             	add    $0x3,%esi
    24e4:	40 38 d6             	cmp    %dl,%sil
    24e7:	0f 9d c2             	setge  %dl
    24ea:	21 fa                	and    %edi,%edx
    24ec:	84 d2                	test   %dl,%dl
    24ee:	74 08                	je     24f8 <table_lookup+0x91>
    24f0:	48 89 c7             	mov    %rax,%rdi
    24f3:	e8 98 fc ff ff       	call   2190 <__asan_report_load4@plt>
    24f8:	8b 41 04             	mov    0x4(%rcx),%eax
    24fb:	39 45 e4             	cmp    %eax,-0x1c(%rbp)
    24fe:	0f 85 87 00 00 00    	jne    258b <table_lookup+0x124>
    2504:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2508:	48 8b 50 08          	mov    0x8(%rax),%rdx
    250c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    250f:	48 98                	cltq   
    2511:	48 c1 e0 04          	shl    $0x4,%rax
    2515:	48 01 c2             	add    %rax,%rdx
    2518:	48 89 d0             	mov    %rdx,%rax
    251b:	48 89 c1             	mov    %rax,%rcx
    251e:	48 89 c8             	mov    %rcx,%rax
    2521:	48 c1 e8 03          	shr    $0x3,%rax
    2525:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    252b:	0f b6 00             	movzbl (%rax),%eax
    252e:	84 c0                	test   %al,%al
    2530:	40 0f 95 c6          	setne  %sil
    2534:	3c 01                	cmp    $0x1,%al
    2536:	0f 9e c0             	setle  %al
    2539:	21 f0                	and    %esi,%eax
    253b:	84 c0                	test   %al,%al
    253d:	74 08                	je     2547 <table_lookup+0xe0>
    253f:	48 89 cf             	mov    %rcx,%rdi
    2542:	e8 b9 fc ff ff       	call   2200 <__asan_report_load2@plt>
    2547:	0f b7 02             	movzwl (%rdx),%eax
    254a:	66 83 f8 01          	cmp    $0x1,%ax
    254e:	75 3b                	jne    258b <table_lookup+0x124>
    2550:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2554:	48 8b 50 08          	mov    0x8(%rax),%rdx
    2558:	8b 45 fc             	mov    -0x4(%rbp),%eax
    255b:	48 98                	cltq   
    255d:	48 c1 e0 04          	shl    $0x4,%rax
    2561:	48 01 d0             	add    %rdx,%rax
    2564:	48 8d 50 08          	lea    0x8(%rax),%rdx
    2568:	48 89 d1             	mov    %rdx,%rcx
    256b:	48 c1 e9 03          	shr    $0x3,%rcx
    256f:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    2576:	0f b6 09             	movzbl (%rcx),%ecx
    2579:	84 c9                	test   %cl,%cl
    257b:	74 08                	je     2585 <table_lookup+0x11e>
    257d:	48 89 d7             	mov    %rdx,%rdi
    2580:	e8 db fb ff ff       	call   2160 <__asan_report_load8@plt>
    2585:	48 8b 40 08          	mov    0x8(%rax),%rax
    2589:	eb 47                	jmp    25d2 <table_lookup+0x16b>
    258b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    258f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2593:	48 89 c2             	mov    %rax,%rdx
    2596:	48 89 d0             	mov    %rdx,%rax
    2599:	48 c1 e8 03          	shr    $0x3,%rax
    259d:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    25a3:	0f b6 00             	movzbl (%rax),%eax
    25a6:	84 c0                	test   %al,%al
    25a8:	0f 95 c1             	setne  %cl
    25ab:	3c 03                	cmp    $0x3,%al
    25ad:	0f 9e c0             	setle  %al
    25b0:	21 c8                	and    %ecx,%eax
    25b2:	84 c0                	test   %al,%al
    25b4:	74 08                	je     25be <table_lookup+0x157>
    25b6:	48 89 d7             	mov    %rdx,%rdi
    25b9:	e8 d2 fb ff ff       	call   2190 <__asan_report_load4@plt>
    25be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    25c2:	8b 00                	mov    (%rax),%eax
    25c4:	39 45 fc             	cmp    %eax,-0x4(%rbp)
    25c7:	0f 85 b9 fe ff ff    	jne    2486 <table_lookup+0x1f>
    25cd:	b8 00 00 00 00       	mov    $0x0,%eax
    25d2:	c9                   	leave  
    25d3:	c3                   	ret    

00000000000025d4 <table_insert>:
    25d4:	f3 0f 1e fa          	endbr64 
    25d8:	55                   	push   %rbp
    25d9:	48 89 e5             	mov    %rsp,%rbp
    25dc:	48 83 ec 30          	sub    $0x30,%rsp
    25e0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    25e4:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    25e7:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    25eb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    25f2:	e9 0b 01 00 00       	jmp    2702 <table_insert+0x12e>
    25f7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    25fb:	48 83 c0 08          	add    $0x8,%rax
    25ff:	48 89 c2             	mov    %rax,%rdx
    2602:	48 c1 ea 03          	shr    $0x3,%rdx
    2606:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    260d:	0f b6 12             	movzbl (%rdx),%edx
    2610:	84 d2                	test   %dl,%dl
    2612:	74 08                	je     261c <table_insert+0x48>
    2614:	48 89 c7             	mov    %rax,%rdi
    2617:	e8 44 fb ff ff       	call   2160 <__asan_report_load8@plt>
    261c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2620:	48 8b 50 08          	mov    0x8(%rax),%rdx
    2624:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    2627:	48 98                	cltq   
    2629:	48 c1 e0 04          	shl    $0x4,%rax
    262d:	48 01 c2             	add    %rax,%rdx
    2630:	48 89 d0             	mov    %rdx,%rax
    2633:	48 89 c1             	mov    %rax,%rcx
    2636:	48 89 c8             	mov    %rcx,%rax
    2639:	48 c1 e8 03          	shr    $0x3,%rax
    263d:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    2643:	0f b6 00             	movzbl (%rax),%eax
    2646:	84 c0                	test   %al,%al
    2648:	40 0f 95 c6          	setne  %sil
    264c:	3c 01                	cmp    $0x1,%al
    264e:	0f 9e c0             	setle  %al
    2651:	21 f0                	and    %esi,%eax
    2653:	84 c0                	test   %al,%al
    2655:	74 08                	je     265f <table_insert+0x8b>
    2657:	48 89 cf             	mov    %rcx,%rdi
    265a:	e8 a1 fb ff ff       	call   2200 <__asan_report_load2@plt>
    265f:	0f b7 02             	movzwl (%rdx),%eax
    2662:	66 83 f8 03          	cmp    $0x3,%ax
    2666:	0f 85 92 00 00 00    	jne    26fe <table_insert+0x12a>
    266c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2670:	48 8b 50 08          	mov    0x8(%rax),%rdx
    2674:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    2677:	48 98                	cltq   
    2679:	48 c1 e0 04          	shl    $0x4,%rax
    267d:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
    2681:	48 8d 41 04          	lea    0x4(%rcx),%rax
    2685:	48 89 c2             	mov    %rax,%rdx
    2688:	48 c1 ea 03          	shr    $0x3,%rdx
    268c:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2693:	0f b6 12             	movzbl (%rdx),%edx
    2696:	84 d2                	test   %dl,%dl
    2698:	40 0f 95 c7          	setne  %dil
    269c:	48 89 c6             	mov    %rax,%rsi
    269f:	83 e6 07             	and    $0x7,%esi
    26a2:	83 c6 03             	add    $0x3,%esi
    26a5:	40 38 d6             	cmp    %dl,%sil
    26a8:	0f 9d c2             	setge  %dl
    26ab:	21 fa                	and    %edi,%edx
    26ad:	84 d2                	test   %dl,%dl
    26af:	74 08                	je     26b9 <table_insert+0xe5>
    26b1:	48 89 c7             	mov    %rax,%rdi
    26b4:	e8 37 fb ff ff       	call   21f0 <__asan_report_store4@plt>
    26b9:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    26bc:	89 41 04             	mov    %eax,0x4(%rcx)
    26bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    26c3:	48 8b 50 08          	mov    0x8(%rax),%rdx
    26c7:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    26ca:	48 98                	cltq   
    26cc:	48 c1 e0 04          	shl    $0x4,%rax
    26d0:	48 01 d0             	add    %rdx,%rax
    26d3:	48 8d 50 08          	lea    0x8(%rax),%rdx
    26d7:	48 89 d1             	mov    %rdx,%rcx
    26da:	48 c1 e9 03          	shr    $0x3,%rcx
    26de:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    26e5:	0f b6 09             	movzbl (%rcx),%ecx
    26e8:	84 c9                	test   %cl,%cl
    26ea:	74 08                	je     26f4 <table_insert+0x120>
    26ec:	48 89 d7             	mov    %rdx,%rdi
    26ef:	e8 1c fb ff ff       	call   2210 <__asan_report_store8@plt>
    26f4:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    26f8:	48 89 50 08          	mov    %rdx,0x8(%rax)
    26fc:	eb 42                	jmp    2740 <table_insert+0x16c>
    26fe:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    2702:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2706:	48 89 c2             	mov    %rax,%rdx
    2709:	48 89 d0             	mov    %rdx,%rax
    270c:	48 c1 e8 03          	shr    $0x3,%rax
    2710:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    2716:	0f b6 00             	movzbl (%rax),%eax
    2719:	84 c0                	test   %al,%al
    271b:	0f 95 c1             	setne  %cl
    271e:	3c 03                	cmp    $0x3,%al
    2720:	0f 9e c0             	setle  %al
    2723:	21 c8                	and    %ecx,%eax
    2725:	84 c0                	test   %al,%al
    2727:	74 08                	je     2731 <table_insert+0x15d>
    2729:	48 89 d7             	mov    %rdx,%rdi
    272c:	e8 5f fa ff ff       	call   2190 <__asan_report_load4@plt>
    2731:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2735:	8b 00                	mov    (%rax),%eax
    2737:	39 45 fc             	cmp    %eax,-0x4(%rbp)
    273a:	0f 85 b7 fe ff ff    	jne    25f7 <table_insert+0x23>
    2740:	c9                   	leave  
    2741:	c3                   	ret    

0000000000002742 <table_remove>:
    2742:	f3 0f 1e fa          	endbr64 
    2746:	55                   	push   %rbp
    2747:	48 89 e5             	mov    %rsp,%rbp
    274a:	48 83 ec 20          	sub    $0x20,%rsp
    274e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    2752:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    2755:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    275c:	e9 55 01 00 00       	jmp    28b6 <table_remove+0x174>
    2761:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2765:	48 83 c0 08          	add    $0x8,%rax
    2769:	48 89 c2             	mov    %rax,%rdx
    276c:	48 c1 ea 03          	shr    $0x3,%rdx
    2770:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2777:	0f b6 12             	movzbl (%rdx),%edx
    277a:	84 d2                	test   %dl,%dl
    277c:	74 08                	je     2786 <table_remove+0x44>
    277e:	48 89 c7             	mov    %rax,%rdi
    2781:	e8 da f9 ff ff       	call   2160 <__asan_report_load8@plt>
    2786:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    278a:	48 8b 50 08          	mov    0x8(%rax),%rdx
    278e:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    2791:	48 98                	cltq   
    2793:	48 c1 e0 04          	shl    $0x4,%rax
    2797:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
    279b:	48 8d 41 04          	lea    0x4(%rcx),%rax
    279f:	48 89 c2             	mov    %rax,%rdx
    27a2:	48 c1 ea 03          	shr    $0x3,%rdx
    27a6:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    27ad:	0f b6 12             	movzbl (%rdx),%edx
    27b0:	84 d2                	test   %dl,%dl
    27b2:	40 0f 95 c7          	setne  %dil
    27b6:	48 89 c6             	mov    %rax,%rsi
    27b9:	83 e6 07             	and    $0x7,%esi
    27bc:	83 c6 03             	add    $0x3,%esi
    27bf:	40 38 d6             	cmp    %dl,%sil
    27c2:	0f 9d c2             	setge  %dl
    27c5:	21 fa                	and    %edi,%edx
    27c7:	84 d2                	test   %dl,%dl
    27c9:	74 08                	je     27d3 <table_remove+0x91>
    27cb:	48 89 c7             	mov    %rax,%rdi
    27ce:	e8 bd f9 ff ff       	call   2190 <__asan_report_load4@plt>
    27d3:	8b 41 04             	mov    0x4(%rcx),%eax
    27d6:	39 45 e4             	cmp    %eax,-0x1c(%rbp)
    27d9:	0f 85 d3 00 00 00    	jne    28b2 <table_remove+0x170>
    27df:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    27e3:	48 8b 50 08          	mov    0x8(%rax),%rdx
    27e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
    27ea:	48 98                	cltq   
    27ec:	48 c1 e0 04          	shl    $0x4,%rax
    27f0:	48 01 c2             	add    %rax,%rdx
    27f3:	48 89 d0             	mov    %rdx,%rax
    27f6:	48 89 c1             	mov    %rax,%rcx
    27f9:	48 89 c8             	mov    %rcx,%rax
    27fc:	48 c1 e8 03          	shr    $0x3,%rax
    2800:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    2806:	0f b6 00             	movzbl (%rax),%eax
    2809:	84 c0                	test   %al,%al
    280b:	40 0f 95 c6          	setne  %sil
    280f:	3c 01                	cmp    $0x1,%al
    2811:	0f 9e c0             	setle  %al
    2814:	21 f0                	and    %esi,%eax
    2816:	84 c0                	test   %al,%al
    2818:	74 08                	je     2822 <table_remove+0xe0>
    281a:	48 89 cf             	mov    %rcx,%rdi
    281d:	e8 de f9 ff ff       	call   2200 <__asan_report_load2@plt>
    2822:	0f b7 02             	movzwl (%rdx),%eax
    2825:	66 83 f8 01          	cmp    $0x1,%ax
    2829:	0f 85 83 00 00 00    	jne    28b2 <table_remove+0x170>
    282f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2833:	48 8b 50 08          	mov    0x8(%rax),%rdx
    2837:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    283a:	48 98                	cltq   
    283c:	48 c1 e0 04          	shl    $0x4,%rax
    2840:	48 01 c2             	add    %rax,%rdx
    2843:	48 89 d0             	mov    %rdx,%rax
    2846:	48 89 c1             	mov    %rax,%rcx
    2849:	48 89 c8             	mov    %rcx,%rax
    284c:	48 c1 e8 03          	shr    $0x3,%rax
    2850:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    2856:	0f b6 00             	movzbl (%rax),%eax
    2859:	84 c0                	test   %al,%al
    285b:	40 0f 95 c6          	setne  %sil
    285f:	3c 01                	cmp    $0x1,%al
    2861:	0f 9e c0             	setle  %al
    2864:	21 f0                	and    %esi,%eax
    2866:	84 c0                	test   %al,%al
    2868:	74 08                	je     2872 <table_remove+0x130>
    286a:	48 89 cf             	mov    %rcx,%rdi
    286d:	e8 fe f8 ff ff       	call   2170 <__asan_report_store2@plt>
    2872:	66 c7 02 00 00       	movw   $0x0,(%rdx)
    2877:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    287b:	48 8b 50 08          	mov    0x8(%rax),%rdx
    287f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    2882:	48 98                	cltq   
    2884:	48 c1 e0 04          	shl    $0x4,%rax
    2888:	48 01 d0             	add    %rdx,%rax
    288b:	48 8d 50 08          	lea    0x8(%rax),%rdx
    288f:	48 89 d1             	mov    %rdx,%rcx
    2892:	48 c1 e9 03          	shr    $0x3,%rcx
    2896:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    289d:	0f b6 09             	movzbl (%rcx),%ecx
    28a0:	84 c9                	test   %cl,%cl
    28a2:	74 08                	je     28ac <table_remove+0x16a>
    28a4:	48 89 d7             	mov    %rdx,%rdi
    28a7:	e8 b4 f8 ff ff       	call   2160 <__asan_report_load8@plt>
    28ac:	48 8b 40 08          	mov    0x8(%rax),%rax
    28b0:	eb 47                	jmp    28f9 <table_remove+0x1b7>
    28b2:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    28b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    28ba:	48 89 c2             	mov    %rax,%rdx
    28bd:	48 89 d0             	mov    %rdx,%rax
    28c0:	48 c1 e8 03          	shr    $0x3,%rax
    28c4:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    28ca:	0f b6 00             	movzbl (%rax),%eax
    28cd:	84 c0                	test   %al,%al
    28cf:	0f 95 c1             	setne  %cl
    28d2:	3c 03                	cmp    $0x3,%al
    28d4:	0f 9e c0             	setle  %al
    28d7:	21 c8                	and    %ecx,%eax
    28d9:	84 c0                	test   %al,%al
    28db:	74 08                	je     28e5 <table_remove+0x1a3>
    28dd:	48 89 d7             	mov    %rdx,%rdi
    28e0:	e8 ab f8 ff ff       	call   2190 <__asan_report_load4@plt>
    28e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    28e9:	8b 00                	mov    (%rax),%eax
    28eb:	39 45 fc             	cmp    %eax,-0x4(%rbp)
    28ee:	0f 85 6d fe ff ff    	jne    2761 <table_remove+0x1f>
    28f4:	b8 00 00 00 00       	mov    $0x0,%eax
    28f9:	c9                   	leave  
    28fa:	c3                   	ret    

00000000000028fb <table_free>:
    28fb:	f3 0f 1e fa          	endbr64 
    28ff:	55                   	push   %rbp
    2900:	48 89 e5             	mov    %rsp,%rbp
    2903:	90                   	nop
    2904:	5d                   	pop    %rbp
    2905:	c3                   	ret    

0000000000002906 <collection_init>:
    2906:	f3 0f 1e fa          	endbr64 
    290a:	55                   	push   %rbp
    290b:	48 89 e5             	mov    %rsp,%rbp
    290e:	48 83 ec 30          	sub    $0x30,%rsp
    2912:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    2916:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    2919:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    291d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
    2921:	74 06                	je     2929 <collection_init+0x23>
    2923:	83 7d e4 08          	cmpl   $0x8,-0x1c(%rbp)
    2927:	76 2d                	jbe    2956 <collection_init+0x50>
    2929:	e8 92 f8 ff ff       	call   21c0 <__asan_handle_no_return@plt>
    292e:	48 8d 05 eb 28 00 00 	lea    0x28eb(%rip),%rax        # 5220 <__PRETTY_FUNCTION__.2>
    2935:	48 89 c1             	mov    %rax,%rcx
    2938:	ba 7a 00 00 00       	mov    $0x7a,%edx
    293d:	48 8d 05 9c 27 00 00 	lea    0x279c(%rip),%rax        # 50e0 <BITSET_SZ+0x60>
    2944:	48 89 c6             	mov    %rax,%rsi
    2947:	48 8d 05 d2 27 00 00 	lea    0x27d2(%rip),%rax        # 5120 <BITSET_SZ+0xa0>
    294e:	48 89 c7             	mov    %rax,%rdi
    2951:	e8 2a f8 ff ff       	call   2180 <__assert_fail@plt>
    2956:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    295a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    295e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2962:	48 83 c0 20          	add    $0x20,%rax
    2966:	48 89 c2             	mov    %rax,%rdx
    2969:	48 89 d0             	mov    %rdx,%rax
    296c:	48 c1 e8 03          	shr    $0x3,%rax
    2970:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    2976:	0f b6 00             	movzbl (%rax),%eax
    2979:	84 c0                	test   %al,%al
    297b:	0f 95 c1             	setne  %cl
    297e:	3c 03                	cmp    $0x3,%al
    2980:	0f 9e c0             	setle  %al
    2983:	21 c8                	and    %ecx,%eax
    2985:	84 c0                	test   %al,%al
    2987:	74 08                	je     2991 <collection_init+0x8b>
    2989:	48 89 d7             	mov    %rdx,%rdi
    298c:	e8 5f f8 ff ff       	call   21f0 <__asan_report_store4@plt>
    2991:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2995:	8b 55 e4             	mov    -0x1c(%rbp),%edx
    2998:	89 50 20             	mov    %edx,0x20(%rax)
    299b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    299f:	48 83 c0 28          	add    $0x28,%rax
    29a3:	48 89 c2             	mov    %rax,%rdx
    29a6:	48 c1 ea 03          	shr    $0x3,%rdx
    29aa:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    29b1:	0f b6 12             	movzbl (%rdx),%edx
    29b4:	84 d2                	test   %dl,%dl
    29b6:	74 08                	je     29c0 <collection_init+0xba>
    29b8:	48 89 c7             	mov    %rax,%rdi
    29bb:	e8 50 f8 ff ff       	call   2210 <__asan_report_store8@plt>
    29c0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    29c4:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    29c8:	48 89 50 28          	mov    %rdx,0x28(%rax)
    29cc:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    29cf:	c1 e0 05             	shl    $0x5,%eax
    29d2:	89 c1                	mov    %eax,%ecx
    29d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    29d8:	48 83 c0 30          	add    $0x30,%rax
    29dc:	48 89 c2             	mov    %rax,%rdx
    29df:	48 89 d0             	mov    %rdx,%rax
    29e2:	48 c1 e8 03          	shr    $0x3,%rax
    29e6:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    29ec:	0f b6 00             	movzbl (%rax),%eax
    29ef:	84 c0                	test   %al,%al
    29f1:	40 0f 95 c6          	setne  %sil
    29f5:	3c 03                	cmp    $0x3,%al
    29f7:	0f 9e c0             	setle  %al
    29fa:	21 f0                	and    %esi,%eax
    29fc:	84 c0                	test   %al,%al
    29fe:	74 08                	je     2a08 <collection_init+0x102>
    2a00:	48 89 d7             	mov    %rdx,%rdi
    2a03:	e8 e8 f7 ff ff       	call   21f0 <__asan_report_store4@plt>
    2a08:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2a0c:	89 48 30             	mov    %ecx,0x30(%rax)
    2a0f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2a13:	48 83 c0 38          	add    $0x38,%rax
    2a17:	48 89 c2             	mov    %rax,%rdx
    2a1a:	48 c1 ea 03          	shr    $0x3,%rdx
    2a1e:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2a25:	0f b6 12             	movzbl (%rdx),%edx
    2a28:	84 d2                	test   %dl,%dl
    2a2a:	74 08                	je     2a34 <collection_init+0x12e>
    2a2c:	48 89 c7             	mov    %rax,%rdi
    2a2f:	e8 dc f7 ff ff       	call   2210 <__asan_report_store8@plt>
    2a34:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2a38:	48 c7 40 38 00 00 00 	movq   $0x0,0x38(%rax)
    2a3f:	00 
    2a40:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2a44:	48 83 c0 40          	add    $0x40,%rax
    2a48:	48 89 c2             	mov    %rax,%rdx
    2a4b:	48 c1 ea 03          	shr    $0x3,%rdx
    2a4f:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2a56:	0f b6 12             	movzbl (%rdx),%edx
    2a59:	84 d2                	test   %dl,%dl
    2a5b:	74 08                	je     2a65 <collection_init+0x15f>
    2a5d:	48 89 c7             	mov    %rax,%rdi
    2a60:	e8 ab f7 ff ff       	call   2210 <__asan_report_store8@plt>
    2a65:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2a69:	48 c7 40 40 00 00 00 	movq   $0x0,0x40(%rax)
    2a70:	00 
    2a71:	90                   	nop
    2a72:	c9                   	leave  
    2a73:	c3                   	ret    

0000000000002a74 <collection_needed>:
    2a74:	f3 0f 1e fa          	endbr64 
    2a78:	55                   	push   %rbp
    2a79:	48 89 e5             	mov    %rsp,%rbp
    2a7c:	48 83 ec 10          	sub    $0x10,%rsp
    2a80:	89 7d fc             	mov    %edi,-0x4(%rbp)
    2a83:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    2a87:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    2a8b:	74 07                	je     2a94 <collection_needed+0x20>
    2a8d:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    2a92:	75 41                	jne    2ad5 <collection_needed+0x61>
    2a94:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    2a98:	75 07                	jne    2aa1 <collection_needed+0x2d>
    2a9a:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    2a9f:	74 2d                	je     2ace <collection_needed+0x5a>
    2aa1:	e8 1a f7 ff ff       	call   21c0 <__asan_handle_no_return@plt>
    2aa6:	48 8d 05 b3 27 00 00 	lea    0x27b3(%rip),%rax        # 5260 <__PRETTY_FUNCTION__.1>
    2aad:	48 89 c1             	mov    %rax,%rcx
    2ab0:	ba 8b 00 00 00       	mov    $0x8b,%edx
    2ab5:	48 8d 05 24 26 00 00 	lea    0x2624(%rip),%rax        # 50e0 <BITSET_SZ+0x60>
    2abc:	48 89 c6             	mov    %rax,%rsi
    2abf:	48 8d 05 9a 26 00 00 	lea    0x269a(%rip),%rax        # 5160 <BITSET_SZ+0xe0>
    2ac6:	48 89 c7             	mov    %rax,%rdi
    2ac9:	e8 b2 f6 ff ff       	call   2180 <__assert_fail@plt>
    2ace:	b8 00 00 00 00       	mov    $0x0,%eax
    2ad3:	eb 50                	jmp    2b25 <collection_needed+0xb1>
    2ad5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
    2ad9:	74 06                	je     2ae1 <collection_needed+0x6d>
    2adb:	83 7d fc 08          	cmpl   $0x8,-0x4(%rbp)
    2adf:	76 2d                	jbe    2b0e <collection_needed+0x9a>
    2ae1:	e8 da f6 ff ff       	call   21c0 <__asan_handle_no_return@plt>
    2ae6:	48 8d 05 73 27 00 00 	lea    0x2773(%rip),%rax        # 5260 <__PRETTY_FUNCTION__.1>
    2aed:	48 89 c1             	mov    %rax,%rcx
    2af0:	ba 8f 00 00 00       	mov    $0x8f,%edx
    2af5:	48 8d 05 e4 25 00 00 	lea    0x25e4(%rip),%rax        # 50e0 <BITSET_SZ+0x60>
    2afc:	48 89 c6             	mov    %rax,%rsi
    2aff:	48 8d 05 1a 26 00 00 	lea    0x261a(%rip),%rax        # 5120 <BITSET_SZ+0xa0>
    2b06:	48 89 c7             	mov    %rax,%rdi
    2b09:	e8 72 f6 ff ff       	call   2180 <__assert_fail@plt>
    2b0e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2b12:	48 8d 50 08          	lea    0x8(%rax),%rdx
    2b16:	8b 45 fc             	mov    -0x4(%rbp),%eax
    2b19:	48 0f af c2          	imul   %rdx,%rax
    2b1d:	48 c1 e0 05          	shl    $0x5,%rax
    2b21:	48 83 c0 48          	add    $0x48,%rax
    2b25:	c9                   	leave  
    2b26:	c3                   	ret    

0000000000002b27 <manager_insert>:
    2b27:	f3 0f 1e fa          	endbr64 
    2b2b:	55                   	push   %rbp
    2b2c:	48 89 e5             	mov    %rsp,%rbp
    2b2f:	48 83 ec 40          	sub    $0x40,%rsp
    2b33:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    2b37:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    2b3b:	89 55 cc             	mov    %edx,-0x34(%rbp)
    2b3e:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
    2b42:	8b 45 cc             	mov    -0x34(%rbp),%eax
    2b45:	48 83 c0 10          	add    $0x10,%rax
    2b49:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    2b50:	00 
    2b51:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2b55:	48 01 d0             	add    %rdx,%rax
    2b58:	48 89 c2             	mov    %rax,%rdx
    2b5b:	48 c1 ea 03          	shr    $0x3,%rdx
    2b5f:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2b66:	0f b6 12             	movzbl (%rdx),%edx
    2b69:	84 d2                	test   %dl,%dl
    2b6b:	40 0f 95 c6          	setne  %sil
    2b6f:	48 89 c1             	mov    %rax,%rcx
    2b72:	83 e1 07             	and    $0x7,%ecx
    2b75:	83 c1 03             	add    $0x3,%ecx
    2b78:	38 d1                	cmp    %dl,%cl
    2b7a:	0f 9d c2             	setge  %dl
    2b7d:	21 f2                	and    %esi,%edx
    2b7f:	84 d2                	test   %dl,%dl
    2b81:	74 08                	je     2b8b <manager_insert+0x64>
    2b83:	48 89 c7             	mov    %rax,%rdi
    2b86:	e8 05 f6 ff ff       	call   2190 <__asan_report_load4@plt>
    2b8b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2b8f:	8b 55 cc             	mov    -0x34(%rbp),%edx
    2b92:	48 83 c2 10          	add    $0x10,%rdx
    2b96:	8b 04 90             	mov    (%rax,%rdx,4),%eax
    2b99:	8d 48 01             	lea    0x1(%rax),%ecx
    2b9c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2ba0:	8b 55 cc             	mov    -0x34(%rbp),%edx
    2ba3:	48 83 c2 10          	add    $0x10,%rdx
    2ba7:	89 0c 90             	mov    %ecx,(%rax,%rdx,4)
    2baa:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
    2baf:	0f 85 ee 00 00 00    	jne    2ca3 <manager_insert+0x17c>
    2bb5:	8b 45 cc             	mov    -0x34(%rbp),%eax
    2bb8:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    2bbf:	00 
    2bc0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2bc4:	48 01 d0             	add    %rdx,%rax
    2bc7:	48 89 c2             	mov    %rax,%rdx
    2bca:	48 c1 ea 03          	shr    $0x3,%rdx
    2bce:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2bd5:	0f b6 12             	movzbl (%rdx),%edx
    2bd8:	84 d2                	test   %dl,%dl
    2bda:	74 08                	je     2be4 <manager_insert+0xbd>
    2bdc:	48 89 c7             	mov    %rax,%rdi
    2bdf:	e8 7c f5 ff ff       	call   2160 <__asan_report_load8@plt>
    2be4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2be8:	8b 55 cc             	mov    -0x34(%rbp),%edx
    2beb:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
    2bef:	48 85 c0             	test   %rax,%rax
    2bf2:	74 32                	je     2c26 <manager_insert+0xff>
    2bf4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2bf8:	8b 55 cc             	mov    -0x34(%rbp),%edx
    2bfb:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
    2bff:	48 8d 50 38          	lea    0x38(%rax),%rdx
    2c03:	48 89 d1             	mov    %rdx,%rcx
    2c06:	48 c1 e9 03          	shr    $0x3,%rcx
    2c0a:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    2c11:	0f b6 09             	movzbl (%rcx),%ecx
    2c14:	84 c9                	test   %cl,%cl
    2c16:	74 08                	je     2c20 <manager_insert+0xf9>
    2c18:	48 89 d7             	mov    %rdx,%rdi
    2c1b:	e8 40 f5 ff ff       	call   2160 <__asan_report_load8@plt>
    2c20:	48 8b 40 38          	mov    0x38(%rax),%rax
    2c24:	eb 05                	jmp    2c2b <manager_insert+0x104>
    2c26:	b8 00 00 00 00       	mov    $0x0,%eax
    2c2b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    2c2f:	8b 45 cc             	mov    -0x34(%rbp),%eax
    2c32:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    2c39:	00 
    2c3a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2c3e:	48 01 d0             	add    %rdx,%rax
    2c41:	48 89 c2             	mov    %rax,%rdx
    2c44:	48 c1 ea 03          	shr    $0x3,%rdx
    2c48:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2c4f:	0f b6 12             	movzbl (%rdx),%edx
    2c52:	84 d2                	test   %dl,%dl
    2c54:	74 08                	je     2c5e <manager_insert+0x137>
    2c56:	48 89 c7             	mov    %rax,%rdi
    2c59:	e8 b2 f5 ff ff       	call   2210 <__asan_report_store8@plt>
    2c5e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2c62:	8b 55 cc             	mov    -0x34(%rbp),%edx
    2c65:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
    2c69:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
    2c6d:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    2c71:	48 83 c0 38          	add    $0x38,%rax
    2c75:	48 89 c2             	mov    %rax,%rdx
    2c78:	48 c1 ea 03          	shr    $0x3,%rdx
    2c7c:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2c83:	0f b6 12             	movzbl (%rdx),%edx
    2c86:	84 d2                	test   %dl,%dl
    2c88:	74 08                	je     2c92 <manager_insert+0x16b>
    2c8a:	48 89 c7             	mov    %rax,%rdi
    2c8d:	e8 7e f5 ff ff       	call   2210 <__asan_report_store8@plt>
    2c92:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    2c96:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    2c9a:	48 89 50 38          	mov    %rdx,0x38(%rax)
    2c9e:	e9 26 01 00 00       	jmp    2dc9 <manager_insert+0x2a2>
    2ca3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2ca7:	48 83 c0 38          	add    $0x38,%rax
    2cab:	48 89 c2             	mov    %rax,%rdx
    2cae:	48 c1 ea 03          	shr    $0x3,%rdx
    2cb2:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2cb9:	0f b6 12             	movzbl (%rdx),%edx
    2cbc:	84 d2                	test   %dl,%dl
    2cbe:	74 08                	je     2cc8 <manager_insert+0x1a1>
    2cc0:	48 89 c7             	mov    %rax,%rdi
    2cc3:	e8 98 f4 ff ff       	call   2160 <__asan_report_load8@plt>
    2cc8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2ccc:	48 8b 40 38          	mov    0x38(%rax),%rax
    2cd0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    2cd4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2cd8:	48 83 c0 40          	add    $0x40,%rax
    2cdc:	48 89 c2             	mov    %rax,%rdx
    2cdf:	48 c1 ea 03          	shr    $0x3,%rdx
    2ce3:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2cea:	0f b6 12             	movzbl (%rdx),%edx
    2ced:	84 d2                	test   %dl,%dl
    2cef:	74 08                	je     2cf9 <manager_insert+0x1d2>
    2cf1:	48 89 c7             	mov    %rax,%rdi
    2cf4:	e8 67 f4 ff ff       	call   2160 <__asan_report_load8@plt>
    2cf9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    2cfd:	48 8b 40 40          	mov    0x40(%rax),%rax
    2d01:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    2d05:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    2d09:	48 83 c0 38          	add    $0x38,%rax
    2d0d:	48 89 c2             	mov    %rax,%rdx
    2d10:	48 c1 ea 03          	shr    $0x3,%rdx
    2d14:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2d1b:	0f b6 12             	movzbl (%rdx),%edx
    2d1e:	84 d2                	test   %dl,%dl
    2d20:	74 08                	je     2d2a <manager_insert+0x203>
    2d22:	48 89 c7             	mov    %rax,%rdi
    2d25:	e8 e6 f4 ff ff       	call   2210 <__asan_report_store8@plt>
    2d2a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    2d2e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    2d32:	48 89 50 38          	mov    %rdx,0x38(%rax)
    2d36:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    2d3a:	48 83 c0 40          	add    $0x40,%rax
    2d3e:	48 89 c2             	mov    %rax,%rdx
    2d41:	48 c1 ea 03          	shr    $0x3,%rdx
    2d45:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2d4c:	0f b6 12             	movzbl (%rdx),%edx
    2d4f:	84 d2                	test   %dl,%dl
    2d51:	74 08                	je     2d5b <manager_insert+0x234>
    2d53:	48 89 c7             	mov    %rax,%rdi
    2d56:	e8 b5 f4 ff ff       	call   2210 <__asan_report_store8@plt>
    2d5b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    2d5f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    2d63:	48 89 50 40          	mov    %rdx,0x40(%rax)
    2d67:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2d6b:	48 83 c0 40          	add    $0x40,%rax
    2d6f:	48 89 c2             	mov    %rax,%rdx
    2d72:	48 c1 ea 03          	shr    $0x3,%rdx
    2d76:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2d7d:	0f b6 12             	movzbl (%rdx),%edx
    2d80:	84 d2                	test   %dl,%dl
    2d82:	74 08                	je     2d8c <manager_insert+0x265>
    2d84:	48 89 c7             	mov    %rax,%rdi
    2d87:	e8 84 f4 ff ff       	call   2210 <__asan_report_store8@plt>
    2d8c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2d90:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
    2d94:	48 89 50 40          	mov    %rdx,0x40(%rax)
    2d98:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2d9c:	48 83 c0 38          	add    $0x38,%rax
    2da0:	48 89 c2             	mov    %rax,%rdx
    2da3:	48 c1 ea 03          	shr    $0x3,%rdx
    2da7:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2dae:	0f b6 12             	movzbl (%rdx),%edx
    2db1:	84 d2                	test   %dl,%dl
    2db3:	74 08                	je     2dbd <manager_insert+0x296>
    2db5:	48 89 c7             	mov    %rax,%rdi
    2db8:	e8 53 f4 ff ff       	call   2210 <__asan_report_store8@plt>
    2dbd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2dc1:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
    2dc5:	48 89 50 38          	mov    %rdx,0x38(%rax)
    2dc9:	c9                   	leave  
    2dca:	c3                   	ret    

0000000000002dcb <manager_erase>:
    2dcb:	f3 0f 1e fa          	endbr64 
    2dcf:	55                   	push   %rbp
    2dd0:	48 89 e5             	mov    %rsp,%rbp
    2dd3:	48 83 ec 30          	sub    $0x30,%rsp
    2dd7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    2ddb:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    2dde:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    2de2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    2de5:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    2dec:	00 
    2ded:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2df1:	48 01 d0             	add    %rdx,%rax
    2df4:	48 89 c2             	mov    %rax,%rdx
    2df7:	48 c1 ea 03          	shr    $0x3,%rdx
    2dfb:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2e02:	0f b6 12             	movzbl (%rdx),%edx
    2e05:	84 d2                	test   %dl,%dl
    2e07:	74 08                	je     2e11 <manager_erase+0x46>
    2e09:	48 89 c7             	mov    %rax,%rdi
    2e0c:	e8 4f f3 ff ff       	call   2160 <__asan_report_load8@plt>
    2e11:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2e15:	8b 55 e4             	mov    -0x1c(%rbp),%edx
    2e18:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
    2e1c:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
    2e20:	75 3d                	jne    2e5f <manager_erase+0x94>
    2e22:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2e26:	48 83 c0 38          	add    $0x38,%rax
    2e2a:	48 89 c2             	mov    %rax,%rdx
    2e2d:	48 c1 ea 03          	shr    $0x3,%rdx
    2e31:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2e38:	0f b6 12             	movzbl (%rdx),%edx
    2e3b:	84 d2                	test   %dl,%dl
    2e3d:	74 08                	je     2e47 <manager_erase+0x7c>
    2e3f:	48 89 c7             	mov    %rax,%rdi
    2e42:	e8 19 f3 ff ff       	call   2160 <__asan_report_load8@plt>
    2e47:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2e4b:	48 8b 48 38          	mov    0x38(%rax),%rcx
    2e4f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2e53:	8b 55 e4             	mov    -0x1c(%rbp),%edx
    2e56:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
    2e5a:	e9 c3 01 00 00       	jmp    3022 <manager_erase+0x257>
    2e5f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    2e62:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    2e69:	00 
    2e6a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2e6e:	48 01 d0             	add    %rdx,%rax
    2e71:	48 89 c2             	mov    %rax,%rdx
    2e74:	48 c1 ea 03          	shr    $0x3,%rdx
    2e78:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2e7f:	0f b6 12             	movzbl (%rdx),%edx
    2e82:	84 d2                	test   %dl,%dl
    2e84:	74 08                	je     2e8e <manager_erase+0xc3>
    2e86:	48 89 c7             	mov    %rax,%rdi
    2e89:	e8 d2 f2 ff ff       	call   2160 <__asan_report_load8@plt>
    2e8e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2e92:	8b 55 e4             	mov    -0x1c(%rbp),%edx
    2e95:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
    2e99:	48 8d 50 40          	lea    0x40(%rax),%rdx
    2e9d:	48 89 d1             	mov    %rdx,%rcx
    2ea0:	48 c1 e9 03          	shr    $0x3,%rcx
    2ea4:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    2eab:	0f b6 09             	movzbl (%rcx),%ecx
    2eae:	84 c9                	test   %cl,%cl
    2eb0:	74 08                	je     2eba <manager_erase+0xef>
    2eb2:	48 89 d7             	mov    %rdx,%rdi
    2eb5:	e8 a6 f2 ff ff       	call   2160 <__asan_report_load8@plt>
    2eba:	48 8b 40 40          	mov    0x40(%rax),%rax
    2ebe:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    2ec2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2ec6:	8b 55 e4             	mov    -0x1c(%rbp),%edx
    2ec9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
    2ecd:	48 8d 50 38          	lea    0x38(%rax),%rdx
    2ed1:	48 89 d1             	mov    %rdx,%rcx
    2ed4:	48 c1 e9 03          	shr    $0x3,%rcx
    2ed8:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    2edf:	0f b6 09             	movzbl (%rcx),%ecx
    2ee2:	84 c9                	test   %cl,%cl
    2ee4:	74 08                	je     2eee <manager_erase+0x123>
    2ee6:	48 89 d7             	mov    %rdx,%rdi
    2ee9:	e8 72 f2 ff ff       	call   2160 <__asan_report_load8@plt>
    2eee:	48 8b 40 38          	mov    0x38(%rax),%rax
    2ef2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    2ef6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2efa:	48 83 c0 38          	add    $0x38,%rax
    2efe:	48 89 c2             	mov    %rax,%rdx
    2f01:	48 c1 ea 03          	shr    $0x3,%rdx
    2f05:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2f0c:	0f b6 12             	movzbl (%rdx),%edx
    2f0f:	84 d2                	test   %dl,%dl
    2f11:	74 08                	je     2f1b <manager_erase+0x150>
    2f13:	48 89 c7             	mov    %rax,%rdi
    2f16:	e8 f5 f2 ff ff       	call   2210 <__asan_report_store8@plt>
    2f1b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    2f1f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    2f23:	48 89 50 38          	mov    %rdx,0x38(%rax)
    2f27:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2f2b:	48 83 c0 40          	add    $0x40,%rax
    2f2f:	48 89 c2             	mov    %rax,%rdx
    2f32:	48 c1 ea 03          	shr    $0x3,%rdx
    2f36:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2f3d:	0f b6 12             	movzbl (%rdx),%edx
    2f40:	84 d2                	test   %dl,%dl
    2f42:	74 08                	je     2f4c <manager_erase+0x181>
    2f44:	48 89 c7             	mov    %rax,%rdi
    2f47:	e8 c4 f2 ff ff       	call   2210 <__asan_report_store8@plt>
    2f4c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2f50:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    2f54:	48 89 50 40          	mov    %rdx,0x40(%rax)
    2f58:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2f5c:	48 83 c0 38          	add    $0x38,%rax
    2f60:	48 89 c2             	mov    %rax,%rdx
    2f63:	48 c1 ea 03          	shr    $0x3,%rdx
    2f67:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2f6e:	0f b6 12             	movzbl (%rdx),%edx
    2f71:	84 d2                	test   %dl,%dl
    2f73:	74 08                	je     2f7d <manager_erase+0x1b2>
    2f75:	48 89 c7             	mov    %rax,%rdi
    2f78:	e8 93 f2 ff ff       	call   2210 <__asan_report_store8@plt>
    2f7d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2f81:	48 c7 40 38 00 00 00 	movq   $0x0,0x38(%rax)
    2f88:	00 
    2f89:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2f8d:	48 83 c0 40          	add    $0x40,%rax
    2f91:	48 89 c2             	mov    %rax,%rdx
    2f94:	48 c1 ea 03          	shr    $0x3,%rdx
    2f98:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2f9f:	0f b6 12             	movzbl (%rdx),%edx
    2fa2:	84 d2                	test   %dl,%dl
    2fa4:	74 08                	je     2fae <manager_erase+0x1e3>
    2fa6:	48 89 c7             	mov    %rax,%rdi
    2fa9:	e8 62 f2 ff ff       	call   2210 <__asan_report_store8@plt>
    2fae:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    2fb2:	48 c7 40 40 00 00 00 	movq   $0x0,0x40(%rax)
    2fb9:	00 
    2fba:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    2fbd:	48 83 c0 10          	add    $0x10,%rax
    2fc1:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    2fc8:	00 
    2fc9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    2fcd:	48 01 d0             	add    %rdx,%rax
    2fd0:	48 89 c2             	mov    %rax,%rdx
    2fd3:	48 c1 ea 03          	shr    $0x3,%rdx
    2fd7:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    2fde:	0f b6 12             	movzbl (%rdx),%edx
    2fe1:	84 d2                	test   %dl,%dl
    2fe3:	40 0f 95 c6          	setne  %sil
    2fe7:	48 89 c1             	mov    %rax,%rcx
    2fea:	83 e1 07             	and    $0x7,%ecx
    2fed:	83 c1 03             	add    $0x3,%ecx
    2ff0:	38 d1                	cmp    %dl,%cl
    2ff2:	0f 9d c2             	setge  %dl
    2ff5:	21 f2                	and    %esi,%edx
    2ff7:	84 d2                	test   %dl,%dl
    2ff9:	74 08                	je     3003 <manager_erase+0x238>
    2ffb:	48 89 c7             	mov    %rax,%rdi
    2ffe:	e8 8d f1 ff ff       	call   2190 <__asan_report_load4@plt>
    3003:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3007:	8b 55 e4             	mov    -0x1c(%rbp),%edx
    300a:	48 83 c2 10          	add    $0x10,%rdx
    300e:	8b 04 90             	mov    (%rax,%rdx,4),%eax
    3011:	8d 48 ff             	lea    -0x1(%rax),%ecx
    3014:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3018:	8b 55 e4             	mov    -0x1c(%rbp),%edx
    301b:	48 83 c2 10          	add    $0x10,%rdx
    301f:	89 0c 90             	mov    %ecx,(%rax,%rdx,4)
    3022:	c9                   	leave  
    3023:	c3                   	ret    

0000000000003024 <allocator_force_take_collection>:
    3024:	f3 0f 1e fa          	endbr64 
    3028:	55                   	push   %rbp
    3029:	48 89 e5             	mov    %rsp,%rbp
    302c:	48 83 ec 40          	sub    $0x40,%rsp
    3030:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    3034:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    3038:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
    303c:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
    3041:	0f 85 08 01 00 00    	jne    314f <allocator_force_take_collection+0x12b>
    3047:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
    304e:	e9 f2 00 00 00       	jmp    3145 <allocator_force_take_collection+0x121>
    3053:	8b 55 e4             	mov    -0x1c(%rbp),%edx
    3056:	48 89 d0             	mov    %rdx,%rax
    3059:	48 01 c0             	add    %rax,%rax
    305c:	48 01 d0             	add    %rdx,%rax
    305f:	48 c1 e0 03          	shl    $0x3,%rax
    3063:	48 89 c2             	mov    %rax,%rdx
    3066:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    306a:	48 01 d0             	add    %rdx,%rax
    306d:	48 8d 50 08          	lea    0x8(%rax),%rdx
    3071:	48 89 d1             	mov    %rdx,%rcx
    3074:	48 c1 e9 03          	shr    $0x3,%rcx
    3078:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    307f:	0f b6 09             	movzbl (%rcx),%ecx
    3082:	84 c9                	test   %cl,%cl
    3084:	74 08                	je     308e <allocator_force_take_collection+0x6a>
    3086:	48 89 d7             	mov    %rdx,%rdi
    3089:	e8 d2 f0 ff ff       	call   2160 <__asan_report_load8@plt>
    308e:	48 8b 48 08          	mov    0x8(%rax),%rcx
    3092:	8b 55 e4             	mov    -0x1c(%rbp),%edx
    3095:	48 89 d0             	mov    %rdx,%rax
    3098:	48 01 c0             	add    %rax,%rax
    309b:	48 01 d0             	add    %rdx,%rax
    309e:	48 c1 e0 03          	shl    $0x3,%rax
    30a2:	48 89 c2             	mov    %rax,%rdx
    30a5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    30a9:	48 01 c2             	add    %rax,%rdx
    30ac:	48 89 d0             	mov    %rdx,%rax
    30af:	48 89 c6             	mov    %rax,%rsi
    30b2:	48 89 f0             	mov    %rsi,%rax
    30b5:	48 c1 e8 03          	shr    $0x3,%rax
    30b9:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    30bf:	0f b6 00             	movzbl (%rax),%eax
    30c2:	84 c0                	test   %al,%al
    30c4:	40 0f 95 c7          	setne  %dil
    30c8:	3c 03                	cmp    $0x3,%al
    30ca:	0f 9e c0             	setle  %al
    30cd:	21 f8                	and    %edi,%eax
    30cf:	84 c0                	test   %al,%al
    30d1:	74 08                	je     30db <allocator_force_take_collection+0xb7>
    30d3:	48 89 f7             	mov    %rsi,%rdi
    30d6:	e8 b5 f0 ff ff       	call   2190 <__asan_report_load4@plt>
    30db:	8b 02                	mov    (%rdx),%eax
    30dd:	48 89 ce             	mov    %rcx,%rsi
    30e0:	89 c7                	mov    %eax,%edi
    30e2:	e8 8d f9 ff ff       	call   2a74 <collection_needed>
    30e7:	48 89 c6             	mov    %rax,%rsi
    30ea:	8b 55 e4             	mov    -0x1c(%rbp),%edx
    30ed:	48 89 d0             	mov    %rdx,%rax
    30f0:	48 01 c0             	add    %rax,%rax
    30f3:	48 01 d0             	add    %rdx,%rax
    30f6:	48 c1 e0 03          	shl    $0x3,%rax
    30fa:	48 89 c2             	mov    %rax,%rdx
    30fd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3101:	48 01 c2             	add    %rax,%rdx
    3104:	48 8d 42 10          	lea    0x10(%rdx),%rax
    3108:	48 89 c1             	mov    %rax,%rcx
    310b:	48 89 c8             	mov    %rcx,%rax
    310e:	48 c1 e8 03          	shr    $0x3,%rax
    3112:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    3118:	0f b6 00             	movzbl (%rax),%eax
    311b:	84 c0                	test   %al,%al
    311d:	40 0f 95 c7          	setne  %dil
    3121:	3c 03                	cmp    $0x3,%al
    3123:	0f 9e c0             	setle  %al
    3126:	21 f8                	and    %edi,%eax
    3128:	84 c0                	test   %al,%al
    312a:	74 08                	je     3134 <allocator_force_take_collection+0x110>
    312c:	48 89 cf             	mov    %rcx,%rdi
    312f:	e8 5c f0 ff ff       	call   2190 <__asan_report_load4@plt>
    3134:	8b 42 10             	mov    0x10(%rdx),%eax
    3137:	89 c0                	mov    %eax,%eax
    3139:	48 0f af c6          	imul   %rsi,%rax
    313d:	48 01 45 c8          	add    %rax,-0x38(%rbp)
    3141:	83 45 e4 01          	addl   $0x1,-0x1c(%rbp)
    3145:	83 7d e4 08          	cmpl   $0x8,-0x1c(%rbp)
    3149:	0f 85 04 ff ff ff    	jne    3053 <allocator_force_take_collection+0x2f>
    314f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    3153:	48 89 c7             	mov    %rax,%rdi
    3156:	e8 55 f0 ff ff       	call   21b0 <malloc@plt>
    315b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    315f:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    3164:	75 0a                	jne    3170 <allocator_force_take_collection+0x14c>
    3166:	b8 01 00 00 00       	mov    $0x1,%eax
    316b:	e9 d8 01 00 00       	jmp    3348 <allocator_force_take_collection+0x324>
    3170:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
    3177:	e9 bd 01 00 00       	jmp    3339 <allocator_force_take_collection+0x315>
    317c:	8b 55 e8             	mov    -0x18(%rbp),%edx
    317f:	48 89 d0             	mov    %rdx,%rax
    3182:	48 01 c0             	add    %rax,%rax
    3185:	48 01 d0             	add    %rdx,%rax
    3188:	48 c1 e0 03          	shl    $0x3,%rax
    318c:	48 89 c2             	mov    %rax,%rdx
    318f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3193:	48 01 d0             	add    %rdx,%rax
    3196:	48 8d 50 08          	lea    0x8(%rax),%rdx
    319a:	48 89 d1             	mov    %rdx,%rcx
    319d:	48 c1 e9 03          	shr    $0x3,%rcx
    31a1:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    31a8:	0f b6 09             	movzbl (%rcx),%ecx
    31ab:	84 c9                	test   %cl,%cl
    31ad:	74 08                	je     31b7 <allocator_force_take_collection+0x193>
    31af:	48 89 d7             	mov    %rdx,%rdi
    31b2:	e8 a9 ef ff ff       	call   2160 <__asan_report_load8@plt>
    31b7:	48 8b 48 08          	mov    0x8(%rax),%rcx
    31bb:	8b 55 e8             	mov    -0x18(%rbp),%edx
    31be:	48 89 d0             	mov    %rdx,%rax
    31c1:	48 01 c0             	add    %rax,%rax
    31c4:	48 01 d0             	add    %rdx,%rax
    31c7:	48 c1 e0 03          	shl    $0x3,%rax
    31cb:	48 89 c2             	mov    %rax,%rdx
    31ce:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    31d2:	48 01 c2             	add    %rax,%rdx
    31d5:	48 89 d0             	mov    %rdx,%rax
    31d8:	48 89 c6             	mov    %rax,%rsi
    31db:	48 89 f0             	mov    %rsi,%rax
    31de:	48 c1 e8 03          	shr    $0x3,%rax
    31e2:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    31e8:	0f b6 00             	movzbl (%rax),%eax
    31eb:	84 c0                	test   %al,%al
    31ed:	40 0f 95 c7          	setne  %dil
    31f1:	3c 03                	cmp    $0x3,%al
    31f3:	0f 9e c0             	setle  %al
    31f6:	21 f8                	and    %edi,%eax
    31f8:	84 c0                	test   %al,%al
    31fa:	74 08                	je     3204 <allocator_force_take_collection+0x1e0>
    31fc:	48 89 f7             	mov    %rsi,%rdi
    31ff:	e8 8c ef ff ff       	call   2190 <__asan_report_load4@plt>
    3204:	8b 02                	mov    (%rdx),%eax
    3206:	48 89 ce             	mov    %rcx,%rsi
    3209:	89 c7                	mov    %eax,%edi
    320b:	e8 64 f8 ff ff       	call   2a74 <collection_needed>
    3210:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    3214:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    321b:	e9 bf 00 00 00       	jmp    32df <allocator_force_take_collection+0x2bb>
    3220:	8b 55 e8             	mov    -0x18(%rbp),%edx
    3223:	48 89 d0             	mov    %rdx,%rax
    3226:	48 01 c0             	add    %rax,%rax
    3229:	48 01 d0             	add    %rdx,%rax
    322c:	48 c1 e0 03          	shl    $0x3,%rax
    3230:	48 89 c2             	mov    %rax,%rdx
    3233:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3237:	48 01 d0             	add    %rdx,%rax
    323a:	48 8d 50 08          	lea    0x8(%rax),%rdx
    323e:	48 89 d1             	mov    %rdx,%rcx
    3241:	48 c1 e9 03          	shr    $0x3,%rcx
    3245:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    324c:	0f b6 09             	movzbl (%rcx),%ecx
    324f:	84 c9                	test   %cl,%cl
    3251:	74 08                	je     325b <allocator_force_take_collection+0x237>
    3253:	48 89 d7             	mov    %rdx,%rdi
    3256:	e8 05 ef ff ff       	call   2160 <__asan_report_load8@plt>
    325b:	48 8b 70 08          	mov    0x8(%rax),%rsi
    325f:	8b 55 e8             	mov    -0x18(%rbp),%edx
    3262:	48 89 d0             	mov    %rdx,%rax
    3265:	48 01 c0             	add    %rax,%rax
    3268:	48 01 d0             	add    %rdx,%rax
    326b:	48 c1 e0 03          	shl    $0x3,%rax
    326f:	48 89 c2             	mov    %rax,%rdx
    3272:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3276:	48 01 c2             	add    %rax,%rdx
    3279:	48 89 d0             	mov    %rdx,%rax
    327c:	48 89 c1             	mov    %rax,%rcx
    327f:	48 89 c8             	mov    %rcx,%rax
    3282:	48 c1 e8 03          	shr    $0x3,%rax
    3286:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    328c:	0f b6 00             	movzbl (%rax),%eax
    328f:	84 c0                	test   %al,%al
    3291:	40 0f 95 c7          	setne  %dil
    3295:	3c 03                	cmp    $0x3,%al
    3297:	0f 9e c0             	setle  %al
    329a:	21 f8                	and    %edi,%eax
    329c:	84 c0                	test   %al,%al
    329e:	74 08                	je     32a8 <allocator_force_take_collection+0x284>
    32a0:	48 89 cf             	mov    %rcx,%rdi
    32a3:	e8 e8 ee ff ff       	call   2190 <__asan_report_load4@plt>
    32a8:	8b 0a                	mov    (%rdx),%ecx
    32aa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    32ae:	48 89 f2             	mov    %rsi,%rdx
    32b1:	89 ce                	mov    %ecx,%esi
    32b3:	48 89 c7             	mov    %rax,%rdi
    32b6:	e8 4b f6 ff ff       	call   2906 <collection_init>
    32bb:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
    32bf:	8b 55 e8             	mov    -0x18(%rbp),%edx
    32c2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    32c6:	be 00 00 00 00       	mov    $0x0,%esi
    32cb:	48 89 c7             	mov    %rax,%rdi
    32ce:	e8 54 f8 ff ff       	call   2b27 <manager_insert>
    32d3:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
    32d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    32db:	48 01 45 f0          	add    %rax,-0x10(%rbp)
    32df:	8b 55 e8             	mov    -0x18(%rbp),%edx
    32e2:	48 89 d0             	mov    %rdx,%rax
    32e5:	48 01 c0             	add    %rax,%rax
    32e8:	48 01 d0             	add    %rdx,%rax
    32eb:	48 c1 e0 03          	shl    $0x3,%rax
    32ef:	48 89 c2             	mov    %rax,%rdx
    32f2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    32f6:	48 01 c2             	add    %rax,%rdx
    32f9:	48 8d 42 10          	lea    0x10(%rdx),%rax
    32fd:	48 89 c1             	mov    %rax,%rcx
    3300:	48 89 c8             	mov    %rcx,%rax
    3303:	48 c1 e8 03          	shr    $0x3,%rax
    3307:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    330d:	0f b6 00             	movzbl (%rax),%eax
    3310:	84 c0                	test   %al,%al
    3312:	40 0f 95 c6          	setne  %sil
    3316:	3c 03                	cmp    $0x3,%al
    3318:	0f 9e c0             	setle  %al
    331b:	21 f0                	and    %esi,%eax
    331d:	84 c0                	test   %al,%al
    331f:	74 08                	je     3329 <allocator_force_take_collection+0x305>
    3321:	48 89 cf             	mov    %rcx,%rdi
    3324:	e8 67 ee ff ff       	call   2190 <__asan_report_load4@plt>
    3329:	8b 42 10             	mov    0x10(%rdx),%eax
    332c:	39 45 ec             	cmp    %eax,-0x14(%rbp)
    332f:	0f 85 eb fe ff ff    	jne    3220 <allocator_force_take_collection+0x1fc>
    3335:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
    3339:	83 7d e8 08          	cmpl   $0x8,-0x18(%rbp)
    333d:	0f 85 39 fe ff ff    	jne    317c <allocator_force_take_collection+0x158>
    3343:	b8 00 00 00 00       	mov    $0x0,%eax
    3348:	c9                   	leave  
    3349:	c3                   	ret    

000000000000334a <allocator_take_collection>:
    334a:	f3 0f 1e fa          	endbr64 
    334e:	55                   	push   %rbp
    334f:	48 89 e5             	mov    %rsp,%rbp
    3352:	48 83 ec 30          	sub    $0x30,%rsp
    3356:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    335a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
    335e:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
    3365:	00 
    3366:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
    336d:	e9 c9 02 00 00       	jmp    363b <allocator_take_collection+0x2f1>
    3372:	8b 45 ec             	mov    -0x14(%rbp),%eax
    3375:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    337c:	00 
    337d:	48 8d 05 fc 3f 00 00 	lea    0x3ffc(%rip),%rax        # 7380 <allocator>
    3384:	48 01 d0             	add    %rdx,%rax
    3387:	48 89 c2             	mov    %rax,%rdx
    338a:	48 c1 ea 03          	shr    $0x3,%rdx
    338e:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3395:	0f b6 12             	movzbl (%rdx),%edx
    3398:	84 d2                	test   %dl,%dl
    339a:	74 08                	je     33a4 <allocator_take_collection+0x5a>
    339c:	48 89 c7             	mov    %rax,%rdi
    339f:	e8 bc ed ff ff       	call   2160 <__asan_report_load8@plt>
    33a4:	8b 45 ec             	mov    -0x14(%rbp),%eax
    33a7:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    33ae:	00 
    33af:	48 8d 05 ca 3f 00 00 	lea    0x3fca(%rip),%rax        # 7380 <allocator>
    33b6:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
    33ba:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    33be:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    33c2:	8b 45 ec             	mov    -0x14(%rbp),%eax
    33c5:	89 c6                	mov    %eax,%esi
    33c7:	48 8d 05 b2 3f 00 00 	lea    0x3fb2(%rip),%rax        # 7380 <allocator>
    33ce:	48 89 c7             	mov    %rax,%rdi
    33d1:	e8 f5 f9 ff ff       	call   2dcb <manager_erase>
    33d6:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
    33da:	8b 55 ec             	mov    -0x14(%rbp),%edx
    33dd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    33e1:	be 00 00 00 00       	mov    $0x0,%esi
    33e6:	48 89 c7             	mov    %rax,%rdi
    33e9:	e8 39 f7 ff ff       	call   2b27 <manager_insert>
    33ee:	8b 55 ec             	mov    -0x14(%rbp),%edx
    33f1:	48 89 d0             	mov    %rdx,%rax
    33f4:	48 01 c0             	add    %rax,%rax
    33f7:	48 01 d0             	add    %rdx,%rax
    33fa:	48 c1 e0 03          	shl    $0x3,%rax
    33fe:	48 89 c2             	mov    %rax,%rdx
    3401:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3405:	48 01 c2             	add    %rax,%rdx
    3408:	48 8d 42 10          	lea    0x10(%rdx),%rax
    340c:	48 89 c1             	mov    %rax,%rcx
    340f:	48 89 c8             	mov    %rcx,%rax
    3412:	48 c1 e8 03          	shr    $0x3,%rax
    3416:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    341c:	0f b6 00             	movzbl (%rax),%eax
    341f:	84 c0                	test   %al,%al
    3421:	40 0f 95 c6          	setne  %sil
    3425:	3c 03                	cmp    $0x3,%al
    3427:	0f 9e c0             	setle  %al
    342a:	21 f0                	and    %esi,%eax
    342c:	84 c0                	test   %al,%al
    342e:	74 08                	je     3438 <allocator_take_collection+0xee>
    3430:	48 89 cf             	mov    %rcx,%rdi
    3433:	e8 58 ed ff ff       	call   2190 <__asan_report_load4@plt>
    3438:	8b 4a 10             	mov    0x10(%rdx),%ecx
    343b:	8b 55 ec             	mov    -0x14(%rbp),%edx
    343e:	48 89 d0             	mov    %rdx,%rax
    3441:	48 01 c0             	add    %rax,%rax
    3444:	48 01 d0             	add    %rdx,%rax
    3447:	48 c1 e0 03          	shl    $0x3,%rax
    344b:	48 89 c2             	mov    %rax,%rdx
    344e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3452:	48 01 c2             	add    %rax,%rdx
    3455:	8d 71 ff             	lea    -0x1(%rcx),%esi
    3458:	48 8d 42 10          	lea    0x10(%rdx),%rax
    345c:	48 89 c1             	mov    %rax,%rcx
    345f:	48 89 c8             	mov    %rcx,%rax
    3462:	48 c1 e8 03          	shr    $0x3,%rax
    3466:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    346c:	0f b6 00             	movzbl (%rax),%eax
    346f:	84 c0                	test   %al,%al
    3471:	40 0f 95 c7          	setne  %dil
    3475:	3c 03                	cmp    $0x3,%al
    3477:	0f 9e c0             	setle  %al
    347a:	21 f8                	and    %edi,%eax
    347c:	84 c0                	test   %al,%al
    347e:	74 08                	je     3488 <allocator_take_collection+0x13e>
    3480:	48 89 cf             	mov    %rcx,%rdi
    3483:	e8 68 ed ff ff       	call   21f0 <__asan_report_store4@plt>
    3488:	89 72 10             	mov    %esi,0x10(%rdx)
    348b:	8b 55 ec             	mov    -0x14(%rbp),%edx
    348e:	48 89 d0             	mov    %rdx,%rax
    3491:	48 01 c0             	add    %rax,%rax
    3494:	48 01 d0             	add    %rdx,%rax
    3497:	48 c1 e0 03          	shl    $0x3,%rax
    349b:	48 89 c2             	mov    %rax,%rdx
    349e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    34a2:	48 01 c2             	add    %rax,%rdx
    34a5:	48 8d 42 10          	lea    0x10(%rdx),%rax
    34a9:	48 89 c1             	mov    %rax,%rcx
    34ac:	48 89 c8             	mov    %rcx,%rax
    34af:	48 c1 e8 03          	shr    $0x3,%rax
    34b3:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    34b9:	0f b6 00             	movzbl (%rax),%eax
    34bc:	84 c0                	test   %al,%al
    34be:	40 0f 95 c6          	setne  %sil
    34c2:	3c 03                	cmp    $0x3,%al
    34c4:	0f 9e c0             	setle  %al
    34c7:	21 f0                	and    %esi,%eax
    34c9:	84 c0                	test   %al,%al
    34cb:	74 08                	je     34d5 <allocator_take_collection+0x18b>
    34cd:	48 89 cf             	mov    %rcx,%rdi
    34d0:	e8 bb ec ff ff       	call   2190 <__asan_report_load4@plt>
    34d5:	8b 42 10             	mov    0x10(%rdx),%eax
    34d8:	85 c0                	test   %eax,%eax
    34da:	74 6d                	je     3549 <allocator_take_collection+0x1ff>
    34dc:	8b 45 ec             	mov    -0x14(%rbp),%eax
    34df:	48 83 c0 10          	add    $0x10,%rax
    34e3:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    34ea:	00 
    34eb:	48 8d 05 8e 3e 00 00 	lea    0x3e8e(%rip),%rax        # 7380 <allocator>
    34f2:	48 01 d0             	add    %rdx,%rax
    34f5:	48 89 c2             	mov    %rax,%rdx
    34f8:	48 c1 ea 03          	shr    $0x3,%rdx
    34fc:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3503:	0f b6 12             	movzbl (%rdx),%edx
    3506:	84 d2                	test   %dl,%dl
    3508:	40 0f 95 c6          	setne  %sil
    350c:	48 89 c1             	mov    %rax,%rcx
    350f:	83 e1 07             	and    $0x7,%ecx
    3512:	83 c1 03             	add    $0x3,%ecx
    3515:	38 d1                	cmp    %dl,%cl
    3517:	0f 9d c2             	setge  %dl
    351a:	21 f2                	and    %esi,%edx
    351c:	84 d2                	test   %dl,%dl
    351e:	74 08                	je     3528 <allocator_take_collection+0x1de>
    3520:	48 89 c7             	mov    %rax,%rdi
    3523:	e8 68 ec ff ff       	call   2190 <__asan_report_load4@plt>
    3528:	8b 45 ec             	mov    -0x14(%rbp),%eax
    352b:	48 83 c0 10          	add    $0x10,%rax
    352f:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    3536:	00 
    3537:	48 8d 05 42 3e 00 00 	lea    0x3e42(%rip),%rax        # 7380 <allocator>
    353e:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    3541:	85 c0                	test   %eax,%eax
    3543:	0f 85 29 fe ff ff    	jne    3372 <allocator_take_collection+0x28>
    3549:	8b 55 ec             	mov    -0x14(%rbp),%edx
    354c:	48 89 d0             	mov    %rdx,%rax
    354f:	48 01 c0             	add    %rax,%rax
    3552:	48 01 d0             	add    %rdx,%rax
    3555:	48 c1 e0 03          	shl    $0x3,%rax
    3559:	48 89 c2             	mov    %rax,%rdx
    355c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    3560:	48 01 d0             	add    %rdx,%rax
    3563:	48 8d 50 08          	lea    0x8(%rax),%rdx
    3567:	48 89 d1             	mov    %rdx,%rcx
    356a:	48 c1 e9 03          	shr    $0x3,%rcx
    356e:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    3575:	0f b6 09             	movzbl (%rcx),%ecx
    3578:	84 c9                	test   %cl,%cl
    357a:	74 08                	je     3584 <allocator_take_collection+0x23a>
    357c:	48 89 d7             	mov    %rdx,%rdi
    357f:	e8 dc eb ff ff       	call   2160 <__asan_report_load8@plt>
    3584:	48 8b 48 08          	mov    0x8(%rax),%rcx
    3588:	8b 55 ec             	mov    -0x14(%rbp),%edx
    358b:	48 89 d0             	mov    %rdx,%rax
    358e:	48 01 c0             	add    %rax,%rax
    3591:	48 01 d0             	add    %rdx,%rax
    3594:	48 c1 e0 03          	shl    $0x3,%rax
    3598:	48 89 c2             	mov    %rax,%rdx
    359b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    359f:	48 01 c2             	add    %rax,%rdx
    35a2:	48 89 d0             	mov    %rdx,%rax
    35a5:	48 89 c6             	mov    %rax,%rsi
    35a8:	48 89 f0             	mov    %rsi,%rax
    35ab:	48 c1 e8 03          	shr    $0x3,%rax
    35af:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    35b5:	0f b6 00             	movzbl (%rax),%eax
    35b8:	84 c0                	test   %al,%al
    35ba:	40 0f 95 c7          	setne  %dil
    35be:	3c 03                	cmp    $0x3,%al
    35c0:	0f 9e c0             	setle  %al
    35c3:	21 f8                	and    %edi,%eax
    35c5:	84 c0                	test   %al,%al
    35c7:	74 08                	je     35d1 <allocator_take_collection+0x287>
    35c9:	48 89 f7             	mov    %rsi,%rdi
    35cc:	e8 bf eb ff ff       	call   2190 <__asan_report_load4@plt>
    35d1:	8b 02                	mov    (%rdx),%eax
    35d3:	48 89 ce             	mov    %rcx,%rsi
    35d6:	89 c7                	mov    %eax,%edi
    35d8:	e8 97 f4 ff ff       	call   2a74 <collection_needed>
    35dd:	48 89 c6             	mov    %rax,%rsi
    35e0:	8b 55 ec             	mov    -0x14(%rbp),%edx
    35e3:	48 89 d0             	mov    %rdx,%rax
    35e6:	48 01 c0             	add    %rax,%rax
    35e9:	48 01 d0             	add    %rdx,%rax
    35ec:	48 c1 e0 03          	shl    $0x3,%rax
    35f0:	48 89 c2             	mov    %rax,%rdx
    35f3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    35f7:	48 01 c2             	add    %rax,%rdx
    35fa:	48 8d 42 10          	lea    0x10(%rdx),%rax
    35fe:	48 89 c1             	mov    %rax,%rcx
    3601:	48 89 c8             	mov    %rcx,%rax
    3604:	48 c1 e8 03          	shr    $0x3,%rax
    3608:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    360e:	0f b6 00             	movzbl (%rax),%eax
    3611:	84 c0                	test   %al,%al
    3613:	40 0f 95 c7          	setne  %dil
    3617:	3c 03                	cmp    $0x3,%al
    3619:	0f 9e c0             	setle  %al
    361c:	21 f8                	and    %edi,%eax
    361e:	84 c0                	test   %al,%al
    3620:	74 08                	je     362a <allocator_take_collection+0x2e0>
    3622:	48 89 cf             	mov    %rcx,%rdi
    3625:	e8 66 eb ff ff       	call   2190 <__asan_report_load4@plt>
    362a:	8b 42 10             	mov    0x10(%rdx),%eax
    362d:	89 c0                	mov    %eax,%eax
    362f:	48 0f af c6          	imul   %rsi,%rax
    3633:	48 01 45 f0          	add    %rax,-0x10(%rbp)
    3637:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
    363b:	83 7d ec 08          	cmpl   $0x8,-0x14(%rbp)
    363f:	0f 85 46 fe ff ff    	jne    348b <allocator_take_collection+0x141>
    3645:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
    364a:	75 07                	jne    3653 <allocator_take_collection+0x309>
    364c:	b8 00 00 00 00       	mov    $0x0,%eax
    3651:	eb 17                	jmp    366a <allocator_take_collection+0x320>
    3653:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    3657:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    365b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    365f:	48 89 ce             	mov    %rcx,%rsi
    3662:	48 89 c7             	mov    %rax,%rdi
    3665:	e8 ba f9 ff ff       	call   3024 <allocator_force_take_collection>
    366a:	c9                   	leave  
    366b:	c3                   	ret    

000000000000366c <allocator_give_collection>:
    366c:	f3 0f 1e fa          	endbr64 
    3670:	55                   	push   %rbp
    3671:	48 89 e5             	mov    %rsp,%rbp
    3674:	48 83 ec 20          	sub    $0x20,%rsp
    3678:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    367c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    3680:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    3687:	e9 0a 01 00 00       	jmp    3796 <allocator_give_collection+0x12a>
    368c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    3690:	48 83 c0 28          	add    $0x28,%rax
    3694:	48 89 c2             	mov    %rax,%rdx
    3697:	48 c1 ea 03          	shr    $0x3,%rdx
    369b:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    36a2:	0f b6 12             	movzbl (%rdx),%edx
    36a5:	84 d2                	test   %dl,%dl
    36a7:	74 08                	je     36b1 <allocator_give_collection+0x45>
    36a9:	48 89 c7             	mov    %rax,%rdi
    36ac:	e8 af ea ff ff       	call   2160 <__asan_report_load8@plt>
    36b1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    36b5:	48 8b 48 28          	mov    0x28(%rax),%rcx
    36b9:	8b 45 f4             	mov    -0xc(%rbp),%eax
    36bc:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    36c3:	00 
    36c4:	48 8d 05 55 19 00 00 	lea    0x1955(%rip),%rax        # 5020 <BLOCK_SZ>
    36cb:	48 01 d0             	add    %rdx,%rax
    36ce:	48 89 c2             	mov    %rax,%rdx
    36d1:	48 c1 ea 03          	shr    $0x3,%rdx
    36d5:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    36dc:	0f b6 12             	movzbl (%rdx),%edx
    36df:	84 d2                	test   %dl,%dl
    36e1:	74 08                	je     36eb <allocator_give_collection+0x7f>
    36e3:	48 89 c7             	mov    %rax,%rdi
    36e6:	e8 75 ea ff ff       	call   2160 <__asan_report_load8@plt>
    36eb:	8b 45 f4             	mov    -0xc(%rbp),%eax
    36ee:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    36f5:	00 
    36f6:	48 8d 05 23 19 00 00 	lea    0x1923(%rip),%rax        # 5020 <BLOCK_SZ>
    36fd:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
    3701:	48 39 c1             	cmp    %rax,%rcx
    3704:	0f 85 88 00 00 00    	jne    3792 <allocator_give_collection+0x126>
    370a:	8b 45 f4             	mov    -0xc(%rbp),%eax
    370d:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    3714:	00 
    3715:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    3719:	48 01 d0             	add    %rdx,%rax
    371c:	48 89 c2             	mov    %rax,%rdx
    371f:	48 c1 ea 03          	shr    $0x3,%rdx
    3723:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    372a:	0f b6 12             	movzbl (%rdx),%edx
    372d:	84 d2                	test   %dl,%dl
    372f:	74 08                	je     3739 <allocator_give_collection+0xcd>
    3731:	48 89 c7             	mov    %rax,%rdi
    3734:	e8 27 ea ff ff       	call   2160 <__asan_report_load8@plt>
    3739:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    373d:	8b 55 f4             	mov    -0xc(%rbp),%edx
    3740:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
    3744:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    3748:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    374c:	8b 55 f4             	mov    -0xc(%rbp),%edx
    374f:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    3753:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
    3757:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    375b:	8b 55 f4             	mov    -0xc(%rbp),%edx
    375e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
    3762:	48 8d 50 38          	lea    0x38(%rax),%rdx
    3766:	48 89 d1             	mov    %rdx,%rcx
    3769:	48 c1 e9 03          	shr    $0x3,%rcx
    376d:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    3774:	0f b6 09             	movzbl (%rcx),%ecx
    3777:	84 c9                	test   %cl,%cl
    3779:	74 08                	je     3783 <allocator_give_collection+0x117>
    377b:	48 89 d7             	mov    %rdx,%rdi
    377e:	e8 8d ea ff ff       	call   2210 <__asan_report_store8@plt>
    3783:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    3787:	48 89 50 38          	mov    %rdx,0x38(%rax)
    378b:	b8 00 00 00 00       	mov    $0x0,%eax
    3790:	eb 13                	jmp    37a5 <allocator_give_collection+0x139>
    3792:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    3796:	83 7d f4 08          	cmpl   $0x8,-0xc(%rbp)
    379a:	0f 85 ec fe ff ff    	jne    368c <allocator_give_collection+0x20>
    37a0:	b8 01 00 00 00       	mov    $0x1,%eax
    37a5:	c9                   	leave  
    37a6:	c3                   	ret    

00000000000037a7 <allocator_force_take_manager>:
    37a7:	f3 0f 1e fa          	endbr64 
    37ab:	55                   	push   %rbp
    37ac:	48 89 e5             	mov    %rsp,%rbp
    37af:	48 83 ec 20          	sub    $0x20,%rsp
    37b3:	89 7d ec             	mov    %edi,-0x14(%rbp)
    37b6:	8b 55 ec             	mov    -0x14(%rbp),%edx
    37b9:	48 89 d0             	mov    %rdx,%rax
    37bc:	48 01 c0             	add    %rax,%rax
    37bf:	48 01 d0             	add    %rdx,%rax
    37c2:	48 c1 e0 02          	shl    $0x2,%rax
    37c6:	48 01 d0             	add    %rdx,%rax
    37c9:	48 c1 e0 03          	shl    $0x3,%rax
    37cd:	48 89 c7             	mov    %rax,%rdi
    37d0:	e8 db e9 ff ff       	call   21b0 <malloc@plt>
    37d5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    37d9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    37e0:	eb 48                	jmp    382a <allocator_force_take_manager+0x83>
    37e2:	48 8b 15 f7 3b 00 00 	mov    0x3bf7(%rip),%rdx        # 73e0 <allocator+0x60>
    37e9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    37ed:	48 83 c0 60          	add    $0x60,%rax
    37f1:	48 89 c1             	mov    %rax,%rcx
    37f4:	48 c1 e9 03          	shr    $0x3,%rcx
    37f8:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    37ff:	0f b6 09             	movzbl (%rcx),%ecx
    3802:	84 c9                	test   %cl,%cl
    3804:	74 08                	je     380e <allocator_force_take_manager+0x67>
    3806:	48 89 c7             	mov    %rax,%rdi
    3809:	e8 02 ea ff ff       	call   2210 <__asan_report_store8@plt>
    380e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3812:	48 89 50 60          	mov    %rdx,0x60(%rax)
    3816:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    381a:	48 89 05 bf 3b 00 00 	mov    %rax,0x3bbf(%rip)        # 73e0 <allocator+0x60>
    3821:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    3825:	48 83 45 f8 68       	addq   $0x68,-0x8(%rbp)
    382a:	8b 45 f4             	mov    -0xc(%rbp),%eax
    382d:	3b 45 ec             	cmp    -0x14(%rbp),%eax
    3830:	75 b0                	jne    37e2 <allocator_force_take_manager+0x3b>
    3832:	b8 00 00 00 00       	mov    $0x0,%eax
    3837:	c9                   	leave  
    3838:	c3                   	ret    

0000000000003839 <allocator_take_manager>:
    3839:	f3 0f 1e fa          	endbr64 
    383d:	55                   	push   %rbp
    383e:	48 89 e5             	mov    %rsp,%rbp
    3841:	48 83 ec 10          	sub    $0x10,%rsp
    3845:	48 8b 05 94 3b 00 00 	mov    0x3b94(%rip),%rax        # 73e0 <allocator+0x60>
    384c:	48 85 c0             	test   %rax,%rax
    384f:	75 15                	jne    3866 <allocator_take_manager+0x2d>
    3851:	bf 04 00 00 00       	mov    $0x4,%edi
    3856:	e8 4c ff ff ff       	call   37a7 <allocator_force_take_manager>
    385b:	85 c0                	test   %eax,%eax
    385d:	74 07                	je     3866 <allocator_take_manager+0x2d>
    385f:	b8 00 00 00 00       	mov    $0x0,%eax
    3864:	eb 4f                	jmp    38b5 <allocator_take_manager+0x7c>
    3866:	48 8b 05 73 3b 00 00 	mov    0x3b73(%rip),%rax        # 73e0 <allocator+0x60>
    386d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    3871:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3875:	48 83 c0 60          	add    $0x60,%rax
    3879:	48 89 c2             	mov    %rax,%rdx
    387c:	48 c1 ea 03          	shr    $0x3,%rdx
    3880:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3887:	0f b6 12             	movzbl (%rdx),%edx
    388a:	84 d2                	test   %dl,%dl
    388c:	74 08                	je     3896 <allocator_take_manager+0x5d>
    388e:	48 89 c7             	mov    %rax,%rdi
    3891:	e8 ca e8 ff ff       	call   2160 <__asan_report_load8@plt>
    3896:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    389a:	48 8b 40 60          	mov    0x60(%rax),%rax
    389e:	48 89 05 3b 3b 00 00 	mov    %rax,0x3b3b(%rip)        # 73e0 <allocator+0x60>
    38a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    38a9:	48 c7 40 60 00 00 00 	movq   $0x0,0x60(%rax)
    38b0:	00 
    38b1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    38b5:	c9                   	leave  
    38b6:	c3                   	ret    

00000000000038b7 <allocator_give_manager>:
    38b7:	f3 0f 1e fa          	endbr64 
    38bb:	55                   	push   %rbp
    38bc:	48 89 e5             	mov    %rsp,%rbp
    38bf:	48 83 ec 10          	sub    $0x10,%rsp
    38c3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    38c7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    38cb:	48 83 c0 60          	add    $0x60,%rax
    38cf:	48 89 c2             	mov    %rax,%rdx
    38d2:	48 c1 ea 03          	shr    $0x3,%rdx
    38d6:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    38dd:	0f b6 12             	movzbl (%rdx),%edx
    38e0:	84 d2                	test   %dl,%dl
    38e2:	74 08                	je     38ec <allocator_give_manager+0x35>
    38e4:	48 89 c7             	mov    %rax,%rdi
    38e7:	e8 74 e8 ff ff       	call   2160 <__asan_report_load8@plt>
    38ec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    38f0:	48 8b 40 60          	mov    0x60(%rax),%rax
    38f4:	48 85 c0             	test   %rax,%rax
    38f7:	74 2d                	je     3926 <allocator_give_manager+0x6f>
    38f9:	e8 c2 e8 ff ff       	call   21c0 <__asan_handle_no_return@plt>
    38fe:	48 8d 05 9b 19 00 00 	lea    0x199b(%rip),%rax        # 52a0 <__PRETTY_FUNCTION__.0>
    3905:	48 89 c1             	mov    %rax,%rcx
    3908:	ba 61 01 00 00       	mov    $0x161,%edx
    390d:	48 8d 05 cc 17 00 00 	lea    0x17cc(%rip),%rax        # 50e0 <BITSET_SZ+0x60>
    3914:	48 89 c6             	mov    %rax,%rsi
    3917:	48 8d 05 82 18 00 00 	lea    0x1882(%rip),%rax        # 51a0 <BITSET_SZ+0x120>
    391e:	48 89 c7             	mov    %rax,%rdi
    3921:	e8 5a e8 ff ff       	call   2180 <__assert_fail@plt>
    3926:	48 8b 15 b3 3a 00 00 	mov    0x3ab3(%rip),%rdx        # 73e0 <allocator+0x60>
    392d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3931:	48 83 c0 60          	add    $0x60,%rax
    3935:	48 89 c1             	mov    %rax,%rcx
    3938:	48 c1 e9 03          	shr    $0x3,%rcx
    393c:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    3943:	0f b6 09             	movzbl (%rcx),%ecx
    3946:	84 c9                	test   %cl,%cl
    3948:	74 08                	je     3952 <allocator_give_manager+0x9b>
    394a:	48 89 c7             	mov    %rax,%rdi
    394d:	e8 be e8 ff ff       	call   2210 <__asan_report_store8@plt>
    3952:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    3956:	48 89 50 60          	mov    %rdx,0x60(%rax)
    395a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    395e:	48 89 05 7b 3a 00 00 	mov    %rax,0x3a7b(%rip)        # 73e0 <allocator+0x60>
    3965:	90                   	nop
    3966:	c9                   	leave  
    3967:	c3                   	ret    

0000000000003968 <serial_allocate>:
    3968:	f3 0f 1e fa          	endbr64 
    396c:	55                   	push   %rbp
    396d:	48 89 e5             	mov    %rsp,%rbp
    3970:	48 83 ec 20          	sub    $0x20,%rsp
    3974:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    3978:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    397c:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    3983:	00 
    3984:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    398b:	e9 92 00 00 00       	jmp    3a22 <serial_allocate+0xba>
    3990:	8b 45 f4             	mov    -0xc(%rbp),%eax
    3993:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    399a:	00 
    399b:	48 8d 05 7e 16 00 00 	lea    0x167e(%rip),%rax        # 5020 <BLOCK_SZ>
    39a2:	48 01 d0             	add    %rdx,%rax
    39a5:	48 89 c2             	mov    %rax,%rdx
    39a8:	48 c1 ea 03          	shr    $0x3,%rdx
    39ac:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    39b3:	0f b6 12             	movzbl (%rdx),%edx
    39b6:	84 d2                	test   %dl,%dl
    39b8:	74 08                	je     39c2 <serial_allocate+0x5a>
    39ba:	48 89 c7             	mov    %rax,%rdi
    39bd:	e8 9e e7 ff ff       	call   2160 <__asan_report_load8@plt>
    39c2:	8b 45 f4             	mov    -0xc(%rbp),%eax
    39c5:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    39cc:	00 
    39cd:	48 8d 05 4c 16 00 00 	lea    0x164c(%rip),%rax        # 5020 <BLOCK_SZ>
    39d4:	48 8b 04 02          	mov    (%rdx,%rax,1),%rax
    39d8:	48 39 45 e8          	cmp    %rax,-0x18(%rbp)
    39dc:	76 40                	jbe    3a1e <serial_allocate+0xb6>
    39de:	8b 45 f4             	mov    -0xc(%rbp),%eax
    39e1:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
    39e8:	00 
    39e9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    39ed:	48 01 d0             	add    %rdx,%rax
    39f0:	48 89 c2             	mov    %rax,%rdx
    39f3:	48 c1 ea 03          	shr    $0x3,%rdx
    39f7:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    39fe:	0f b6 12             	movzbl (%rdx),%edx
    3a01:	84 d2                	test   %dl,%dl
    3a03:	74 08                	je     3a0d <serial_allocate+0xa5>
    3a05:	48 89 c7             	mov    %rax,%rdi
    3a08:	e8 53 e7 ff ff       	call   2160 <__asan_report_load8@plt>
    3a0d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    3a11:	8b 55 f4             	mov    -0xc(%rbp),%edx
    3a14:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
    3a18:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    3a1c:	eb 0e                	jmp    3a2c <serial_allocate+0xc4>
    3a1e:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    3a22:	83 7d f4 07          	cmpl   $0x7,-0xc(%rbp)
    3a26:	0f 86 64 ff ff ff    	jbe    3990 <serial_allocate+0x28>
    3a2c:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    3a31:	75 07                	jne    3a3a <serial_allocate+0xd2>
    3a33:	b8 00 00 00 00       	mov    $0x0,%eax
    3a38:	eb 00                	jmp    3a3a <serial_allocate+0xd2>
    3a3a:	c9                   	leave  
    3a3b:	c3                   	ret    

0000000000003a3c <mm_malloc>:
    3a3c:	f3 0f 1e fa          	endbr64 
    3a40:	55                   	push   %rbp
    3a41:	48 89 e5             	mov    %rsp,%rbp
    3a44:	41 56                	push   %r14
    3a46:	41 55                	push   %r13
    3a48:	41 54                	push   %r12
    3a4a:	53                   	push   %rbx
    3a4b:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
    3a4f:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
    3a56:	48 8d 5d 80          	lea    -0x80(%rbp),%rbx
    3a5a:	49 89 de             	mov    %rbx,%r14
    3a5d:	83 3d fc 38 00 00 00 	cmpl   $0x0,0x38fc(%rip)        # 7360 <__asan_option_detect_stack_use_after_return@@Base>
    3a64:	74 12                	je     3a78 <mm_malloc+0x3c>
    3a66:	bf 40 00 00 00       	mov    $0x40,%edi
    3a6b:	e8 d0 e7 ff ff       	call   2240 <__asan_stack_malloc_0@plt>
    3a70:	48 85 c0             	test   %rax,%rax
    3a73:	74 03                	je     3a78 <mm_malloc+0x3c>
    3a75:	48 89 c3             	mov    %rax,%rbx
    3a78:	48 8d 43 60          	lea    0x60(%rbx),%rax
    3a7c:	49 89 c5             	mov    %rax,%r13
    3a7f:	48 c7 03 b3 8a b5 41 	movq   $0x41b58ab3,(%rbx)
    3a86:	48 8d 05 53 17 00 00 	lea    0x1753(%rip),%rax        # 51e0 <BITSET_SZ+0x160>
    3a8d:	48 89 43 08          	mov    %rax,0x8(%rbx)
    3a91:	48 8d 05 a4 ff ff ff 	lea    -0x5c(%rip),%rax        # 3a3c <mm_malloc>
    3a98:	48 89 43 10          	mov    %rax,0x10(%rbx)
    3a9c:	49 89 dc             	mov    %rbx,%r12
    3a9f:	49 c1 ec 03          	shr    $0x3,%r12
    3aa3:	41 c7 84 24 00 80 ff 	movl   $0xf1f1f1f1,0x7fff8000(%r12)
    3aaa:	7f f1 f1 f1 f1 
    3aaf:	41 c7 84 24 04 80 ff 	movl   $0xf3f3f300,0x7fff8004(%r12)
    3ab6:	7f 00 f3 f3 f3 
    3abb:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    3ac2:	00 00 
    3ac4:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    3ac8:	31 c0                	xor    %eax,%eax
    3aca:	c7 85 7c ff ff ff 00 	movl   $0x0,-0x84(%rbp)
    3ad1:	00 00 00 
    3ad4:	8b 95 7c ff ff ff    	mov    -0x84(%rbp),%edx
    3ada:	48 8b 05 3f 39 00 00 	mov    0x393f(%rip),%rax        # 7420 <G_table>
    3ae1:	89 d6                	mov    %edx,%esi
    3ae3:	48 89 c7             	mov    %rax,%rdi
    3ae6:	e8 7c e9 ff ff       	call   2467 <table_lookup>
    3aeb:	49 8d 55 c0          	lea    -0x40(%r13),%rdx
    3aef:	48 89 d1             	mov    %rdx,%rcx
    3af2:	48 c1 e9 03          	shr    $0x3,%rcx
    3af6:	48 81 c1 00 80 ff 7f 	add    $0x7fff8000,%rcx
    3afd:	0f b6 09             	movzbl (%rcx),%ecx
    3b00:	84 c9                	test   %cl,%cl
    3b02:	74 08                	je     3b0c <mm_malloc+0xd0>
    3b04:	48 89 d7             	mov    %rdx,%rdi
    3b07:	e8 04 e7 ff ff       	call   2210 <__asan_report_store8@plt>
    3b0c:	49 89 45 c0          	mov    %rax,-0x40(%r13)
    3b10:	49 8b 45 c0          	mov    -0x40(%r13),%rax
    3b14:	48 85 c0             	test   %rax,%rax
    3b17:	75 11                	jne    3b2a <mm_malloc+0xee>
    3b19:	49 8d 45 c0          	lea    -0x40(%r13),%rax
    3b1d:	48 89 c7             	mov    %rax,%rdi
    3b20:	b8 00 00 00 00       	mov    $0x0,%eax
    3b25:	e8 0f fd ff ff       	call   3839 <allocator_take_manager>
    3b2a:	b8 00 00 00 00       	mov    $0x0,%eax
    3b2f:	48 89 c2             	mov    %rax,%rdx
    3b32:	49 39 de             	cmp    %rbx,%r14
    3b35:	74 22                	je     3b59 <mm_malloc+0x11d>
    3b37:	48 c7 03 0e 36 e0 45 	movq   $0x45e0360e,(%rbx)
    3b3e:	48 b8 f5 f5 f5 f5 f5 	movabs $0xf5f5f5f5f5f5f5f5,%rax
    3b45:	f5 f5 f5 
    3b48:	49 89 84 24 00 80 ff 	mov    %rax,0x7fff8000(%r12)
    3b4f:	7f 
    3b50:	48 8b 43 38          	mov    0x38(%rbx),%rax
    3b54:	c6 00 00             	movb   $0x0,(%rax)
    3b57:	eb 0c                	jmp    3b65 <mm_malloc+0x129>
    3b59:	49 c7 84 24 00 80 ff 	movq   $0x0,0x7fff8000(%r12)
    3b60:	7f 00 00 00 00 
    3b65:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3b69:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    3b70:	00 00 
    3b72:	74 05                	je     3b79 <mm_malloc+0x13d>
    3b74:	e8 67 e6 ff ff       	call   21e0 <__stack_chk_fail@plt>
    3b79:	48 89 d0             	mov    %rdx,%rax
    3b7c:	48 83 ec 80          	sub    $0xffffffffffffff80,%rsp
    3b80:	5b                   	pop    %rbx
    3b81:	41 5c                	pop    %r12
    3b83:	41 5d                	pop    %r13
    3b85:	41 5e                	pop    %r14
    3b87:	5d                   	pop    %rbp
    3b88:	c3                   	ret    

0000000000003b89 <mm_free>:
    3b89:	f3 0f 1e fa          	endbr64 
    3b8d:	55                   	push   %rbp
    3b8e:	48 89 e5             	mov    %rsp,%rbp
    3b91:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    3b95:	90                   	nop
    3b96:	5d                   	pop    %rbp
    3b97:	c3                   	ret    

0000000000003b98 <mm_init>:
    3b98:	f3 0f 1e fa          	endbr64 
    3b9c:	55                   	push   %rbp
    3b9d:	48 89 e5             	mov    %rsp,%rbp
    3ba0:	41 56                	push   %r14
    3ba2:	41 55                	push   %r13
    3ba4:	41 54                	push   %r12
    3ba6:	53                   	push   %rbx
    3ba7:	48 81 ec 60 01 00 00 	sub    $0x160,%rsp
    3bae:	4c 8d a5 80 fe ff ff 	lea    -0x180(%rbp),%r12
    3bb5:	4d 89 e6             	mov    %r12,%r14
    3bb8:	83 3d a1 37 00 00 00 	cmpl   $0x0,0x37a1(%rip)        # 7360 <__asan_option_detect_stack_use_after_return@@Base>
    3bbf:	74 12                	je     3bd3 <mm_init+0x3b>
    3bc1:	bf 40 01 00 00       	mov    $0x140,%edi
    3bc6:	e8 05 e6 ff ff       	call   21d0 <__asan_stack_malloc_3@plt>
    3bcb:	48 85 c0             	test   %rax,%rax
    3bce:	74 03                	je     3bd3 <mm_init+0x3b>
    3bd0:	49 89 c4             	mov    %rax,%r12
    3bd3:	49 8d 84 24 60 01 00 	lea    0x160(%r12),%rax
    3bda:	00 
    3bdb:	48 89 c3             	mov    %rax,%rbx
    3bde:	49 c7 04 24 b3 8a b5 	movq   $0x41b58ab3,(%r12)
    3be5:	41 
    3be6:	48 8d 05 0b 16 00 00 	lea    0x160b(%rip),%rax        # 51f8 <BITSET_SZ+0x178>
    3bed:	49 89 44 24 08       	mov    %rax,0x8(%r12)
    3bf2:	48 8d 05 9f ff ff ff 	lea    -0x61(%rip),%rax        # 3b98 <mm_init>
    3bf9:	49 89 44 24 10       	mov    %rax,0x10(%r12)
    3bfe:	4d 89 e5             	mov    %r12,%r13
    3c01:	49 c1 ed 03          	shr    $0x3,%r13
    3c05:	41 c7 85 00 80 ff 7f 	movl   $0xf1f1f1f1,0x7fff8000(%r13)
    3c0c:	f1 f1 f1 f1 
    3c10:	41 c7 85 04 80 ff 7f 	movl   $0xf2f2f200,0x7fff8004(%r13)
    3c17:	00 f2 f2 f2 
    3c1b:	41 c7 85 20 80 ff 7f 	movl   $0xf3f3f3f3,0x7fff8020(%r13)
    3c22:	f3 f3 f3 f3 
    3c26:	41 c7 85 24 80 ff 7f 	movl   $0xf3f3f3f3,0x7fff8024(%r13)
    3c2d:	f3 f3 f3 f3 
    3c31:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    3c38:	00 00 
    3c3a:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    3c3e:	31 c0                	xor    %eax,%eax
    3c40:	bf 20 00 00 00       	mov    $0x20,%edi
    3c45:	e8 ff e6 ff ff       	call   2349 <table_need>
    3c4a:	48 98                	cltq   
    3c4c:	48 89 c7             	mov    %rax,%rdi
    3c4f:	e8 5c e5 ff ff       	call   21b0 <malloc@plt>
    3c54:	48 89 05 c5 37 00 00 	mov    %rax,0x37c5(%rip)        # 7420 <G_table>
    3c5b:	48 8b 05 be 37 00 00 	mov    0x37be(%rip),%rax        # 7420 <G_table>
    3c62:	be 20 00 00 00       	mov    $0x20,%esi
    3c67:	48 89 c7             	mov    %rax,%rdi
    3c6a:	e8 f2 e6 ff ff       	call   2361 <table_init>
    3c6f:	48 8d 83 e0 fe ff ff 	lea    -0x120(%rbx),%rax
    3c76:	48 89 c2             	mov    %rax,%rdx
    3c79:	48 c1 ea 03          	shr    $0x3,%rdx
    3c7d:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3c84:	0f b6 12             	movzbl (%rdx),%edx
    3c87:	84 d2                	test   %dl,%dl
    3c89:	0f 95 c1             	setne  %cl
    3c8c:	84 d2                	test   %dl,%dl
    3c8e:	0f 9e c2             	setle  %dl
    3c91:	89 ce                	mov    %ecx,%esi
    3c93:	21 d6                	and    %edx,%esi
    3c95:	ba c0 00 00 00       	mov    $0xc0,%edx
    3c9a:	48 83 ea 01          	sub    $0x1,%rdx
    3c9e:	48 8d 0c 10          	lea    (%rax,%rdx,1),%rcx
    3ca2:	48 89 ca             	mov    %rcx,%rdx
    3ca5:	48 c1 ea 03          	shr    $0x3,%rdx
    3ca9:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3cb0:	0f b6 12             	movzbl (%rdx),%edx
    3cb3:	84 d2                	test   %dl,%dl
    3cb5:	40 0f 95 c7          	setne  %dil
    3cb9:	83 e1 07             	and    $0x7,%ecx
    3cbc:	38 d1                	cmp    %dl,%cl
    3cbe:	0f 9d c2             	setge  %dl
    3cc1:	21 fa                	and    %edi,%edx
    3cc3:	09 f2                	or     %esi,%edx
    3cc5:	84 d2                	test   %dl,%dl
    3cc7:	74 0d                	je     3cd6 <mm_init+0x13e>
    3cc9:	be c0 00 00 00       	mov    $0xc0,%esi
    3cce:	48 89 c7             	mov    %rax,%rdi
    3cd1:	e8 ca e4 ff ff       	call   21a0 <__asan_report_store_n@plt>
    3cd6:	48 8d 93 e0 fe ff ff 	lea    -0x120(%rbx),%rdx
    3cdd:	b8 00 00 00 00       	mov    $0x0,%eax
    3ce2:	b9 18 00 00 00       	mov    $0x18,%ecx
    3ce7:	48 89 d7             	mov    %rdx,%rdi
    3cea:	f3 48 ab             	rep stos %rax,%es:(%rdi)
    3ced:	b8 08 00 00 00       	mov    $0x8,%eax
    3cf2:	89 c1                	mov    %eax,%ecx
    3cf4:	48 8d 83 e0 fe ff ff 	lea    -0x120(%rbx),%rax
    3cfb:	48 89 c2             	mov    %rax,%rdx
    3cfe:	48 89 d0             	mov    %rdx,%rax
    3d01:	48 c1 e8 03          	shr    $0x3,%rax
    3d05:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    3d0b:	0f b6 00             	movzbl (%rax),%eax
    3d0e:	84 c0                	test   %al,%al
    3d10:	40 0f 95 c6          	setne  %sil
    3d14:	3c 03                	cmp    $0x3,%al
    3d16:	0f 9e c0             	setle  %al
    3d19:	21 f0                	and    %esi,%eax
    3d1b:	84 c0                	test   %al,%al
    3d1d:	74 08                	je     3d27 <mm_init+0x18f>
    3d1f:	48 89 d7             	mov    %rdx,%rdi
    3d22:	e8 c9 e4 ff ff       	call   21f0 <__asan_report_store4@plt>
    3d27:	89 8b e0 fe ff ff    	mov    %ecx,-0x120(%rbx)
    3d2d:	b9 40 00 00 00       	mov    $0x40,%ecx
    3d32:	48 8d 83 e0 fe ff ff 	lea    -0x120(%rbx),%rax
    3d39:	48 83 c0 08          	add    $0x8,%rax
    3d3d:	48 89 c2             	mov    %rax,%rdx
    3d40:	48 c1 ea 03          	shr    $0x3,%rdx
    3d44:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3d4b:	0f b6 12             	movzbl (%rdx),%edx
    3d4e:	84 d2                	test   %dl,%dl
    3d50:	74 08                	je     3d5a <mm_init+0x1c2>
    3d52:	48 89 c7             	mov    %rax,%rdi
    3d55:	e8 b6 e4 ff ff       	call   2210 <__asan_report_store8@plt>
    3d5a:	48 89 8b e8 fe ff ff 	mov    %rcx,-0x118(%rbx)
    3d61:	48 8d 83 e0 fe ff ff 	lea    -0x120(%rbx),%rax
    3d68:	48 83 c0 10          	add    $0x10,%rax
    3d6c:	48 89 c2             	mov    %rax,%rdx
    3d6f:	48 89 d0             	mov    %rdx,%rax
    3d72:	48 c1 e8 03          	shr    $0x3,%rax
    3d76:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    3d7c:	0f b6 00             	movzbl (%rax),%eax
    3d7f:	84 c0                	test   %al,%al
    3d81:	0f 95 c1             	setne  %cl
    3d84:	3c 03                	cmp    $0x3,%al
    3d86:	0f 9e c0             	setle  %al
    3d89:	21 c8                	and    %ecx,%eax
    3d8b:	84 c0                	test   %al,%al
    3d8d:	74 08                	je     3d97 <mm_init+0x1ff>
    3d8f:	48 89 d7             	mov    %rdx,%rdi
    3d92:	e8 59 e4 ff ff       	call   21f0 <__asan_report_store4@plt>
    3d97:	c7 83 f0 fe ff ff 08 	movl   $0x8,-0x110(%rbx)
    3d9e:	00 00 00 
    3da1:	48 8d 83 e0 fe ff ff 	lea    -0x120(%rbx),%rax
    3da8:	ba 00 00 00 00       	mov    $0x0,%edx
    3dad:	48 89 c6             	mov    %rax,%rsi
    3db0:	48 8d 05 c9 35 00 00 	lea    0x35c9(%rip),%rax        # 7380 <allocator>
    3db7:	48 89 c7             	mov    %rax,%rdi
    3dba:	e8 65 f2 ff ff       	call   3024 <allocator_force_take_collection>
    3dbf:	48 8d 83 c0 fe ff ff 	lea    -0x140(%rbx),%rax
    3dc6:	48 89 c7             	mov    %rax,%rdi
    3dc9:	b8 00 00 00 00       	mov    $0x0,%eax
    3dce:	e8 66 fa ff ff       	call   3839 <allocator_take_manager>
    3dd3:	48 8d 83 c0 fe ff ff 	lea    -0x140(%rbx),%rax
    3dda:	48 89 c2             	mov    %rax,%rdx
    3ddd:	48 c1 ea 03          	shr    $0x3,%rdx
    3de1:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3de8:	0f b6 12             	movzbl (%rdx),%edx
    3deb:	84 d2                	test   %dl,%dl
    3ded:	74 08                	je     3df7 <mm_init+0x25f>
    3def:	48 89 c7             	mov    %rax,%rdi
    3df2:	e8 69 e3 ff ff       	call   2160 <__asan_report_load8@plt>
    3df7:	48 8b 93 c0 fe ff ff 	mov    -0x140(%rbx),%rdx
    3dfe:	48 8b 05 1b 36 00 00 	mov    0x361b(%rip),%rax        # 7420 <G_table>
    3e05:	be 00 00 00 00       	mov    $0x0,%esi
    3e0a:	48 89 c7             	mov    %rax,%rdi
    3e0d:	e8 c2 e7 ff ff       	call   25d4 <table_insert>
    3e12:	b8 08 00 00 00       	mov    $0x8,%eax
    3e17:	89 c1                	mov    %eax,%ecx
    3e19:	48 8d 83 e0 fe ff ff 	lea    -0x120(%rbx),%rax
    3e20:	48 89 c2             	mov    %rax,%rdx
    3e23:	48 89 d0             	mov    %rdx,%rax
    3e26:	48 c1 e8 03          	shr    $0x3,%rax
    3e2a:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    3e30:	0f b6 00             	movzbl (%rax),%eax
    3e33:	84 c0                	test   %al,%al
    3e35:	40 0f 95 c6          	setne  %sil
    3e39:	3c 03                	cmp    $0x3,%al
    3e3b:	0f 9e c0             	setle  %al
    3e3e:	21 f0                	and    %esi,%eax
    3e40:	84 c0                	test   %al,%al
    3e42:	74 08                	je     3e4c <mm_init+0x2b4>
    3e44:	48 89 d7             	mov    %rdx,%rdi
    3e47:	e8 a4 e3 ff ff       	call   21f0 <__asan_report_store4@plt>
    3e4c:	89 8b e0 fe ff ff    	mov    %ecx,-0x120(%rbx)
    3e52:	b9 40 00 00 00       	mov    $0x40,%ecx
    3e57:	48 8d 83 e0 fe ff ff 	lea    -0x120(%rbx),%rax
    3e5e:	48 83 c0 08          	add    $0x8,%rax
    3e62:	48 89 c2             	mov    %rax,%rdx
    3e65:	48 c1 ea 03          	shr    $0x3,%rdx
    3e69:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3e70:	0f b6 12             	movzbl (%rdx),%edx
    3e73:	84 d2                	test   %dl,%dl
    3e75:	74 08                	je     3e7f <mm_init+0x2e7>
    3e77:	48 89 c7             	mov    %rax,%rdi
    3e7a:	e8 91 e3 ff ff       	call   2210 <__asan_report_store8@plt>
    3e7f:	48 89 8b e8 fe ff ff 	mov    %rcx,-0x118(%rbx)
    3e86:	48 8d 83 e0 fe ff ff 	lea    -0x120(%rbx),%rax
    3e8d:	48 83 c0 10          	add    $0x10,%rax
    3e91:	48 89 c2             	mov    %rax,%rdx
    3e94:	48 89 d0             	mov    %rdx,%rax
    3e97:	48 c1 e8 03          	shr    $0x3,%rax
    3e9b:	48 05 00 80 ff 7f    	add    $0x7fff8000,%rax
    3ea1:	0f b6 00             	movzbl (%rax),%eax
    3ea4:	84 c0                	test   %al,%al
    3ea6:	0f 95 c1             	setne  %cl
    3ea9:	3c 03                	cmp    $0x3,%al
    3eab:	0f 9e c0             	setle  %al
    3eae:	21 c8                	and    %ecx,%eax
    3eb0:	84 c0                	test   %al,%al
    3eb2:	74 08                	je     3ebc <mm_init+0x324>
    3eb4:	48 89 d7             	mov    %rdx,%rdi
    3eb7:	e8 34 e3 ff ff       	call   21f0 <__asan_report_store4@plt>
    3ebc:	c7 83 f0 fe ff ff 01 	movl   $0x1,-0x110(%rbx)
    3ec3:	00 00 00 
    3ec6:	48 8d 83 c0 fe ff ff 	lea    -0x140(%rbx),%rax
    3ecd:	48 89 c2             	mov    %rax,%rdx
    3ed0:	48 c1 ea 03          	shr    $0x3,%rdx
    3ed4:	48 81 c2 00 80 ff 7f 	add    $0x7fff8000,%rdx
    3edb:	0f b6 12             	movzbl (%rdx),%edx
    3ede:	84 d2                	test   %dl,%dl
    3ee0:	74 08                	je     3eea <mm_init+0x352>
    3ee2:	48 89 c7             	mov    %rax,%rdi
    3ee5:	e8 76 e2 ff ff       	call   2160 <__asan_report_load8@plt>
    3eea:	48 8b 83 c0 fe ff ff 	mov    -0x140(%rbx),%rax
    3ef1:	48 8d 93 e0 fe ff ff 	lea    -0x120(%rbx),%rdx
    3ef8:	48 89 d6             	mov    %rdx,%rsi
    3efb:	48 89 c7             	mov    %rax,%rdi
    3efe:	e8 47 f4 ff ff       	call   334a <allocator_take_collection>
    3f03:	b8 00 00 00 00       	mov    $0x0,%eax
    3f08:	89 c2                	mov    %eax,%edx
    3f0a:	4d 39 e6             	cmp    %r12,%r14
    3f0d:	74 56                	je     3f65 <mm_init+0x3cd>
    3f0f:	49 c7 04 24 0e 36 e0 	movq   $0x45e0360e,(%r12)
    3f16:	45 
    3f17:	48 be f5 f5 f5 f5 f5 	movabs $0xf5f5f5f5f5f5f5f5,%rsi
    3f1e:	f5 f5 f5 
    3f21:	48 bf f5 f5 f5 f5 f5 	movabs $0xf5f5f5f5f5f5f5f5,%rdi
    3f28:	f5 f5 f5 
    3f2b:	49 89 b5 00 80 ff 7f 	mov    %rsi,0x7fff8000(%r13)
    3f32:	49 89 bd 08 80 ff 7f 	mov    %rdi,0x7fff8008(%r13)
    3f39:	49 89 b5 10 80 ff 7f 	mov    %rsi,0x7fff8010(%r13)
    3f40:	49 89 bd 18 80 ff 7f 	mov    %rdi,0x7fff8018(%r13)
    3f47:	48 b8 f5 f5 f5 f5 f5 	movabs $0xf5f5f5f5f5f5f5f5,%rax
    3f4e:	f5 f5 f5 
    3f51:	49 89 85 20 80 ff 7f 	mov    %rax,0x7fff8020(%r13)
    3f58:	49 8b 84 24 f8 01 00 	mov    0x1f8(%r12),%rax
    3f5f:	00 
    3f60:	c6 00 00             	movb   $0x0,(%rax)
    3f63:	eb 16                	jmp    3f7b <mm_init+0x3e3>
    3f65:	49 c7 85 00 80 ff 7f 	movq   $0x0,0x7fff8000(%r13)
    3f6c:	00 00 00 00 
    3f70:	49 c7 85 20 80 ff 7f 	movq   $0x0,0x7fff8020(%r13)
    3f77:	00 00 00 00 
    3f7b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    3f7f:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    3f86:	00 00 
    3f88:	74 05                	je     3f8f <mm_init+0x3f7>
    3f8a:	e8 51 e2 ff ff       	call   21e0 <__stack_chk_fail@plt>
    3f8f:	89 d0                	mov    %edx,%eax
    3f91:	48 81 c4 60 01 00 00 	add    $0x160,%rsp
    3f98:	5b                   	pop    %rbx
    3f99:	41 5c                	pop    %r12
    3f9b:	41 5d                	pop    %r13
    3f9d:	41 5e                	pop    %r14
    3f9f:	5d                   	pop    %rbp
    3fa0:	c3                   	ret    

0000000000003fa1 <_sub_D_00099_0>:
    3fa1:	f3 0f 1e fa          	endbr64 
    3fa5:	55                   	push   %rbp
    3fa6:	48 89 e5             	mov    %rsp,%rbp
    3fa9:	be 0b 00 00 00       	mov    $0xb,%esi
    3fae:	48 8d 05 eb 30 00 00 	lea    0x30eb(%rip),%rax        # 70a0 <__dso_handle+0x98>
    3fb5:	48 89 c7             	mov    %rax,%rdi
    3fb8:	e8 63 e2 ff ff       	call   2220 <__asan_unregister_globals@plt>
    3fbd:	5d                   	pop    %rbp
    3fbe:	c3                   	ret    

0000000000003fbf <_sub_I_00099_1>:
    3fbf:	f3 0f 1e fa          	endbr64 
    3fc3:	55                   	push   %rbp
    3fc4:	48 89 e5             	mov    %rsp,%rbp
    3fc7:	e8 84 e1 ff ff       	call   2150 <__asan_init@plt>
    3fcc:	e8 7f e2 ff ff       	call   2250 <__asan_version_mismatch_check_v8@plt>
    3fd1:	be 0b 00 00 00       	mov    $0xb,%esi
    3fd6:	48 8d 05 c3 30 00 00 	lea    0x30c3(%rip),%rax        # 70a0 <__dso_handle+0x98>
    3fdd:	48 89 c7             	mov    %rax,%rdi
    3fe0:	e8 4b e2 ff ff       	call   2230 <__asan_register_globals@plt>
    3fe5:	5d                   	pop    %rbp
    3fe6:	c3                   	ret    

0000000000003fe7 <main>:
    3fe7:	f3 0f 1e fa          	endbr64 
    3feb:	55                   	push   %rbp
    3fec:	48 89 e5             	mov    %rsp,%rbp
    3fef:	48 83 ec 10          	sub    $0x10,%rsp
    3ff3:	89 7d fc             	mov    %edi,-0x4(%rbp)
    3ff6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    3ffa:	b8 00 00 00 00       	mov    $0x0,%eax
    3fff:	e8 94 fb ff ff       	call   3b98 <mm_init>
    4004:	b8 01 00 00 00       	mov    $0x1,%eax
    4009:	c9                   	leave  
    400a:	c3                   	ret    

000000000000400b <_sub_I_00099_0>:
    400b:	f3 0f 1e fa          	endbr64 
    400f:	55                   	push   %rbp
    4010:	48 89 e5             	mov    %rsp,%rbp
    4013:	e8 38 e1 ff ff       	call   2150 <__asan_init@plt>
    4018:	e8 33 e2 ff ff       	call   2250 <__asan_version_mismatch_check_v8@plt>
    401d:	5d                   	pop    %rbp
    401e:	c3                   	ret    

Disassembly of section .fini:

0000000000004020 <_fini>:
    4020:	f3 0f 1e fa          	endbr64 
    4024:	48 83 ec 08          	sub    $0x8,%rsp
    4028:	48 83 c4 08          	add    $0x8,%rsp
    402c:	c3                   	ret    
