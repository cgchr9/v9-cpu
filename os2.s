No.:   Addr:    Value:  Intr  Operand  (Dec Format) #Label_id #Meaning
=======================================================================
  1: 00000000: 0000080e: LL   0x000008 (D   8) # label84  # ra = uint(sp[0x8=8])
  2: 00000004: 00000099: BIN  0x000000 (D   0)           # ra = kbchar, kbchar is the value from outside IO

  3: 00000008: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
  4: 0000000c: 0000080e: LL   0x000008 (D   8) # label2  # ra = uint(sp[0x8=8])
  5: 00000010: 00001026: LBL  0x000010 (D  16)           # rb = uint(sp[0x10=16])
  6: 00000014: 0000009a: BOUT 0x000000 (D   0)           # write(ra, &rb, 1)
  7: 00000018: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
  8: 0000001c: 0000080e: LL   0x000008 (D   8) # label99  # ra = uint(sp[0x8=8])
  9: 00000020: 000000a4: IVEC 0x000000 (D   0)           # intr vec addr = ra

 10: 00000024: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 11: 00000028: 000000a8: LVAD 0x000000 (D   0) # label78  # ra= bad virtual address
 12: 0000002c: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 13: 00000030: 0000080e: LL   0x000008 (D   8) # label101  # ra = uint(sp[0x8=8])
 14: 00000034: 000000a7: TIME 0x000000 (D   0)           # timer's timeout =ra
 15: 00000038: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 16: 0000003c: 0000080e: LL   0x000008 (D   8) # label115  # ra = uint(sp[0x8=8])
 17: 00000040: 000000a5: PDIR 0x000000 (D   0)           # Page_Directory_Addr=ra
 18: 00000044: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 19: 00000048: 0000080e: LL   0x000008 (D   8) # label98  # ra = uint(sp[0x8=8])
 20: 0000004c: 000000a6: SPAG 0x000000 (D   0)           # Paging=ra set/unset paging
 21: 00000050: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 22: 00000054: 0000080e: LL   0x000008 (D   8) # label119  # ra = uint(sp[0x8=8])
 23: 00000058: 00000000: HALT 0x000000 (D   0)           # System Halt
 24: 0000005c: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 25: 00000060: 0000080e: LL   0x000008 (D   8) # label54  # ra = uint(sp[0x8=8])
 26: 00000064: 00001026: LBL  0x000010 (D  16)           # rb = uint(sp[0x10=16])
 27: 00000068: 000018ac: LCL  0x000018 (D  24)           # rc = *(uint *)(sp + imme)
 28: 0000006c: 0000000a: MCPY 0x000000 (D   0)           # memcpy(char *ra, char *rb, len=rc)
 29: 00000070: 0000080e: LL   0x000008 (D   8)           # ra = uint(sp[0x8=8])
 30: 00000074: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 31: 00000078: 0000080e: LL   0x000008 (D   8) # label57  # ra = uint(sp[0x8=8])
 32: 0000007c: 0000102a: LBLB 0x000010 (D  16)           # rb = uchar(sp[0x10=16])
 33: 00000080: 000018ac: LCL  0x000018 (D  24)           # rc = *(uint *)(sp + imme)
 34: 00000084: 0000000d: MSET 0x000000 (D   0)           # memset(char *ra, char rb, len=rc)
 35: 00000088: 0000080e: LL   0x000008 (D   8)           # ra = uint(sp[0x8=8])
 36: 0000008c: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 37: 00000090: 0000080e: LL   0x000008 (D   8) # label4  # ra = uint(sp[0x8=8])
 38: 00000094: 0000102a: LBLB 0x000010 (D  16)           # rb = uchar(sp[0x10=16])
 39: 00000098: 000018ac: LCL  0x000018 (D  24)           # rc = *(uint *)(sp + imme)
 40: 0000009c: 0000000c: MCHR 0x000000 (D   0)           # memchr(char *ra, char rb, len=rc)
 41: 000000a0: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 42: 000000a4: 00002403: JMP  0x000024 (D  36) # label60  # Jmp label1 0xc8=pc+36
 43: 000000a8: 0000100e: LL   0x000010 (D  16) # label3  # ra = uint(sp[0x10=16])
 44: 000000ac: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
 45: 000000b0: 00001040: SL   0x000010 (D  16)           # uint(sp[0x10=16]) = ra
 46: 000000b4: ffffff1f: LXC  0xffffff (D  -1)           # ra = char(ra[0xffffff=16777215])
 47: 000000b8: 0000009d: PSHA 0x000000 (D   0)           # push ra
 48: 000000bc: 0000100e: LL   0x000010 (D  16)           # ra = uint(sp[0x10=16])
 49: 000000c0: 0000009d: PSHA 0x000000 (D   0)           # push ra
 50: 000000c4: ffff4405: JSR  0xffff44 (D-188)           # Call label2 0x1000008=pc+-188
 51: 000000c8: 00001001: ENT  0x000010 (D  16)           # sp += 0x10=16
 52: 000000cc: 0000180e: LL   0x000018 (D  24) # label1  # ra = uint(sp[0x18=24])
 53: 000000d0: 00000157: SUBI 0x000001 (D   1)           # ra = ra - rb
 54: 000000d4: 00001840: SL   0x000018 (D  24)           # uint(sp[0x18=24]) = ra
 55: 000000d8: 00000154: ADDI 0x000001 (D   1)           # ra = ra + rb
 56: 000000dc: ffffc886: BNZ  0xffffc8 (D -56)           # Cond goto label3
 57: 000000e0: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 58: 000000e4: ffffff9e: PSHI 0xffffff (D  -1) # label30  # push 0xffffff=16777215
 59: 000000e8: 0000009e: PSHI 0x000000 (D   0)           # push 0x0=0
 60: 000000ec: 0000180e: LL   0x000018 (D  24)           # ra = uint(sp[0x18=24])
 61: 000000f0: 0000009d: PSHA 0x000000 (D   0)           # push ra
 62: 000000f4: ffff9805: JSR  0xffff98 (D-104)           # Call label4 0x100008c=pc+-104
 63: 000000f8: 00001801: ENT  0x000018 (D  24)           # sp += 0x18=24
 64: 000000fc: 00000858: SUBL 0x000008 (D   8)           # ra = ra - 8
 65: 00000100: 0000015d: DIVI 0x000001 (D   1)           # ra = int(ra) / rb
 66: 00000104: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 67: 00000108: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 68: 0000010c: ffffc001: ENT  0xffffc0 (D -64) # label59  # sp += 0xffffc0=-64
 69: 00000110: 0000480e: LL   0x000048 (D  72)           # ra = uint(sp[0x48=72])
 70: 00000114: 00003c40: SL   0x00003c (D  60)           # uint(sp[0x3c=60]) = ra
 71: 00000118: 00061403: JMP  0x000614 (D1556)           # Jmp label5 0x72c=pc+1556
 72: 0000011c: 00003711: LLC  0x000037 (D  55) # label58  # ra = char(sp[0x37=55])
 73: 00000120: 0000253b: LBI  0x000025 (D  37)           # rb = uint(0x25=37)
 74: 00000124: 00002088: BE   0x000020 (D  32)           # Cond goto label6
 75: 00000128: 00003c0e: LL   0x00003c (D  60)           # ra = uint(sp[0x3c=60])
 76: 0000012c: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
 77: 00000130: 00003c40: SL   0x00003c (D  60)           # uint(sp[0x3c=60]) = ra
 78: 00000134: ffffff54: ADDI 0xffffff (D  -1)           # ra = ra + rb
 79: 00000138: 0000003e: LBA  0x000000 (D   0)           # rb=ra 
 80: 0000013c: 00003711: LLC  0x000037 (D  55)           # ra = char(sp[0x37=55])
 81: 00000140: 0000004c: SXB  0x000000 (D   0)           # uchar(ra[0x0=0]) = ra
 82: 00000144: 0005e803: JMP  0x0005e8 (D1512)           # Jmp label7 0x72c=pc+1512
 83: 00000148: 0000500e: LL   0x000050 (D  80) # label6  # ra = uint(sp[0x50=80])
 84: 0000014c: 0000001f: LXC  0x000000 (D   0)           # ra = char(ra[0x0=0])
 85: 00000150: 0000253b: LBI  0x000025 (D  37)           # rb = uint(0x25=37)
 86: 00000154: 0000308a: BNE  0x000030 (D  48)           # Cond goto label8
 87: 00000158: 00003c0e: LL   0x00003c (D  60)           # ra = uint(sp[0x3c=60])
 88: 0000015c: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
 89: 00000160: 00003c40: SL   0x00003c (D  60)           # uint(sp[0x3c=60]) = ra
 90: 00000164: ffffff54: ADDI 0xffffff (D  -1)           # ra = ra + rb
 91: 00000168: 0000009d: PSHA 0x000000 (D   0)           # push ra
 92: 0000016c: 0000580e: LL   0x000058 (D  88)           # ra = uint(sp[0x58=88])
 93: 00000170: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
 94: 00000174: 00005840: SL   0x000058 (D  88)           # uint(sp[0x58=88]) = ra
 95: 00000178: ffffff1f: LXC  0xffffff (D  -1)           # ra = char(ra[0xffffff=16777215])
 96: 0000017c: 000000a1: POPB 0x000000 (D   0)           # pop rb
 97: 00000180: 0000004c: SXB  0x000000 (D   0)           # uchar(ra[0x0=0]) = ra
 98: 00000184: 0005a803: JMP  0x0005a8 (D1448)           # Jmp label9 0x72c=pc+1448
 99: 00000188: 0000500e: LL   0x000050 (D  80) # label8  # ra = uint(sp[0x50=80])
