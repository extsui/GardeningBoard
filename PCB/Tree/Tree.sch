EESchema Schematic File Version 4
LIBS:Tree-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Tree-rescue:HT16K33-28SOP-Garden U1
U 1 1 5C2B207A
P 2550 2750
F 0 "U1" H 2000 3500 50  0000 C CNN
F 1 "HT16K33-28SOP" H 2550 3500 50  0000 C CNN
F 2 "Package_SO:SOIC-28W_7.5x18.7mm_P1.27mm" H 2300 3500 50  0001 C CNN
F 3 "" H 2300 3500 50  0001 C CNN
	1    2550 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5C2C9BBC
P 1400 2200
F 0 "#PWR06" H 1400 1950 50  0001 C CNN
F 1 "GND" H 1405 2027 50  0000 C CNN
F 2 "" H 1400 2200 50  0001 C CNN
F 3 "" H 1400 2200 50  0001 C CNN
	1    1400 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5C2CAF32
P 2450 3650
F 0 "R1" V 2350 3650 50  0000 C CNN
F 1 "39k" V 2450 3650 50  0000 C CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 2380 3650 50  0001 C CNN
F 3 "~" H 2450 3650 50  0001 C CNN
	1    2450 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5C2CAF7E
P 2450 3950
F 0 "R2" V 2350 3950 50  0000 C CNN
F 1 "39k" V 2450 3950 50  0000 C CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 2380 3950 50  0001 C CNN
F 3 "~" H 2450 3950 50  0001 C CNN
	1    2450 3950
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5C2CAFA0
P 2450 4250
F 0 "R3" V 2350 4250 50  0000 C CNN
F 1 "39k" V 2450 4250 50  0000 C CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 2380 4250 50  0001 C CNN
F 3 "~" H 2450 4250 50  0001 C CNN
	1    2450 4250
	0    1    1    0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP1
U 1 1 5C2CB500
P 2800 3650
F 0 "JP1" H 2800 3550 50  0000 C CNN
F 1 "A2" H 2800 3750 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 2800 3650 50  0001 C CNN
F 3 "~" H 2800 3650 50  0001 C CNN
	1    2800 3650
	1    0    0    1   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP2
U 1 1 5C2CB546
P 2800 3950
F 0 "JP2" H 2800 4050 50  0000 C CNN
F 1 "A1" H 2800 3850 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 2800 3950 50  0001 C CNN
F 3 "~" H 2800 3950 50  0001 C CNN
	1    2800 3950
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP3
U 1 1 5C2CB568
P 2800 4250
F 0 "JP3" H 2800 4350 50  0000 C CNN
F 1 "A0" H 2800 4150 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 2800 4250 50  0001 C CNN
F 3 "~" H 2800 4250 50  0001 C CNN
	1    2800 4250
	1    0    0    -1  
$EndComp
Text Notes 2150 1350 0    50   ~ 0
The I2C pull-up resistor is \nexternally attached.
$Comp
L power:+5V #PWR05
U 1 1 5C2CBF57
P 3450 1650
F 0 "#PWR05" H 3450 1500 50  0001 C CNN
F 1 "+5V" H 3465 1823 50  0000 C CNN
F 2 "" H 3450 1650 50  0001 C CNN
F 3 "" H 3450 1650 50  0001 C CNN
	1    3450 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 3950 2200 3950
Wire Wire Line
	2300 4250 2200 4250
Wire Wire Line
	2100 3650 2200 3650
Connection ~ 2200 3650
Wire Wire Line
	2200 3650 2300 3650
Wire Wire Line
	2650 3650 2600 3650
Wire Wire Line
	2600 3950 2650 3950
Wire Wire Line
	2650 4250 2600 4250
Wire Wire Line
	1850 2100 1400 2100
Wire Wire Line
	3250 2100 3450 2100
Wire Wire Line
	3450 2100 3450 1800
Wire Wire Line
	3250 2200 3500 2200
Wire Wire Line
	3250 2300 3500 2300
Wire Wire Line
	2200 6350 2200 6300
Wire Wire Line
	2000 6350 2000 6200
Wire Wire Line
	1600 6350 1600 6000
