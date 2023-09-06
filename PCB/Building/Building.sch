EESchema Schematic File Version 4
LIBS:Building-cache
EELAYER 26 0
EELAYER END
$Descr A4 8268 11693 portrait
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
L power:GND #PWR06
U 1 1 5C2C9BBC
P 1250 3050
F 0 "#PWR06" H 1250 2800 50  0001 C CNN
F 1 "GND" H 1255 2877 50  0000 C CNN
F 2 "" H 1250 3050 50  0001 C CNN
F 3 "" H 1250 3050 50  0001 C CNN
	1    1250 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5C2CAF32
P 3200 2300
F 0 "R3" V 3100 2300 50  0000 C CNN
F 1 "39k" V 3200 2300 50  0000 C CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 3130 2300 50  0001 C CNN
F 3 "~" H 3200 2300 50  0001 C CNN
	1    3200 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5C2CAF7E
P 3400 2300
F 0 "R2" V 3300 2300 50  0000 C CNN
F 1 "39k" V 3400 2300 50  0000 C CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 3330 2300 50  0001 C CNN
F 3 "~" H 3400 2300 50  0001 C CNN
	1    3400 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5C2CAFA0
P 3600 2300
F 0 "R1" V 3500 2300 50  0000 C CNN
F 1 "39k" V 3600 2300 50  0000 C CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 3530 2300 50  0001 C CNN
F 3 "~" H 3600 2300 50  0001 C CNN
	1    3600 2300
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP3
U 1 1 5C2CB500
P 3200 1950
F 0 "JP3" H 3200 1850 50  0000 C CNN
F 1 "A2" H 3350 1850 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3200 1950 50  0001 C CNN
F 3 "~" H 3200 1950 50  0001 C CNN
	1    3200 1950
	0    1    -1   0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP2
U 1 1 5C2CB546
P 3400 1950
F 0 "JP2" H 3400 2050 50  0000 C CNN
F 1 "A1" H 3550 2050 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3400 1950 50  0001 C CNN
F 3 "~" H 3400 1950 50  0001 C CNN
	1    3400 1950
	0    -1   -1   0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP1
U 1 1 5C2CB568
P 3600 1950
F 0 "JP1" H 3600 2050 50  0000 C CNN
F 1 "A0" H 3750 2050 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3600 1950 50  0001 C CNN
F 3 "~" H 3600 1950 50  0001 C CNN
	1    3600 1950
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 5C2CBF57
P 1250 1000
F 0 "#PWR05" H 1250 850 50  0001 C CNN
F 1 "+5V" H 1265 1173 50  0000 C CNN
F 2 "" H 1250 1000 50  0001 C CNN
F 3 "" H 1250 1000 50  0001 C CNN
	1    1250 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 2450 3400 2550
Wire Wire Line
	3600 2450 3600 2550
Wire Wire Line
	3200 2100 3200 2150
Wire Wire Line
	3400 2150 3400 2100
Wire Wire Line
	3600 2100 3600 2150
$Comp
L power:+5V #PWR02
U 1 1 5C2D1124
P 1050 9800
F 0 "#PWR02" H 1050 9650 50  0001 C CNN
F 1 "+5V" H 1065 9973 50  0000 C CNN
F 2 "" H 1050 9800 50  0001 C CNN
F 3 "" H 1050 9800 50  0001 C CNN
	1    1050 9800
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5C2D1EAE
P 1450 9800
F 0 "#PWR04" H 1450 9550 50  0001 C CNN
F 1 "GND" H 1455 9627 50  0000 C CNN
F 2 "" H 1450 9800 50  0001 C CNN
F 3 "" H 1450 9800 50  0001 C CNN
	1    1450 9800
	1    0    0    -1  
$EndComp
Wire Notes Line
	1750 10100 1750 9500
Wire Notes Line
	1750 9500 800  9500
Wire Notes Line
	800  9500 800  10100
Wire Notes Line
	800  10100 1750 10100
Text Notes 850  9450 0    50   ~ 0
Power Flag
Text GLabel 2200 9700 1    50   Input ~ 0
+5V
Text GLabel 2400 9700 1    50   Input ~ 0
SCL
Text GLabel 2300 9700 1    50   Input ~ 0
SDA
Text GLabel 2600 9700 1    50   Input ~ 0
GND
Text GLabel 1150 1400 0    50   Input ~ 0
SDA
Text GLabel 1150 1300 0    50   Input ~ 0
SCL
Text GLabel 1150 1100 0    50   Input ~ 0
+5V
Text GLabel 1150 2900 0    50   Input ~ 0
GND
Wire Wire Line
	1150 1100 1250 1100
$Comp
L Device:C_Small C1
U 1 1 5C2DF16B
P 1250 2200
F 0 "C1" V 1021 2200 50  0000 C CNN
F 1 "0.1u" V 1112 2200 50  0000 C CNN
F 2 "extsui:C_1608_HandSolderingCustom" H 1250 2200 50  0001 C CNN
F 3 "~" H 1250 2200 50  0001 C CNN
	1    1250 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky_ALT D1
U 1 1 5C2E2B2F
P 3200 2800
F 0 "D1" H 3200 2700 50  0000 C CNN
F 1 "D" H 3200 2900 50  0000 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" H 3200 2800 50  0001 C CNN
F 3 "~" H 3200 2800 50  0001 C CNN
	1    3200 2800
	0    1    1    0   
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5C353DD7
P 1050 9800
F 0 "#FLG0101" H 1050 9875 50  0001 C CNN
F 1 "PWR_FLAG" H 1050 10000 50  0000 C CNN
F 2 "" H 1050 9800 50  0001 C CNN
F 3 "~" H 1050 9800 50  0001 C CNN
	1    1050 9800
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5C365F2A
P 1450 9800
F 0 "#FLG0102" H 1450 9875 50  0001 C CNN
F 1 "PWR_FLAG" H 1450 10000 50  0000 C CNN
F 2 "" H 1450 9800 50  0001 C CNN
F 3 "~" H 1450 9800 50  0001 C CNN
	1    1450 9800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x05 J1
U 1 1 5CEBBC43
P 2400 10100
F 0 "J1" V 2273 9812 50  0000 R CNN
F 1 "Conn_01x05" V 2364 9812 50  0000 R CNN
F 2 "extsui:EDAC_5P_P2.54mm" H 2400 10100 50  0001 C CNN
F 3 "~" H 2400 10100 50  0001 C CNN
	1    2400 10100
	0    -1   1    0   