100: 0000018c: 0000001f: LXC  0x000000 (D   0)           # ra = char(ra[0x0=0])
101: 00000190: 00002d3b: LBI  0x00002d (D  45)           # rb = uint(0x2d=45)
102: 00000194: 0000007a: EQ   0x000000 (D   0)           # ra = uint(ra) >> sp[0]
103: 00000198: 00000c40: SL   0x00000c (D  12)           # uint(sp[0xc=12]) = ra
104: 0000019c: 00000c84: BZ   0x00000c (D  12)           # Cond goto label10
105: 000001a0: 0000500e: LL   0x000050 (D  80)           # ra = uint(sp[0x50=80])
106: 000001a4: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
107: 000001a8: 00005040: SL   0x000050 (D  80)           # uint(sp[0x50=80]) = ra
108: 000001ac: 0000500e: LL   0x000050 (D  80) # label10  # ra = uint(sp[0x50=80])
109: 000001b0: 0000001f: LXC  0x000000 (D   0)           # ra = char(ra[0x0=0])
110: 000001b4: 0000303b: LBI  0x000030 (D  48)           # rb = uint(0x30=48)
111: 000001b8: 0000148a: BNE  0x000014 (D  20)           # Cond goto label11
112: 000001bc: 0000500e: LL   0x000050 (D  80)           # ra = uint(sp[0x50=80])
113: 000001c0: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
114: 000001c4: 00005040: SL   0x000050 (D  80)           # uint(sp[0x50=80]) = ra
115: 000001c8: ffffff1f: LXC  0xffffff (D  -1)           # ra = char(ra[0xffffff=16777215])
116: 000001cc: 00000403: JMP  0x000004 (D   4)           # Jmp label12 0x1d0=pc+4
117: 000001d0: 00002023: LI   0x000020 (D  32) # label11  # ra = uint(0x20=32)
118: 000001d4: 00003642: SLB  0x000036 (D  54) # label12  # uchar(sp[0x36=54]) = ra
119: 000001d8: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
120: 000001dc: 00000040: SL   0x000000 (D   0)           # uint(sp[0x0=0]) = ra
121: 000001e0: 00000440: SL   0x000004 (D   4)           # uint(sp[0x4=4]) = ra
122: 000001e4: 00002023: LI   0x000020 (D  32)           # ra = uint(0x20=32)
123: 000001e8: 00000840: SL   0x000008 (D   8)           # uint(sp[0x8=8]) = ra
124: 000001ec: 0000500e: LL   0x000050 (D  80)           # ra = uint(sp[0x50=80])
125: 000001f0: 0000001f: LXC  0x000000 (D   0)           # ra = char(ra[0x0=0])
126: 000001f4: 00002a3b: LBI  0x00002a (D  42)           # rb = uint(0x2a=42)
127: 000001f8: 0000248a: BNE  0x000024 (D  36)           # Cond goto label13
128: 000001fc: 0000580e: LL   0x000058 (D  88)           # ra = uint(sp[0x58=88])
129: 00000200: 00000854: ADDI 0x000008 (D   8)           # ra = ra + rb
130: 00000204: 00005840: SL   0x000058 (D  88)           # uint(sp[0x58=88]) = ra
131: 00000208: 0000001c: LX   0x000000 (D   0)           # ra = uint(ra[0x0=0])
132: 0000020c: 00000440: SL   0x000004 (D   4)           # uint(sp[0x4=4]) = ra
133: 00000210: 0000500e: LL   0x000050 (D  80)           # ra = uint(sp[0x50=80])
134: 00000214: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
135: 00000218: 00005040: SL   0x000050 (D  80)           # uint(sp[0x50=80]) = ra
136: 0000021c: 00005403: JMP  0x000054 (D  84)           # Jmp label14 0x270=pc+84
137: 00000220: 00002c03: JMP  0x00002c (D  44) # label13  # Jmp label15 0x24c=pc+44
138: 00000224: 0000500e: LL   0x000050 (D  80) # label17  # ra = uint(sp[0x50=80])
139: 00000228: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
140: 0000022c: 00005040: SL   0x000050 (D  80)           # uint(sp[0x50=80]) = ra
141: 00000230: ffffff1f: LXC  0xffffff (D  -1)           # ra = char(ra[0xffffff=16777215])
142: 00000234: 0000009d: PSHA 0x000000 (D   0)           # push ra
143: 00000238: 00000c0e: LL   0x00000c (D  12)           # ra = uint(sp[0xc=12])
144: 0000023c: 00000a5a: MULI 0x00000a (D  10)           # ra = int(ra) *  rb
145: 00000240: 000000a1: POPB 0x000000 (D   0)           # pop rb
146: 00000244: 00000053: ADD  0x000000 (D   0)           # ra = ra +
147: 00000248: ffffd054: ADDI 0xffffd0 (D -48)           # ra = ra + rb
148: 0000024c: 00000440: SL   0x000004 (D   4)           # uint(sp[0x4=4]) = ra
149: 00000250: 0000500e: LL   0x000050 (D  80) # label15  # ra = uint(sp[0x50=80])
150: 00000254: 0000001f: LXC  0x000000 (D   0)           # ra = char(ra[0x0=0])
151: 00000258: 0000303b: LBI  0x000030 (D  48)           # rb = uint(0x30=48)
152: 0000025c: 0000148c: BLT  0x000014 (D  20)           # Cond goto label16
153: 00000260: 0000500e: LL   0x000050 (D  80)           # ra = uint(sp[0x50=80])
154: 00000264: 0000001f: LXC  0x000000 (D   0)           # ra = char(ra[0x0=0])
155: 00000268: 0000003e: LBA  0x000000 (D   0)           # rb=ra 
156: 0000026c: 00003923: LI   0x000039 (D  57)           # ra = uint(0x39=57)
157: 00000270: ffffb08f: BGE  0xffffb0 (D -80)           # Cond goto label17
158: 00000274: 0000500e: LL   0x000050 (D  80) # label16  # ra = uint(sp[0x50=80])
159: 00000278: 0000001f: LXC  0x000000 (D   0)           # ra = char(ra[0x0=0])
160: 0000027c: 00002e3b: LBI  0x00002e (D  46)           # rb = uint(0x2e=46)
161: 00000280: 0000988a: BNE  0x000098 (D 152)           # Cond goto label18
162: 00000284: 0000500e: LL   0x000050 (D  80)           # ra = uint(sp[0x50=80])
163: 00000288: 00000154: ADDI 0x000001 (D   1)           # ra = ra + rb
164: 0000028c: 00005040: SL   0x000050 (D  80)           # uint(sp[0x50=80]) = ra
165: 00000290: 0000001f: LXC  0x000000 (D   0)           # ra = char(ra[0x0=0])
166: 00000294: 00002a3b: LBI  0x00002a (D  42)           # rb = uint(0x2a=42)
167: 00000298: 0000248a: BNE  0x000024 (D  36)           # Cond goto label19
168: 0000029c: 0000580e: LL   0x000058 (D  88)           # ra = uint(sp[0x58=88])
169: 000002a0: 00000854: ADDI 0x000008 (D   8)           # ra = ra + rb
170: 000002a4: 00005840: SL   0x000058 (D  88)           # uint(sp[0x58=88]) = ra
171: 000002a8: 0000001c: LX   0x000000 (D   0)           # ra = uint(ra[0x0=0])
172: 000002ac: 00000840: SL   0x000008 (D   8)           # uint(sp[0x8=8]) = ra
173: 000002b0: 0000500e: LL   0x000050 (D  80)           # ra = uint(sp[0x50=80])
174: 000002b4: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
175: 000002b8: 00005040: SL   0x000050 (D  80)           # uint(sp[0x50=80]) = ra
176: 000002bc: 00005c03: JMP  0x00005c (D  92)           # Jmp label20 0x318=pc+92
177: 000002c0: 00000023: LI   0x000000 (D   0) # label19  # ra = uint(0x0=0)
178: 000002c4: 00000840: SL   0x000008 (D   8)           # uint(sp[0x8=8]) = ra
179: 000002c8: 00002c03: JMP  0x00002c (D  44)           # Jmp label21 0x2f4=pc+44
180: 000002cc: 0000500e: LL   0x000050 (D  80) # label23  # ra = uint(sp[0x50=80])
181: 000002d0: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
182: 000002d4: 00005040: SL   0x000050 (D  80)           # uint(sp[0x50=80]) = ra
183: 000002d8: ffffff1f: LXC  0xffffff (D  -1)           # ra = char(ra[0xffffff=16777215])
184: 000002dc: 0000009d: PSHA 0x000000 (D   0)           # push ra
185: 000002e0: 0000100e: LL   0x000010 (D  16)           # ra = uint(sp[0x10=16])
186: 000002e4: 00000a5a: MULI 0x00000a (D  10)           # ra = int(ra) *  rb
187: 000002e8: 000000a1: POPB 0x000000 (D   0)           # pop rb
188: 000002ec: 00000053: ADD  0x000000 (D   0)           # ra = ra +
189: 000002f0: ffffd054: ADDI 0xffffd0 (D -48)           # ra = ra + rb
190: 000002f4: 00000840: SL   0x000008 (D   8)           # uint(sp[0x8=8]) = ra
191: 000002f8: 0000500e: LL   0x000050 (D  80) # label21  # ra = uint(sp[0x50=80])
192: 000002fc: 0000001f: LXC  0x000000 (D   0)           # ra = char(ra[0x0=0])
193: 00000300: 0000303b: LBI  0x000030 (D  48)           # rb = uint(0x30=48)
194: 00000304: 0000148c: BLT  0x000014 (D  20)           # Cond goto label22
195: 00000308: 0000500e: LL   0x000050 (D  80)           # ra = uint(sp[0x50=80])
196: 0000030c: 0000001f: LXC  0x000000 (D   0)           # ra = char(ra[0x0=0])
197: 00000310: 0000003e: LBA  0x000000 (D   0)           # rb=ra 
198: 00000314: 00003923: LI   0x000039 (D  57)           # ra = uint(0x39=57)
199: 00000318: ffffb08f: BGE  0xffffb0 (D -80)           # Cond goto label23
200: 0000031c: 0000500e: LL   0x000050 (D  80) # label22  # ra = uint(sp[0x50=80])
201: 00000320: 0000001f: LXC  0x000000 (D   0)           # ra = char(ra[0x0=0])
202: 00000324: 00006c3b: LBI  0x00006c (D 108)           # rb = uint(0x6c=108)
203: 00000328: 00000c8a: BNE  0x00000c (D  12)           # Cond goto label24
204: 0000032c: 0000500e: LL   0x000050 (D  80)           # ra = uint(sp[0x50=80])
205: 00000330: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
206: 00000334: 00005040: SL   0x000050 (D  80)           # uint(sp[0x50=80]) = ra
207: 00000338: 0000500e: LL   0x000050 (D  80) # label24  # ra = uint(sp[0x50=80])
208: 0000033c: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
209: 00000340: 00005040: SL   0x000050 (D  80)           # uint(sp[0x50=80]) = ra
210: 00000344: ffffff1f: LXC  0xffffff (D  -1)           # ra = char(ra[0xffffff=16777215])
211: 00000348: 00003742: SLB  0x000037 (D  55)           # uchar(sp[0x37=55]) = ra
212: 0000034c: 00001872: SHLI 0x000018 (D  24)           # ra = ra << rb #  = ra
213: 00000350: 00001875: SHRI 0x000018 (D  24)           # ra = int(ra) >> rb #  = ra
214: 00000354: 0002a803: JMP  0x0002a8 (D 680)           # Jmp label25 0x5fc=pc+680
215: 00000358: 00003c0e: LL   0x00003c (D  60)           # ra = uint(sp[0x3c=60])
216: 0000035c: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
217: 00000360: 00003c40: SL   0x00003c (D  60)           # uint(sp[0x3c=60]) = ra
218: 00000364: ffffff54: ADDI 0xffffff (D  -1)           # ra = ra + rb
219: 00000368: 0000003e: LBA  0x000000 (D   0)           # rb=ra 
220: 0000036c: 00002523: LI   0x000025 (D  37)           # ra = uint(0x25=37)
221: 00000370: 0000004c: SXB  0x000000 (D   0)           # uchar(ra[0x0=0]) = ra
222: 00000374: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
223: 00000378: 00003c26: LBL  0x00003c (D  60)           # rb = uint(sp[0x3c=60])
224: 0000037c: 0000004c: SXB  0x000000 (D   0)           # uchar(ra[0x0=0]) = ra
225: 00000380: 00003c0e: LL   0x00003c (D  60)           # ra = uint(sp[0x3c=60])
226: 00000384: 00004858: SUBL 0x000048 (D  72)           # ra = ra - 72
227: 00000388: 0000015d: DIVI 0x000001 (D   1)           # ra = int(ra) / rb
228: 0000038c: 00004002: LEV  0x000040 (D  64)           # pc=*sp, sp += 64 + 8 (return) 
229: 00000390: 00002023: LI   0x000020 (D  32)           # ra = uint(0x20=32)
230: 00000394: 00003642: SLB  0x000036 (D  54)           # uchar(sp[0x36=54]) = ra
231: 00000398: 00001607: LEA  0x000016 (D  22)           # ra = sp+22
232: 0000039c: 00003840: SL   0x000038 (D  56)           # uint(sp[0x38=56]) = ra
233: 000003a0: 0000009d: PSHA 0x000000 (D   0)           # push ra
234: 000003a4: 0000600e: LL   0x000060 (D  96)           # ra = uint(sp[0x60=96])
235: 000003a8: 00000854: ADDI 0x000008 (D   8)           # ra = ra + rb
236: 000003ac: 00006040: SL   0x000060 (D  96)           # uint(sp[0x60=96]) = ra
237: 000003b0: 0000001c: LX   0x000000 (D   0)           # ra = uint(ra[0x0=0])
238: 000003b4: 000000a1: POPB 0x000000 (D   0)           # pop rb
239: 000003b8: 0000004c: SXB  0x000000 (D   0)           # uchar(ra[0x0=0]) = ra
240: 000003bc: 00001872: SHLI 0x000018 (D  24)           # ra = ra << rb #  = ra
241: 000003c0: 00001875: SHRI 0x000018 (D  24)           # ra = int(ra) >> rb #  = ra
242: 000003c4: 00000884: BZ   0x000008 (D   8)           # Cond goto label26
243: 000003c8: 00000123: LI   0x000001 (D   1)           # ra = uint(0x1=1)
244: 000003cc: 00000403: JMP  0x000004 (D   4)           # Jmp label27 0x3d0=pc+4
245: 000003d0: 00000023: LI   0x000000 (D   0) # label26  # ra = uint(0x0=0)
246: 000003d4: 00001040: SL   0x000010 (D  16) # label27  # uint(sp[0x10=16]) = ra
247: 000003d8: 00023003: JMP  0x000230 (D 560)           # Jmp label28 0x608=pc+560
248: 000003dc: 00002023: LI   0x000020 (D  32)           # ra = uint(0x20=32)
249: 000003e0: 00003642: SLB  0x000036 (D  54)           # uchar(sp[0x36=54]) = ra
250: 000003e4: 0000580e: LL   0x000058 (D  88)           # ra = uint(sp[0x58=88])
251: 000003e8: 00000854: ADDI 0x000008 (D   8)           # ra = ra + rb
252: 000003ec: 00005840: SL   0x000058 (D  88)           # uint(sp[0x58=88]) = ra
253: 000003f0: 0000001c: LX   0x000000 (D   0)           # ra = uint(ra[0x0=0])
254: 000003f4: 00003840: SL   0x000038 (D  56)           # uint(sp[0x38=56]) = ra
255: 000003f8: 00000886: BNZ  0x000008 (D   8)           # Cond goto label29
256: 000003fc: 00085008: LEAG 0x000850 (D2128)           # ra = pc+2128
257: 00000400: 00003840: SL   0x000038 (D  56)           # uint(sp[0x38=56]) = ra
258: 00000404: 0000380e: LL   0x000038 (D  56) # label29  # ra = uint(sp[0x38=56])
259: 00000408: 0000009d: PSHA 0x000000 (D   0)           # push ra
260: 0000040c: fffcd405: JSR  0xfffcd4 (D-812)           # Call label30 0x10000e0=pc+-812
261: 00000410: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
262: 00000414: 00001040: SL   0x000010 (D  16)           # uint(sp[0x10=16]) = ra
263: 00000418: 0000003e: LBA  0x000000 (D   0)           # rb=ra 
264: 0000041c: 0000080e: LL   0x000008 (D   8)           # ra = uint(sp[0x8=8])
265: 00000420: 0000088f: BGE  0x000008 (D   8)           # Cond goto label31
266: 00000424: 0000080e: LL   0x000008 (D   8)           # ra = uint(sp[0x8=8])
267: 00000428: 00001040: SL   0x000010 (D  16)           # uint(sp[0x10=16]) = ra
268: 0000042c: 0001dc03: JMP  0x0001dc (D 476) # label31  # Jmp label32 0x608=pc+476
269: 00000430: 0000580e: LL   0x000058 (D  88)           # ra = uint(sp[0x58=88])
270: 00000434: 00000854: ADDI 0x000008 (D   8)           # ra = ra + rb
271: 00000438: 00005840: SL   0x000058 (D  88)           # uint(sp[0x58=88]) = ra
272: 0000043c: 0000001c: LX   0x000000 (D   0)           # ra = uint(ra[0x0=0])
273: 00000440: 00001040: SL   0x000010 (D  16)           # uint(sp[0x10=16]) = ra
274: 00000444: 00003003: JMP  0x000030 (D  48)           # Jmp label33 0x474=pc+48
275: 00000448: 0000580e: LL   0x000058 (D  88)           # ra = uint(sp[0x58=88])
276: 0000044c: 00000854: ADDI 0x000008 (D   8)           # ra = ra + rb
277: 00000450: 00005840: SL   0x000058 (D  88)           # uint(sp[0x58=88]) = ra
278: 00000454: 0000001c: LX   0x000000 (D   0)           # ra = uint(ra[0x0=0])
279: 00000458: 00001040: SL   0x000010 (D  16)           # uint(sp[0x10=16]) = ra
280: 0000045c: 0000003b: LBI  0x000000 (D   0)           # rb = uint(0x0=0)
281: 00000460: 0000148f: BGE  0x000014 (D  20)           # Cond goto label34
282: 00000464: 00000123: LI   0x000001 (D   1)           # ra = uint(0x1=1)
283: 00000468: 00000040: SL   0x000000 (D   0)           # uint(sp[0x0=0]) = ra
284: 0000046c: 0000100e: LL   0x000010 (D  16)           # ra = uint(sp[0x10=16])
285: 00000470: ffffff5a: MULI 0xffffff (D  -1)           # ra = int(ra) *  rb
286: 00000474: 00001040: SL   0x000010 (D  16)           # uint(sp[0x10=16]) = ra
287: 00000478: 00003507: LEA  0x000035 (D  53) # label34  # ra = sp+53
288: 0000047c: 00003840: SL   0x000038 (D  56)           # uint(sp[0x38=56]) = ra
289: 00000480: 0000380e: LL   0x000038 (D  56) # label35  # ra = uint(sp[0x38=56])
290: 00000484: 00000157: SUBI 0x000001 (D   1)           # ra = ra - rb
291: 00000488: 00003840: SL   0x000038 (D  56)           # uint(sp[0x38=56]) = ra
292: 0000048c: 0000009d: PSHA 0x000000 (D   0)           # push ra
293: 00000490: 0000180e: LL   0x000018 (D  24)           # ra = uint(sp[0x18=24])
294: 00000494: 00000a66: MDUI 0x00000a (D  10)           # ra = uint(ra) mod rb
295: 00000498: 00003054: ADDI 0x000030 (D  48)           # ra = ra + rb
296: 0000049c: 000000a1: POPB 0x000000 (D   0)           # pop rb
297: 000004a0: 0000004c: SXB  0x000000 (D   0)           # uchar(ra[0x0=0]) = ra
298: 000004a4: 0000100e: LL   0x000010 (D  16)           # ra = uint(sp[0x10=16])
299: 000004a8: 00000a60: DVUI 0x00000a (D  10)           # ra = uint(ra) / rb
300: 000004ac: 00001040: SL   0x000010 (D  16)           # uint(sp[0x10=16]) = ra
301: 000004b0: ffffcc86: BNZ  0xffffcc (D -52)           # Cond goto label35
302: 000004b4: 00003507: LEA  0x000035 (D  53)           # ra = sp+53
303: 000004b8: 00003858: SUBL 0x000038 (D  56)           # ra = ra - 56
304: 000004bc: 0000015d: DIVI 0x000001 (D   1)           # ra = int(ra) / rb
305: 000004c0: 00001040: SL   0x000010 (D  16)           # uint(sp[0x10=16]) = ra
306: 000004c4: 00014403: JMP  0x000144 (D 324)           # Jmp label36 0x608=pc+324
307: 000004c8: 0000580e: LL   0x000058 (D  88)           # ra = uint(sp[0x58=88])
308: 000004cc: 00000854: ADDI 0x000008 (D   8)           # ra = ra + rb
309: 000004d0: 00005840: SL   0x000058 (D  88)           # uint(sp[0x58=88]) = ra
310: 000004d4: 0000001c: LX   0x000000 (D   0)           # ra = uint(ra[0x0=0])
311: 000004d8: 00001040: SL   0x000010 (D  16)           # uint(sp[0x10=16]) = ra
312: 000004dc: 00003507: LEA  0x000035 (D  53)           # ra = sp+53
313: 000004e0: 00003840: SL   0x000038 (D  56)           # uint(sp[0x38=56]) = ra
314: 000004e4: 0000380e: LL   0x000038 (D  56) # label37  # ra = uint(sp[0x38=56])
315: 000004e8: 00000157: SUBI 0x000001 (D   1)           # ra = ra - rb
316: 000004ec: 00003840: SL   0x000038 (D  56)           # uint(sp[0x38=56]) = ra
317: 000004f0: 0000009d: PSHA 0x000000 (D   0)           # push ra
318: 000004f4: 0000180e: LL   0x000018 (D  24)           # ra = uint(sp[0x18=24])
319: 000004f8: 00000769: ANDI 0x000007 (D   7)           # ra = ra & rb
320: 000004fc: 00003054: ADDI 0x000030 (D  48)           # ra = ra + rb
321: 00000500: 000000a1: POPB 0x000000 (D   0)           # pop rb
322: 00000504: 0000004c: SXB  0x000000 (D   0)           # uchar(ra[0x0=0]) = ra
323: 00000508: 0000100e: LL   0x000010 (D  16)           # ra = uint(sp[0x10=16])
324: 0000050c: 00000378: SRUI 0x000003 (D   3)           # ra = uint(ra) >> rb #  = ra
325: 00000510: 00001040: SL   0x000010 (D  16)           # uint(sp[0x10=16]) = ra
326: 00000514: ffffcc86: BNZ  0xffffcc (D -52)           # Cond goto label37
327: 00000518: 00003507: LEA  0x000035 (D  53)           # ra = sp+53
328: 0000051c: 00003858: SUBL 0x000038 (D  56)           # ra = ra - 56
329: 00000520: 0000015d: DIVI 0x000001 (D   1)           # ra = int(ra) / rb
330: 00000524: 00001040: SL   0x000010 (D  16)           # uint(sp[0x10=16]) = ra
331: 00000528: 0000e003: JMP  0x0000e0 (D 224)           # Jmp label38 0x608=pc+224
332: 0000052c: 00003023: LI   0x000030 (D  48)           # ra = uint(0x30=48)
333: 00000530: 00003642: SLB  0x000036 (D  54)           # uchar(sp[0x36=54]) = ra
334: 00000534: 00000823: LI   0x000008 (D   8)           # ra = uint(0x8=8)
335: 00000538: 00000440: SL   0x000004 (D   4)           # uint(sp[0x4=4]) = ra
336: 0000053c: 00007823: LI   0x000078 (D 120)           # ra = uint(0x78=120)
337: 00000540: 00003742: SLB  0x000037 (D  55)           # uchar(sp[0x37=55]) = ra
338: 00000544: 00003711: LLC  0x000037 (D  55)           # ra = char(sp[0x37=55])
339: 00000548: 00002157: SUBI 0x000021 (D  33)           # ra = ra - rb
340: 0000054c: 00003742: SLB  0x000037 (D  55)           # uchar(sp[0x37=55]) = ra
341: 00000550: 0000580e: LL   0x000058 (D  88)           # ra = uint(sp[0x58=88])
342: 00000554: 00000854: ADDI 0x000008 (D   8)           # ra = ra + rb
343: 00000558: 00005840: SL   0x000058 (D  88)           # uint(sp[0x58=88]) = ra
344: 0000055c: 0000001c: LX   0x000000 (D   0)           # ra = uint(ra[0x0=0])
345: 00000560: 00001040: SL   0x000010 (D  16)           # uint(sp[0x10=16]) = ra
346: 00000564: 00003507: LEA  0x000035 (D  53)           # ra = sp+53
347: 00000568: 00003840: SL   0x000038 (D  56)           # uint(sp[0x38=56]) = ra
348: 0000056c: 0000380e: LL   0x000038 (D  56) # label41  # ra = uint(sp[0x38=56])
349: 00000570: 00000157: SUBI 0x000001 (D   1)           # ra = ra - rb
350: 00000574: 00003840: SL   0x000038 (D  56)           # uint(sp[0x38=56]) = ra
351: 00000578: 0000009d: PSHA 0x000000 (D   0)           # push ra
352: 0000057c: 0000180e: LL   0x000018 (D  24)           # ra = uint(sp[0x18=24])
353: 00000580: 00000f69: ANDI 0x00000f (D  15)           # ra = ra & rb
354: 00000584: 0000003e: LBA  0x000000 (D   0)           # rb=ra 
355: 00000588: 00000923: LI   0x000009 (D   9)           # ra = uint(0x9=9)
356: 0000058c: 0000088f: BGE  0x000008 (D   8)           # Cond goto label39
357: 00000590: 00003f11: LLC  0x00003f (D  63)           # ra = char(sp[0x3f=63])
358: 00000594: 00000403: JMP  0x000004 (D   4)           # Jmp label40 0x598=pc+4
359: 00000598: 00003023: LI   0x000030 (D  48) # label39  # ra = uint(0x30=48)
360: 0000059c: 0000009d: PSHA 0x000000 (D   0) # label40  # push ra
361: 000005a0: 0000200e: LL   0x000020 (D  32)           # ra = uint(sp[0x20=32])
362: 000005a4: 00000f69: ANDI 0x00000f (D  15)           # ra = ra & rb
363: 000005a8: 000000a1: POPB 0x000000 (D   0)           # pop rb
364: 000005ac: 00000053: ADD  0x000000 (D   0)           # ra = ra +
365: 000005b0: 000000a1: POPB 0x000000 (D   0)           # pop rb
366: 000005b4: 0000004c: SXB  0x000000 (D   0)           # uchar(ra[0x0=0]) = ra
367: 000005b8: 0000100e: LL   0x000010 (D  16)           # ra = uint(sp[0x10=16])
368: 000005bc: 00000478: SRUI 0x000004 (D   4)           # ra = uint(ra) >> rb #  = ra
369: 000005c0: 00001040: SL   0x000010 (D  16)           # uint(sp[0x10=16]) = ra
370: 000005c4: ffffa486: BNZ  0xffffa4 (D -92)           # Cond goto label41
371: 000005c8: 00003507: LEA  0x000035 (D  53)           # ra = sp+53
372: 000005cc: 00003858: SUBL 0x000038 (D  56)           # ra = ra - 56
373: 000005d0: 0000015d: DIVI 0x000001 (D   1)           # ra = int(ra) / rb
374: 000005d4: 00001040: SL   0x000010 (D  16)           # uint(sp[0x10=16]) = ra
375: 000005d8: 00003003: JMP  0x000030 (D  48)           # Jmp label42 0x608=pc+48
376: 000005dc: 00003c0e: LL   0x00003c (D  60) # label45  # ra = uint(sp[0x3c=60])
377: 000005e0: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
378: 000005e4: 00003c40: SL   0x00003c (D  60)           # uint(sp[0x3c=60]) = ra
379: 000005e8: ffffff54: ADDI 0xffffff (D  -1)           # ra = ra + rb
380: 000005ec: 0000003e: LBA  0x000000 (D   0)           # rb=ra 
381: 000005f0: 00003711: LLC  0x000037 (D  55)           # ra = char(sp[0x37=55])
382: 000005f4: 0000004c: SXB  0x000000 (D   0)           # uchar(ra[0x0=0]) = ra
383: 000005f8: 00013403: JMP  0x000134 (D 308)           # Jmp label43 0x72c=pc+308
384: 000005fc: 00000c03: JMP  0x00000c (D  12)           # Jmp label44 0x608=pc+12
385: 00000600: 0000793b: LBI  0x000079 (D 121) # label25  # rb = uint(0x79=121)
386: 00000604: ffffd490: BGEU 0xffffd4 (D -44)           # Cond goto label45
387: 00000608: 00064c04: JMPI 0x00064c (D1612)           # Jmp label46 0xc54=pc+1612
388: 0000060c: 0000100e: LL   0x000010 (D  16) # label44  # ra = uint(sp[0x10=16])
389: 00000610: 00000055: ADDL 0x000000 (D   0)           # ra = ra + 0
390: 00000614: 0000003e: LBA  0x000000 (D   0)           # rb=ra 
391: 00000618: 0000040e: LL   0x000004 (D   4)           # ra = uint(sp[0x4=4])
392: 0000061c: 00000056: SUB  0x000000 (D   0)           # ra = ra + sp[0]
393: 00000620: 00000440: SL   0x000004 (D   4)           # uint(sp[0x4=4]) = ra
394: 00000624: 0000000e: LL   0x000000 (D   0)           # ra = uint(sp[0x0=0])
395: 00000628: 00002884: BZ   0x000028 (D  40)           # Cond goto label47
396: 0000062c: 00003611: LLC  0x000036 (D  54)           # ra = char(sp[0x36=54])
397: 00000630: 0000303b: LBI  0x000030 (D  48)           # rb = uint(0x30=48)
398: 00000634: 00001c8a: BNE  0x00001c (D  28)           # Cond goto label48
399: 00000638: 00003c0e: LL   0x00003c (D  60)           # ra = uint(sp[0x3c=60])
400: 0000063c: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
401: 00000640: 00003c40: SL   0x00003c (D  60)           # uint(sp[0x3c=60]) = ra
402: 00000644: ffffff54: ADDI 0xffffff (D  -1)           # ra = ra + rb
403: 00000648: 0000003e: LBA  0x000000 (D   0)           # rb=ra 
404: 0000064c: 00002d23: LI   0x00002d (D  45)           # ra = uint(0x2d=45)
405: 00000650: 0000004c: SXB  0x000000 (D   0)           # uchar(ra[0x0=0]) = ra
406: 00000654: 00000c0e: LL   0x00000c (D  12) # label48  # ra = uint(sp[0xc=12])
407: 00000658: 00003886: BNZ  0x000038 (D  56)           # Cond goto label49
408: 0000065c: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
409: 00000660: 00000426: LBL  0x000004 (D   4)           # rb = uint(sp[0x4=4])
410: 00000664: 00002c8f: BGE  0x00002c (D  44)           # Cond goto label50
411: 00000668: 0000040e: LL   0x000004 (D   4)           # ra = uint(sp[0x4=4])
412: 0000066c: 0000009d: PSHA 0x000000 (D   0)           # push ra
413: 00000670: 00003e11: LLC  0x00003e (D  62)           # ra = char(sp[0x3e=62])
414: 00000674: 0000009d: PSHA 0x000000 (D   0)           # push ra
415: 00000678: 00004c0e: LL   0x00004c (D  76)           # ra = uint(sp[0x4c=76])
416: 0000067c: 0000009d: PSHA 0x000000 (D   0)           # push ra
417: 00000680: fff9f405: JSR  0xfff9f4 (D-1548)           # Call label51 0x1000074=pc+-1548
418: 00000684: 00001801: ENT  0x000018 (D  24)           # sp += 0x18=24
419: 00000688: 00003c0e: LL   0x00003c (D  60)           # ra = uint(sp[0x3c=60])
420: 0000068c: 00000455: ADDL 0x000004 (D   4)           # ra = ra + 4
421: 00000690: 00003c40: SL   0x00003c (D  60)           # uint(sp[0x3c=60]) = ra
422: 00000694: 0000000e: LL   0x000000 (D   0) # label50  # ra = uint(sp[0x0=0])
423: 00000698: 00002884: BZ   0x000028 (D  40)           # Cond goto label52
424: 0000069c: 00003611: LLC  0x000036 (D  54)           # ra = char(sp[0x36=54])
425: 000006a0: 0000203b: LBI  0x000020 (D  32)           # rb = uint(0x20=32)
426: 000006a4: 00001c8a: BNE  0x00001c (D  28)           # Cond goto label53
427: 000006a8: 00003c0e: LL   0x00003c (D  60)           # ra = uint(sp[0x3c=60])
428: 000006ac: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
429: 000006b0: 00003c40: SL   0x00003c (D  60)           # uint(sp[0x3c=60]) = ra
430: 000006b4: ffffff54: ADDI 0xffffff (D  -1)           # ra = ra + rb
431: 000006b8: 0000003e: LBA  0x000000 (D   0)           # rb=ra 
432: 000006bc: 00002d23: LI   0x00002d (D  45)           # ra = uint(0x2d=45)
433: 000006c0: 0000004c: SXB  0x000000 (D   0)           # uchar(ra[0x0=0]) = ra
434: 000006c4: 0000100e: LL   0x000010 (D  16) # label53  # ra = uint(sp[0x10=16])
435: 000006c8: 0000009d: PSHA 0x000000 (D   0)           # push ra
436: 000006cc: 0000400e: LL   0x000040 (D  64)           # ra = uint(sp[0x40=64])
437: 000006d0: 0000009d: PSHA 0x000000 (D   0)           # push ra
438: 000006d4: 00004c0e: LL   0x00004c (D  76)           # ra = uint(sp[0x4c=76])
439: 000006d8: 0000009d: PSHA 0x000000 (D   0)           # push ra
440: 000006dc: fff98005: JSR  0xfff980 (D-1664)           # Call label54 0x100005c=pc+-1664
441: 000006e0: 00001801: ENT  0x000018 (D  24)           # sp += 0x18=24
442: 000006e4: 00003c0e: LL   0x00003c (D  60)           # ra = uint(sp[0x3c=60])
443: 000006e8: 00001055: ADDL 0x000010 (D  16)           # ra = ra + 16
444: 000006ec: 00003c40: SL   0x00003c (D  60)           # uint(sp[0x3c=60]) = ra
445: 000006f0: 00000c0e: LL   0x00000c (D  12)           # ra = uint(sp[0xc=12])
446: 000006f4: 00003884: BZ   0x000038 (D  56)           # Cond goto label55
447: 000006f8: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
448: 000006fc: 00000426: LBL  0x000004 (D   4)           # rb = uint(sp[0x4=4])
449: 00000700: 00002c8f: BGE  0x00002c (D  44)           # Cond goto label56
450: 00000704: 0000040e: LL   0x000004 (D   4)           # ra = uint(sp[0x4=4])
451: 00000708: 0000009d: PSHA 0x000000 (D   0)           # push ra
452: 0000070c: 00003e11: LLC  0x00003e (D  62)           # ra = char(sp[0x3e=62])
453: 00000710: 0000009d: PSHA 0x000000 (D   0)           # push ra
454: 00000714: 00004c0e: LL   0x00004c (D  76)           # ra = uint(sp[0x4c=76])
455: 00000718: 0000009d: PSHA 0x000000 (D   0)           # push ra
456: 0000071c: fff95805: JSR  0xfff958 (D-1704)           # Call label57 0x1000074=pc+-1704
457: 00000720: 00001801: ENT  0x000018 (D  24)           # sp += 0x18=24
458: 00000724: 00003c0e: LL   0x00003c (D  60)           # ra = uint(sp[0x3c=60])
459: 00000728: 00000455: ADDL 0x000004 (D   4)           # ra = ra + 4
460: 0000072c: 00003c40: SL   0x00003c (D  60)           # uint(sp[0x3c=60]) = ra
461: 00000730: 0000500e: LL   0x000050 (D  80) # label56  # ra = uint(sp[0x50=80])
462: 00000734: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
463: 00000738: 00005040: SL   0x000050 (D  80)           # uint(sp[0x50=80]) = ra
464: 0000073c: ffffff1f: LXC  0xffffff (D  -1)           # ra = char(ra[0xffffff=16777215])
465: 00000740: 00003742: SLB  0x000037 (D  55)           # uchar(sp[0x37=55]) = ra
466: 00000744: 00001872: SHLI 0x000018 (D  24)           # ra = ra << rb #  = ra
467: 00000748: 00001875: SHRI 0x000018 (D  24)           # ra = int(ra) >> rb #  = ra
468: 0000074c: fff9cc86: BNZ  0xfff9cc (D-1588)           # Cond goto label58
469: 00000750: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
470: 00000754: 00003c26: LBL  0x00003c (D  60)           # rb = uint(sp[0x3c=60])
471: 00000758: 0000004c: SXB  0x000000 (D   0)           # uchar(ra[0x0=0]) = ra
472: 0000075c: 00003c0e: LL   0x00003c (D  60)           # ra = uint(sp[0x3c=60])
473: 00000760: 00004858: SUBL 0x000048 (D  72)           # ra = ra - 72
474: 00000764: 0000015d: DIVI 0x000001 (D   1)           # ra = int(ra) / rb
475: 00000768: 00004002: LEV  0x000040 (D  64)           # pc=*sp, sp += 64 + 8 (return) 
476: 0000076c: 00004002: LEV  0x000040 (D  64)           # pc=*sp, sp += 64 + 8 (return) 
477: 00000770: 00000807: LEA  0x000008 (D   8) # label118  # ra = sp+8
478: 00000774: 0000009d: PSHA 0x000000 (D   0)           # push ra
479: 00000778: 0000100e: LL   0x000010 (D  16)           # ra = uint(sp[0x10=16])
480: 0000077c: 0000009d: PSHA 0x000000 (D   0)           # push ra
481: 00000780: 00685408: LEAG 0x006854 (D26708)           # ra = pc+26708
482: 00000784: 0000009d: PSHA 0x000000 (D   0)           # push ra
483: 00000788: fff98005: JSR  0xfff980 (D-1664)           # Call label59 0x1000108=pc+-1664
484: 0000078c: 00001801: ENT  0x000018 (D  24)           # sp += 0x18=24
485: 00000790: 0000009d: PSHA 0x000000 (D   0)           # push ra
486: 00000794: 00684008: LEAG 0x006840 (D26688)           # ra = pc+26688
487: 00000798: 0000009d: PSHA 0x000000 (D   0)           # push ra
488: 0000079c: 0000019e: PSHI 0x000001 (D   1)           # push 0x1=1
489: 000007a0: fff90005: JSR  0xfff900 (D-1792)           # Call label60 0x10000a0=pc+-1792
490: 000007a4: 00001801: ENT  0x000018 (D  24)           # sp += 0x18=24
491: 000007a8: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
492: 000007ac: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
493: 000007b0: 00068808: LEAG 0x000688 (D1672) # label92  # ra = pc+1672
494: 000007b4: 0000009d: PSHA 0x000000 (D   0)           # push ra
495: 000007b8: ffffb405: JSR  0xffffb4 (D -76)           # Call label61 0x100076c=pc+-76
496: 000007bc: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
497: 000007c0: 0000200e: LL   0x000020 (D  32)           # ra = uint(sp[0x20=32])
498: 000007c4: 00011803: JMP  0x000118 (D 280)           # Jmp label62 0x8dc=pc+280
499: 000007c8: 00067708: LEAG 0x000677 (D1655)           # ra = pc+1655
500: 000007cc: 0000009d: PSHA 0x000000 (D   0)           # push ra
501: 000007d0: ffff9c05: JSR  0xffff9c (D-100)           # Call label63 0x100076c=pc+-100
502: 000007d4: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
503: 000007d8: 00011003: JMP  0x000110 (D 272)           # Jmp label64 0x8e8=pc+272
504: 000007dc: fff84805: JSR  0xfff848 (D-1976)           # Call label65 0x1000024=pc+-1976
505: 000007e0: 0000009d: PSHA 0x000000 (D   0)           # push ra
506: 000007e4: 00066108: LEAG 0x000661 (D1633)           # ra = pc+1633
507: 000007e8: 0000009d: PSHA 0x000000 (D   0)           # push ra
508: 000007ec: ffff8005: JSR  0xffff80 (D-128)           # Call label66 0x100076c=pc+-128
509: 000007f0: 00001001: ENT  0x000010 (D  16)           # sp += 0x10=16
510: 000007f4: 0000f403: JMP  0x0000f4 (D 244)           # Jmp label67 0x8e8=pc+244
511: 000007f8: fff82c05: JSR  0xfff82c (D-2004)           # Call label68 0x1000024=pc+-2004
512: 000007fc: 0000009d: PSHA 0x000000 (D   0)           # push ra
513: 00000800: 00065508: LEAG 0x000655 (D1621)           # ra = pc+1621
514: 00000804: 0000009d: PSHA 0x000000 (D   0)           # push ra
515: 00000808: ffff6405: JSR  0xffff64 (D-156)           # Call label69 0x100076c=pc+-156
516: 0000080c: 00001001: ENT  0x000010 (D  16)           # sp += 0x10=16
517: 00000810: 0000d803: JMP  0x0000d8 (D 216)           # Jmp label70 0x8e8=pc+216
518: 00000814: fff81005: JSR  0xfff810 (D-2032)           # Call label71 0x1000024=pc+-2032
519: 00000818: 0000009d: PSHA 0x000000 (D   0)           # push ra
520: 0000081c: 00064908: LEAG 0x000649 (D1609)           # ra = pc+1609
521: 00000820: 0000009d: PSHA 0x000000 (D   0)           # push ra
522: 00000824: ffff4805: JSR  0xffff48 (D-184)           # Call label72 0x100076c=pc+-184
523: 00000828: 00001001: ENT  0x000010 (D  16)           # sp += 0x10=16
524: 0000082c: 0000bc03: JMP  0x0000bc (D 188)           # Jmp label73 0x8e8=pc+188
525: 00000830: 00064508: LEAG 0x000645 (D1605)           # ra = pc+1605
526: 00000834: 0000009d: PSHA 0x000000 (D   0)           # push ra
527: 00000838: ffff3405: JSR  0xffff34 (D-204)           # Call label74 0x100076c=pc+-204
528: 0000083c: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
529: 00000840: 0000a803: JMP  0x0000a8 (D 168)           # Jmp label75 0x8e8=pc+168
530: 00000844: 00063608: LEAG 0x000636 (D1590)           # ra = pc+1590
531: 00000848: 0000009d: PSHA 0x000000 (D   0)           # push ra
532: 0000084c: ffff2005: JSR  0xffff20 (D-224)           # Call label76 0x100076c=pc+-224
533: 00000850: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
534: 00000854: 00009403: JMP  0x000094 (D 148)           # Jmp label77 0x8e8=pc+148
535: 00000858: fff7cc05: JSR  0xfff7cc (D-2100)           # Call label78 0x1000024=pc+-2100
536: 0000085c: 0000009d: PSHA 0x000000 (D   0)           # push ra
537: 00000860: 00062108: LEAG 0x000621 (D1569)           # ra = pc+1569
538: 00000864: 0000009d: PSHA 0x000000 (D   0)           # push ra
539: 00000868: ffff0405: JSR  0xffff04 (D-252)           # Call label79 0x100076c=pc+-252
540: 0000086c: 00001001: ENT  0x000010 (D  16)           # sp += 0x10=16
541: 00000870: 00007803: JMP  0x000078 (D 120)           # Jmp label80 0x8e8=pc+120
542: 00000874: 00061b08: LEAG 0x00061b (D1563)           # ra = pc+1563
543: 00000878: 0000009d: PSHA 0x000000 (D   0)           # push ra
544: 0000087c: fffef005: JSR  0xfffef0 (D-272)           # Call label81 0x100076c=pc+-272
545: 00000880: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
546: 00000884: 00000123: LI   0x000001 (D   1)           # ra = uint(0x1=1)
547: 00000888: 00674845: SG   0x006748 (D26440)           # uint(gaddr[0x6fd0=28624=pc+26440]) = ra
548: 0000088c: 0000009e: PSHI 0x000000 (D   0)           # push 0x0=0
549: 00000890: fff79c05: JSR  0xfff79c (D-2148)           # Call label82 0x100002c=pc+-2148
550: 00000894: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
551: 00000898: 00005003: JMP  0x000050 (D  80)           # Jmp label83 0x8e8=pc+80
552: 0000089c: 0000009e: PSHI 0x000000 (D   0)           # push 0x0=0
553: 000008a0: fff75c05: JSR  0xfff75c (D-2212)           # Call label84 0xfffffc=pc+-2212
554: 000008a4: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
555: 000008a8: 0000009d: PSHA 0x000000 (D   0)           # push ra
556: 000008ac: 0005ea08: LEAG 0x0005ea (D1514)           # ra = pc+1514
557: 000008b0: 0000009d: PSHA 0x000000 (D   0)           # push ra
558: 000008b4: fffeb805: JSR  0xfffeb8 (D-328)           # Call label85 0x100076c=pc+-328
559: 000008b8: 00001001: ENT  0x000010 (D  16)           # sp += 0x10=16
560: 000008bc: 00002c03: JMP  0x00002c (D  44)           # Jmp label86 0x8e8=pc+44
561: 000008c0: 0000200e: LL   0x000020 (D  32) # label90  # ra = uint(sp[0x20=32])
562: 000008c4: 0000009d: PSHA 0x000000 (D   0)           # push ra
563: 000008c8: 0005da08: LEAG 0x0005da (D1498)           # ra = pc+1498
564: 000008cc: 0000009d: PSHA 0x000000 (D   0)           # push ra
565: 000008d0: fffe9c05: JSR  0xfffe9c (D-356)           # Call label87 0x100076c=pc+-356
566: 000008d4: 00001001: ENT  0x000010 (D  16)           # sp += 0x10=16
567: 000008d8: 00001003: JMP  0x000010 (D  16)           # Jmp label88 0x8e8=pc+16
568: 000008dc: 00000c03: JMP  0x00000c (D  12)           # Jmp label89 0x8e8=pc+12
569: 000008e0: 00000a3b: LBI  0x00000a (D  10) # label62  # rb = uint(0xa=10)
570: 000008e4: ffffd890: BGEU 0xffffd8 (D -40)           # Cond goto label90
571: 000008e8: 0005c804: JMPI 0x0005c8 (D1480)           # Jmp label91 0xeb0=pc+1480
572: 000008ec: 00000002: LEV  0x000000 (D   0) # label89  # pc=*sp, sp += 0 + 8 (return) 
573: 000008f0: 0000009d: PSHA 0x000000 (D   0)           # push ra
574: 000008f4: 000000a0: PSHB 0x000000 (D   0)           # push rb
575: 000008f8: 000000ae: PSHC 0x000000 (D   0)           # push rc
576: 000008fc: fffeb005: JSR  0xfffeb0 (D-336)           # Call label92 0x10007ac=pc+-336
577: 00000900: 000000af: POPC 0x000000 (D   0)           # pop rc
578: 00000904: 000000a1: POPB 0x000000 (D   0)           # pop rb
579: 00000908: 000000a3: POPA 0x000000 (D   0)           # pop ra
580: 0000090c: 00000098: RTI  0x000000 (D   0)           # POP fault code|pc|sp
581: 00000910: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
582: 00000914: fffff801: ENT  0xfffff8 (D  -8) # label112  # sp += 0xfffff8=-8
583: 00000918: 0016a308: LEAG 0x0016a3 (D5795)           # ra = pc+5795
584: 0000091c: fff00069: ANDI 0xfff000 (D-4096)           # ra = ra & rb
585: 00000920: 00669c45: SG   0x00669c (D26268)           # uint(gaddr[0x6fbc=28604=pc+26268]) = ra
586: 00000924: 00669815: LG   0x006698 (D26264)           # ra = uint(gaddr[0x6fbc=28604=pc+26264])
587: 00000928: 00100054: ADDI 0x001000 (D4096)           # ra = ra + rb
588: 0000092c: 00669445: SG   0x006694 (D26260)           # uint(gaddr[0x6fc0=28608=pc+26260]) = ra
589: 00000930: 00669015: LG   0x006690 (D26256)           # ra = uint(gaddr[0x6fc0=28608=pc+26256])
590: 00000934: 00100054: ADDI 0x001000 (D4096)           # ra = ra + rb
591: 00000938: 00668c45: SG   0x00668c (D26252)           # uint(gaddr[0x6fc4=28612=pc+26252]) = ra
592: 0000093c: 00668815: LG   0x006688 (D26248)           # ra = uint(gaddr[0x6fc4=28612=pc+26248])
593: 00000940: 00100054: ADDI 0x001000 (D4096)           # ra = ra + rb
594: 00000944: 00668445: SG   0x006684 (D26244)           # uint(gaddr[0x6fc8=28616=pc+26244]) = ra
595: 00000948: 00668015: LG   0x006680 (D26240)           # ra = uint(gaddr[0x6fc8=28616=pc+26240])
596: 0000094c: 00100054: ADDI 0x001000 (D4096)           # ra = ra + rb
597: 00000950: 00667c45: SG   0x00667c (D26236)           # uint(gaddr[0x6fcc=28620=pc+26236]) = ra
598: 00000954: 00666c15: LG   0x00666c (D26220)           # ra = uint(gaddr[0x6fc0=28608=pc+26220])
599: 00000958: 0000016c: ORI  0x000001 (D   1)           # ra = ra | rb
600: 0000095c: 0000026c: ORI  0x000002 (D   2)           # ra = ra | rb
601: 00000960: 0000046c: ORI  0x000004 (D   4)           # ra = ra | rb
602: 00000964: 0066582d: LBG  0x006658 (D26200)           # rb = uint(gaddr[0x6fbc=28604=pc+26200])
603: 00000968: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
604: 0000096c: 00665015: LG   0x006650 (D26192)           # ra = uint(gaddr[0x6fbc=28604=pc+26192])
605: 00000970: 00000454: ADDI 0x000004 (D   4)           # ra = ra + rb
606: 00000974: 0000009d: PSHA 0x000000 (D   0)           # push ra
607: 00000978: 00664c15: LG   0x00664c (D26188)           # ra = uint(gaddr[0x6fc4=28612=pc+26188])
608: 0000097c: 0000016c: ORI  0x000001 (D   1)           # ra = ra | rb
609: 00000980: 0000026c: ORI  0x000002 (D   2)           # ra = ra | rb
610: 00000984: 0000046c: ORI  0x000004 (D   4)           # ra = ra | rb
611: 00000988: 000000a1: POPB 0x000000 (D   0)           # pop rb
612: 0000098c: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
613: 00000990: 00662c15: LG   0x00662c (D26156)           # ra = uint(gaddr[0x6fbc=28604=pc+26156])
614: 00000994: 00000854: ADDI 0x000008 (D   8)           # ra = ra + rb
615: 00000998: 0000009d: PSHA 0x000000 (D   0)           # push ra
616: 0000099c: 00662c15: LG   0x00662c (D26156)           # ra = uint(gaddr[0x6fc8=28616=pc+26156])
617: 000009a0: 0000016c: ORI  0x000001 (D   1)           # ra = ra | rb
618: 000009a4: 0000026c: ORI  0x000002 (D   2)           # ra = ra | rb
619: 000009a8: 0000046c: ORI  0x000004 (D   4)           # ra = ra | rb
620: 000009ac: 000000a1: POPB 0x000000 (D   0)           # pop rb
621: 000009b0: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
622: 000009b4: 00660815: LG   0x006608 (D26120)           # ra = uint(gaddr[0x6fbc=28604=pc+26120])
623: 000009b8: 00000c54: ADDI 0x00000c (D  12)           # ra = ra + rb
624: 000009bc: 0000009d: PSHA 0x000000 (D   0)           # push ra
625: 000009c0: 00660c15: LG   0x00660c (D26124)           # ra = uint(gaddr[0x6fcc=28620=pc+26124])
626: 000009c4: 0000016c: ORI  0x000001 (D   1)           # ra = ra | rb
627: 000009c8: 0000026c: ORI  0x000002 (D   2)           # ra = ra | rb
628: 000009cc: 0000046c: ORI  0x000004 (D   4)           # ra = ra | rb
629: 000009d0: 000000a1: POPB 0x000000 (D   0)           # pop rb
630: 000009d4: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
631: 000009d8: 00000423: LI   0x000004 (D   4)           # ra = uint(0x4=4)
632: 000009dc: 00000440: SL   0x000004 (D   4)           # uint(sp[0x4=4]) = ra
633: 000009e0: 00002803: JMP  0x000028 (D  40)           # Jmp label93 0xa08=pc+40
634: 000009e4: 0000040e: LL   0x000004 (D   4) # label94  # ra = uint(sp[0x4=4])
635: 000009e8: 0000045a: MULI 0x000004 (D   4)           # ra = int(ra) *  rb
636: 000009ec: 0065d02d: LBG  0x0065d0 (D26064)           # rb = uint(gaddr[0x6fbc=28604=pc+26064])
637: 000009f0: 00000053: ADD  0x000000 (D   0)           # ra = ra +
638: 000009f4: 0000003e: LBA  0x000000 (D   0)           # rb=ra 
639: 000009f8: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
640: 000009fc: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
641: 00000a00: 0000040e: LL   0x000004 (D   4)           # ra = uint(sp[0x4=4])
642: 00000a04: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
643: 00000a08: 00000440: SL   0x000004 (D   4)           # uint(sp[0x4=4]) = ra
644: 00000a0c: 0000040e: LL   0x000004 (D   4) # label93  # ra = uint(sp[0x4=4])
645: 00000a10: 0004003b: LBI  0x000400 (D1024)           # rb = uint(0x400=1024)
646: 00000a14: ffffcc8c: BLT  0xffffcc (D -52)           # Cond goto label94
647: 00000a18: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
648: 00000a1c: 00000440: SL   0x000004 (D   4)           # uint(sp[0x4=4]) = ra
649: 00000a20: 00003c03: JMP  0x00003c (D  60)           # Jmp label95 0xa5c=pc+60
650: 00000a24: 0000040e: LL   0x000004 (D   4) # label96  # ra = uint(sp[0x4=4])
651: 00000a28: 0000045a: MULI 0x000004 (D   4)           # ra = int(ra) *  rb
652: 00000a2c: 0065942d: LBG  0x006594 (D26004)           # rb = uint(gaddr[0x6fc0=28608=pc+26004])
653: 00000a30: 00000053: ADD  0x000000 (D   0)           # ra = ra +
654: 00000a34: 0000009d: PSHA 0x000000 (D   0)           # push ra
655: 00000a38: 00000c0e: LL   0x00000c (D  12)           # ra = uint(sp[0xc=12])
656: 00000a3c: 00000c72: SHLI 0x00000c (D  12)           # ra = ra << rb #  = ra
657: 00000a40: 0000016c: ORI  0x000001 (D   1)           # ra = ra | rb
658: 00000a44: 0000026c: ORI  0x000002 (D   2)           # ra = ra | rb
659: 00000a48: 0000046c: ORI  0x000004 (D   4)           # ra = ra | rb
660: 00000a4c: 000000a1: POPB 0x000000 (D   0)           # pop rb
661: 00000a50: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
662: 00000a54: 0000040e: LL   0x000004 (D   4)           # ra = uint(sp[0x4=4])
663: 00000a58: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
664: 00000a5c: 00000440: SL   0x000004 (D   4)           # uint(sp[0x4=4]) = ra
665: 00000a60: 0000040e: LL   0x000004 (D   4) # label95  # ra = uint(sp[0x4=4])
666: 00000a64: 0010003b: LBI  0x001000 (D4096)           # rb = uint(0x1000=4096)
667: 00000a68: ffffb88c: BLT  0xffffb8 (D -72)           # Cond goto label96
668: 00000a6c: 00655015: LG   0x006550 (D25936)           # ra = uint(gaddr[0x6fbc=28604=pc+25936])
669: 00000a70: 0000009d: PSHA 0x000000 (D   0)           # push ra
670: 00000a74: fff5c405: JSR  0xfff5c4 (D-2620)           # Call label97 0x1000038=pc+-2620
671: 00000a78: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
672: 00000a7c: 0000019e: PSHI 0x000001 (D   1)           # push 0x1=1
673: 00000a80: fff5c405: JSR  0xfff5c4 (D-2620)           # Call label98 0x1000044=pc+-2620
674: 00000a84: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
675: 00000a88: 00000802: LEV  0x000008 (D   8)           # pc=*sp, sp += 8 + 8 (return) 
676: 00000a8c: fffff801: ENT  0xfffff8 (D  -8) # <=ENTRY           # sp += 0xfffff8=-8
677: 00000a90: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
678: 00000a94: 00653c45: SG   0x00653c (D25916)           # uint(gaddr[0x6fd0=28624=pc+25916]) = ra
679: 00000a98: fffe5408: LEAG 0xfffe54 (D-428)           # ra = pc+16776788
680: 00000a9c: 0000009d: PSHA 0x000000 (D   0)           # push ra
681: 00000aa0: fff57805: JSR  0xfff578 (D-2696)           # Call label99 0x1000018=pc+-2696
682: 00000aa4: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
683: 00000aa8: 00000097: STI  0x000000 (D   0)           # Enable Interrupt
684: 00000aac: 00042c08: LEAG 0x00042c (D1068)           # ra = pc+1068
685: 00000ab0: 0000009d: PSHA 0x000000 (D   0)           # push ra
686: 00000ab4: fffcb805: JSR  0xfffcb8 (D-840)           # Call label100 0x100076c=pc+-840
687: 00000ab8: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
688: 00000abc: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
689: 00000ac0: 00000440: SL   0x000004 (D   4)           # uint(sp[0x4=4]) = ra
690: 00000ac4: 0027109e: PSHI 0x002710 (D10000)           # push 0x2710=10000
691: 00000ac8: fff56405: JSR  0xfff564 (D-2716)           # Call label101 0x100002c=pc+-2716
692: 00000acc: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
693: 00000ad0: 00000c03: JMP  0x00000c (D  12)           # Jmp label102 0xadc=pc+12
694: 00000ad4: 0000040e: LL   0x000004 (D   4) # label103  # ra = uint(sp[0x4=4])
695: 00000ad8: ffffff57: SUBI 0xffffff (D  -1)           # ra = ra - rb
696: 00000adc: 00000440: SL   0x000004 (D   4)           # uint(sp[0x4=4]) = ra
697: 00000ae0: 0064f015: LG   0x0064f0 (D25840) # label102  # ra = uint(gaddr[0x6fd0=28624=pc+25840])
698: 00000ae4: ffffec84: BZ   0xffffec (D -20)           # Cond goto label103
699: 00000ae8: 0000040e: LL   0x000004 (D   4)           # ra = uint(sp[0x4=4])
700: 00000aec: 0000009d: PSHA 0x000000 (D   0)           # push ra
701: 00000af0: 0003f608: LEAG 0x0003f6 (D1014)           # ra = pc+1014
702: 00000af4: 0000009d: PSHA 0x000000 (D   0)           # push ra
703: 00000af8: fffc7405: JSR  0xfffc74 (D-908)           # Call label104 0x100076c=pc+-908
704: 00000afc: 00001001: ENT  0x000010 (D  16)           # sp += 0x10=16
705: 00000b00: 0003f308: LEAG 0x0003f3 (D1011)           # ra = pc+1011
706: 00000b04: 0000009d: PSHA 0x000000 (D   0)           # push ra
707: 00000b08: fffc6405: JSR  0xfffc64 (D-924)           # Call label105 0x100076c=pc+-924
708: 00000b0c: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
709: 00000b10: ffffffff: illegal instr 
710: 00000b14: 0003fb08: LEAG 0x0003fb (D1019)           # ra = pc+1019
711: 00000b18: 0000009d: PSHA 0x000000 (D   0)           # push ra
712: 00000b1c: fffc5005: JSR  0xfffc50 (D-944)           # Call label106 0x100076c=pc+-944
713: 00000b20: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
714: 00000b24: 0003f208: LEAG 0x0003f2 (D1010)           # ra = pc+1010
715: 00000b28: 0000009d: PSHA 0x000000 (D   0)           # push ra
716: 00000b2c: fffc4005: JSR  0xfffc40 (D-960)           # Call label107 0x100076c=pc+-960
717: 00000b30: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
718: 00000b34: 00002023: LI   0x000020 (D  32)           # ra = uint(0x20=32)
719: 00000b38: 00000024: LHI  0x000000 (D   0)           # ra = 
720: 00000b3c: 0000001c: LX   0x000000 (D   0)           # ra = uint(ra[0x0=0])
721: 00000b40: 00000440: SL   0x000004 (D   4)           # uint(sp[0x4=4]) = ra
722: 00000b44: 0003ef08: LEAG 0x0003ef (D1007)           # ra = pc+1007
723: 00000b48: 0000009d: PSHA 0x000000 (D   0)           # push ra
724: 00000b4c: fffc2005: JSR  0xfffc20 (D-992)           # Call label108 0x100076c=pc+-992
725: 00000b50: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
726: 00000b54: 0003e608: LEAG 0x0003e6 (D 998)           # ra = pc+998
727: 00000b58: 0000009d: PSHA 0x000000 (D   0)           # push ra
728: 00000b5c: fffc1005: JSR  0xfffc10 (D-1008)           # Call label109 0x100076c=pc+-1008
729: 00000b60: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
730: 00000b64: 00000a23: LI   0x00000a (D  10)           # ra = uint(0xa=10)
731: 00000b68: 00000440: SL   0x000004 (D   4)           # uint(sp[0x4=4]) = ra
732: 00000b6c: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
733: 00000b70: 00000040: SL   0x000000 (D   0)           # uint(sp[0x0=0]) = ra
734: 00000b74: 0000040e: LL   0x000004 (D   4)           # ra = uint(sp[0x4=4])
735: 00000b78: 0000005e: DIVL 0x000000 (D   0)           # ra = int(ra) / 0
736: 00000b7c: 00000440: SL   0x000004 (D   4)           # uint(sp[0x4=4]) = ra
737: 00000b80: 0003d108: LEAG 0x0003d1 (D 977)           # ra = pc+977
738: 00000b84: 0000009d: PSHA 0x000000 (D   0)           # push ra
739: 00000b88: fffbe405: JSR  0xfffbe4 (D-1052)           # Call label110 0x100076c=pc+-1052
740: 00000b8c: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
741: 00000b90: 0003c808: LEAG 0x0003c8 (D 968)           # ra = pc+968
742: 00000b94: 0000009d: PSHA 0x000000 (D   0)           # push ra
743: 00000b98: fffbd405: JSR  0xfffbd4 (D-1068)           # Call label111 0x100076c=pc+-1068
744: 00000b9c: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
745: 00000ba0: 40000023: LI   0x400000 (D4194304)           # ra = uint(0x400000=4194304)
746: 00000ba4: 0000009c: SSP  0x000000 (D   0)           # kenel_sp=ra
747: 00000ba8: fffd6805: JSR  0xfffd68 (D-664)           # Call label112 0x1000910=pc+-664
748: 00000bac: 0003bb08: LEAG 0x0003bb (D 955)           # ra = pc+955
749: 00000bb0: 0000009d: PSHA 0x000000 (D   0)           # push ra
750: 00000bb4: fffbb805: JSR  0xfffbb8 (D-1096)           # Call label113 0x100076c=pc+-1096
751: 00000bb8: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
752: 00000bbc: 0003be08: LEAG 0x0003be (D 958)           # ra = pc+958
753: 00000bc0: 0000009d: PSHA 0x000000 (D   0)           # push ra
754: 00000bc4: fffba805: JSR  0xfffba8 (D-1112)           # Call label114 0x100076c=pc+-1112
755: 00000bc8: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
756: 00000bcc: 0063f415: LG   0x0063f4 (D25588)           # ra = uint(gaddr[0x6fc0=28608=pc+25588])
757: 00000bd0: 0000c854: ADDI 0x0000c8 (D 200)           # ra = ra + rb
758: 00000bd4: 0000003e: LBA  0x000000 (D   0)           # rb=ra 
759: 00000bd8: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
760: 00000bdc: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
761: 00000be0: 0063dc15: LG   0x0063dc (D25564)           # ra = uint(gaddr[0x6fbc=28604=pc+25564])
762: 00000be4: 0000009d: PSHA 0x000000 (D   0)           # push ra
763: 00000be8: fff45005: JSR  0xfff450 (D-2992)           # Call label115 0x1000038=pc+-2992
764: 00000bec: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
765: 00000bf0: 03200023: LI   0x032000 (D204800)           # ra = uint(0x32000=204800)
766: 00000bf4: 0000001c: LX   0x000000 (D   0)           # ra = uint(ra[0x0=0])
767: 00000bf8: 00000440: SL   0x000004 (D   4)           # uint(sp[0x4=4]) = ra
768: 00000bfc: 00039608: LEAG 0x000396 (D 918)           # ra = pc+918
769: 00000c00: 0000009d: PSHA 0x000000 (D   0)           # push ra
770: 00000c04: fffb6805: JSR  0xfffb68 (D-1176)           # Call label116 0x100076c=pc+-1176
771: 00000c08: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
772: 00000c0c: 00038d08: LEAG 0x00038d (D 909)           # ra = pc+909
773: 00000c10: 0000009d: PSHA 0x000000 (D   0)           # push ra
774: 00000c14: fffb5805: JSR  0xfffb58 (D-1192)           # Call label117 0x100076c=pc+-1192
775: 00000c18: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
776: 00000c1c: 03200023: LI   0x032000 (D204800)           # ra = uint(0x32000=204800)
777: 00000c20: 0000003e: LBA  0x000000 (D   0)           # rb=ra 
778: 00000c24: 00000523: LI   0x000005 (D   5)           # ra = uint(0x5=5)
779: 00000c28: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
780: 00000c2c: 00038608: LEAG 0x000386 (D 902)           # ra = pc+902
781: 00000c30: 0000009d: PSHA 0x000000 (D   0)           # push ra
782: 00000c34: fffb3805: JSR  0xfffb38 (D-1224)           # Call label118 0x100076c=pc+-1224
783: 00000c38: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
784: 00000c3c: 0000009e: PSHI 0x000000 (D   0)           # push 0x0=0
785: 00000c40: fff41005: JSR  0xfff410 (D-3056)           # Call label119 0x1000050=pc+-3056
786: 00000c44: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
787: 00000c48: 00000802: LEV  0x000008 (D   8)           # pc=*sp, sp += 8 + 8 (return) 
788: 00000c4c: 00000000: HALT 0x000000 (D   0)           # System Halt
=======================================================================
Data Segment
Address     Hex									 | Char
0x00000c50	28 6e 75 6c	6c 29 00 00	4c fd ff ffffffff	d0 ff ff ffffffff	 | (null)..L.......
0x00000c60	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000c70	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000c80	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000c90	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000ca0	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000cb0	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000cc0	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000cd0	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000ce0	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000cf0	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000d00	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000d10	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000d20	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000d30	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000d40	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000d50	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000d60	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000d70	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000d80	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000d90	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000da0	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000db0	d0 ff ff ffffffff	d0 ff ff ffffffff	38 ff ff ffffffff	d0 ff ff ffffffff	 | ........8.......
0x00000dc0	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000dd0	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000de0	d0 ff ff ffffffff	84 fd ff ffffffff	3c fe ff ffffffff	d0 ff ff ffffffff	 | ........<.......
0x00000df0	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000e00	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	d0 ff ff ffffffff	 | ................
0x00000e10	d0 ff ff ffffffff	bc fe ff ffffffff	20 ff ff ffffffff	d0 ff ff ffffffff	 | ........ .......
0x00000e20	d0 ff ff ffffffff	d0 fd ff ffffffff	d0 ff ff ffffffff	24 fe ff ffffffff	 | ............$...
0x00000e30	d0 ff ff ffffffff	d0 ff ff ffffffff	38 ff ff ffffffff	54 52 41 50	 | ........8...TRAP
0x00000e40	3a 20 00 46	49 4e 53 54	00 46 52 50	41 47 45 20	 | : .FINST.FRPAGE 
0x00000e50	5b 30 78 25	30 38 78 5d	00 46 57 50	41 47 45 20	 | [0x%08x].FWPAGE 
0x00000e60	5b 30 78 25	30 38 78 5d	00 46 49 50	41 47 45 20	 | [0x%08x].FIPAGE 
0x00000e70	5b 30 78 25	30 38 78 5d	00 46 53 59	53 00 46 41	 | [0x%08x].FSYS.FA
0x00000e80	52 49 54 48	00 46 4d 45	4d 20 5b 30	78 25 30 38	 | RITH.FMEM [0x%08
0x00000e90	78 5d 00 46	54 49 4d 45	52 00 46 4b	45 59 42 44	 | x].FTIMER.FKEYBD
0x00000ea0	20 5b 25 63	5d 00 6f 74	68 65 72 20	5b 25 64 5d	 |  [%c].other [%d]
0x00000eb0	00 00 00 00	6c ff ff ffffffff	88 ff ff ffffffff	b0 ff ff ffffffff	 | ....l...........
0x00000ec0	d4 ff ff ffffffff	dc fe ff ffffffff	44 ff ff ffffffff	58 ff ff ffffffff	 | ........D...X...
0x00000ed0	28 ff ff ffffffff	0c ff ff ffffffff	f0 fe ff ffffffff	74 65 73 74	 | (...........test
0x00000ee0	20 74 69 6d	65 72 2e 2e	2e 00 28 74	3d 25 64 29	 |  timer....(t=%d)
0x00000ef0	2e 2e 2e 6f	6b 0a 00 74	65 73 74 20	69 6e 76 61	 | ...ok..test inva
0x00000f00	6c 69 64 20	69 6e 73 74	72 75 63 74	69 6f 6e 2e	 | lid instruction.
0x00000f10	2e 2e 00 2e	2e 2e 6f 6b	0a 00 74 65	73 74 20 62	 | ......ok..test b
0x00000f20	61 64 20 70	68 79 73 69	63 61 6c 20	61 64 64 72	 | ad physical addr
0x00000f30	65 73 73 2e	2e 2e 00 2e	2e 2e 6f 6b	0a 00 74 65	 | ess.......ok..te
0x00000f40	73 74 20 64	69 76 69 64	65 20 62 79	20 7a 65 72	 | st divide by zer
0x00000f50	6f 2e 2e 2e	00 2e 2e 2e	6f 6b 0a 00	74 65 73 74	 | o.......ok..test
0x00000f60	20 70 61 67	69 6e 67 2e	2e 2e 00 69	64 65 6e 74	 |  paging....ident
0x00000f70	69 74 79 20	6d 61 70 2e	2e 2e 6f 6b	0a 00 74 65	 | ity map...ok..te
0x00000f80	73 74 20 70	61 67 65 20	66 61 75 6c	74 20 72 65	 | st page fault re
0x00000f90	61 64 2e 2e	2e 00 2e 2e	2e 6f 6b 0a	00 74 65 73	 | ad.......ok..tes
0x00000fa0	74 20 70 61	67 65 20 66	61 75 6c 74	20 77 72 69	 | t page fault wri
0x00000fb0	74 65 2e 2e	2e 00 2e 2e	2e 6f 6b 0a	00 00 00 00	 | te.......ok.....