$Comp
L power:+5V #PWR02
U 1 1 5C2D1124
P 1050 1150
F 0 "#PWR02" H 1050 1000 50  0001 C CNN
F 1 "+5V" H 1065 1323 50  0000 C CNN
F 2 "" H 1050 1150 50  0001 C CNN
F 3 "" H 1050 1150 50  0001 C CNN
	1    1050 1150
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5C2D1EAE
P 1450 1150
F 0 "#PWR04" H 1450 900 50  0001 C CNN
F 1 "GND" H 1455 977 50  0000 C CNN
F 2 "" H 1450 1150 50  0001 C CNN
F 3 "" H 1450 1150 50  0001 C CNN
	1    1450 1150
	1    0    0    -1  
$EndComp
Wire Notes Line
	1750 1450 1750 850 
Wire Notes Line
	1750 850  800  850 
Wire Notes Line
	800  850  800  1450
Wire Notes Line
	800  1450 1750 1450
Text Notes 850  800  0    50   ~ 0
Power Flag
Wire Wire Line
	1850 2200 1750 2200
Wire Wire Line
	1750 2200 1750 3650
Wire Wire Line
	1750 3650 1800 3650
Wire Wire Line
	2950 3650 3350 3650
Wire Wire Line
	3350 3650 3350 2400
Wire Wire Line
	3350 2400 3250 2400
Wire Wire Line
	3250 2500 3450 2500
Wire Wire Line
	3450 2500 3450 3950
Wire Wire Line
	3450 3950 2950 3950
Wire Wire Line
	3250 2600 3550 2600
Wire Wire Line
	2950 4250 3550 4250
Connection ~ 2200 3950
Wire Wire Line
	3550 2600 3550 4250
Wire Wire Line
	2200 3950 2200 4250
Wire Wire Line
	2200 3650 2200 3950
Text GLabel 1600 5900 1    50   Input ~ 0
+5V
Text GLabel 1800 5900 1    50   Input ~ 0
SCL
Text GLabel 2000 5900 1    50   Input ~ 0
SDA
Text GLabel 2200 5900 1    50   Input ~ 0
GND
Text GLabel 3500 2200 2    50   Input ~ 0
SDA
Text GLabel 3500 2300 2    50   Input ~ 0
SCL
Text GLabel 3750 2100 2    50   Input ~ 0
+5V
Text GLabel 1150 2100 0    50   Input ~ 0
GND
Wire Wire Line
	3750 2100 3450 2100
Connection ~ 3450 2100
Wire Wire Line
	1400 2100 1150 2100
Connection ~ 1400 2100
Wire Wire Line
	1400 2200 1400 2100
Wire Wire Line
	1400 2100 1400 1800
Wire Wire Line
	1400 1800 2450 1800
$Comp
L Device:C_Small C1
U 1 1 5C2DF16B
P 2550 1800
F 0 "C1" V 2321 1800 50  0000 C CNN
F 1 "0.1u" V 2412 1800 50  0000 C CNN
F 2 "extsui:C_1608_HandSolderingCustom" H 2550 1800 50  0001 C CNN
F 3 "~" H 2550 1800 50  0001 C CNN
	1    2550 1800
	0    1    1    0   
$EndComp
Wire Wire Line
	2650 1800 3450 1800
Connection ~ 3450 1800
Wire Wire Line
	3450 1800 3450 1650
$Comp
L Device:D_Schottky_ALT D20
U 1 1 5C2E2B2F
P 1950 3650
F 0 "D20" H 1950 3550 50  0000 C CNN
F 1 "D" H 1950 3750 50  0000 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" H 1950 3650 50  0001 C CNN
F 3 "~" H 1950 3650 50  0001 C CNN
	1    1950 3650
	-1   0    0    1   
