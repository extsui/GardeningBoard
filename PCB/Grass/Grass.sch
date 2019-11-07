EESchema Schematic File Version 4
LIBS:Grass-cache
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
L Grass-rescue:HT16K33-28SOP-Garden U1
U 1 1 5C2B207A
P 2550 2700
F 0 "U1" H 2000 3450 50  0000 C CNN
F 1 "HT16K33-28SOP" H 2550 3450 50  0000 C CNN
F 2 "Package_SO:SOIC-28W_7.5x18.7mm_P1.27mm" H 2300 3450 50  0001 C CNN
F 3 "" H 2300 3450 50  0001 C CNN
	1    2550 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5C2C9BBC
P 1550 2150
F 0 "#PWR06" H 1550 1900 50  0001 C CNN
F 1 "GND" H 1555 1977 50  0000 C CNN
F 2 "" H 1550 2150 50  0001 C CNN
F 3 "" H 1550 2150 50  0001 C CNN
	1    1550 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5C2CAF32
P 2450 3950
F 0 "R1" V 2350 3950 50  0000 C CNN
F 1 "39k" V 2450 3950 50  0000 C CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 2380 3950 50  0001 C CNN
F 3 "~" H 2450 3950 50  0001 C CNN
	1    2450 3950
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5C2CAF7E
P 2450 4250
F 0 "R2" V 2350 4250 50  0000 C CNN
F 1 "39k" V 2450 4250 50  0000 C CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 2380 4250 50  0001 C CNN
F 3 "~" H 2450 4250 50  0001 C CNN
	1    2450 4250
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5C2CAFA0
P 2450 4550
F 0 "R3" V 2350 4550 50  0000 C CNN
F 1 "39k" V 2450 4550 50  0000 C CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 2380 4550 50  0001 C CNN
F 3 "~" H 2450 4550 50  0001 C CNN
	1    2450 4550
	0    1    1    0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP1
U 1 1 5C2CB500
P 2800 3950
F 0 "JP1" H 2800 3850 50  0000 C CNN
F 1 "A2" H 2800 4050 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 2800 3950 50  0001 C CNN
F 3 "~" H 2800 3950 50  0001 C CNN
	1    2800 3950
	1    0    0    1   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP2
U 1 1 5C2CB546
P 2800 4250
F 0 "JP2" H 2800 4350 50  0000 C CNN
F 1 "A1" H 2800 4150 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 2800 4250 50  0001 C CNN
F 3 "~" H 2800 4250 50  0001 C CNN
	1    2800 4250
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP3
U 1 1 5C2CB568
P 2800 4550
F 0 "JP3" H 2800 4650 50  0000 C CNN
F 1 "A0" H 2800 4450 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 2800 4550 50  0001 C CNN
F 3 "~" H 2800 4550 50  0001 C CNN
	1    2800 4550
	1    0    0    -1  
$EndComp
Text Notes 3700 1850 0    50   ~ 0
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
	2300 4250 2200 4250
Wire Wire Line
	2300 4550 2200 4550
Wire Wire Line
	2100 3950 2200 3950
Connection ~ 2200 3950
Wire Wire Line
	2200 3950 2300 3950
Wire Wire Line
	2650 3950 2600 3950
Wire Wire Line
	2600 4250 2650 4250
Wire Wire Line
	2650 4550 2600 4550
Wire Wire Line
	1850 2050 1550 2050
Wire Wire Line
	3250 2050 3450 2050
Wire Wire Line
	3450 2050 3450 1800
Wire Wire Line
	3250 2150 3500 2150
Wire Wire Line
	3250 2250 3500 2250
Wire Wire Line
	3050 5800 3050 5750
Wire Wire Line
	2850 5800 2850 5650
Wire Wire Line
	2450 5800 2450 5450
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
	1850 2150 1750 2150
Wire Wire Line
	1750 2150 1750 3950
Wire Wire Line
	1750 3950 1800 3950
Wire Wire Line
	2950 3950 3350 3950
Wire Wire Line
	3350 3950 3350 2350
Wire Wire Line
	3350 2350 3250 2350
Wire Wire Line
	3250 2450 3450 2450
Wire Wire Line
	3450 2450 3450 4250