$EndComp
Wire Wire Line
	2200 9700 2200 9900
Wire Wire Line
	2300 9900 2300 9700
Wire Wire Line
	2400 9700 2400 9900
Wire Wire Line
	2600 9900 2600 9700
NoConn ~ 2500 9900
$Comp
L extsui:OSL60362_IX U1
U 1 1 64EE7689
P 4600 2250
F 0 "U1" H 5300 2800 50  0000 L CNN
F 1 "OSL60362_IX" H 4900 2700 50  0000 L CNN
F 2 "extsui:OSL60362_XX" H 4700 3000 50  0001 C CNN
F 3 "" H 4700 3000 50  0001 C CNN
	1    4600 2250
	1    0    0    -1  
$EndComp
NoConn ~ 2400 2900
NoConn ~ 2500 2900
NoConn ~ 2600 2900
Entry Wire Line
	4150 3200 4250 3100
Entry Wire Line
	4250 3200 4350 3100
Entry Wire Line
	4350 3200 4450 3100
Entry Wire Line
	4450 3200 4550 3100
Entry Wire Line
	4550 3200 4650 3100
Entry Wire Line
	4650 3200 4750 3100
Entry Wire Line
	4750 3200 4850 3100
Entry Wire Line
	4850 3200 4950 3100
NoConn ~ 2700 2900
Entry Wire Line
	5950 3200 6050 3100
Entry Wire Line
	6050 3200 6150 3100
Entry Wire Line
	6150 3200 6250 3100
Entry Wire Line
	6250 3200 6350 3100
Entry Wire Line
	6350 3200 6450 3100
Entry Wire Line
	6450 3200 6550 3100
Entry Wire Line
	6550 3200 6650 3100
Entry Wire Line
	6650 3200 6750 3100
Entry Wire Line
	2300 3100 2200 3200
Entry Wire Line
	2200 3100 2100 3200
Entry Wire Line
	2100 3100 2000 3200
Entry Wire Line
	2000 3100 1900 3200
Entry Wire Line
	1900 3100 1800 3200
Entry Wire Line
	1800 3100 1700 3200
Entry Wire Line
	1700 3100 1600 3200
Entry Wire Line
	1600 3100 1500 3200
Wire Wire Line
	1600 2900 1600 3100
Wire Wire Line
	1700 2900 1700 3100
Wire Wire Line
	1800 2900 1800 3100
Wire Wire Line
	1900 2900 1900 3100
Wire Wire Line
	2000 2900 2000 3100
Wire Wire Line
	2100 2900 2100 3100
Wire Wire Line
	2200 2900 2200 3100
Wire Wire Line
	2300 2900 2300 3100
Text Label 1600 2950 3    50   ~ 0
A_1
Text Label 1700 2950 3    50   ~ 0
B_1
Text Label 1800 2950 3    50   ~ 0
C_1
Text Label 1900 2950 3    50   ~ 0
D_1
Text Label 2000 2950 3    50   ~ 0
E_1
Text Label 2100 2950 3    50   ~ 0
F_1
Text Label 2200 2950 3    50   ~ 0
G_1
Text Label 2300 2900 3    50   ~ 0
DP_1
Entry Wire Line
	3200 3100 3100 3200
Wire Wire Line
	3200 2950 3200 3100
Entry Wire Line
	6050 900  6150 1000
Entry Wire Line
	6150 900  6250 1000
Entry Wire Line
	6250 900  6350 1000
Entry Wire Line
	6350 900  6450 1000
Entry Wire Line
	6450 900  6550 1000
Entry Wire Line
	6550 900  6650 1000
Text Label 6650 1300 1    50   ~ 0
CA12
Text Label 6550 1300 1    50   ~ 0
CA11
Text Label 6450 1300 1    50   ~ 0
CA10
Text Label 6350 1300 1    50   ~ 0
CA9
Text Label 6250 1300 1    50   ~ 0
CA8
Text Label 6150 1300 1    50   ~ 0
CA7
Entry Wire Line
	4350 1100 4450 1200
Entry Wire Line
	4450 1100 4550 1200
Entry Wire Line
	4550 1100 4650 1200
Entry Wire Line
	4650 1100 4750 1200
Entry Wire Line
	4750 1100 4850 1200
Entry Wire Line
	4250 1100 4350 1200
Wire Wire Line
	4450 1750 4450 1200
Wire Wire Line
	4550 1750 4550 1200
Wire Wire Line
	4650 1750 4650 1200
Wire Wire Line
	4750 1750 4750 1200
Wire Wire Line
	4850 1750 4850 1200
Wire Wire Line
	4350 1750 4350 1200
Text Label 4350 1600 1    50   ~ 0
CA1
Text Label 4850 1600 1    50   ~ 0
CA6
Text Label 4750 1600 1    50   ~ 0
CA5
Text Label 4650 1600 1    50   ~ 0
CA4
Text Label 4550 1600 1    50   ~ 0
CA3
Text Label 4450 1600 1    50   ~ 0
CA2
Text Label 1800 1400 1    50   ~ 0
CA1
Text Label 2300 1400 1    50   ~ 0
CA6
Text Label 2200 1400 1    50   ~ 0
CA5
Text Label 2100 1400 1    50   ~ 0
CA4
Text Label 2000 1400 1    50   ~ 0
CA3
Text Label 1900 1400 1    50   ~ 0
CA2
Wire Wire Line
	2100 1200 2100 1500
Wire Wire Line
	2200 1200 2200 1500
Wire Wire Line
	2300 1200 2300 1500
Wire Wire Line
	1250 1100 1250 1500
Wire Wire Line
	1600 1500 1600 1400
Wire Wire Line
	1600 1400 1150 1400
Wire Wire Line
	1150 1300 1700 1300
Wire Wire Line
	1700 1300 1700 1500
Wire Wire Line
	1250 1000 1250 1100
Connection ~ 1250 1100
Wire Wire Line
	1500 1500 1250 1500
Connection ~ 1250 1500
Wire Wire Line
	1250 1500 1250 2100
Text Label 3200 1400 1    50   ~ 0
CA1
Text Label 3600 1400 1    50   ~ 0
CA3
Text Label 3400 1400 1    50   ~ 0
CA2
Wire Wire Line
	3200 1200 3200 1800