$EndComp
$Comp
L Device:LED_Small D1
U 1 1 5C2E323A
P 6600 1100
F 0 "D1" H 6600 1200 50  0000 C CNN
F 1 "GLED" H 6800 1200 50  0000 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 6600 1100 50  0001 C CNN
F 3 "~" V 6600 1100 50  0001 C CNN
	1    6600 1100
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D7
U 1 1 5C2E4FE3
P 5700 3500
F 0 "D7" H 5700 3600 50  0000 C CNN
F 1 "GLED" H 5700 3400 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5700 3500 50  0001 C CNN
F 3 "~" V 5700 3500 50  0001 C CNN
	1    5700 3500
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D9
U 1 1 5C2E55DC
P 6900 3500
F 0 "D9" H 6900 3600 50  0000 C CNN
F 1 "GLED" H 6900 3400 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 6900 3500 50  0001 C CNN
F 3 "~" V 6900 3500 50  0001 C CNN
	1    6900 3500
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D3
U 1 1 5C2E7A23
P 6900 1900
F 0 "D3" H 6900 1800 50  0000 C CNN
F 1 "GLED" H 6900 1800 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 6900 1900 50  0001 C CNN
F 3 "~" V 6900 1900 50  0001 C CNN
	1    6900 1900
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D6
U 1 1 5C2E803B
P 7200 2700
F 0 "D6" H 7200 2600 50  0000 C CNN
F 1 "GLED" H 7200 2600 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 7200 2700 50  0001 C CNN
F 3 "~" V 7200 2700 50  0001 C CNN
	1    7200 2700
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D11
U 1 1 5C2E864A
P 5400 4300
F 0 "D11" H 5400 4400 50  0000 C CNN
F 1 "GLED" H 5400 4200 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5400 4300 50  0001 C CNN
F 3 "~" V 5400 4300 50  0001 C CNN
	1    5400 4300
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D5
U 1 1 5C2E8C64
P 6600 2700
F 0 "D5" H 6600 2800 50  0000 C CNN
F 1 "GLED" H 6600 2600 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 6600 2700 50  0001 C CNN
F 3 "~" V 6600 2700 50  0001 C CNN
	1    6600 2700
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D4
U 1 1 5C2FAC7B
P 6000 2700
F 0 "D4" H 6000 2800 50  0000 C CNN
F 1 "GLED" H 6000 2600 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 6000 2700 50  0001 C CNN
F 3 "~" V 6000 2700 50  0001 C CNN
	1    6000 2700
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D10
U 1 1 5C2FAC82
P 7500 3500
F 0 "D10" H 7500 3400 50  0000 C CNN
F 1 "GLED" H 7500 3400 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 7500 3500 50  0001 C CNN
F 3 "~" V 7500 3500 50  0001 C CNN
	1    7500 3500
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D8
U 1 1 5C2FAC89
P 6300 3500
F 0 "D8" H 6300 3600 50  0000 C CNN
F 1 "GLED" H 6300 3400 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 6300 3500 50  0001 C CNN
F 3 "~" V 6300 3500 50  0001 C CNN
	1    6300 3500
	-1   0    0    -1  
$EndComp
NoConn ~ 1850 2400
NoConn ~ 1850 2500
NoConn ~ 1850 2600
NoConn ~ 1850 2700
NoConn ~ 1850 2800
NoConn ~ 1850 2900
NoConn ~ 1850 3000
Wire Wire Line
	3350 2400 3750 2400
Connection ~ 3350 2400
Connection ~ 3450 2500
Connection ~ 3550 2600
Wire Wire Line
	1750 3650 1750 5000
Connection ~ 1750 3650
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5C353DD7
P 1050 1150
F 0 "#FLG0101" H 1050 1225 50  0001 C CNN
F 1 "PWR_FLAG" H 1050 1350 50  0000 C CNN
F 2 "" H 1050 1150 50  0001 C CNN
F 3 "~" H 1050 1150 50  0001 C CNN
	1    1050 1150
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5C365F2A
P 1450 1150
F 0 "#FLG0102" H 1450 1225 50  0001 C CNN
F 1 "PWR_FLAG" H 1450 1350 50  0000 C CNN
F 2 "" H 1450 1150 50  0001 C CNN
F 3 "~" H 1450 1150 50  0001 C CNN
	1    1450 1150
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 5C36C2C4
P 1600 6350
F 0 "TP1" H 1650 6600 50  0000 R CNN
F 1 "TestPoint" H 1542 6468 50  0001 R CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 1800 6350 50  0001 C CNN
F 3 "~" H 1800 6350 50  0001 C CNN
	1    1600 6350
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 5C36E622
P 1800 6350
F 0 "TP2" H 1850 6600 50  0000 R CNN
F 1 "TestPoint" H 1742 6468 50  0001 R CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 2000 6350 50  0001 C CNN
F 3 "~" H 2000 6350 50  0001 C CNN
	1    1800 6350
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 5C370496
P 2000 6350
F 0 "TP3" H 2050 6600 50  0000 R CNN
F 1 "TestPoint" H 1942 6468 50  0001 R CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 2200 6350 50  0001 C CNN
F 3 "~" H 2200 6350 50  0001 C CNN
	1    2000 6350
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 5C372307
P 2200 6350
F 0 "TP4" H 2250 6600 50  0000 R CNN
F 1 "TestPoint" H 2142 6468 50  0001 R CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 2400 6350 50  0001 C CNN
F 3 "~" H 2400 6350 50  0001 C CNN
	1    2200 6350
	-1   0    0    1   