Wire Wire Line
	3450 4250 2950 4250
Wire Wire Line
	3250 2550 3550 2550
Wire Wire Line
	2950 4550 3550 4550
Connection ~ 2200 4250
Wire Wire Line
	3550 2550 3550 4550
Wire Wire Line
	2200 4250 2200 4550
Wire Wire Line
	2200 3950 2200 4250
Text GLabel 2450 5350 1    50   Input ~ 0
+5V
Text GLabel 2650 5350 1    50   Input ~ 0
SCL
Text GLabel 2850 5350 1    50   Input ~ 0
SDA
Text GLabel 3050 5350 1    50   Input ~ 0
GND
Text GLabel 3500 2150 2    50   Input ~ 0
SDA
Text GLabel 3500 2250 2    50   Input ~ 0
SCL
Text GLabel 3750 2050 2    50   Input ~ 0
+5V
Text GLabel 1300 2050 0    50   Input ~ 0
GND
Wire Wire Line
	3750 2050 3450 2050
Connection ~ 3450 2050
Wire Wire Line
	1550 2050 1300 2050
Connection ~ 1550 2050
Wire Wire Line
	1550 2150 1550 2050
Wire Wire Line
	1550 2050 1550 1800
Wire Wire Line
	1550 1800 2450 1800
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
L Device:D_Schottky_ALT D12
U 1 1 5C2E2B2F
P 1950 3950
F 0 "D12" H 1950 3850 50  0000 C CNN
F 1 "D" H 1950 4050 50  0000 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" H 1950 3950 50  0001 C CNN
F 3 "~" H 1950 3950 50  0001 C CNN
	1    1950 3950
	-1   0    0    1   
$EndComp
$Comp
L Device:LED_Small D1
U 1 1 5C2E323A
P 4850 2350
F 0 "D1" H 4850 2450 50  0000 C CNN
F 1 "GLED" H 5050 2450 50  0000 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 4850 2350 50  0001 C CNN
F 3 "~" V 4850 2350 50  0001 C CNN
	1    4850 2350
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D2
U 1 1 5C2E49C9
P 4850 2550
F 0 "D2" H 4850 2650 50  0000 C CNN
F 1 "GLED" H 4850 2450 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 4850 2550 50  0001 C CNN
F 3 "~" V 4850 2550 50  0001 C CNN
	1    4850 2550
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D7
U 1 1 5C2E4FE3
P 4850 3550
F 0 "D7" H 4850 3650 50  0000 C CNN
F 1 "GLED" H 4850 3450 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 4850 3550 50  0001 C CNN
F 3 "~" V 4850 3550 50  0001 C CNN
	1    4850 3550
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D9
U 1 1 5C2E55DC
P 4850 3950
F 0 "D9" H 4850 4050 50  0000 C CNN
F 1 "GLED" H 4850 3850 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 4850 3950 50  0001 C CNN
F 3 "~" V 4850 3950 50  0001 C CNN
	1    4850 3950
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D3
U 1 1 5C2E7A23
P 4850 2750
F 0 "D3" H 4850 2850 50  0000 C CNN
F 1 "GLED" H 4850 2650 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 4850 2750 50  0001 C CNN
F 3 "~" V 4850 2750 50  0001 C CNN
	1    4850 2750
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D6
U 1 1 5C2E803B
P 4850 3350
F 0 "D6" H 4850 3450 50  0000 C CNN
F 1 "GLED" H 4850 3250 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 4850 3350 50  0001 C CNN
F 3 "~" V 4850 3350 50  0001 C CNN
	1    4850 3350
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D11
U 1 1 5C2E864A
P 4850 4350
F 0 "D11" H 4850 4450 50  0000 C CNN
F 1 "GLED" H 4850 4250 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 4850 4350 50  0001 C CNN
F 3 "~" V 4850 4350 50  0001 C CNN
	1    4850 4350
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D5
U 1 1 5C2E8C64
P 4850 3150
F 0 "D5" H 4850 3250 50  0000 C CNN
F 1 "GLED" H 4850 3050 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 4850 3150 50  0001 C CNN
F 3 "~" V 4850 3150 50  0001 C CNN
	1    4850 3150
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D4
U 1 1 5C2FAC7B
P 4850 2950
F 0 "D4" H 4850 3050 50  0000 C CNN
F 1 "GLED" H 4850 2850 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 4850 2950 50  0001 C CNN
F 3 "~" V 4850 2950 50  0001 C CNN
	1    4850 2950
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D10
U 1 1 5C2FAC82
P 4850 4150
F 0 "D10" H 4850 4250 50  0000 C CNN
F 1 "GLED" H 4850 4050 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 4850 4150 50  0001 C CNN
F 3 "~" V 4850 4150 50  0001 C CNN
	1    4850 4150
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D8
U 1 1 5C2FAC89
P 4850 3750
F 0 "D8" H 4850 3850 50  0000 C CNN
F 1 "GLED" H 4850 3650 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 4850 3750 50  0001 C CNN
F 3 "~" V 4850 3750 50  0001 C CNN
	1    4850 3750
	-1   0    0    -1  