Wire Wire Line
	1800 1200 1800 1500
Wire Wire Line
	1900 1200 1900 1500
Wire Wire Line
	3400 1200 3400 1800
Wire Wire Line
	2000 1200 2000 1500
Wire Wire Line
	3600 1200 3600 1800
Entry Wire Line
	3600 1200 3500 1100
Entry Wire Line
	3400 1200 3300 1100
Entry Wire Line
	3200 1200 3100 1100
Text Label 3000 1300 1    50   ~ 0
CA12
Text Label 2800 1300 1    50   ~ 0
CA11
Text Label 2700 1300 1    50   ~ 0
CA10
Text Label 2600 1300 1    50   ~ 0
CA9
Text Label 2500 1300 1    50   ~ 0
CA8
Text Label 2400 1300 1    50   ~ 0
CA7
Wire Wire Line
	2800 2900 3000 2900
Entry Wire Line
	1700 1100 1800 1200
Entry Wire Line
	2200 1100 2300 1200
Entry Wire Line
	2100 1100 2200 1200
Entry Wire Line
	2000 1100 2100 1200
Entry Wire Line
	1900 1100 2000 1200
Entry Wire Line
	1800 1100 1900 1200
Wire Wire Line
	1500 2900 1250 2900
Connection ~ 1250 2900
Wire Wire Line
	1250 2900 1250 2300
Wire Wire Line
	1250 2900 1250 3050
Wire Wire Line
	1150 2900 1250 2900
Entry Wire Line
	2900 900  3000 1000
Entry Wire Line
	2700 900  2800 1000
Entry Wire Line
	2600 900  2700 1000
Entry Wire Line
	2500 900  2600 1000
Entry Wire Line
	2400 900  2500 1000
Wire Wire Line
	3000 1000 3000 2900
Wire Wire Line
	2400 1500 2400 1000
Entry Wire Line
	2300 900  2400 1000
Wire Wire Line
	3200 2450 3200 2550
Connection ~ 3200 2550
Wire Wire Line
	3200 2550 3200 2650
Wire Wire Line
	2800 1500 2800 1000
Wire Wire Line
	6650 1750 6650 1000
Wire Wire Line
	6350 1750 6350 1000
Wire Wire Line
	6250 1750 6250 1000
Wire Wire Line
	6150 1750 6150 1000
Wire Wire Line
	6450 1750 6450 1000
Wire Wire Line
	6550 1750 6550 1000
$Comp
L extsui:OSL60362_IX U2
U 1 1 64F0B404
P 6400 2250
F 0 "U2" H 7100 2800 50  0000 L CNN
F 1 "OSL60362_IX" H 6700 2700 50  0000 L CNN
F 2 "extsui:OSL60362_XX" H 6500 3000 50  0001 C CNN
F 3 "" H 6500 3000 50  0001 C CNN
	1    6400 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1500 2500 1000
Wire Wire Line
	2600 1500 2600 1000
Wire Wire Line
	2700 1500 2700 1000
$Comp
L Building-rescue:HT16K33-28SOP-Garden-Grass-rescue IC1
U 1 1 5C2B207A
P 2150 2200
F 0 "IC1" H 1600 2950 50  0000 C CNN
F 1 "HT16K33-28SOP" H 2150 2950 50  0000 C CNN
F 2 "Package_SO:SOIC-28W_7.5x18.7mm_P1.27mm" H 1900 2950 50  0001 C CNN
F 3 "" H 1900 2950 50  0001 C CNN
	1    2150 2200
	0    -1   -1   0   
$EndComp
Connection ~ 3400 2550
Wire Wire Line
	3400 2550 3200 2550
Wire Wire Line
	3400 2550 3600 2550
Wire Notes Line
	800  700  7400 700 
Wire Notes Line
	7400 700  7400 3400
Wire Notes Line
	7400 3400 800  3400
Wire Notes Line
	800  3400 800  700 
$Comp
L power:GND #PWR0101
U 1 1 64FA0130
P 1250 5950
F 0 "#PWR0101" H 1250 5700 50  0001 C CNN
F 1 "GND" H 1255 5777 50  0000 C CNN
F 2 "" H 1250 5950 50  0001 C CNN
F 3 "" H 1250 5950 50  0001 C CNN
	1    1250 5950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 64FA0136
P 3200 5200
F 0 "R6" V 3100 5200 50  0000 C CNN
F 1 "39k" V 3200 5200 50  0000 C CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 3130 5200 50  0001 C CNN
F 3 "~" H 3200 5200 50  0001 C CNN
	1    3200 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 64FA013D
P 3400 5200
F 0 "R5" V 3300 5200 50  0000 C CNN
F 1 "39k" V 3400 5200 50  0000 C CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 3330 5200 50  0001 C CNN
F 3 "~" H 3400 5200 50  0001 C CNN
	1    3400 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 64FA0144
P 3600 5200
F 0 "R4" V 3500 5200 50  0000 C CNN
F 1 "39k" V 3600 5200 50  0000 C CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 3530 5200 50  0001 C CNN
F 3 "~" H 3600 5200 50  0001 C CNN
	1    3600 5200
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP6
U 1 1 64FA014B
P 3200 4850
F 0 "JP6" H 3200 4750 50  0000 C CNN
F 1 "A2" H 3350 4750 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3200 4850 50  0001 C CNN
F 3 "~" H 3200 4850 50  0001 C CNN
	1    3200 4850
	0    1    -1   0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP5
U 1 1 64FA0152
P 3400 4850
F 0 "JP5" H 3400 4950 50  0000 C CNN
F 1 "A1" H 3550 4950 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3400 4850 50  0001 C CNN
F 3 "~" H 3400 4850 50  0001 C CNN
	1    3400 4850
	0    -1   -1   0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP4
U 1 1 64FA0159
P 3600 4850
F 0 "JP4" H 3600 4950 50  0000 C CNN
F 1 "A0" H 3750 4950 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3600 4850 50  0001 C CNN
F 3 "~" H 3600 4850 50  0001 C CNN
	1    3600 4850
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 64FA0160
P 1250 3900
F 0 "#PWR0102" H 1250 3750 50  0001 C CNN
F 1 "+5V" H 1265 4073 50  0000 C CNN
F 2 "" H 1250 3900 50  0001 C CNN
F 3 "" H 1250 3900 50  0001 C CNN
	1    1250 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 5350 3400 5450