$EndComp
Text Notes 1550 6800 0    50   ~ 0
2.54mm pitch to Mother Board (both sides)
Wire Wire Line
	2800 6350 2800 6100
Wire Wire Line
	3200 6350 3200 6300
Wire Wire Line
	2600 6350 2600 6000
$Comp
L Connector:TestPoint TP5
U 1 1 5C387CC7
P 2600 6350
F 0 "TP5" H 2650 6600 50  0000 R CNN
F 1 "TestPoint" H 2542 6468 50  0001 R CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 2800 6350 50  0001 C CNN
F 3 "~" H 2800 6350 50  0001 C CNN
	1    2600 6350
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP6
U 1 1 5C387CCE
P 2800 6350
F 0 "TP6" H 2850 6600 50  0000 R CNN
F 1 "TestPoint" H 2742 6468 50  0001 R CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 3000 6350 50  0001 C CNN
F 3 "~" H 3000 6350 50  0001 C CNN
	1    2800 6350
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP7
U 1 1 5C387CD5
P 3000 6350
F 0 "TP7" H 3050 6600 50  0000 R CNN
F 1 "TestPoint" H 2942 6468 50  0001 R CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 3200 6350 50  0001 C CNN
F 3 "~" H 3200 6350 50  0001 C CNN
	1    3000 6350
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP8
U 1 1 5C387CDC
P 3200 6350
F 0 "TP8" H 3250 6600 50  0000 R CNN
F 1 "TestPoint" H 3142 6468 50  0001 R CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 3400 6350 50  0001 C CNN
F 3 "~" H 3400 6350 50  0001 C CNN
	1    3200 6350
	-1   0    0    1   
$EndComp
Wire Wire Line
	1600 6000 2600 6000
Connection ~ 1600 6000
Wire Wire Line
	1600 6000 1600 5900
Wire Wire Line
	1800 6100 2800 6100
Connection ~ 1800 6100
Wire Wire Line
	1800 6100 1800 5900
Wire Wire Line
	1800 6100 1800 6350
Wire Wire Line
	2000 6200 3000 6200
Connection ~ 2000 6200
Wire Wire Line
	2000 6200 2000 5900
Wire Wire Line
	3000 6200 3000 6350
Wire Wire Line
	2200 6300 3200 6300
Connection ~ 2200 6300
Wire Wire Line
	2200 6300 2200 5900
$Comp
L Device:LED_Small D2
U 1 1 5C2E49C9
P 6300 1900
F 0 "D2" H 6300 2000 50  0000 C CNN
F 1 "GLED" H 6300 1800 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 6300 1900 50  0001 C CNN
F 3 "~" V 6300 1900 50  0001 C CNN
	1    6300 1900
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D12
U 1 1 5C4D6FD4
P 6000 4300
F 0 "D12" H 6000 4400 50  0000 C CNN
F 1 "GLED" H 6000 4200 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 6000 4300 50  0001 C CNN
F 3 "~" V 6000 4300 50  0001 C CNN
	1    6000 4300
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D14
U 1 1 5C4D6FDB
P 7200 4300
F 0 "D14" H 7200 4400 50  0000 C CNN
F 1 "GLED" H 7200 4200 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 7200 4300 50  0001 C CNN
F 3 "~" V 7200 4300 50  0001 C CNN
	1    7200 4300
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D15
U 1 1 5C4D6FE2
P 7800 4300
F 0 "D15" H 7800 4200 50  0000 C CNN
F 1 "GLED" H 7800 4200 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 7800 4300 50  0001 C CNN
F 3 "~" V 7800 4300 50  0001 C CNN
	1    7800 4300
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D13
U 1 1 5C4D6FE9
P 6600 4300
F 0 "D13" H 6600 4400 50  0000 C CNN
F 1 "GLED" H 6600 4200 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 6600 4300 50  0001 C CNN
F 3 "~" V 6600 4300 50  0001 C CNN
	1    6600 4300
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D16
U 1 1 5C4DA107
P 6200 5500
F 0 "D16" H 6200 5400 50  0000 C CNN
F 1 "GLED" H 6200 5400 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 6200 5500 50  0001 C CNN
F 3 "~" V 6200 5500 50  0001 C CNN
	1    6200 5500
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D18
U 1 1 5C4DA10E
P 6200 6300
F 0 "D18" H 6200 6200 50  0000 C CNN
F 1 "GLED" H 6200 6200 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 6200 6300 50  0001 C CNN
F 3 "~" V 6200 6300 50  0001 C CNN
	1    6200 6300
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D19
U 1 1 5C4DA115
P 7000 6300
F 0 "D19" H 7000 6400 50  0000 C CNN
F 1 "GLED" H 7000 6200 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 7000 6300 50  0001 C CNN
F 3 "~" V 7000 6300 50  0001 C CNN
	1    7000 6300
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D17
U 1 1 5C4DA11C
P 7000 5500
F 0 "D17" H 7000 5600 50  0000 C CNN
F 1 "GLED" H 7000 5400 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 7000 5500 50  0001 C CNN
F 3 "~" V 7000 5500 50  0001 C CNN
	1    7000 5500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4200 1100 6500 1100
