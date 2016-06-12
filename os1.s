No.:   Addr:    Value:  Intr  Operand  (Dec Format) #Label_id #Meaning
=======================================================================
  1: 00000000: 0000080e: LL   0x000008 (D   8) # label2  # ra = uint(sp[0x8=8])
  2: 00000004: 00001026: LBL  0x000010 (D  16)           # rb = uint(sp[0x10=16])
  3: 00000008: 0000009a: BOUT 0x000000 (D   0)           # write(ra, &rb, 1)
  4: 0000000c: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
  5: 00000010: 0000080e: LL   0x000008 (D   8) # label20  # ra = uint(sp[0x8=8])
  6: 00000014: 000000a4: IVEC 0x000000 (D   0)           # intr vec addr = ra

  7: 00000018: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
  8: 0000001c: 0000080e: LL   0x000008 (D   8) # label19  # ra = uint(sp[0x8=8])
  9: 00000020: 000000a7: TIME 0x000000 (D   0)           # timer's timeout =ra
 10: 00000024: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 11: 00000028: 0000080e: LL   0x000008 (D   8) # label13  # ra = uint(sp[0x8=8])
 12: 0000002c: 00000000: HALT 0x000000 (D   0)           # System Halt
 13: 00000030: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 14: 00000034: 00002403: JMP  0x000024 (D  36) # label12  # Jmp label1 0x58=pc+36
 15: 00000038: 0000100e: LL   0x000010 (D  16) # label3  # ra = uint(sp[0x10=16])
 16: 0000003c: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
 17: 00000040: 00001040: SL   0x000010 (D  16)           # uint(sp[0x10=16]) = ra
 18: 00000044: ffffff1f: LXC  0xffffff (D  -1)           # ra = char(ra[0xffffff=16777215])
 19: 00000048: 0000009d: PSHA 0x000000 (D   0)           # push ra
 20: 0000004c: 0000100e: LL   0x000010 (D  16)           # ra = uint(sp[0x10=16])
 21: 00000050: 0000009d: PSHA 0x000000 (D   0)           # push ra
 22: 00000054: ffffa805: JSR  0xffffa8 (D -88)           # Call label2 0xfffffc=pc+-88
 23: 00000058: 00001001: ENT  0x000010 (D  16)           # sp += 0x10=16
 24: 0000005c: 0000180e: LL   0x000018 (D  24) # label1  # ra = uint(sp[0x18=24])
 25: 00000060: 00000157: SUBI 0x000001 (D   1)           # ra = ra - rb
 26: 00000064: 00001840: SL   0x000018 (D  24)           # uint(sp[0x18=24]) = ra
 27: 00000068: 00000154: ADDI 0x000001 (D   1)           # ra = ra + rb
 28: 0000006c: ffffc886: BNZ  0xffffc8 (D -56)           # Cond goto label3
 29: 00000070: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 30: 00000074: 00001803: JMP  0x000018 (D  24) # label21  # Jmp label4 0x8c=pc+24
 31: 00000078: 0000019e: PSHI 0x000001 (D   1) # label6  # push 0x1=1
 32: 0000007c: 00020808: LEAG 0x000208 (D 520)           # ra = pc+520
 33: 00000080: 0000009d: PSHA 0x000000 (D   0)           # push ra
 34: 00000084: 0000019e: PSHI 0x000001 (D   1)           # push 0x1=1
 35: 00000088: ffffa805: JSR  0xffffa8 (D -88)           # Call label5 0x1000030=pc+-88
 36: 0000008c: 00001801: ENT  0x000018 (D  24)           # sp += 0x18=24
 37: 00000090: 0002e415: LG   0x0002e4 (D 740) # label4  # ra = uint(gaddr[0x374=884=pc+740])
 38: 00000094: 00000a3b: LBI  0x00000a (D  10)           # rb = uint(0xa=10)
 39: 00000098: ffffdc8c: BLT  0xffffdc (D -36)           # Cond goto label6
 40: 0000009c: 00000b9e: PSHI 0x00000b (D  11)           # push 0xb=11
 41: 000000a0: 0001e608: LEAG 0x0001e6 (D 486)           # ra = pc+486
 42: 000000a4: 0000009d: PSHA 0x000000 (D   0)           # push ra
 43: 000000a8: 0000019e: PSHI 0x000001 (D   1)           # push 0x1=1
 44: 000000ac: ffff8405: JSR  0xffff84 (D-124)           # Call label7 0x1000030=pc+-124
 45: 000000b0: 00001801: ENT  0x000018 (D  24)           # sp += 0x18=24
 46: 000000b4: 0000009e: PSHI 0x000000 (D   0)           # push 0x0=0
 47: 000000b8: ffff6c05: JSR  0xffff6c (D-148)           # Call label8 0x1000024=pc+-148
 48: 000000bc: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
 49: 000000c0: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 50: 000000c4: 00001803: JMP  0x000018 (D  24)           # Jmp label9 0xdc=pc+24
 51: 000000c8: 0000019e: PSHI 0x000001 (D   1) # label11  # push 0x1=1
 52: 000000cc: 0001c608: LEAG 0x0001c6 (D 454)           # ra = pc+454
 53: 000000d0: 0000009d: PSHA 0x000000 (D   0)           # push ra
 54: 000000d4: 0000019e: PSHI 0x000001 (D   1)           # push 0x1=1
 55: 000000d8: ffff5805: JSR  0xffff58 (D-168)           # Call label10 0x1000030=pc+-168
 56: 000000dc: 00001801: ENT  0x000018 (D  24)           # sp += 0x18=24
 57: 000000e0: 00029415: LG   0x000294 (D 660) # label9  # ra = uint(gaddr[0x374=884=pc+660])
 58: 000000e4: 00000a3b: LBI  0x00000a (D  10)           # rb = uint(0xa=10)
 59: 000000e8: ffffdc8c: BLT  0xffffdc (D -36)           # Cond goto label11
 60: 000000ec: 00000b9e: PSHI 0x00000b (D  11)           # push 0xb=11
 61: 000000f0: 0001a408: LEAG 0x0001a4 (D 420)           # ra = pc+420
 62: 000000f4: 0000009d: PSHA 0x000000 (D   0)           # push ra
 63: 000000f8: 0000019e: PSHI 0x000001 (D   1)           # push 0x1=1
 64: 000000fc: ffff3405: JSR  0xffff34 (D-204)           # Call label12 0x1000030=pc+-204
 65: 00000100: 00001801: ENT  0x000018 (D  24)           # sp += 0x18=24
 66: 00000104: 0000009e: PSHI 0x000000 (D   0)           # push 0x0=0
 67: 00000108: ffff1c05: JSR  0xffff1c (D-228)           # Call label13 0x1000024=pc+-228
 68: 0000010c: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
 69: 00000110: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 70: 00000114: 00000007: LEA  0x000000 (D   0) # label17  # ra = sp+0
 71: 00000118: 00000826: LBL  0x000008 (D   8)           # rb = uint(sp[0x8=8])
 72: 0000011c: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
 73: 00000120: 0000100e: LL   0x000010 (D  16)           # ra = uint(sp[0x10=16])
 74: 00000124: 0000009c: SSP  0x000000 (D   0)           # kenel_sp=ra
 75: 00000128: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 76: 0000012c: 00024815: LG   0x000248 (D 584) # label18  # ra = uint(gaddr[0x374=884=pc+584])
 77: 00000130: 00000154: ADDI 0x000001 (D   1)           # ra = ra + rb
 78: 00000134: 00024045: SG   0x000240 (D 576)           # uint(gaddr[0x374=884=pc+576]) = ra
 79: 00000138: 00000169: ANDI 0x000001 (D   1)           # ra = ra & rb
 80: 0000013c: 00001c84: BZ   0x00001c (D  28)           # Cond goto label14
 81: 00000140: 00023015: LG   0x000230 (D 560)           # ra = uint(gaddr[0x370=880=pc+560])
 82: 00000144: 0000009d: PSHA 0x000000 (D   0)           # push ra
 83: 00000148: 00022408: LEAG 0x000224 (D 548)           # ra = pc+548
 84: 0000014c: 0000009d: PSHA 0x000000 (D   0)           # push ra
 85: 00000150: ffffc005: JSR  0xffffc0 (D -64)           # Call label15 0x1000110=pc+-64
 86: 00000154: 00001001: ENT  0x000010 (D  16)           # sp += 0x10=16
 87: 00000158: 00001803: JMP  0x000018 (D  24)           # Jmp label16 0x170=pc+24
 88: 0000015c: 00021015: LG   0x000210 (D 528) # label14  # ra = uint(gaddr[0x36c=876=pc+528])
 89: 00000160: 0000009d: PSHA 0x000000 (D   0)           # push ra
 90: 00000164: 00020c08: LEAG 0x00020c (D 524)           # ra = pc+524
 91: 00000168: 0000009d: PSHA 0x000000 (D   0)           # push ra
 92: 0000016c: ffffa405: JSR  0xffffa4 (D -92)           # Call label17 0x1000110=pc+-92
 93: 00000170: 00001001: ENT  0x000010 (D  16)           # sp += 0x10=16
 94: 00000174: 00000002: LEV  0x000000 (D   0) # label16  # pc=*sp, sp += 0 + 8 (return) 
 95: 00000178: 0000009d: PSHA 0x000000 (D   0)           # push ra
 96: 0000017c: 000000a0: PSHB 0x000000 (D   0)           # push rb
 97: 00000180: 000000ae: PSHC 0x000000 (D   0)           # push rc
 98: 00000184: ffffa405: JSR  0xffffa4 (D -92)           # Call label18 0x1000128=pc+-92
 99: 00000188: 000000af: POPC 0x000000 (D   0)           # pop rc