Wire Wire Line
	3600 5350 3600 5450
Wire Wire Line
	3200 5000 3200 5050
Wire Wire Line
	3400 5050 3400 5000
Wire Wire Line
	3600 5000 3600 5050
Text GLabel 1150 4300 0    50   Input ~ 0
SDA
Text GLabel 1150 4200 0    50   Input ~ 0
SCL
Text GLabel 1150 4000 0    50   Input ~ 0
+5V
Text GLabel 1150 5800 0    50   Input ~ 0
GND
Wire Wire Line
	1150 4000 1250 4000
$Comp
L Device:C_Small C2
U 1 1 64FA0170
P 1250 5100
F 0 "C2" V 1021 5100 50  0000 C CNN
F 1 "0.1u" V 1112 5100 50  0000 C CNN
F 2 "extsui:C_1608_HandSolderingCustom" H 1250 5100 50  0001 C CNN
F 3 "~" H 1250 5100 50  0001 C CNN
	1    1250 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky_ALT D2
U 1 1 64FA0177
P 3200 5700
F 0 "D2" H 3200 5600 50  0000 C CNN
F 1 "D" H 3200 5800 50  0000 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" H 3200 5700 50  0001 C CNN
F 3 "~" H 3200 5700 50  0001 C CNN
	1    3200 5700
	0    1    1    0   
$EndComp
$Comp
L extsui:OSL60362_IX U3
U 1 1 64FA017E
P 4600 5150
F 0 "U3" H 5300 5700 50  0000 L CNN
F 1 "OSL60362_IX" H 4900 5600 50  0000 L CNN
F 2 "extsui:OSL60362_XX" H 4700 5900 50  0001 C CNN
F 3 "" H 4700 5900 50  0001 C CNN
	1    4600 5150
	1    0    0    -1  
$EndComp
NoConn ~ 2400 5800
NoConn ~ 2500 5800
NoConn ~ 2600 5800
Entry Wire Line
	4150 6100 4250 6000
Entry Wire Line
	4250 6100 4350 6000
Entry Wire Line
	4350 6100 4450 6000
Entry Wire Line
	4450 6100 4550 6000
Entry Wire Line
	4550 6100 4650 6000
Entry Wire Line
	4650 6100 4750 6000
Entry Wire Line
	4750 6100 4850 6000
Entry Wire Line
	4850 6100 4950 6000
NoConn ~ 2700 5800
Entry Wire Line
	5950 6100 6050 6000
Entry Wire Line
	6050 6100 6150 6000
Entry Wire Line
	6150 6100 6250 6000
Entry Wire Line
	6250 6100 6350 6000
Entry Wire Line
	6350 6100 6450 6000
Entry Wire Line
	6450 6100 6550 6000
Entry Wire Line
	6550 6100 6650 6000
Entry Wire Line
	6650 6100 6750 6000
Entry Wire Line
	2300 6000 2200 6100
Entry Wire Line
	2200 6000 2100 6100
Entry Wire Line
	2100 6000 2000 6100
Entry Wire Line
	2000 6000 1900 6100
Entry Wire Line
	1900 6000 1800 6100
Entry Wire Line
	1800 6000 1700 6100
Entry Wire Line
	1700 6000 1600 6100
Entry Wire Line
	1600 6000 1500 6100
Entry Wire Line
	3200 6000 3100 6100
Wire Wire Line
	3200 5850 3200 6000
Text Label 3200 5850 3    50   ~ 0
A_2
Entry Wire Line
	6050 3800 6150 3900
Entry Wire Line
	6150 3800 6250 3900
Entry Wire Line
	6250 3800 6350 3900
Entry Wire Line
	6350 3800 6450 3900
Entry Wire Line
	6450 3800 6550 3900
Entry Wire Line
	6550 3800 6650 3900
Text Label 6650 4200 1    50   ~ 0
CA24
Text Label 6550 4200 1    50   ~ 0
CA23
Text Label 6450 4200 1    50   ~ 0
CA22
Text Label 6350 4200 1    50   ~ 0
CA21
Text Label 6250 4200 1    50   ~ 0
CA20
Text Label 6150 4200 1    50   ~ 0
CA19
Entry Wire Line
	4350 4000 4450 4100
Entry Wire Line
	4450 4000 4550 4100
Entry Wire Line
	4550 4000 4650 4100
Entry Wire Line
	4650 4000 4750 4100
Entry Wire Line
	4750 4000 4850 4100
Entry Wire Line
	4250 4000 4350 4100
Wire Wire Line
	4450 4650 4450 4100
Wire Wire Line
	4550 4650 4550 4100
Wire Wire Line
	4650 4650 4650 4100
Wire Wire Line
	4750 4650 4750 4100
Wire Wire Line
	4850 4650 4850 4100
Wire Wire Line
	4350 4650 4350 4100
Text Label 4350 4500 1    50   ~ 0
CA13
Text Label 4850 4500 1    50   ~ 0
CA18
Text Label 4750 4500 1    50   ~ 0
CA17
Text Label 4650 4500 1    50   ~ 0
CA16
Text Label 4550 4500 1    50   ~ 0
CA15
Text Label 4450 4500 1    50   ~ 0
CA14
Text Label 1800 4300 1    50   ~ 0
CA13
Text Label 2300 4300 1    50   ~ 0
CA18
Text Label 2200 4300 1    50   ~ 0
CA17
Text Label 2100 4300 1    50   ~ 0
CA16
Text Label 2000 4300 1    50   ~ 0
CA15
Text Label 1900 4300 1    50   ~ 0
CA14
Wire Wire Line
	2100 4100 2100 4400
Wire Wire Line
	2200 4100 2200 4400
Wire Wire Line
	2300 4100 2300 4400
Wire Wire Line
	1250 4000 1250 4400
Wire Wire Line
	1600 4400 1600 4300
Wire Wire Line
	1600 4300 1150 4300
Wire Wire Line
	1150 4200 1700 4200
Wire Wire Line
	1700 4200 1700 4400
Wire Wire Line
	1250 3900 1250 4000
Connection ~ 1250 4000
Wire Wire Line
	1500 4400 1250 4400
Connection ~ 1250 4400
Wire Wire Line
	1250 4400 1250 5000
Text Label 3200 4300 1    50   ~ 0
CA13
Text Label 3600 4300 1    50   ~ 0
CA15
Text Label 3400 4300 1    50   ~ 0
CA14
Wire Wire Line
	3200 4100 3200 4700