Wire Wire Line
	4650 1900 6200 1900
Wire Wire Line
	3450 2500 3850 2500
Wire Wire Line
	4750 2000 6600 2000
Wire Wire Line
	6600 2000 6600 1900
Wire Wire Line
	6600 1900 6800 1900
Wire Wire Line
	3550 2600 3950 2600
Wire Wire Line
	6300 2700 6500 2700
Wire Wire Line
	6300 2800 6300 2700
Wire Wire Line
	6900 2900 6900 2700
Wire Wire Line
	6900 2700 7100 2700
Wire Wire Line
	3250 3000 4850 3000
Wire Wire Line
	6000 3600 6000 3500
Wire Wire Line
	6000 3500 6200 3500
Wire Wire Line
	3250 3100 4750 3100
Wire Wire Line
	6600 3700 6600 3500
Wire Wire Line
	6600 3500 6800 3500
Wire Wire Line
	4200 1100 4200 2400
Wire Wire Line
	4650 1900 4650 2500
Wire Wire Line
	4750 2000 4750 2600
Wire Wire Line
	4850 3000 4850 3500
Wire Wire Line
	4850 3500 5600 3500
Wire Wire Line
	4750 3100 4750 3600
Wire Wire Line
	4750 3600 6000 3600
Wire Wire Line
	4650 3200 4650 3700
Wire Wire Line
	4650 3700 6600 3700
Wire Wire Line
	3250 3200 4650 3200
Wire Wire Line
	4550 3300 4550 3800
Wire Wire Line
	4550 3800 7200 3800
Wire Wire Line
	7200 3800 7200 3500
Wire Wire Line
	7200 3500 7400 3500
Wire Wire Line
	3250 3300 4550 3300
Wire Wire Line
	4450 3400 4450 4300
Wire Wire Line
	4450 4300 5300 4300
Wire Wire Line
	3250 3400 4450 3400
Wire Wire Line
	1850 3400 1400 3400
Wire Wire Line
	1400 3400 1400 4400
Wire Wire Line
	1400 4400 5700 4400
Wire Wire Line
	5700 4400 5700 4300
Wire Wire Line
	5700 4300 5900 4300
Wire Wire Line
	1850 3300 1300 3300
Wire Wire Line
	1300 3300 1300 4500
Wire Wire Line
	1300 4500 6300 4500
Wire Wire Line
	6300 4500 6300 4300
Wire Wire Line
	6300 4300 6500 4300
Wire Wire Line
	1850 3200 1200 3200
Wire Wire Line
	1200 3200 1200 4600
Wire Wire Line
	1200 4600 6900 4600
Wire Wire Line
	6900 4600 6900 4300
Wire Wire Line
	6900 4300 7100 4300
Wire Wire Line
	1850 3100 1100 3100
Wire Wire Line
	1100 3100 1100 4700
Wire Wire Line
	1100 4700 7500 4700
Wire Wire Line
	7500 4700 7500 4300
Wire Wire Line
	7500 4300 7700 4300
Wire Wire Line
	3250 2700 4050 2700
Wire Wire Line
	3250 2800 6300 2800
Wire Wire Line
	3250 2900 6900 2900
Wire Wire Line
	1850 2300 1650 2300
Wire Wire Line
	1650 2300 1650 5100
Wire Wire Line
	1750 5000 8800 5000
Wire Wire Line
	8800 5000 8800 4300