$EndComp
NoConn ~ 1850 2250
NoConn ~ 1850 2350
NoConn ~ 1850 2450
NoConn ~ 1850 2550
NoConn ~ 1850 2650
NoConn ~ 1850 2750
NoConn ~ 1850 2850
NoConn ~ 1850 2950
NoConn ~ 1850 3050
NoConn ~ 1850 3150
NoConn ~ 1850 3250
Wire Wire Line
	3350 2350 4750 2350
Connection ~ 3350 2350
Connection ~ 3450 2450
Wire Wire Line
	3450 2450 4650 2450
Wire Wire Line
	4750 2550 4650 2550
Wire Wire Line
	4650 2550 4650 2450
Wire Wire Line
	3550 2550 4550 2550
Wire Wire Line
	4550 2550 4550 2750
Wire Wire Line
	4550 2750 4750 2750
Connection ~ 3550 2550
Wire Wire Line
	3250 2650 4450 2650
Wire Wire Line
	4450 2650 4450 2950
Wire Wire Line
	4450 2950 4750 2950
Wire Wire Line
	3250 3350 3750 3350
Wire Wire Line
	3750 3350 3750 4350
Wire Wire Line
	3750 4350 4750 4350
Wire Wire Line
	4750 4150 3850 4150
Wire Wire Line
	3850 4150 3850 3250
Wire Wire Line
	3850 3250 3250 3250
Wire Wire Line
	3250 3150 3950 3150
Wire Wire Line
	3950 3150 3950 3950
Wire Wire Line
	3950 3950 4750 3950
Wire Wire Line
	4750 3750 4050 3750
Wire Wire Line
	4050 3750 4050 3050
Wire Wire Line
	4050 3050 3250 3050
Wire Wire Line
	3250 2950 4150 2950
Wire Wire Line
	4150 2950 4150 3550
Wire Wire Line
	4150 3550 4750 3550
Wire Wire Line
	4750 3350 4250 3350
Wire Wire Line
	4250 3350 4250 2850
Wire Wire Line
	4250 2850 3250 2850
Wire Wire Line
	3250 2750 4350 2750
Wire Wire Line
	4350 2750 4350 3150
Wire Wire Line
	4350 3150 4750 3150
Wire Wire Line
	4950 2350 5250 2350
Wire Wire Line
	5250 2350 5250 2550
Wire Wire Line
	4950 2550 5250 2550
Connection ~ 5250 2550
Wire Wire Line
	5250 2550 5250 2750
Wire Wire Line
	4950 2750 5250 2750
Connection ~ 5250 2750
Wire Wire Line
	5250 2750 5250 2950
Wire Wire Line
	4950 2950 5250 2950
Connection ~ 5250 2950
Wire Wire Line
	5250 2950 5250 3150
Wire Wire Line
	4950 3150 5250 3150
Connection ~ 5250 3150
Wire Wire Line
	5250 3150 5250 3350
Wire Wire Line
	4950 3350 5250 3350
Connection ~ 5250 3350
Wire Wire Line
	5250 3350 5250 3550
Wire Wire Line
	4950 3550 5250 3550
Connection ~ 5250 3550
Wire Wire Line
	5250 3550 5250 3750
Wire Wire Line
	4950 3750 5250 3750
Connection ~ 5250 3750
Wire Wire Line
	5250 3750 5250 3950
