No.:   Addr:    Value:  Intr  Operand  (Dec Format) #Label_id #Meaning
=======================================================================
  1: 00000000: 0000080e: LL   0x000008 (D   8) # label18  # ra = uint(sp[0x8=8])
  2: 00000004: 00001026: LBL  0x000010 (D  16)           # rb = uint(sp[0x10=16])
  3: 00000008: 0000009a: BOUT 0x000000 (D   0)           # write(ra, &rb, 1)
  4: 0000000c: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
  5: 00000010: 0000080e: LL   0x000008 (D   8) # label26  # ra = uint(sp[0x8=8])
  6: 00000014: 000000a4: IVEC 0x000000 (D   0)           # intr vec addr = ra

  7: 00000018: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
  8: 0000001c: 0000080e: LL   0x000008 (D   8) # label25  # ra = uint(sp[0x8=8])
  9: 00000020: 000000a7: TIME 0x000000 (D   0)           # timer's timeout =ra
 10: 00000024: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 11: 00000028: 0000080e: LL   0x000008 (D   8) # label8  # ra = uint(sp[0x8=8])
 12: 0000002c: 00000000: HALT 0x000000 (D   0)           # System Halt
 13: 00000030: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 14: 00000034: fffff801: ENT  0xfffff8 (D  -8) # label20  # sp += 0xfffff8=-8
 15: 00000038: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
 16: 0000003c: 00000440: SL   0x000004 (D   4)           # uint(sp[0x4=4]) = ra
 17: 00000040: 00002c03: JMP  0x00002c (D  44)           # Jmp label1 0x6c=pc+44
 18: 00000044: 0000180e: LL   0x000018 (D  24) # label3  # ra = uint(sp[0x18=24])
 19: 00000048: 00000455: ADDL 0x000004 (D   4)           # ra = ra + 4
 20: 0000004c: 0000001f: LXC  0x000000 (D   0)           # ra = char(ra[0x0=0])
 21: 00000050: 0000009d: PSHA 0x000000 (D   0)           # push ra
 22: 00000054: 0000180e: LL   0x000018 (D  24)           # ra = uint(sp[0x18=24])
 23: 00000058: 0000009d: PSHA 0x000000 (D   0)           # push ra
 24: 0000005c: ffffa005: JSR  0xffffa0 (D -96)           # Call label2 0xfffffc=pc+-96
 25: 00000060: 00001001: ENT  0x000010 (D  16)           # sp += 0x10=16
 26: 00000064: 0000040e: LL   0x000004 (D   4)           # ra = uint(sp[0x4=4])
 27: 00000068: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
 28: 0000006c: 00000440: SL   0x000004 (D   4)           # uint(sp[0x4=4]) = ra
 29: 00000070: 0000040e: LL   0x000004 (D   4) # label1  # ra = uint(sp[0x4=4])
 30: 00000074: 00002026: LBL  0x000020 (D  32)           # rb = uint(sp[0x20=32])
 31: 00000078: ffffc88c: BLT  0xffffc8 (D -56)           # Cond goto label3
 32: 0000007c: 0000040e: LL   0x000004 (D   4)           # ra = uint(sp[0x4=4])
 33: 00000080: 00000802: LEV  0x000008 (D   8)           # pc=*sp, sp += 8 + 8 (return) 
 34: 00000084: 00000802: LEV  0x000008 (D   8)           # pc=*sp, sp += 8 + 8 (return) 
 35: 00000088: 0000080e: LL   0x000008 (D   8) # label7  # ra = uint(sp[0x8=8])
 36: 0000008c: 00001026: LBL  0x000010 (D  16)           # rb = uint(sp[0x10=16])
 37: 00000090: 000018ac: LCL  0x000018 (D  24)           # rc = *(uint *)(sp + imme)
 38: 00000094: 000005a9: TRAP 0x000005 (D   5)           #trap = FSYS for syscall
 39: 00000098: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 40: 0000009c: 00001803: JMP  0x000018 (D  24)           # Jmp label4 0xb4=pc+24
 41: 000000a0: 0000019e: PSHI 0x000001 (D   1) # label6  # push 0x1=1
 42: 000000a4: 00024008: LEAG 0x000240 (D 576)           # ra = pc+576
 43: 000000a8: 0000009d: PSHA 0x000000 (D   0)           # push ra
 44: 000000ac: 0000019e: PSHI 0x000001 (D   1)           # push 0x1=1
 45: 000000b0: ffffd405: JSR  0xffffd4 (D -44)           # Call label5 0x1000084=pc+-44
 46: 000000b4: 00001801: ENT  0x000018 (D  24)           # sp += 0x18=24
 47: 000000b8: 000ab815: LG   0x000ab8 (D2744) # label4  # ra = uint(gaddr[0xb70=2928=pc+2744])
 48: 000000bc: 00000a3b: LBI  0x00000a (D  10)           # rb = uint(0xa=10)
 49: 000000c0: ffffdc8c: BLT  0xffffdc (D -36)           # Cond goto label6
 50: 000000c4: 00000b9e: PSHI 0x00000b (D  11)           # push 0xb=11
 51: 000000c8: 00021e08: LEAG 0x00021e (D 542)           # ra = pc+542
 52: 000000cc: 0000009d: PSHA 0x000000 (D   0)           # push ra
 53: 000000d0: 0000019e: PSHI 0x000001 (D   1)           # push 0x1=1
 54: 000000d4: ffffb005: JSR  0xffffb0 (D -80)           # Call label7 0x1000084=pc+-80
 55: 000000d8: 00001801: ENT  0x000018 (D  24)           # sp += 0x18=24
 56: 000000dc: 0000009e: PSHI 0x000000 (D   0)           # push 0x0=0
 57: 000000e0: ffff4405: JSR  0xffff44 (D-188)           # Call label8 0x1000024=pc+-188
 58: 000000e4: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
 59: 000000e8: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 60: 000000ec: 0000280e: LL   0x000028 (D  40) # label24  # ra = uint(sp[0x28=40])
 61: 000000f0: 0000a803: JMP  0x0000a8 (D 168)           # Jmp label9 0x198=pc+168
 62: 000000f4: 0000300e: LL   0x000030 (D  48)           # ra = uint(sp[0x30=48])
 63: 000000f8: fffffc1c: LX   0xfffffc (D  -4)           # ra = uint(ra[0xfffffc=16777212])
 64: 000000fc: 00000878: SRUI 0x000008 (D   8)           # ra = uint(ra) >> rb #  = ra
 65: 00000100: 00004803: JMP  0x000048 (D  72)           # Jmp label10 0x148=pc+72
 66: 00000104: 0000100e: LL   0x000010 (D  16)           # ra = uint(sp[0x10=16])
 67: 00000108: 0000009d: PSHA 0x000000 (D   0)           # push ra
 68: 0000010c: 0000200e: LL   0x000020 (D  32)           # ra = uint(sp[0x20=32])
 69: 00000110: 0000009d: PSHA 0x000000 (D   0)           # push ra
 70: 00000114: 0000300e: LL   0x000030 (D  48)           # ra = uint(sp[0x30=48])
 71: 00000118: 0000009d: PSHA 0x000000 (D   0)           # push ra
 72: 0000011c: ffff1405: JSR  0xffff14 (D-236)           # Call label11 0x1000030=pc+-236
 73: 00000120: 00001801: ENT  0x000018 (D  24)           # sp += 0x18=24
 74: 00000124: 00002040: SL   0x000020 (D  32)           # uint(sp[0x20=32]) = ra
 75: 00000128: 00002c03: JMP  0x00002c (D  44)           # Jmp label12 0x154=pc+44
 76: 0000012c: 0000179e: PSHI 0x000017 (D  23) # label15  # push 0x17=23
 77: 00000130: 0001c208: LEAG 0x0001c2 (D 450)           # ra = pc+450
 78: 00000134: 0000009d: PSHA 0x000000 (D   0)           # push ra
 79: 00000138: 0000019e: PSHI 0x000001 (D   1)           # push 0x1=1
 80: 0000013c: fffef405: JSR  0xfffef4 (D-268)           # Call label13 0x1000030=pc+-268
 81: 00000140: 00001801: ENT  0x000018 (D  24)           # sp += 0x18=24
 82: 00000144: 00000000: HALT 0x000000 (D   0)           # System Halt
 83: 00000148: 00000c03: JMP  0x00000c (D  12)           # Jmp label14 0x154=pc+12
 84: 0000014c: 0000063b: LBI  0x000006 (D   6) # label10  # rb = uint(0x6=6)
 85: 00000150: ffffd890: BGEU 0xffffd8 (D -40)           # Cond goto label15
 86: 00000154: 0001b804: JMPI 0x0001b8 (D 440)           # Jmp label16 0x30c=pc+440
 87: 00000158: 00004c03: JMP  0x00004c (D  76) # label14  # Jmp label17 0x1a4=pc+76
 88: 0000015c: 0000789e: PSHI 0x000078 (D 120)           # push 0x78=120
 89: 00000160: 0000019e: PSHI 0x000001 (D   1)           # push 0x1=1
 90: 00000164: fffe9805: JSR  0xfffe98 (D-360)           # Call label18 0xfffffc=pc+-360
 91: 00000168: 00001001: ENT  0x000010 (D  16)           # sp += 0x10=16
 92: 0000016c: 000a0415: LG   0x000a04 (D2564)           # ra = uint(gaddr[0xb70=2928=pc+2564])
 93: 00000170: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
 94: 00000174: 0009fc45: SG   0x0009fc (D2556)           # uint(gaddr[0xb70=2928=pc+2556]) = ra
 95: 00000178: 00002c03: JMP  0x00002c (D  44)           # Jmp label19 0x1a4=pc+44
 96: 0000017c: 0000199e: PSHI 0x000019 (D  25) # label22  # push 0x19=25
 97: 00000180: 0001a408: LEAG 0x0001a4 (D 420)           # ra = pc+420
 98: 00000184: 0000009d: PSHA 0x000000 (D   0)           # push ra
 99: 00000188: 0000019e: PSHI 0x000001 (D   1)           # push 0x1=1