Wire Wire Line
	1800 4100 1800 4400
Wire Wire Line
	1900 4100 1900 4400
Wire Wire Line
	3400 4100 3400 4700
Wire Wire Line
	2000 4100 2000 4400
Wire Wire Line
	3600 4100 3600 4700
Entry Wire Line
	3600 4100 3500 4000
Entry Wire Line
	3400 4100 3300 4000
Entry Wire Line
	3200 4100 3100 4000
Text Label 3000 4200 1    50   ~ 0
CA24
Text Label 2800 4200 1    50   ~ 0
CA23
Text Label 2700 4200 1    50   ~ 0
CA22
Text Label 2600 4200 1    50   ~ 0
CA21
Text Label 2500 4200 1    50   ~ 0
CA20
Text Label 2400 4200 1    50   ~ 0
CA19
Wire Wire Line
	2800 5800 3000 5800
Entry Wire Line
	1700 4000 1800 4100
Entry Wire Line
	2200 4000 2300 4100
Entry Wire Line
	2100 4000 2200 4100
Entry Wire Line
	2000 4000 2100 4100
Entry Wire Line
	1900 4000 2000 4100
Entry Wire Line
	1800 4000 1900 4100
Wire Wire Line
	1500 5800 1250 5800
Connection ~ 1250 5800
Wire Wire Line
	1250 5800 1250 5200
Wire Wire Line
	1250 5800 1250 5950
Wire Wire Line
	1150 5800 1250 5800
Entry Wire Line
	2900 3800 3000 3900
Entry Wire Line
	2700 3800 2800 3900
Entry Wire Line
	2600 3800 2700 3900
Entry Wire Line
	2500 3800 2600 3900
Entry Wire Line
	2400 3800 2500 3900
Wire Wire Line
	3000 3900 3000 5800
Wire Wire Line
	2400 4400 2400 3900
Entry Wire Line
	2300 3800 2400 3900
Wire Wire Line
	3200 5350 3200 5450
Connection ~ 3200 5450
Wire Wire Line
	3200 5450 3200 5550
Wire Wire Line
	2800 4400 2800 3900
Wire Wire Line
	6650 4650 6650 3900
Wire Wire Line
	6350 4650 6350 3900
Wire Wire Line
	6250 4650 6250 3900
Wire Wire Line
	6150 4650 6150 3900
Wire Wire Line
	6450 4650 6450 3900
Wire Wire Line
	6550 4650 6550 3900
$Comp
L extsui:OSL60362_IX U4
U 1 1 64FA0235
P 6400 5150
F 0 "U4" H 7100 5700 50  0000 L CNN
F 1 "OSL60362_IX" H 6700 5600 50  0000 L CNN
F 2 "extsui:OSL60362_XX" H 6500 5900 50  0001 C CNN
F 3 "" H 6500 5900 50  0001 C CNN
	1    6400 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4400 2500 3900
Wire Wire Line
	2600 4400 2600 3900
Wire Wire Line
	2700 4400 2700 3900
$Comp
L Building-rescue:HT16K33-28SOP-Garden-Grass-rescue IC2
U 1 1 64FA023F
P 2150 5100
F 0 "IC2" H 1600 5850 50  0000 C CNN
F 1 "HT16K33-28SOP" H 2150 5850 50  0000 C CNN
F 2 "Package_SO:SOIC-28W_7.5x18.7mm_P1.27mm" H 1900 5850 50  0001 C CNN
F 3 "" H 1900 5850 50  0001 C CNN
	1    2150 5100
	0    -1   -1   0   
$EndComp
Connection ~ 3400 5450
Wire Wire Line
	3400 5450 3200 5450
Wire Wire Line
	3400 5450 3600 5450
Wire Notes Line
	800  3600 7400 3600
Wire Notes Line
	7400 3600 7400 6300
Wire Notes Line
	7400 6300 800  6300
Wire Notes Line
	800  6300 800  3600
$Comp
L power:GND #PWR0103
U 1 1 64FB7B58
P 1250 8850
F 0 "#PWR0103" H 1250 8600 50  0001 C CNN
F 1 "GND" H 1255 8677 50  0000 C CNN
F 2 "" H 1250 8850 50  0001 C CNN
F 3 "" H 1250 8850 50  0001 C CNN
	1    1250 8850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 64FB7B5E
P 3200 8100
F 0 "R9" V 3100 8100 50  0000 C CNN
F 1 "39k" V 3200 8100 50  0000 C CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 3130 8100 50  0001 C CNN
F 3 "~" H 3200 8100 50  0001 C CNN
	1    3200 8100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 64FB7B65
P 3400 8100
F 0 "R8" V 3300 8100 50  0000 C CNN
F 1 "39k" V 3400 8100 50  0000 C CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 3330 8100 50  0001 C CNN
F 3 "~" H 3400 8100 50  0001 C CNN
	1    3400 8100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 64FB7B6C
P 3600 8100
F 0 "R7" V 3500 8100 50  0000 C CNN
F 1 "39k" V 3600 8100 50  0000 C CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 3530 8100 50  0001 C CNN
F 3 "~" H 3600 8100 50  0001 C CNN
	1    3600 8100
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP9
U 1 1 64FB7B73
P 3200 7750
F 0 "JP9" H 3200 7650 50  0000 C CNN
F 1 "A2" H 3350 7650 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3200 7750 50  0001 C CNN
F 3 "~" H 3200 7750 50  0001 C CNN
	1    3200 7750
	0    1    -1   0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP8
U 1 1 64FB7B7A
P 3400 7750
F 0 "JP8" H 3400 7850 50  0000 C CNN
F 1 "A1" H 3550 7850 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3400 7750 50  0001 C CNN
F 3 "~" H 3400 7750 50  0001 C CNN
	1    3400 7750
	0    -1   -1   0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP7
U 1 1 64FB7B81
P 3600 7750
F 0 "JP7" H 3600 7850 50  0000 C CNN
F 1 "A0" H 3750 7850 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3600 7750 50  0001 C CNN
F 3 "~" H 3600 7750 50  0001 C CNN
	1    3600 7750
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0104
U 1 1 64FB7B88
P 1250 6800
F 0 "#PWR0104" H 1250 6650 50  0001 C CNN
F 1 "+5V" H 1265 6973 50  0000 C CNN
F 2 "" H 1250 6800 50  0001 C CNN
F 3 "" H 1250 6800 50  0001 C CNN
	1    1250 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 8250 3400 8350
