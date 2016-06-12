No.:   Addr:    Value:  Intr  Operand  (Dec Format) #Label_id #Meaning
=======================================================================
  1: 00000000: 0000080e: LL   0x000008 (D   8) # label23  # ra = uint(sp[0x8=8])
  2: 00000004: 00001026: LBL  0x000010 (D  16)           # rb = uint(sp[0x10=16])
  3: 00000008: 0000009a: BOUT 0x000000 (D   0)           # write(ra, &rb, 1)
  4: 0000000c: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
  5: 00000010: 0000080e: LL   0x000008 (D   8) # label35  # ra = uint(sp[0x8=8])
  6: 00000014: 000000a4: IVEC 0x000000 (D   0)           # intr vec addr = ra

  7: 00000018: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
  8: 0000001c: 0000080e: LL   0x000008 (D   8) # label34  # ra = uint(sp[0x8=8])
  9: 00000020: 000000a7: TIME 0x000000 (D   0)           # timer's timeout =ra
 10: 00000024: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 11: 00000028: 0000080e: LL   0x000008 (D   8) # label13  # ra = uint(sp[0x8=8])
 12: 0000002c: 00000000: HALT 0x000000 (D   0)           # System Halt
 13: 00000030: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 14: 00000034: fffff801: ENT  0xfffff8 (D  -8) # label29  # sp += 0xfffff8=-8
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
 35: 00000088: 0000080e: LL   0x000008 (D   8) # label12  # ra = uint(sp[0x8=8])
 36: 0000008c: 00001026: LBL  0x000010 (D  16)           # rb = uint(sp[0x10=16])
 37: 00000090: 000018ac: LCL  0x000018 (D  24)           # rc = *(uint *)(sp + imme)
 38: 00000094: 000005a9: TRAP 0x000005 (D   5)           #trap = FSYS for syscall
 39: 00000098: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 40: 0000009c: 00001803: JMP  0x000018 (D  24)           # Jmp label4 0xb4=pc+24
 41: 000000a0: 0000029e: PSHI 0x000002 (D   2) # label6  # push 0x2=2
 42: 000000a4: 00039008: LEAG 0x000390 (D 912)           # ra = pc+912
 43: 000000a8: 0000009d: PSHA 0x000000 (D   0)           # push ra
 44: 000000ac: 0000019e: PSHI 0x000001 (D   1)           # push 0x1=1
 45: 000000b0: ffffd405: JSR  0xffffd4 (D -44)           # Call label5 0x1000084=pc+-44
 46: 000000b4: 00001801: ENT  0x000018 (D  24)           # sp += 0x18=24
 47: 000000b8: 0013ec15: LG   0x0013ec (D5100) # label4  # ra = uint(gaddr[0x14a4=5284=pc+5100])
 48: 000000bc: 00000a3b: LBI  0x00000a (D  10)           # rb = uint(0xa=10)
 49: 000000c0: ffffdc8c: BLT  0xffffdc (D -36)           # Cond goto label6
 50: 000000c4: 00000b9e: PSHI 0x00000b (D  11)           # push 0xb=11
 51: 000000c8: 00036f08: LEAG 0x00036f (D 879)           # ra = pc+879
 52: 000000cc: 0000009d: PSHA 0x000000 (D   0)           # push ra
 53: 000000d0: 0000019e: PSHI 0x000001 (D   1)           # push 0x1=1
 54: 000000d4: ffffb005: JSR  0xffffb0 (D -80)           # Call label7 0x1000084=pc+-80
 55: 000000d8: 00001801: ENT  0x000018 (D  24)           # sp += 0x18=24
 56: 000000dc: 0000009e: PSHI 0x000000 (D   0)           # push 0x0=0
 57: 000000e0: ffff4405: JSR  0xffff44 (D-188)           # Call label8 0x1000024=pc+-188
 58: 000000e4: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
 59: 000000e8: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 60: 000000ec: 00001803: JMP  0x000018 (D  24)           # Jmp label9 0x104=pc+24
 61: 000000f0: 0000029e: PSHI 0x000002 (D   2) # label11  # push 0x2=2
 62: 000000f4: 00034f08: LEAG 0x00034f (D 847)           # ra = pc+847
 63: 000000f8: 0000009d: PSHA 0x000000 (D   0)           # push ra
 64: 000000fc: 0000019e: PSHI 0x000001 (D   1)           # push 0x1=1
 65: 00000100: ffff8405: JSR  0xffff84 (D-124)           # Call label10 0x1000084=pc+-124
 66: 00000104: 00001801: ENT  0x000018 (D  24)           # sp += 0x18=24
 67: 00000108: 00139c15: LG   0x00139c (D5020) # label9  # ra = uint(gaddr[0x14a4=5284=pc+5020])
 68: 0000010c: 00000a3b: LBI  0x00000a (D  10)           # rb = uint(0xa=10)
 69: 00000110: ffffdc8c: BLT  0xffffdc (D -36)           # Cond goto label11
 70: 00000114: 00000b9e: PSHI 0x00000b (D  11)           # push 0xb=11
 71: 00000118: 00032e08: LEAG 0x00032e (D 814)           # ra = pc+814
 72: 0000011c: 0000009d: PSHA 0x000000 (D   0)           # push ra
 73: 00000120: 0000019e: PSHI 0x000001 (D   1)           # push 0x1=1
 74: 00000124: ffff6005: JSR  0xffff60 (D-160)           # Call label12 0x1000084=pc+-160
 75: 00000128: 00001801: ENT  0x000018 (D  24)           # sp += 0x18=24
 76: 0000012c: 0000009e: PSHI 0x000000 (D   0)           # push 0x0=0
 77: 00000130: fffef405: JSR  0xfffef4 (D-268)           # Call label13 0x1000024=pc+-268
 78: 00000134: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
 79: 00000138: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 80: 0000013c: 00000007: LEA  0x000000 (D   0) # label27  # ra = sp+0
 81: 00000140: 00000826: LBL  0x000008 (D   8)           # rb = uint(sp[0x8=8])
 82: 00000144: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
 83: 00000148: 0000100e: LL   0x000010 (D  16)           # ra = uint(sp[0x10=16])
 84: 0000014c: 0000009c: SSP  0x000000 (D   0)           # kenel_sp=ra
 85: 00000150: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
 86: 00000154: 0000280e: LL   0x000028 (D  40) # label33  # ra = uint(sp[0x28=40])
 87: 00000158: 0000e403: JMP  0x0000e4 (D 228)           # Jmp label14 0x23c=pc+228
 88: 0000015c: 0000300e: LL   0x000030 (D  48)           # ra = uint(sp[0x30=48])
 89: 00000160: fffffc1c: LX   0xfffffc (D  -4)           # ra = uint(ra[0xfffffc=16777212])
 90: 00000164: 00000878: SRUI 0x000008 (D   8)           # ra = uint(ra) >> rb #  = ra
 91: 00000168: 00004803: JMP  0x000048 (D  72)           # Jmp label15 0x1b0=pc+72
 92: 0000016c: 0000100e: LL   0x000010 (D  16)           # ra = uint(sp[0x10=16])
 93: 00000170: 0000009d: PSHA 0x000000 (D   0)           # push ra
 94: 00000174: 0000200e: LL   0x000020 (D  32)           # ra = uint(sp[0x20=32])
 95: 00000178: 0000009d: PSHA 0x000000 (D   0)           # push ra
 96: 0000017c: 0000300e: LL   0x000030 (D  48)           # ra = uint(sp[0x30=48])
 97: 00000180: 0000009d: PSHA 0x000000 (D   0)           # push ra
 98: 00000184: fffeac05: JSR  0xfffeac (D-340)           # Call label16 0x1000030=pc+-340
 99: 00000188: 00001801: ENT  0x000018 (D  24)           # sp += 0x18=24