100: 0000018c: 000000a1: POPB 0x000000 (D   0)           # pop rb
101: 00000190: 000000a3: POPA 0x000000 (D   0)           # pop ra
102: 00000194: 00000098: RTI  0x000000 (D   0)           # POP fault code|pc|sp
103: 00000198: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
104: 0000019c: 000000af: POPC 0x000000 (D   0)           # pop rc
105: 000001a0: 000000a1: POPB 0x000000 (D   0)           # pop rb
106: 000001a4: 000000a3: POPA 0x000000 (D   0)           # pop ra
107: 000001a8: 00000098: RTI  0x000000 (D   0)           # POP fault code|pc|sp
108: 000001ac: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
109: 000001b0: 00000023: LI   0x000000 (D   0) # <=ENTRY           # ra = uint(0x0=0)
110: 000001b4: 0001c045: SG   0x0001c0 (D 448)           # uint(gaddr[0x374=884=pc+448]) = ra
111: 000001b8: 0013889e: PSHI 0x001388 (D5000)           # push 0x1388=5000
112: 000001bc: fffe5c05: JSR  0xfffe5c (D-420)           # Call label19 0x1000018=pc+-420
113: 000001c0: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
114: 000001c4: ffffb008: LEAG 0xffffb0 (D -80)           # ra = pc+16777136
115: 000001c8: 0000009d: PSHA 0x000000 (D   0)           # push ra
116: 000001cc: fffe4005: JSR  0xfffe40 (D-448)           # Call label20 0x100000c=pc+-448
117: 000001d0: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
118: 000001d4: 0000d008: LEAG 0x0000d0 (D 208)           # ra = pc+208
119: 000001d8: 00019845: SG   0x000198 (D 408)           # uint(gaddr[0x370=880=pc+408]) = ra
120: 000001dc: 00019415: LG   0x000194 (D 404)           # ra = uint(gaddr[0x370=880=pc+404])
121: 000001e0: 0000c854: ADDI 0x0000c8 (D 200)           # ra = ra + rb
122: 000001e4: 00018c45: SG   0x00018c (D 396)           # uint(gaddr[0x370=880=pc+396]) = ra
123: 000001e8: 00018815: LG   0x000188 (D 392)           # ra = uint(gaddr[0x370=880=pc+392])
124: 000001ec: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
125: 000001f0: 00018045: SG   0x000180 (D 384)           # uint(gaddr[0x370=880=pc+384]) = ra
126: 000001f4: fffecc08: LEAG 0xfffecc (D-308)           # ra = pc+16776908
127: 000001f8: 0001782d: LBG  0x000178 (D 376)           # rb = uint(gaddr[0x370=880=pc+376])
128: 000001fc: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
129: 00000200: 00017015: LG   0x000170 (D 368)           # ra = uint(gaddr[0x370=880=pc+368])
130: 00000204: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
131: 00000208: 00016845: SG   0x000168 (D 360)           # uint(gaddr[0x370=880=pc+360]) = ra
132: 0000020c: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
133: 00000210: 0001602d: LBG  0x000160 (D 352)           # rb = uint(gaddr[0x370=880=pc+352])
134: 00000214: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
135: 00000218: 00015815: LG   0x000158 (D 344)           # ra = uint(gaddr[0x370=880=pc+344])
136: 0000021c: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
137: 00000220: 00015045: SG   0x000150 (D 336)           # uint(gaddr[0x370=880=pc+336]) = ra
138: 00000224: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
139: 00000228: 0001482d: LBG  0x000148 (D 328)           # rb = uint(gaddr[0x370=880=pc+328])
140: 0000022c: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
141: 00000230: 00014015: LG   0x000140 (D 320)           # ra = uint(gaddr[0x370=880=pc+320])
142: 00000234: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
143: 00000238: 00013845: SG   0x000138 (D 312)           # uint(gaddr[0x370=880=pc+312]) = ra
144: 0000023c: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
145: 00000240: 0001302d: LBG  0x000130 (D 304)           # rb = uint(gaddr[0x370=880=pc+304])
146: 00000244: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
147: 00000248: 00012815: LG   0x000128 (D 296)           # ra = uint(gaddr[0x370=880=pc+296])
148: 0000024c: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
149: 00000250: 00012045: SG   0x000120 (D 288)           # uint(gaddr[0x370=880=pc+288]) = ra
150: 00000254: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
151: 00000258: 0001182d: LBG  0x000118 (D 280)           # rb = uint(gaddr[0x370=880=pc+280])
152: 0000025c: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
153: 00000260: 00011015: LG   0x000110 (D 272)           # ra = uint(gaddr[0x370=880=pc+272])
154: 00000264: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
155: 00000268: 00010845: SG   0x000108 (D 264)           # uint(gaddr[0x370=880=pc+264]) = ra
156: 0000026c: ffff2c08: LEAG 0xffff2c (D-212)           # ra = pc+16777004
157: 00000270: 0001002d: LBG  0x000100 (D 256)           # rb = uint(gaddr[0x370=880=pc+256])
158: 00000274: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
159: 00000278: 00000097: STI  0x000000 (D   0)           # Enable Interrupt
160: 0000027c: fffdf405: JSR  0xfffdf4 (D-524)           # Call label21 0x1000070=pc+-524
161: 00000280: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
162: 00000284: 00000000: HALT 0x000000 (D   0)           # System Halt
=======================================================================
Data Segment
Address     Hex									 | Char
0x00000288	30 00 74 61	73 6b 30 20	65 78 69 74	0a 00 31 00	 | 0.task0 exit..1.
0x00000298	74 61 73 6b	31 20 65 78	69 74 0a 00	00 00 00 00	 | task1 exit......