Wire Wire Line
	3600 8250 3600 8350
Wire Wire Line
	3200 7900 3200 7950
Wire Wire Line
	3400 7950 3400 7900
Wire Wire Line
	3600 7900 3600 7950
Text GLabel 1150 7200 0    50   Input ~ 0
SDA
Text GLabel 1150 7100 0    50   Input ~ 0
SCL
Text GLabel 1150 6900 0    50   Input ~ 0
+5V
Text GLabel 1150 8700 0    50   Input ~ 0
GND
Wire Wire Line
	1150 6900 1250 6900
$Comp
L Device:C_Small C3
U 1 1 64FB7B98
P 1250 8000
F 0 "C3" V 1021 8000 50  0000 C CNN
F 1 "0.1u" V 1112 8000 50  0000 C CNN
F 2 "extsui:C_1608_HandSolderingCustom" H 1250 8000 50  0001 C CNN
F 3 "~" H 1250 8000 50  0001 C CNN
	1    1250 8000
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky_ALT D3
U 1 1 64FB7B9F
P 3200 8600
F 0 "D3" H 3200 8500 50  0000 C CNN
F 1 "D" H 3200 8700 50  0000 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" H 3200 8600 50  0001 C CNN
F 3 "~" H 3200 8600 50  0001 C CNN
	1    3200 8600
	0    1    1    0   
$EndComp
$Comp
L extsui:OSL60362_IX U5
U 1 1 64FB7BA6
P 4600 8050
F 0 "U5" H 5300 8600 50  0000 L CNN
F 1 "OSL60362_IX" H 4900 8500 50  0000 L CNN
F 2 "extsui:OSL60362_XX" H 4700 8800 50  0001 C CNN
F 3 "" H 4700 8800 50  0001 C CNN
	1    4600 8050
	1    0    0    -1  
$EndComp
NoConn ~ 2400 8700
NoConn ~ 2500 8700
NoConn ~ 2600 8700
Entry Wire Line
	4150 9000 4250 8900
Entry Wire Line
	4250 9000 4350 8900
Entry Wire Line
	4350 9000 4450 8900
Entry Wire Line
	4450 9000 4550 8900
Entry Wire Line
	4550 9000 4650 8900
Entry Wire Line
	4650 9000 4750 8900
Entry Wire Line
	4750 9000 4850 8900
Entry Wire Line
	4850 9000 4950 8900
NoConn ~ 2700 8700
Entry Wire Line
	5950 9000 6050 8900
Entry Wire Line
	6050 9000 6150 8900
Entry Wire Line
	6150 9000 6250 8900
Entry Wire Line
	6250 9000 6350 8900
Entry Wire Line
	6350 9000 6450 8900
Entry Wire Line
	6450 9000 6550 8900
Entry Wire Line
	6550 9000 6650 8900
Entry Wire Line
	6650 9000 6750 8900
Entry Wire Line
	2300 8900 2200 9000
Entry Wire Line
	2200 8900 2100 9000
Entry Wire Line
	2100 8900 2000 9000
Entry Wire Line
	2000 8900 1900 9000
Entry Wire Line
	1900 8900 1800 9000
Entry Wire Line
	1800 8900 1700 9000
Entry Wire Line
	1700 8900 1600 9000
Entry Wire Line
	1600 8900 1500 9000
Entry Wire Line
	3200 8900 3100 9000
Wire Wire Line
	3200 8750 3200 8900
Text Label 3200 8750 3    50   ~ 0
A_3
Entry Wire Line
	6050 6700 6150 6800
Entry Wire Line
	6150 6700 6250 6800
Entry Wire Line
	6250 6700 6350 6800
Entry Wire Line
	6350 6700 6450 6800
Entry Wire Line
	6450 6700 6550 6800
Entry Wire Line
	6550 6700 6650 6800
Text Label 6650 7100 1    50   ~ 0
CA36
Text Label 6550 7100 1    50   ~ 0
CA35
Text Label 6450 7100 1    50   ~ 0
CA34
Text Label 6350 7100 1    50   ~ 0
CA33
Text Label 6250 7100 1    50   ~ 0
CA32
Text Label 6150 7100 1    50   ~ 0
CA31
Entry Wire Line
	4350 6900 4450 7000
Entry Wire Line
	4450 6900 4550 7000
Entry Wire Line
	4550 6900 4650 7000
Entry Wire Line
	4650 6900 4750 7000
Entry Wire Line
	4750 6900 4850 7000
Entry Wire Line
	4250 6900 4350 7000
Wire Wire Line
	4450 7550 4450 7000
Wire Wire Line
	4550 7550 4550 7000
Wire Wire Line
	4650 7550 4650 7000
Wire Wire Line
	4750 7550 4750 7000
Wire Wire Line
	4850 7550 4850 7000
Wire Wire Line
	4350 7550 4350 7000
Text Label 4350 7400 1    50   ~ 0
CA25
Text Label 4850 7400 1    50   ~ 0
CA30
Text Label 4750 7400 1    50   ~ 0
CA29
Text Label 4650 7400 1    50   ~ 0
CA28
Text Label 4550 7400 1    50   ~ 0
CA27
Text Label 4450 7400 1    50   ~ 0
CA26
Text Label 1800 7200 1    50   ~ 0
CA25
Text Label 2300 7200 1    50   ~ 0
CA30
Text Label 2200 7200 1    50   ~ 0
CA29
Text Label 2100 7200 1    50   ~ 0
CA28
Text Label 2000 7200 1    50   ~ 0
CA27
Text Label 1900 7200 1    50   ~ 0
CA26
Wire Wire Line
	2100 7000 2100 7300
Wire Wire Line
	2200 7000 2200 7300
Wire Wire Line
	2300 7000 2300 7300
Wire Wire Line
	1250 6900 1250 7300
Wire Wire Line
	1600 7300 1600 7200
Wire Wire Line
	1600 7200 1150 7200
Wire Wire Line
	1150 7100 1700 7100
Wire Wire Line
	1700 7100 1700 7300
Wire Wire Line
	1250 6800 1250 6900
Connection ~ 1250 6900
Wire Wire Line
	1500 7300 1250 7300
Connection ~ 1250 7300
Wire Wire Line
	1250 7300 1250 7900