100: 0000018c: 00002040: SL   0x000020 (D  32)           # uint(sp[0x20=32]) = ra
101: 00000190: 00002c03: JMP  0x00002c (D  44)           # Jmp label17 0x1bc=pc+44
102: 00000194: 0000179e: PSHI 0x000017 (D  23) # label20  # push 0x17=23
103: 00000198: 0002ba08: LEAG 0x0002ba (D 698)           # ra = pc+698
104: 0000019c: 0000009d: PSHA 0x000000 (D   0)           # push ra
105: 000001a0: 0000019e: PSHI 0x000001 (D   1)           # push 0x1=1
106: 000001a4: fffe8c05: JSR  0xfffe8c (D-372)           # Call label18 0x1000030=pc+-372
107: 000001a8: 00001801: ENT  0x000018 (D  24)           # sp += 0x18=24
108: 000001ac: 00000000: HALT 0x000000 (D   0)           # System Halt
109: 000001b0: 00000c03: JMP  0x00000c (D  12)           # Jmp label19 0x1bc=pc+12
110: 000001b4: 0000063b: LBI  0x000006 (D   6) # label15  # rb = uint(0x6=6)
111: 000001b8: ffffd890: BGEU 0xffffd8 (D -40)           # Cond goto label20
112: 000001bc: 0002b004: JMPI 0x0002b0 (D 688)           # Jmp label21 0x46c=pc+688
113: 000001c0: 00008803: JMP  0x000088 (D 136) # label19  # Jmp label22 0x248=pc+136
114: 000001c4: 0000789e: PSHI 0x000078 (D 120)           # push 0x78=120
115: 000001c8: 0000019e: PSHI 0x000001 (D   1)           # push 0x1=1
116: 000001cc: fffe3005: JSR  0xfffe30 (D-464)           # Call label23 0xfffffc=pc+-464
117: 000001d0: 00001001: ENT  0x000010 (D  16)           # sp += 0x10=16
118: 000001d4: 0012d015: LG   0x0012d0 (D4816)           # ra = uint(gaddr[0x14a4=5284=pc+4816])
119: 000001d8: 00000154: ADDI 0x000001 (D   1)           # ra = ra + rb
120: 000001dc: 0012c845: SG   0x0012c8 (D4808)           # uint(gaddr[0x14a4=5284=pc+4808]) = ra
121: 000001e0: 00000169: ANDI 0x000001 (D   1)           # ra = ra & rb
122: 000001e4: 00001c84: BZ   0x00001c (D  28)           # Cond goto label24
123: 000001e8: 0012b815: LG   0x0012b8 (D4792)           # ra = uint(gaddr[0x14a0=5280=pc+4792])
124: 000001ec: 0000009d: PSHA 0x000000 (D   0)           # push ra
125: 000001f0: 0012ac08: LEAG 0x0012ac (D4780)           # ra = pc+4780
126: 000001f4: 0000009d: PSHA 0x000000 (D   0)           # push ra
127: 000001f8: ffff4005: JSR  0xffff40 (D-192)           # Call label25 0x1000138=pc+-192
128: 000001fc: 00001001: ENT  0x000010 (D  16)           # sp += 0x10=16
129: 00000200: 00001803: JMP  0x000018 (D  24)           # Jmp label26 0x218=pc+24
130: 00000204: 00129815: LG   0x001298 (D4760) # label24  # ra = uint(gaddr[0x149c=5276=pc+4760])
131: 00000208: 0000009d: PSHA 0x000000 (D   0)           # push ra
132: 0000020c: 00129408: LEAG 0x001294 (D4756)           # ra = pc+4756
133: 00000210: 0000009d: PSHA 0x000000 (D   0)           # push ra
134: 00000214: ffff2405: JSR  0xffff24 (D-220)           # Call label27 0x1000138=pc+-220
135: 00000218: 00001001: ENT  0x000010 (D  16)           # sp += 0x10=16
136: 0000021c: 00002c03: JMP  0x00002c (D  44) # label26  # Jmp label28 0x248=pc+44
137: 00000220: 0000199e: PSHI 0x000019 (D  25) # label31  # push 0x19=25
138: 00000224: 00026008: LEAG 0x000260 (D 608)           # ra = pc+608
139: 00000228: 0000009d: PSHA 0x000000 (D   0)           # push ra
140: 0000022c: 0000019e: PSHI 0x000001 (D   1)           # push 0x1=1
141: 00000230: fffe0005: JSR  0xfffe00 (D-512)           # Call label29 0x1000030=pc+-512
142: 00000234: 00001801: ENT  0x000018 (D  24)           # sp += 0x18=24
143: 00000238: 00000000: HALT 0x000000 (D   0)           # System Halt
144: 0000023c: 00000c03: JMP  0x00000c (D  12)           # Jmp label30 0x248=pc+12
145: 00000240: 0000163b: LBI  0x000016 (D  22) # label14  # rb = uint(0x16=22)
146: 00000244: ffffd890: BGEU 0xffffd8 (D -40)           # Cond goto label31
147: 00000248: 00025804: JMPI 0x000258 (D 600)           # Jmp label32 0x4a0=pc+600
148: 0000024c: 00000002: LEV  0x000000 (D   0) # label30  # pc=*sp, sp += 0 + 8 (return) 
149: 00000250: 0000009d: PSHA 0x000000 (D   0)           # push ra
150: 00000254: 000000a0: PSHB 0x000000 (D   0)           # push rb
151: 00000258: 000000ae: PSHC 0x000000 (D   0)           # push rc
152: 0000025c: 000000aa: LUSP 0x000000 (D   0)           # ra= user_sp 
153: 00000260: 0000009d: PSHA 0x000000 (D   0)           # push ra
154: 00000264: fffeec05: JSR  0xfffeec (D-276)           # Call label33 0x1000150=pc+-276
155: 00000268: 000000a3: POPA 0x000000 (D   0)           # pop ra
156: 0000026c: 000000ab: SUSP 0x000000 (D   0)           # user_sp=ra 
157: 00000270: 000000af: POPC 0x000000 (D   0)           # pop rc
158: 00000274: 000000a1: POPB 0x000000 (D   0)           # pop rb
159: 00000278: 000000a3: POPA 0x000000 (D   0)           # pop ra
160: 0000027c: 00000098: RTI  0x000000 (D   0)           # POP fault code|pc|sp
161: 00000280: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
162: 00000284: 000000a3: POPA 0x000000 (D   0)           # pop ra
163: 00000288: 000000ab: SUSP 0x000000 (D   0)           # user_sp=ra 
164: 0000028c: 000000af: POPC 0x000000 (D   0)           # pop rc
165: 00000290: 000000a1: POPB 0x000000 (D   0)           # pop rb
166: 00000294: 000000a3: POPA 0x000000 (D   0)           # pop ra
167: 00000298: 00000098: RTI  0x000000 (D   0)           # POP fault code|pc|sp
168: 0000029c: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
169: 000002a0: fffff801: ENT  0xfffff8 (D  -8) # <=ENTRY           # sp += 0xfffff8=-8
170: 000002a4: 0013889e: PSHI 0x001388 (D5000)           # push 0x1388=5000
171: 000002a8: fffd7005: JSR  0xfffd70 (D-656)           # Call label34 0x1000018=pc+-656
172: 000002ac: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
173: 000002b0: ffff9c08: LEAG 0xffff9c (D-100)           # ra = pc+16777116
174: 000002b4: 0000009d: PSHA 0x000000 (D   0)           # push ra
175: 000002b8: fffd5405: JSR  0xfffd54 (D-684)           # Call label35 0x100000c=pc+-684
176: 000002bc: 00000801: ENT  0x000008 (D   8)           # sp += 0x8=8
177: 000002c0: 000a0c08: LEAG 0x000a0c (D2572)           # ra = pc+2572
178: 000002c4: 0011d845: SG   0x0011d8 (D4568)           # uint(gaddr[0x149c=5276=pc+4568]) = ra
179: 000002c8: 0011d415: LG   0x0011d4 (D4564)           # ra = uint(gaddr[0x149c=5276=pc+4564])
180: 000002cc: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
181: 000002d0: 0011cc45: SG   0x0011cc (D4556)           # uint(gaddr[0x149c=5276=pc+4556]) = ra
182: 000002d4: fffdc408: LEAG 0xfffdc4 (D-572)           # ra = pc+16776644
183: 000002d8: 0011c42d: LBG  0x0011c4 (D4548)           # rb = uint(gaddr[0x149c=5276=pc+4548])
184: 000002dc: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
185: 000002e0: 0011bc15: LG   0x0011bc (D4540)           # ra = uint(gaddr[0x149c=5276=pc+4540])
186: 000002e4: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
187: 000002e8: 0011b445: SG   0x0011b4 (D4532)           # uint(gaddr[0x149c=5276=pc+4532]) = ra
188: 000002ec: 00001023: LI   0x000010 (D  16)           # ra = uint(0x10=16)
189: 000002f0: 0011ac2d: LBG  0x0011ac (D4524)           # rb = uint(gaddr[0x149c=5276=pc+4524])
190: 000002f4: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
191: 000002f8: 0011a415: LG   0x0011a4 (D4516)           # ra = uint(gaddr[0x149c=5276=pc+4516])
192: 000002fc: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
193: 00000300: 00119c45: SG   0x00119c (D4508)           # uint(gaddr[0x149c=5276=pc+4508]) = ra
194: 00000304: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
195: 00000308: 0011942d: LBG  0x001194 (D4500)           # rb = uint(gaddr[0x149c=5276=pc+4500])
196: 0000030c: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
197: 00000310: 00118c15: LG   0x00118c (D4492)           # ra = uint(gaddr[0x149c=5276=pc+4492])
198: 00000314: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
199: 00000318: 00118445: SG   0x001184 (D4484)           # uint(gaddr[0x149c=5276=pc+4484]) = ra
200: 0000031c: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
201: 00000320: 00117c2d: LBG  0x00117c (D4476)           # rb = uint(gaddr[0x149c=5276=pc+4476])
202: 00000324: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
203: 00000328: 00117415: LG   0x001174 (D4468)           # ra = uint(gaddr[0x149c=5276=pc+4468])
204: 0000032c: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
205: 00000330: 00116c45: SG   0x00116c (D4460)           # uint(gaddr[0x149c=5276=pc+4460]) = ra
206: 00000334: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
207: 00000338: 0011642d: LBG  0x001164 (D4452)           # rb = uint(gaddr[0x149c=5276=pc+4452])
208: 0000033c: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
209: 00000340: 00115c15: LG   0x00115c (D4444)           # ra = uint(gaddr[0x149c=5276=pc+4444])
210: 00000344: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
211: 00000348: 00115445: SG   0x001154 (D4436)           # uint(gaddr[0x149c=5276=pc+4436]) = ra
212: 0000034c: 00059808: LEAG 0x000598 (D1432)           # ra = pc+1432
213: 00000350: 00114c2d: LBG  0x00114c (D4428)           # rb = uint(gaddr[0x149c=5276=pc+4428])
214: 00000354: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
215: 00000358: 00114415: LG   0x001144 (D4420)           # ra = uint(gaddr[0x149c=5276=pc+4420])
216: 0000035c: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
217: 00000360: 00113c45: SG   0x00113c (D4412)           # uint(gaddr[0x149c=5276=pc+4412]) = ra
218: 00000364: ffff1c08: LEAG 0xffff1c (D-228)           # ra = pc+16776988
219: 00000368: 0011342d: LBG  0x001134 (D4404)           # rb = uint(gaddr[0x149c=5276=pc+4404])
220: 0000036c: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
221: 00000370: 00112c08: LEAG 0x00112c (D4396)           # ra = pc+4396
222: 00000374: 00112c45: SG   0x00112c (D4396)           # uint(gaddr[0x14a0=5280=pc+4396]) = ra
223: 00000378: 00112815: LG   0x001128 (D4392)           # ra = uint(gaddr[0x14a0=5280=pc+4392])
224: 0000037c: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
225: 00000380: 00112045: SG   0x001120 (D4384)           # uint(gaddr[0x14a0=5280=pc+4384]) = ra
226: 00000384: fffd6408: LEAG 0xfffd64 (D-668)           # ra = pc+16776548
227: 00000388: 0011182d: LBG  0x001118 (D4376)           # rb = uint(gaddr[0x14a0=5280=pc+4376])
228: 0000038c: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
229: 00000390: 00111015: LG   0x001110 (D4368)           # ra = uint(gaddr[0x14a0=5280=pc+4368])
230: 00000394: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
231: 00000398: 00110845: SG   0x001108 (D4360)           # uint(gaddr[0x14a0=5280=pc+4360]) = ra
232: 0000039c: 00001023: LI   0x000010 (D  16)           # ra = uint(0x10=16)
233: 000003a0: 0011002d: LBG  0x001100 (D4352)           # rb = uint(gaddr[0x14a0=5280=pc+4352])
234: 000003a4: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
235: 000003a8: 0010f815: LG   0x0010f8 (D4344)           # ra = uint(gaddr[0x14a0=5280=pc+4344])
236: 000003ac: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
237: 000003b0: 0010f045: SG   0x0010f0 (D4336)           # uint(gaddr[0x14a0=5280=pc+4336]) = ra
238: 000003b4: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
239: 000003b8: 0010e82d: LBG  0x0010e8 (D4328)           # rb = uint(gaddr[0x14a0=5280=pc+4328])
240: 000003bc: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
241: 000003c0: 0010e015: LG   0x0010e0 (D4320)           # ra = uint(gaddr[0x14a0=5280=pc+4320])
242: 000003c4: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
243: 000003c8: 0010d845: SG   0x0010d8 (D4312)           # uint(gaddr[0x14a0=5280=pc+4312]) = ra
244: 000003cc: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
245: 000003d0: 0010d02d: LBG  0x0010d0 (D4304)           # rb = uint(gaddr[0x14a0=5280=pc+4304])
246: 000003d4: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
247: 000003d8: 0010c815: LG   0x0010c8 (D4296)           # ra = uint(gaddr[0x14a0=5280=pc+4296])
248: 000003dc: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
249: 000003e0: 0010c045: SG   0x0010c0 (D4288)           # uint(gaddr[0x14a0=5280=pc+4288]) = ra
250: 000003e4: 00000023: LI   0x000000 (D   0)           # ra = uint(0x0=0)
251: 000003e8: 0010b82d: LBG  0x0010b8 (D4280)           # rb = uint(gaddr[0x14a0=5280=pc+4280])
252: 000003ec: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
253: 000003f0: 0010b015: LG   0x0010b0 (D4272)           # ra = uint(gaddr[0x14a0=5280=pc+4272])
254: 000003f4: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
255: 000003f8: 0010a845: SG   0x0010a8 (D4264)           # uint(gaddr[0x14a0=5280=pc+4264]) = ra
256: 000003fc: 000cb808: LEAG 0x000cb8 (D3256)           # ra = pc+3256
257: 00000400: 0010a02d: LBG  0x0010a0 (D4256)           # rb = uint(gaddr[0x14a0=5280=pc+4256])
258: 00000404: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
259: 00000408: 00109815: LG   0x001098 (D4248)           # ra = uint(gaddr[0x14a0=5280=pc+4248])
260: 0000040c: 00000857: SUBI 0x000008 (D   8)           # ra = ra - rb
261: 00000410: 00109045: SG   0x001090 (D4240)           # uint(gaddr[0x14a0=5280=pc+4240]) = ra
262: 00000414: fffe6c08: LEAG 0xfffe6c (D-404)           # ra = pc+16776812
263: 00000418: 0010882d: LBG  0x001088 (D4232)           # rb = uint(gaddr[0x14a0=5280=pc+4232])
264: 0000041c: 0000004a: SX   0x000000 (D   0)           # uint(ra[0x0=0]) = ra
265: 00000420: 00107c15: LG   0x00107c (D4220)           # ra = uint(gaddr[0x149c=5276=pc+4220])
266: 00000424: 00000440: SL   0x000004 (D   4)           # uint(sp[0x4=4]) = ra
267: 00000428: 0000040e: LL   0x000004 (D   4)           # ra = uint(sp[0x4=4])
268: 0000042c: 0000009c: SSP  0x000000 (D   0)           # kenel_sp=ra
269: 00000430: 00000002: LEV  0x000000 (D   0)           # pc=*sp, sp += 0 + 8 (return) 
270: 00000434: 00000802: LEV  0x000008 (D   8)           # pc=*sp, sp += 8 + 8 (return) 
=======================================================================
Data Segment
Address     Hex									 | Char
0x00000438	30 30 00 74	61 73 6b 30	20 65 78 69	74 0a 00 31	 | 00.task0 exit..1
0x00000448	31 00 74 61	73 6b 31 20	65 78 69 74	0a 00 70 61	 | 1.task1 exit..pa
0x00000458	6e 69 63 21	20 75 6e 6b	6e 6f 77 6e	20 73 79 73	 | nic! unknown sys
0x00000468	63 61 6c 6c	0a 00 00 00	d4 ff ff ffffffff	d4 ff ff ffffffff	 | call............
0x00000478	d4 ff ff ffffffff	d4 ff ff ffffffff	d4 ff ff ffffffff	ac ff ff ffffffff	 | ................
0x00000488	70 61 6e 69	63 21 20 75	6e 6b 6e 6f	77 6e 20 69	 | panic! unknown i
0x00000498	6e 74 65 72	72 75 70 74	0a 00 00 00	d4 ff ff ffffffff	 | nterrupt........
0x000004a8	78 ff ff ffffffff	d4 ff ff ffffffff	d4 ff ff ffffffff	d4 ff ff ffffffff	 | x...............
0x000004b8	d4 ff ff ffffffff	d4 ff ff ffffffff	d4 ff ff ffffffff	d4 ff ff ffffffff	 | ................
0x000004c8	d4 ff ff ffffffff	d4 ff ff ffffffff	d4 ff ff ffffffff	d4 ff ff ffffffff	 | ................
0x000004d8	d4 ff ff ffffffff	d4 ff ff ffffffff	d4 ff ff ffffffff	d4 ff ff ffffffff	 | ................
0x000004e8	78 ff ff ffffffff	d4 ff ff ffffffff	d4 ff ff ffffffff	d4 ff ff ffffffff	 | x...............
0x000004f8	10 ff ff ffffffff	00 00 00 00	                   	                   	 | ........        