Wire Wire Line
	8800 1100 6700 1100
Wire Wire Line
	6400 1900 6400 1800
Wire Wire Line
	7000 1900 8800 1900
Connection ~ 8800 1900
Wire Wire Line
	8800 1900 8800 1800
Wire Wire Line
	7300 2700 8800 2700
Connection ~ 8800 2700
Wire Wire Line
	8800 2700 8800 2600
Wire Wire Line
	6700 2700 6700 2600
Wire Wire Line
	6400 1800 8800 1800
Connection ~ 8800 1800
Wire Wire Line
	8800 1100 8800 1800
Wire Wire Line
	6700 2600 8800 2600
Connection ~ 8800 2600
Wire Wire Line
	8800 1900 8800 2500
Wire Wire Line
	6100 2700 6100 2500
Wire Wire Line
	6100 2500 8800 2500
Connection ~ 8800 2500
Wire Wire Line
	8800 2500 8800 2600
Wire Wire Line
	7600 3500 8800 3500
Connection ~ 8800 3500
Wire Wire Line
	8800 3500 8800 3400
Wire Wire Line
	7000 3500 7000 3400
Wire Wire Line
	7000 3400 8800 3400
Connection ~ 8800 3400
Wire Wire Line
	8800 3400 8800 3300
Wire Wire Line
	6400 3500 6400 3300
Wire Wire Line
	6400 3300 8800 3300
Connection ~ 8800 3300
Wire Wire Line
	8800 3300 8800 3200
Wire Wire Line
	5800 3500 5800 3200
Wire Wire Line
	5800 3200 8800 3200
Connection ~ 8800 3200
Wire Wire Line
	8800 3200 8800 2700
Wire Wire Line
	7900 4300 8800 4300
Connection ~ 8800 4300
Wire Wire Line
	8800 4300 8800 4200
Wire Wire Line
	7300 4300 7300 4200
Wire Wire Line
	7300 4200 8800 4200
Connection ~ 8800 4200
Wire Wire Line
	8800 4200 8800 4100
Wire Wire Line
	6700 4300 6700 4100
Wire Wire Line
	6700 4100 8800 4100
Connection ~ 8800 4100
Wire Wire Line
	8800 4100 8800 4000
Wire Wire Line
	6100 4300 6100 4000
Wire Wire Line
	6100 4000 8800 4000
Connection ~ 8800 4000
Wire Wire Line
	8800 4000 8800 3900
Wire Wire Line
	5500 4300 5600 4300
Wire Wire Line
	5600 4300 5600 3900
Wire Wire Line
	5600 3900 8800 3900
Connection ~ 8800 3900
Wire Wire Line
	8800 3900 8800 3500
Wire Wire Line
	3750 2400 3750 5500
Wire Wire Line
	3750 5500 6100 5500
Connection ~ 3750 2400
Wire Wire Line
	3750 2400 4200 2400
Wire Wire Line
	3850 2500 3850 5400
Wire Wire Line
	3850 5400 6600 5400
Wire Wire Line
	6600 5400 6600 5500
Wire Wire Line
	6600 5500 6900 5500
Connection ~ 3850 2500
Wire Wire Line
	3850 2500 4650 2500
Wire Wire Line
	3950 2600 3950 6300
Wire Wire Line
	3950 6300 6100 6300
Connection ~ 3950 2600
Wire Wire Line
	3950 2600 4750 2600
Wire Wire Line
	4050 2700 4050 6200
Wire Wire Line
	4050 6200 6600 6200
Wire Wire Line
	6600 6200 6600 6300
Wire Wire Line
	6600 6300 6900 6300
Connection ~ 4050 2700
Wire Wire Line
	4050 2700 5900 2700
Wire Wire Line
	1650 5100 7500 5100
Wire Wire Line
	7500 5100 7500 5500
Wire Wire Line
	7500 5500 7100 5500
Wire Wire Line
	6300 5500 6300 5600
Wire Wire Line
	6300 5600 7500 5600
Wire Wire Line
	7500 5600 7500 5500
Connection ~ 7500 5500
Wire Wire Line
	7500 5600 7500 6300
Wire Wire Line
	7500 6300 7100 6300
Connection ~ 7500 5600
Wire Wire Line
	6300 6300 6300 6400
Wire Wire Line
	6300 6400 7500 6400
Wire Wire Line
	7500 6400 7500 6300
Connection ~ 7500 6300
$EndSCHEMATC
