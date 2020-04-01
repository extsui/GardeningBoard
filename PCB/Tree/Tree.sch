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
P 2450 3700
F 0 "R1" V 2350 3700 50  0000 C CNN
F 1 "39k" V 2450 3700 50  0000 C CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 2380 3700 50  0001 C CNN
F 3 "~" H 2450 3700 50  0001 C CNN
	1    2450 3700
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5C2CAF7E
P 2450 4000
F 0 "R2" V 2350 4000 50  0000 C CNN
F 1 "39k" V 2450 4000 50  0000 C CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 2380 4000 50  0001 C CNN
F 3 "~" H 2450 4000 50  0001 C CNN
	1    2450 4000
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5C2CAFA0
P 2450 4300
F 0 "R3" V 2350 4300 50  0000 C CNN
F 1 "39k" V 2450 4300 50  0000 C CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 2380 4300 50  0001 C CNN
F 3 "~" H 2450 4300 50  0001 C CNN
	1    2450 4300
	0    1    1    0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP1
U 1 1 5C2CB500
P 2800 3700
F 0 "JP1" H 2800 3600 50  0000 C CNN
F 1 "A2" H 2800 3800 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 2800 3700 50  0001 C CNN
F 3 "~" H 2800 3700 50  0001 C CNN
	1    2800 3700
	1    0    0    1   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP2
U 1 1 5C2CB546
P 2800 4000
F 0 "JP2" H 2800 4100 50  0000 C CNN
F 1 "A1" H 2800 3900 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 2800 4000 50  0001 C CNN
F 3 "~" H 2800 4000 50  0001 C CNN
	1    2800 4000
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP3
U 1 1 5C2CB568
P 2800 4300
F 0 "JP3" H 2800 4400 50  0000 C CNN
F 1 "A0" H 2800 4200 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 2800 4300 50  0001 C CNN
F 3 "~" H 2800 4300 50  0001 C CNN
	1    2800 4300
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
	2300 4000 2200 4000
Wire Wire Line
	2300 4300 2200 4300
Wire Wire Line
	2100 3700 2200 3700
Connection ~ 2200 3700
Wire Wire Line
	2200 3700 2300 3700
Wire Wire Line
	2650 3700 2600 3700
Wire Wire Line
	2600 4000 2650 4000
Wire Wire Line
	2650 4300 2600 4300
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
	1750 3700 1800 3700
Wire Wire Line
	2950 3700 3350 3700
Wire Wire Line
	3450 4000 2950 4000
Wire Wire Line
	2950 4300 3550 4300
Connection ~ 2200 4000
Wire Wire Line
	2200 4000 2200 4300
Wire Wire Line
	2200 3700 2200 4000
Text GLabel 3500 2200 2    50   Input ~ 0
SDA
Text GLabel 3500 2300 2    50   Input ~ 0
SCL
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
P 1950 3700
F 0 "D20" H 1950 3600 50  0000 C CNN
F 1 "D" H 1950 3800 50  0000 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" H 1950 3700 50  0001 C CNN
F 3 "~" H 1950 3700 50  0001 C CNN
	1    1950 3700
	-1   0    0    1   