Text Label 3200 7200 1    50   ~ 0
CA25
Text Label 3600 7200 1    50   ~ 0
CA27
Text Label 3400 7200 1    50   ~ 0
CA26
Wire Wire Line
	3200 7000 3200 7600
Wire Wire Line
	1800 7000 1800 7300
Wire Wire Line
	1900 7000 1900 7300
Wire Wire Line
	3400 7000 3400 7600
Wire Wire Line
	2000 7000 2000 7300
Wire Wire Line
	3600 7000 3600 7600
Entry Wire Line
	3600 7000 3500 6900
Entry Wire Line
	3400 7000 3300 6900
Entry Wire Line
	3200 7000 3100 6900
Text Label 3000 7100 1    50   ~ 0
CA36
Text Label 2800 7100 1    50   ~ 0
CA35
Text Label 2700 7100 1    50   ~ 0
CA34
Text Label 2600 7100 1    50   ~ 0
CA33
Text Label 2500 7100 1    50   ~ 0
CA32
Text Label 2400 7100 1    50   ~ 0
CA31
Wire Wire Line
	2800 8700 3000 8700
Entry Wire Line
	1700 6900 1800 7000
Entry Wire Line
	2200 6900 2300 7000
Entry Wire Line
	2100 6900 2200 7000
Entry Wire Line
	2000 6900 2100 7000
Entry Wire Line
	1900 6900 2000 7000
Entry Wire Line
	1800 6900 1900 7000
Wire Wire Line
	1500 8700 1250 8700
Connection ~ 1250 8700
Wire Wire Line
	1250 8700 1250 8100
Wire Wire Line
	1250 8700 1250 8850
Wire Wire Line
	1150 8700 1250 8700
Entry Wire Line
	2900 6700 3000 6800
Entry Wire Line
	2700 6700 2800 6800
Entry Wire Line
	2600 6700 2700 6800
Entry Wire Line
	2500 6700 2600 6800
Entry Wire Line
	2400 6700 2500 6800
Wire Wire Line
	3000 6800 3000 8700
Wire Wire Line
	2400 7300 2400 6800
Entry Wire Line
	2300 6700 2400 6800
Wire Wire Line
	3200 8250 3200 8350
Connection ~ 3200 8350
Wire Wire Line
	3200 8350 3200 8450
Wire Wire Line
	2800 7300 2800 6800
Wire Wire Line
	6650 7550 6650 6800
Wire Wire Line
	6350 7550 6350 6800
Wire Wire Line
	6250 7550 6250 6800
Wire Wire Line
	6150 7550 6150 6800
Wire Wire Line
	6450 7550 6450 6800
Wire Wire Line
	6550 7550 6550 6800
$Comp
L extsui:OSL60362_IX U6
U 1 1 64FB7C5D
P 6400 8050
F 0 "U6" H 7100 8600 50  0000 L CNN
F 1 "OSL60362_IX" H 6700 8500 50  0000 L CNN
F 2 "extsui:OSL60362_XX" H 6500 8800 50  0001 C CNN
F 3 "" H 6500 8800 50  0001 C CNN
	1    6400 8050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 7300 2500 6800
Wire Wire Line
	2600 7300 2600 6800
Wire Wire Line
	2700 7300 2700 6800
$Comp
L Building-rescue:HT16K33-28SOP-Garden-Grass-rescue IC3
U 1 1 64FB7C67
P 2150 8000
F 0 "IC3" H 1600 8750 50  0000 C CNN
F 1 "HT16K33-28SOP" H 2150 8750 50  0000 C CNN
F 2 "Package_SO:SOIC-28W_7.5x18.7mm_P1.27mm" H 1900 8750 50  0001 C CNN
F 3 "" H 1900 8750 50  0001 C CNN
	1    2150 8000
	0    -1   -1   0   
$EndComp
Connection ~ 3400 8350
Wire Wire Line
	3400 8350 3200 8350
Wire Wire Line
	3400 8350 3600 8350
Wire Notes Line
	800  6500 7400 6500
Wire Notes Line
	7400 6500 7400 9200
Wire Notes Line
	7400 9200 800  9200
Wire Notes Line
	800  9200 800  6500
Text Notes 1500 10850 0    50   ~ 0
* 2.54mm pitch to Mother Board (both sides)\n  (Card Edge Connector)\n\n* The I2C pull-up resistor is externally attached.\n\n* The I2C signal voltage is required 5V.\n  (Due to HT16K33 specification)
Text Notes 850  650  0    50   ~ 0
CA1-12
Text Notes 850  6450 0    50   ~ 0
CA25-36
Text Notes 850  3550 0    50   ~ 0
CA13-24
Text Label 3200 2950 3    50   ~ 0
A_1
Wire Wire Line
	4250 2700 4250 3100
Wire Wire Line
	4350 2700 4350 3100
Wire Wire Line
	4450 2700 4450 3100
Wire Wire Line
	4550 2700 4550 3100
Wire Wire Line
	4650 2700 4650 3100
Wire Wire Line
	4750 2700 4750 3100
Wire Wire Line
	4850 2700 4850 3100
Wire Wire Line
	4950 2700 4950 3100
Text Label 4250 2950 3    50   ~ 0
A_1
Text Label 4350 2950 3    50   ~ 0
B_1
Text Label 4450 2950 3    50   ~ 0
C_1
Text Label 4550 2950 3    50   ~ 0
D_1
Text Label 4650 2950 3    50   ~ 0
E_1
Text Label 4750 2950 3    50   ~ 0
F_1
Text Label 4850 2950 3    50   ~ 0
G_1
Text Label 4950 2900 3    50   ~ 0
DP_1
Wire Wire Line
	6050 2700 6050 3100
Wire Wire Line
	6150 2700 6150 3100
Wire Wire Line
	6250 2700 6250 3100
Wire Wire Line
	6350 2700 6350 3100
Wire Wire Line
	6450 2700 6450 3100
Wire Wire Line
	6550 2700 6550 3100
Wire Wire Line
	6650 2700 6650 3100
Wire Wire Line
	6750 2700 6750 3100
Text Label 6050 2950 3    50   ~ 0
A_1
Text Label 6150 2950 3    50   ~ 0
B_1
Text Label 6250 2950 3    50   ~ 0
C_1
Text Label 6350 2950 3    50   ~ 0
D_1
Text Label 6450 2950 3    50   ~ 0
E_1
Text Label 6550 2950 3    50   ~ 0
F_1
Text Label 6650 2950 3    50   ~ 0
G_1
Text Label 6750 2900 3    50   ~ 0
DP_1
Wire Wire Line
	1600 5800 1600 6000