Wire Wire Line
	4950 3950 5250 3950
Connection ~ 5250 3950
Wire Wire Line
	5250 3950 5250 4150
Wire Wire Line
	4950 4150 5250 4150
Connection ~ 5250 4150
Wire Wire Line
	5250 4150 5250 4350
Wire Wire Line
	4950 4350 5250 4350
Connection ~ 5250 4350
Wire Wire Line
	1750 3950 1750 4900
Wire Wire Line
	1750 4900 5250 4900
Wire Wire Line
	5250 4350 5250 4900
Connection ~ 1750 3950
NoConn ~ 1850 3350
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
P 2450 5800
F 0 "TP1" H 2500 6050 50  0000 R CNN
F 1 "TestPoint" H 2392 5918 50  0001 R CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 2650 5800 50  0001 C CNN
F 3 "~" H 2650 5800 50  0001 C CNN
	1    2450 5800
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 5C36E622
P 2650 5800
F 0 "TP2" H 2700 6050 50  0000 R CNN
F 1 "TestPoint" H 2592 5918 50  0001 R CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 2850 5800 50  0001 C CNN
F 3 "~" H 2850 5800 50  0001 C CNN
	1    2650 5800
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 5C370496
P 2850 5800
F 0 "TP3" H 2900 6050 50  0000 R CNN
F 1 "TestPoint" H 2792 5918 50  0001 R CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 3050 5800 50  0001 C CNN
F 3 "~" H 3050 5800 50  0001 C CNN
	1    2850 5800
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 5C372307
P 3050 5800
F 0 "TP4" H 3100 6050 50  0000 R CNN
F 1 "TestPoint" H 2992 5918 50  0001 R CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 3250 5800 50  0001 C CNN
F 3 "~" H 3250 5800 50  0001 C CNN
	1    3050 5800
	-1   0    0    1   
$EndComp
Text Notes 2400 6250 0    50   ~ 0
2.54mm pitch to Mother Board (both sides)
Wire Wire Line
	3650 5800 3650 5550
Wire Wire Line
	4050 5800 4050 5750
Wire Wire Line
	3450 5800 3450 5450
$Comp
L Connector:TestPoint TP5
U 1 1 5C387CC7
P 3450 5800
F 0 "TP5" H 3500 6050 50  0000 R CNN
F 1 "TestPoint" H 3392 5918 50  0001 R CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 3650 5800 50  0001 C CNN
F 3 "~" H 3650 5800 50  0001 C CNN
	1    3450 5800
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP6
U 1 1 5C387CCE
P 3650 5800
F 0 "TP6" H 3700 6050 50  0000 R CNN
F 1 "TestPoint" H 3592 5918 50  0001 R CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 3850 5800 50  0001 C CNN
F 3 "~" H 3850 5800 50  0001 C CNN
	1    3650 5800
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP7
U 1 1 5C387CD5
P 3850 5800
F 0 "TP7" H 3900 6050 50  0000 R CNN
F 1 "TestPoint" H 3792 5918 50  0001 R CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 4050 5800 50  0001 C CNN
F 3 "~" H 4050 5800 50  0001 C CNN
	1    3850 5800
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP8
U 1 1 5C387CDC
P 4050 5800
F 0 "TP8" H 4100 6050 50  0000 R CNN
F 1 "TestPoint" H 3992 5918 50  0001 R CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 4250 5800 50  0001 C CNN
F 3 "~" H 4250 5800 50  0001 C CNN
	1    4050 5800
	-1   0    0    1   
$EndComp
Wire Wire Line
	2450 5450 3450 5450
Connection ~ 2450 5450
Wire Wire Line
	2450 5450 2450 5350
Wire Wire Line
	2650 5550 3650 5550
Connection ~ 2650 5550
Wire Wire Line
	2650 5550 2650 5350
Wire Wire Line
	2650 5550 2650 5800
Wire Wire Line
	2850 5650 3850 5650
Connection ~ 2850 5650
Wire Wire Line
	2850 5650 2850 5350
Wire Wire Line
	3850 5650 3850 5800
Wire Wire Line
	3050 5750 4050 5750
Connection ~ 3050 5750
Wire Wire Line
	3050 5750 3050 5350
$EndSCHEMATC