$EndComp
$Comp
L Device:LED_Small D1
U 1 1 5C2E323A
P 5050 2100
F 0 "D1" H 5050 2200 50  0000 C CNN
F 1 "LED" H 5250 2200 50  0000 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 2100 50  0001 C CNN
F 3 "~" V 5050 2100 50  0001 C CNN
	1    5050 2100
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D7
U 1 1 5C2E4FE3
P 5050 3900
F 0 "D7" H 5050 4000 50  0000 C CNN
F 1 "GLED" H 5050 3800 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 3900 50  0001 C CNN
F 3 "~" V 5050 3900 50  0001 C CNN
	1    5050 3900
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D9
U 1 1 5C2E55DC
P 5050 5050
F 0 "D9" H 5050 5150 50  0000 C CNN
F 1 "GLED" H 5050 4950 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 5050 50  0001 C CNN
F 3 "~" V 5050 5050 50  0001 C CNN
	1    5050 5050
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D3
U 1 1 5C2E7A23
P 5050 2700
F 0 "D3" H 5050 2800 50  0000 C CNN
F 1 "GLED" H 5050 2600 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 2700 50  0001 C CNN
F 3 "~" V 5050 2700 50  0001 C CNN
	1    5050 2700
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D6
U 1 1 5C2E803B
P 5050 3600
F 0 "D6" H 5050 3700 50  0000 C CNN
F 1 "GLED" H 5050 3500 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 3600 50  0001 C CNN
F 3 "~" V 5050 3600 50  0001 C CNN
	1    5050 3600
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D11
U 1 1 5C2E864A
P 5050 5650
F 0 "D11" H 5050 5750 50  0000 C CNN
F 1 "GLED" H 5050 5550 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 5650 50  0001 C CNN
F 3 "~" V 5050 5650 50  0001 C CNN
	1    5050 5650
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D5
U 1 1 5C2E8C64
P 5050 3300
F 0 "D5" H 5050 3400 50  0000 C CNN
F 1 "GLED" H 5050 3200 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 3300 50  0001 C CNN
F 3 "~" V 5050 3300 50  0001 C CNN
	1    5050 3300
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D4
U 1 1 5C2FAC7B
P 5050 3000
F 0 "D4" H 5050 3100 50  0000 C CNN
F 1 "GLED" H 5050 2900 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 3000 50  0001 C CNN
F 3 "~" V 5050 3000 50  0001 C CNN
	1    5050 3000
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D10
U 1 1 5C2FAC82
P 5050 5350
F 0 "D10" H 5050 5450 50  0000 C CNN
F 1 "GLED" H 5050 5250 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 5350 50  0001 C CNN
F 3 "~" V 5050 5350 50  0001 C CNN
	1    5050 5350
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D8
U 1 1 5C2FAC89
P 5050 4200
F 0 "D8" H 5050 4300 50  0000 C CNN
F 1 "GLED" H 5050 4100 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 4200 50  0001 C CNN
F 3 "~" V 5050 4200 50  0001 C CNN
	1    5050 4200
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
	1750 3700 1750 4650
Connection ~ 1750 3700
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
Text Notes 5150 1750 0    50   ~ 0
2.54mm pitch to Mother Board (both sides)\n(Card Edge Connector)
$Comp
L Device:LED_Small D2
U 1 1 5C2E49C9
P 5050 2400
F 0 "D2" H 5050 2500 50  0000 C CNN
F 1 "GLED" H 5050 2300 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 2400 50  0001 C CNN
F 3 "~" V 5050 2400 50  0001 C CNN
	1    5050 2400
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D12
U 1 1 5C4D6FD4
P 5050 5950
F 0 "D12" H 5050 6050 50  0000 C CNN
F 1 "GLED" H 5050 5850 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 5950 50  0001 C CNN
F 3 "~" V 5050 5950 50  0001 C CNN
	1    5050 5950
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D14
U 1 1 5C4D6FDB
P 5050 6550
F 0 "D14" H 5050 6650 50  0000 C CNN
F 1 "GLED" H 5050 6450 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 6550 50  0001 C CNN
F 3 "~" V 5050 6550 50  0001 C CNN
	1    5050 6550
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D15
U 1 1 5C4D6FE2
P 5050 6850
F 0 "D15" H 5050 6950 50  0000 C CNN
F 1 "GLED" H 5050 6750 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 6850 50  0001 C CNN
F 3 "~" V 5050 6850 50  0001 C CNN
	1    5050 6850
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D13
U 1 1 5C4D6FE9
P 5050 6250
F 0 "D13" H 5050 6350 50  0000 C CNN
F 1 "GLED" H 5050 6150 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 6250 50  0001 C CNN
F 3 "~" V 5050 6250 50  0001 C CNN
	1    5050 6250
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D16
U 1 1 5C4DA107
P 5650 2250
F 0 "D16" H 5650 2350 50  0000 C CNN
F 1 "GLED" H 5650 2150 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5650 2250 50  0001 C CNN
F 3 "~" V 5650 2250 50  0001 C CNN
	1    5650 2250
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D18
U 1 1 5C4DA10E
P 5650 2850
F 0 "D18" H 5650 2950 50  0000 C CNN
F 1 "GLED" H 5650 2750 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5650 2850 50  0001 C CNN
F 3 "~" V 5650 2850 50  0001 C CNN
	1    5650 2850
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D19
U 1 1 5C4DA115
P 5650 3150
F 0 "D19" H 5650 3250 50  0000 C CNN
F 1 "GLED" H 5650 3050 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5650 3150 50  0001 C CNN
F 3 "~" V 5650 3150 50  0001 C CNN
	1    5650 3150
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D17
U 1 1 5C4DA11C
P 5650 2550
F 0 "D17" H 5650 2650 50  0000 C CNN
F 1 "GLED" H 5650 2450 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5650 2550 50  0001 C CNN
F 3 "~" V 5650 2550 50  0001 C CNN
	1    5650 2550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3250 3400 3750 3400