100: 0000018c: fffea405: JSR  0xfffea4 (D-348)           # Call label20 0x1000030=pc+-348
101: 00000190: 00001801: ENT  0x000018 (D  24)           # sp += 0x18=24
102: 00000194: 00000000: HALT 0x000000 (D   0)           # System Halt
103: 00000198: 00000c03: JMP  0x00000c (D  12)           # Jmp label21 0x1a4=pc+12
104: 0000019c: 0000163b: LBI  0x000016 (D  22) # label9  # rb = uint(0x16=22)
105: 000001a0: ffffd890: BGEU 0xffffd8 (D -40)           # Cond goto label22
106: 000001a4: 00019c04: JMPI 0x00019c (D 412)           # Jmp label23 0x340=pc+412
107: 000001a8: 00000002: LEV  0x000000 (D   0) # label21  # pc=*sp, sp += 0 + 8 (return) 
108: 000001ac: 0000009d: PSHA 0x000000 (D   0)           # push ra
109: 000001b0: 000000a0: PSHB 0x000000 (D   0)           # push rb
110: 000001b4: 000000ae: PSHC 0x000000 (D   0)           # push rc
111: 000001b8: 000000aa: LUSP 0x000000 (D   0)           # ra= user_sp 
112: 000001bc: 0000009d: PSHA 0x000000 (D   0)           # push ra
113: 000001c0: ffff2805: JSR  0xffff28 (D-216)           # Call label24 0x10000e8=pc+-216
114: 000001c4: 000000a3: POPA 0x000000 (D   0)           # pop ra
115: 000001c8: 000000ab: SUSP 0x000000 (D   0)           # user_sp=ra 
116: 000001cc: 000000af: POPC 0x000000 (D   0)           # pop rc
117: 000001d0: 000000a1: POPB 0x000000 (D   0)           # pop rb
118: 000001d4: 000000a3: POPA 0x000000 (D   0)           # pop ra
119: 000001d8: 00000098: RTI  0x000000 (D   0)           # POP fault code|pc|sp
120: 000001dc: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
121: 000001e0: 000000a3: POPA 0x000000 (D   0)           # pop ra
122: 000001e4: 000000ab: SUSP 0x000000 (D   0)           # user_sp=ra 
123: 000001e8: 000000af: POPC 0x000000 (D   0)           # pop rc
124: 000001ec: 000000a1: POPB 0x000000 (D   0)           # pop rb
125: 000001f0: 000000a3: POPA 0x000000 (D   0)           # pop ra
126: 000001f4: 00000098: RTI  0x000000 (D   0)           # POP fault code|pc|sp
127: 000001f8: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
128: 000001fc: fffff801: ENT  0xfffff8 (D  -8) # <=ENTRY           # sp += 0xfffff8=-8
129: 00000200: 0013889e: PSHI 0x001388 (D5000)           # push 0x1388=5000
130: 00000204: fffe1405: JSR  0xfffe14 (D-492)           # Call label25 0x1000018=pc+-492
131: 00000208: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
132: 0000020c: ffff9c08: LEAG 0xffff9c (D-100)           # ra = pc+16777116
133: 00000210: 0000009d: PSHA 0x000000 (D   0)           # push ra
134: 00000214: fffdf805: JSR  0xfffdf8 (D-520)           # Call label26 0x100000c=pc+-520
135: 00000218: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
136: 0000021c: 00095008: LEAG 0x000950 (D2384)           # ra = pc+2384
137: 00000220: 00094c45: SG   0x00094c (D2380)           # uint(gaddr[0xb6c=2924=pc+2380]) = ra
138: 00000224: 00094815: LG   0x000948 (D2376)           # ra = uint(gaddr[0xb6c=2924=pc+2376])
139: 00000228: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
140: 0000022c: 00094045: SG   0x000940 (D2368)           # uint(gaddr[0xb6c=2924=pc+2368]) = ra
141: 00000230: fffe6808: LEAG 0xfffe68 (D-408)           # ra = pc+16776808
142: 00000234: 0009382d: LBG  0x000938 (D2360)           # rb = uint(gaddr[0xb6c=2924=pc+2360])
143: 00000238: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
144: 0000023c: 00093015: LG   0x000930 (D2352)           # ra = uint(gaddr[0xb6c=2924=pc+2352])
145: 00000240: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
146: 00000244: 00092845: SG   0x000928 (D2344)           # uint(gaddr[0xb6c=2924=pc+2344]) = ra
147: 00000248: 00001023: LI   0x000010 (D  16)           # ra = uint(0x10=16)
148: 0000024c: 0009202d: LBG  0x000920 (D2336)           # rb = uint(gaddr[0xb6c=2924=pc+2336])
149: 00000250: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
150: 00000254: 00091815: LG   0x000918 (D2328)           # ra = uint(gaddr[0xb6c=2924=pc+2328])
151: 00000258: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
152: 0000025c: 00091045: SG   0x000910 (D2320)           # uint(gaddr[0xb6c=2924=pc+2320]) = ra
153: 00000260: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
154: 00000264: 0009082d: LBG  0x000908 (D2312)           # rb = uint(gaddr[0xb6c=2924=pc+2312])
155: 00000268: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
156: 0000026c: 00090015: LG   0x000900 (D2304)           # ra = uint(gaddr[0xb6c=2924=pc+2304])
157: 00000270: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
158: 00000274: 0008f845: SG   0x0008f8 (D2296)           # uint(gaddr[0xb6c=2924=pc+2296]) = ra
159: 00000278: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
160: 0000027c: 0008f02d: LBG  0x0008f0 (D2288)           # rb = uint(gaddr[0xb6c=2924=pc+2288])
161: 00000280: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
162: 00000284: 0008e815: LG   0x0008e8 (D2280)           # ra = uint(gaddr[0xb6c=2924=pc+2280])
163: 00000288: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
164: 0000028c: 0008e045: SG   0x0008e0 (D2272)           # uint(gaddr[0xb6c=2924=pc+2272]) = ra
165: 00000290: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
166: 00000294: 0008d82d: LBG  0x0008d8 (D2264)           # rb = uint(gaddr[0xb6c=2924=pc+2264])
167: 00000298: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
168: 0000029c: 0008d015: LG   0x0008d0 (D2256)           # ra = uint(gaddr[0xb6c=2924=pc+2256])
169: 000002a0: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
170: 000002a4: 0008c845: SG   0x0008c8 (D2248)           # uint(gaddr[0xb6c=2924=pc+2248]) = ra
171: 000002a8: 0004dc08: LEAG 0x0004dc (D1244)           # ra = pc+1244
172: 000002ac: 0008c02d: LBG  0x0008c0 (D2240)           # rb = uint(gaddr[0xb6c=2924=pc+2240])
173: 000002b0: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
174: 000002b4: 0008b815: LG   0x0008b8 (D2232)           # ra = uint(gaddr[0xb6c=2924=pc+2232])
175: 000002b8: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
176: 000002bc: 0008b045: SG   0x0008b0 (D2224)           # uint(gaddr[0xb6c=2924=pc+2224]) = ra
177: 000002c0: ffff1c08: LEAG 0xffff1c (D-228)           # ra = pc+16776988
178: 000002c4: 0008a82d: LBG  0x0008a8 (D2216)           # rb = uint(gaddr[0xb6c=2924=pc+2216])
179: 000002c8: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
180: 000002cc: 0008a015: LG   0x0008a0 (D2208)           # ra = uint(gaddr[0xb6c=2924=pc+2208])
181: 000002d0: 00000440: SL   0x000004 (D   4)           # uint(sp[0x4=4]) = ra
182: 000002d4: 0000040e: LL   0x000004 (D   4)           # ra = uint(sp[0x4=4])
183: 000002d8: 0000009c: SSP  0x000000 (D   0)           # kenel_sp=ra
184: 000002dc: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
185: 000002e0: 00000802: LEV  0x000008 (D   8)           # pc=*sp, sp += 8 + 8 (return) 
186: 000002e4: 00000000: HALT 0x000000 (D   0)           # System Halt
=======================================================================
Data Segment
Address     Hex									 | Char
0x000002e8	5f 00 74 61	73 6b 30 20	65 78 69 74	0a 00 70 61	 | _.task0 exit..pa
0x000002f8	6e 69 63 21	20 75 6e 6b	6e 6f 77 6e	20 73 79 73	 | nic! unknown sys
0x00000308	63 61 6c 6c	0a 00 00 00	d4 ff ff ffffffff	d4 ff ff ffffffff	 | call............
0x00000318	d4 ff ff ffffffff	d4 ff ff ffffffff	d4 ff ff ffffffff	ac ff ff ffffffff	 | ................
0x00000328	70 61 6e 69	63 21 20 75	6e 6b 6e 6f	77 6e 20 69	 | panic! unknown i
0x00000338	6e 74 65 72	72 75 70 74	0a 00 00 00	d4 ff ff ffffffff	 | nterrupt........
0x00000348	b4 ff ff ffffffff	d4 ff ff ffffffff	d4 ff ff ffffffff	d4 ff ff ffffffff	 | ................
0x00000358	d4 ff ff ffffffff	d4 ff ff ffffffff	d4 ff ff ffffffff	d4 ff ff ffffffff	 | ................
0x00000368	d4 ff ff ffffffff	d4 ff ff ffffffff	d4 ff ff ffffffff	d4 ff ff ffffffff	 | ................
0x00000378	d4 ff ff ffffffff	d4 ff ff ffffffff	d4 ff ff ffffffff	d4 ff ff ffffffff	 | ................
0x00000388	b4 ff ff ffffffff	d4 ff ff ffffffff	d4 ff ff ffffffff	d4 ff ff ffffffff	 | ................
0x00000398	4c ff ff ffffffff	00 00 00 00	                   	                   	 | L.......        