Wire Wire Line
	1700 5800 1700 6000
Wire Wire Line
	1800 5800 1800 6000
Wire Wire Line
	1900 5800 1900 6000
Wire Wire Line
	2000 5800 2000 6000
Wire Wire Line
	2100 5800 2100 6000
Wire Wire Line
	2200 5800 2200 6000
Wire Wire Line
	2300 5800 2300 6000
Text Label 1600 5850 3    50   ~ 0
A_2
Text Label 1700 5850 3    50   ~ 0
B_2
Text Label 1800 5850 3    50   ~ 0
C_2
Text Label 1900 5850 3    50   ~ 0
D_2
Text Label 2000 5850 3    50   ~ 0
E_2
Text Label 2100 5850 3    50   ~ 0
F_2
Text Label 2200 5850 3    50   ~ 0
G_2
Text Label 2300 5800 3    50   ~ 0
DP_2
Wire Wire Line
	4250 5600 4250 6000
Wire Wire Line
	4350 5600 4350 6000
Wire Wire Line
	4450 5600 4450 6000
Wire Wire Line
	4550 5600 4550 6000
Wire Wire Line
	4650 5600 4650 6000
Wire Wire Line
	4750 5600 4750 6000
Wire Wire Line
	4850 5600 4850 6000
Wire Wire Line
	4950 5600 4950 6000
Text Label 4250 5850 3    50   ~ 0
A_2
Text Label 4350 5850 3    50   ~ 0
B_2
Text Label 4450 5850 3    50   ~ 0
C_2
Text Label 4550 5850 3    50   ~ 0
D_2
Text Label 4650 5850 3    50   ~ 0
E_2
Text Label 4750 5850 3    50   ~ 0
F_2
Text Label 4850 5850 3    50   ~ 0
G_2
Text Label 4950 5800 3    50   ~ 0
DP_2
Wire Wire Line
	1600 8700 1600 8900
Wire Wire Line
	1700 8700 1700 8900
Wire Wire Line
	1800 8700 1800 8900
Wire Wire Line
	1900 8700 1900 8900
Wire Wire Line
	2000 8700 2000 8900
Wire Wire Line
	2100 8700 2100 8900
Wire Wire Line
	2200 8700 2200 8900
Wire Wire Line
	2300 8700 2300 8900
Text Label 1600 8750 3    50   ~ 0
A_3
Text Label 1700 8750 3    50   ~ 0
B_3
Text Label 1800 8750 3    50   ~ 0
C_3
Text Label 1900 8750 3    50   ~ 0
D_3
Text Label 2000 8750 3    50   ~ 0
E_3
Text Label 2100 8750 3    50   ~ 0
F_3
Text Label 2200 8750 3    50   ~ 0
G_3
Text Label 2300 8700 3    50   ~ 0
DP_3
Wire Wire Line
	4250 8500 4250 8900
Wire Wire Line
	4350 8500 4350 8900
Wire Wire Line
	4450 8500 4450 8900
Wire Wire Line
	4550 8500 4550 8900
Wire Wire Line
	4650 8500 4650 8900
Wire Wire Line
	4750 8500 4750 8900
Wire Wire Line
	4850 8500 4850 8900
Wire Wire Line
	4950 8500 4950 8900
Text Label 4250 8750 3    50   ~ 0
A_3
Text Label 4350 8750 3    50   ~ 0
B_3
Text Label 4450 8750 3    50   ~ 0
C_3
Text Label 4550 8750 3    50   ~ 0
D_3
Text Label 4650 8750 3    50   ~ 0
E_3
Text Label 4750 8750 3    50   ~ 0
F_3
Text Label 4850 8750 3    50   ~ 0
G_3
Text Label 4950 8700 3    50   ~ 0
DP_3
Wire Wire Line
	6050 8500 6050 8900
Wire Wire Line
	6150 8500 6150 8900
Wire Wire Line
	6250 8500 6250 8900
Wire Wire Line
	6350 8500 6350 8900
Wire Wire Line
	6450 8500 6450 8900
Wire Wire Line
	6550 8500 6550 8900
Wire Wire Line
	6650 8500 6650 8900
Wire Wire Line
	6750 8500 6750 8900
Text Label 6050 8750 3    50   ~ 0
A_3
Text Label 6150 8750 3    50   ~ 0
B_3
Text Label 6250 8750 3    50   ~ 0
C_3
Text Label 6350 8750 3    50   ~ 0
D_3
Text Label 6450 8750 3    50   ~ 0
E_3
Text Label 6550 8750 3    50   ~ 0
F_3
Text Label 6650 8750 3    50   ~ 0
G_3
Text Label 6750 8700 3    50   ~ 0
DP_3
Wire Wire Line
	6050 5600 6050 6000
Wire Wire Line
	6150 5600 6150 6000
Wire Wire Line
	6250 5600 6250 6000
Wire Wire Line
	6350 5600 6350 6000
Wire Wire Line
	6450 5600 6450 6000
Wire Wire Line
	6550 5600 6550 6000
Wire Wire Line
	6650 5600 6650 6000
Wire Wire Line
	6750 5600 6750 6000
Text Label 6050 5850 3    50   ~ 0
A_2
Text Label 6150 5850 3    50   ~ 0
B_2
Text Label 6250 5850 3    50   ~ 0
C_2
Text Label 6350 5850 3    50   ~ 0
D_2
Text Label 6450 5850 3    50   ~ 0
E_2
Text Label 6550 5850 3    50   ~ 0
F_2
Text Label 6650 5850 3    50   ~ 0
G_2
Text Label 6750 5800 3    50   ~ 0
DP_2
Wire Bus Line
	2300 900  6550 900 
Wire Bus Line
	1700 1100 4750 1100
Wire Bus Line
	2300 3800 6550 3800
Wire Bus Line
	1700 4000 4750 4000
Wire Bus Line
	2300 6700 6550 6700
Wire Bus Line
	1700 6900 4750 6900
Wire Bus Line
	1500 3200 6650 3200
Wire Bus Line
	1500 6100 6650 6100
Wire Bus Line
	1500 9000 6650 9000
$EndSCHEMATC