Wire Wire Line
	1850 3400 1400 3400
Wire Wire Line
	1850 3300 1300 3300
Wire Wire Line
	1850 3200 1200 3200
Wire Wire Line
	1850 3100 1100 3100
Wire Wire Line
	1850 2300 1650 2300
$Comp
L Connector_Generic:Conn_01x05 J1
U 1 1 5E858B5D
P 5650 1450
F 0 "J1" V 5523 1162 50  0000 R CNN
F 1 "Conn_01x05" V 5614 1162 50  0000 R CNN
F 2 "" H 5650 1450 50  0001 C CNN
F 3 "~" H 5650 1450 50  0001 C CNN
	1    5650 1450
	0    -1   1    0   
$EndComp
Text GLabel 5450 1000 1    50   Input ~ 0
+5V
Text GLabel 5650 1000 1    50   Input ~ 0
SCL
Text GLabel 5550 1000 1    50   Input ~ 0
SDA
Text GLabel 5850 1000 1    50   Input ~ 0
GND
Wire Wire Line
	5450 1000 5450 1250
Wire Wire Line
	5550 1000 5550 1250
Wire Wire Line
	5650 1000 5650 1250
Wire Wire Line
	5850 1000 5850 1250
NoConn ~ 5750 1250
Wire Wire Line
	3250 3300 3850 3300
Wire Wire Line
	3850 3300 3850 5350
Wire Wire Line
	3750 3400 3750 5650
Wire Wire Line
	3250 3200 3950 3200
Wire Wire Line
	3950 3200 3950 5050
Wire Wire Line
	3250 3100 4050 3100
Wire Wire Line
	4050 3100 4050 4200
Wire Wire Line
	3250 3000 4150 3000
Wire Wire Line
	4150 3000 4150 3900
Wire Wire Line
	3250 2900 4250 2900
Wire Wire Line
	4250 2900 4250 3600
Wire Wire Line
	3250 2800 4350 2800
Wire Wire Line
	4350 2800 4350 3300
Wire Wire Line
	3250 2700 4450 2700
Wire Wire Line
	4450 2700 4450 3000
Wire Wire Line
	4450 3000 4800 3000
Wire Wire Line
	4550 2600 4550 2700
Wire Wire Line
	4550 2700 4800 2700
Wire Wire Line
	4550 2500 4550 2400
Wire Wire Line
	4550 2400 4800 2400
Wire Wire Line
	4450 2400 4450 2100
Wire Wire Line
	4450 2100 4800 2100
Wire Wire Line
	3250 2400 3350 2400
Wire Wire Line
	3250 2500 3450 2500
Wire Wire Line
	3250 2600 3550 2600
Wire Wire Line
	1650 2300 1650 4750
Wire Wire Line
	1750 2200 1750 3700
Wire Wire Line
	3350 2400 3350 3700
Connection ~ 3350 2400
Wire Wire Line
	3350 2400 4450 2400
Wire Wire Line
	3450 2500 3450 4000
Connection ~ 3450 2500
Wire Wire Line
	3450 2500 4550 2500
Wire Wire Line
	3550 2600 3550 4300
Connection ~ 3550 2600
Wire Wire Line
	3550 2600 4550 2600
Wire Wire Line
	4800 2100 4800 2250
Wire Wire Line
	4800 2250 5550 2250
Wire Wire Line
	4800 2400 4800 2550
Wire Wire Line
	4800 2550 5550 2550
Wire Wire Line
	4800 2700 4800 2850
Wire Wire Line
	4800 2850 5550 2850
Wire Wire Line
	4800 3000 4800 3150
Wire Wire Line
	4800 3150 5550 3150
Wire Wire Line
	4950 2100 4800 2100
Connection ~ 4800 2100
Wire Wire Line
	4950 2400 4800 2400
Connection ~ 4800 2400
Wire Wire Line
	4950 2700 4800 2700
Connection ~ 4800 2700
Wire Wire Line
	4950 3000 4800 3000
Connection ~ 4800 3000
Wire Wire Line
	5150 2400 5250 2400
Wire Wire Line
	5150 2700 5250 2700
Wire Wire Line
	5150 3000 5250 3000
Wire Wire Line
	5150 3300 5250 3300
Wire Wire Line
	5150 3600 5250 3600
Wire Wire Line
	5150 3900 5250 3900
Wire Wire Line
	5150 2100 5250 2100
Wire Wire Line
	5250 2100 5250 2400
Connection ~ 5250 2400
Wire Wire Line
	5250 2400 5250 2700
Connection ~ 5250 2700
Wire Wire Line
	5250 2700 5250 3000
Connection ~ 5250 3000
Wire Wire Line
	5250 3000 5250 3300
Connection ~ 5250 3300
Wire Wire Line
	5250 3300 5250 3600
Connection ~ 5250 3600
Wire Wire Line
	5250 3600 5250 3900
Connection ~ 5250 3900
Wire Wire Line
	5250 3900 5250 4200
Wire Wire Line
	5150 4200 5250 4200
Connection ~ 5250 4200
Wire Wire Line
	5250 4200 5250 4650
Wire Wire Line
	1750 4650 5250 4650
Connection ~ 5250 4650
Wire Wire Line
	1650 4750 5850 4750
Text Notes 6250 2350 0    50   ~ 0
!!!WARNING!!!\n  LEDs' position is different from the footfprint.
Wire Wire Line
	5150 5050 5250 5050
Wire Wire Line
	5250 4650 5250 5050
Connection ~ 5250 5050
Wire Wire Line
	4950 5950 1400 5950
Wire Wire Line
	1400 3400 1400 5950
Wire Wire Line
	1300 6250 4950 6250
Wire Wire Line
	1300 3300 1300 6250
Wire Wire Line
	1200 6550 4950 6550
Wire Wire Line
	1200 3200 1200 6550
Wire Wire Line
	1100 6850 4950 6850
Wire Wire Line
	1100 3100 1100 6850
Wire Wire Line
	3950 5050 4950 5050
Wire Wire Line
	3850 5350 4950 5350
Wire Wire Line
	3750 5650 4950 5650
Wire Wire Line
	5150 6850 5250 6850
Wire Wire Line
	5250 5050 5250 5350
Wire Wire Line
	5150 6550 5250 6550
Connection ~ 5250 6550
Wire Wire Line
	5250 6550 5250 6850
Wire Wire Line
	5150 6250 5250 6250
Connection ~ 5250 6250
Wire Wire Line
	5250 6250 5250 6550
Wire Wire Line
	5150 5950 5250 5950
Connection ~ 5250 5950
Wire Wire Line
	5250 5950 5250 6250
Wire Wire Line
	5150 5650 5250 5650
Connection ~ 5250 5650
Wire Wire Line
	5250 5650 5250 5950
Wire Wire Line
	5150 5350 5250 5350
Connection ~ 5250 5350
Wire Wire Line
	5250 5350 5250 5650
Text Notes 2700 7200 0    50   ~ 0
!!!WARNING!!!\n  ROW15 is not used due to board wiring restrictions.\n  (The software takes care of it.)
Wire Notes Line
	4900 7000 5200 7000
Wire Notes Line
	5200 7000 5200 7200
Wire Notes Line
	5200 7200 4900 7200
Wire Notes Line
	4900 7200 4900 7000
NoConn ~ 5050 7100
Wire Wire Line
	4350 3300 4950 3300
Wire Wire Line
	4250 3600 4950 3600
Wire Wire Line
	4150 3900 4950 3900
Wire Wire Line
	4050 4200 4950 4200
Wire Wire Line
	5750 2250 5850 2250
Wire Wire Line
	5850 2250 5850 2550
Wire Wire Line
	5750 2550 5850 2550
Connection ~ 5850 2550
Wire Wire Line
	5850 2550 5850 2850
Wire Wire Line
	5750 2850 5850 2850
Connection ~ 5850 2850
Wire Wire Line
	5850 2850 5850 3150
Wire Wire Line
	5750 3150 5850 3150
Connection ~ 5850 3150
Wire Wire Line
	5850 3150 5850 4750
Text GLabel 3750 2100 2    50   Input ~ 0
+5V
$EndSCHEMATC
