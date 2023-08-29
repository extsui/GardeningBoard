EESchema Schematic File Version 4
LIBS:Building-cache
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
L power:GND #PWR06
U 1 1 5C2C9BBC
P 2500 2750
F 0 "#PWR06" H 2500 2500 50  0001 C CNN
F 1 "GND" H 2505 2577 50  0000 C CNN
F 2 "" H 2500 2750 50  0001 C CNN
F 3 "" H 2500 2750 50  0001 C CNN
	1    2500 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5C2CAF32
P 4750 2050
F 0 "R1" V 4650 2050 50  0000 C CNN
F 1 "39k" V 4750 2050 50  0000 C CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 4680 2050 50  0001 C CNN
F 3 "~" H 4750 2050 50  0001 C CNN
	1    4750 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5C2CAF7E
P 5050 2050
F 0 "R2" V 4950 2050 50  0000 C CNN
F 1 "39k" V 5050 2050 50  0000 C CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 4980 2050 50  0001 C CNN
F 3 "~" H 5050 2050 50  0001 C CNN
	1    5050 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5C2CAFA0
P 5350 2050
F 0 "R3" V 5250 2050 50  0000 C CNN
F 1 "39k" V 5350 2050 50  0000 C CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 5280 2050 50  0001 C CNN
F 3 "~" H 5350 2050 50  0001 C CNN
	1    5350 2050
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP1
U 1 1 5C2CB500
P 4750 1700
F 0 "JP1" H 4750 1600 50  0000 C CNN
F 1 "A2" H 4750 1800 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 4750 1700 50  0001 C CNN
F 3 "~" H 4750 1700 50  0001 C CNN
	1    4750 1700
	0    1    -1   0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP2
U 1 1 5C2CB546
P 5050 1700
F 0 "JP2" H 5050 1800 50  0000 C CNN
F 1 "A1" H 5050 1600 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 5050 1700 50  0001 C CNN
F 3 "~" H 5050 1700 50  0001 C CNN
	1    5050 1700
	0    -1   -1   0   
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP3
U 1 1 5C2CB568
P 5350 1700
F 0 "JP3" H 5350 1800 50  0000 C CNN
F 1 "A0" H 5350 1600 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 5350 1700 50  0001 C CNN
F 3 "~" H 5350 1700 50  0001 C CNN
	1    5350 1700
	0    -1   -1   0   
$EndComp
Text Notes 1700 1900 2    50   ~ 0
The I2C pull-up resistor is \nexternally attached.
$Comp
L power:+5V #PWR05
U 1 1 5C2CBF57
P 2500 850
F 0 "#PWR05" H 2500 700 50  0001 C CNN
F 1 "+5V" H 2515 1023 50  0000 C CNN
F 2 "" H 2500 850 50  0001 C CNN
F 3 "" H 2500 850 50  0001 C CNN
	1    2500 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 2200 5050 2300
Wire Wire Line
	5350 2200 5350 2300
Wire Wire Line
	4750 1850 4750 1900
Wire Wire Line
	5050 1900 5050 1850
Wire Wire Line
	5350 1850 5350 1900
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
	5050 2300 5350 2300
Text GLabel 1000 6700 1    50   Input ~ 0
+5V
Text GLabel 1200 6700 1    50   Input ~ 0
SCL
Text GLabel 1100 6700 1    50   Input ~ 0
SDA
Text GLabel 1400 6700 1    50   Input ~ 0
GND
Text GLabel 2400 1150 0    50   Input ~ 0
SDA
Text GLabel 2400 1050 0    50   Input ~ 0
SCL
Text GLabel 2400 950  0    50   Input ~ 0
+5V
Text GLabel 2400 2650 0    50   Input ~ 0
GND
Wire Wire Line
	2400 950  2500 950 
$Comp
L Device:C_Small C1
U 1 1 5C2DF16B
P 2500 1950
F 0 "C1" V 2271 1950 50  0000 C CNN
F 1 "0.1u" V 2362 1950 50  0000 C CNN
F 2 "extsui:C_1608_HandSolderingCustom" H 2500 1950 50  0001 C CNN
F 3 "~" H 2500 1950 50  0001 C CNN
	1    2500 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky_ALT D1
U 1 1 5C2E2B2F
P 4750 2550
F 0 "D1" H 4750 2450 50  0000 C CNN
F 1 "D" H 4750 2650 50  0000 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" H 4750 2550 50  0001 C CNN
F 3 "~" H 4750 2550 50  0001 C CNN
	1    4750 2550
	0    1    1    0   
$EndComp
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
Text Notes 700  7400 0    50   ~ 0
2.54mm pitch to Mother Board (both sides)\n(Card Edge Connector)
$Comp
L Connector_Generic:Conn_01x05 J1
U 1 1 5CEBBC43
P 1200 7100
F 0 "J1" V 1073 6812 50  0000 R CNN
F 1 "Conn_01x05" V 1164 6812 50  0000 R CNN
F 2 "extsui:EDAC_5P_P2.54mm" H 1200 7100 50  0001 C CNN
F 3 "~" H 1200 7100 50  0001 C CNN
	1    1200 7100
	0    -1   1    0   
$EndComp
Wire Wire Line
	1000 6700 1000 6900
Wire Wire Line
	1100 6900 1100 6700
Wire Wire Line
	1200 6700 1200 6900
Wire Wire Line
	1400 6900 1400 6700
NoConn ~ 1300 6900
$Comp
L extsui:OSL60362_IX U?
U 1 1 64EE7689
P 6700 2000
F 0 "U?" H 7528 2071 50  0000 L CNN
F 1 "OSL60362_IX" H 7528 1980 50  0000 L CNN
F 2 "" H 6800 2750 50  0001 C CNN
F 3 "" H 6800 2750 50  0001 C CNN
	1    6700 2000
	1    0    0    -1  
$EndComp
NoConn ~ 3650 2650
NoConn ~ 3750 2650
NoConn ~ 3850 2650
Entry Wire Line
	6250 2950 6350 2850
Entry Wire Line
	6350 2950 6450 2850
Entry Wire Line
	6450 2950 6550 2850
Entry Wire Line
	6550 2950 6650 2850
Entry Wire Line
	6650 2950 6750 2850
Entry Wire Line
	6750 2950 6850 2850
Entry Wire Line
	6850 2950 6950 2850
Entry Wire Line
	6950 2950 7050 2850
Wire Wire Line
	6350 2450 6350 2850
Wire Wire Line
	6450 2450 6450 2850
Wire Wire Line
	6550 2450 6550 2850
Wire Wire Line
	6650 2450 6650 2850
Wire Wire Line
	6750 2450 6750 2850
Wire Wire Line
	6850 2450 6850 2850
Wire Wire Line
	6950 2450 6950 2850
Wire Wire Line
	7050 2450 7050 2850
NoConn ~ 3950 2650
Text Label 6350 2850 2    50   ~ 0
A
Text Label 6450 2850 2    50   ~ 0
B
Text Label 6550 2850 2    50   ~ 0
C
Text Label 6650 2850 2    50   ~ 0
D
Text Label 6750 2850 2    50   ~ 0
E
Text Label 6850 2850 2    50   ~ 0
F
Text Label 6950 2850 2    50   ~ 0
G
Text Label 7050 2850 2    50   ~ 0
DP
Entry Wire Line
	8450 2950 8550 2850
Entry Wire Line
	8550 2950 8650 2850
Entry Wire Line
	8650 2950 8750 2850
Entry Wire Line
	8750 2950 8850 2850
Entry Wire Line
	8850 2950 8950 2850
Entry Wire Line
	8950 2950 9050 2850
Entry Wire Line
	9050 2950 9150 2850
Entry Wire Line
	9150 2950 9250 2850
Wire Wire Line
	8550 2450 8550 2850
Wire Wire Line
	8650 2450 8650 2850
Wire Wire Line
	8750 2450 8750 2850
Wire Wire Line
	8850 2450 8850 2850
Wire Wire Line
	8950 2450 8950 2850
Wire Wire Line
	9050 2450 9050 2850
Wire Wire Line
	9150 2450 9150 2850
Wire Wire Line
	9250 2450 9250 2850
Text Label 8550 2850 2    50   ~ 0
A
Text Label 8650 2850 2    50   ~ 0
B
Text Label 8750 2850 2    50   ~ 0
C
Text Label 8850 2850 2    50   ~ 0
D
Text Label 8950 2850 2    50   ~ 0
E
Text Label 9050 2850 2    50   ~ 0
F
Text Label 9150 2850 2    50   ~ 0
G
Text Label 9250 2850 2    50   ~ 0
DP
Entry Wire Line
	3550 2850 3450 2950
Entry Wire Line
	3450 2850 3350 2950
Entry Wire Line
	3350 2850 3250 2950
Entry Wire Line
	3250 2850 3150 2950
Entry Wire Line
	3150 2850 3050 2950
Entry Wire Line
	3050 2850 2950 2950
Entry Wire Line
	2950 2850 2850 2950
Entry Wire Line
	2850 2850 2750 2950
Wire Wire Line
	2850 2650 2850 2850
Wire Wire Line
	2950 2650 2950 2850
Wire Wire Line
	3050 2650 3050 2850
Wire Wire Line
	3150 2650 3150 2850
Wire Wire Line
	3250 2650 3250 2850
Wire Wire Line
	3350 2650 3350 2850
Wire Wire Line
	3450 2650 3450 2850
Wire Wire Line
	3550 2650 3550 2850
Text Label 2850 2850 2    50   ~ 0
A
Text Label 2950 2850 2    50   ~ 0
B
Text Label 3050 2850 2    50   ~ 0
C
Text Label 3150 2850 2    50   ~ 0
D
Text Label 3250 2850 2    50   ~ 0
E
Text Label 3350 2850 2    50   ~ 0
F
Text Label 3450 2850 2    50   ~ 0
G
Text Label 3550 2850 2    50   ~ 0
DP
Entry Wire Line
	4750 2850 4650 2950
Wire Wire Line
	4750 2700 4750 2850
Text Label 4750 2850 2    50   ~ 0
A
Entry Wire Line
	8550 650  8650 750 
Entry Wire Line
	8650 650  8750 750 
Entry Wire Line
	8750 650  8850 750 
Entry Wire Line
	8850 650  8950 750 
Entry Wire Line
	8950 650  9050 750 
Entry Wire Line
	9050 650  9150 750 
Text Label 9150 1050 1    50   ~ 0
CA12
Text Label 9050 1050 1    50   ~ 0
CA11
Text Label 8950 1050 1    50   ~ 0
CA10
Text Label 8850 1050 1    50   ~ 0
CA9
Text Label 8750 1050 1    50   ~ 0
CA8
Text Label 8650 1050 1    50   ~ 0
CA7
Entry Wire Line
	6450 850  6550 950 
Entry Wire Line
	6550 850  6650 950 
Entry Wire Line
	6650 850  6750 950 
Entry Wire Line
	6750 850  6850 950 
Entry Wire Line
	6850 850  6950 950 
Entry Wire Line
	6350 850  6450 950 
Wire Wire Line
	6550 1500 6550 950 
Wire Wire Line
	6650 1500 6650 950 
Wire Wire Line
	6750 1500 6750 950 
Wire Wire Line
	6850 1500 6850 950 
Wire Wire Line
	6950 1500 6950 950 
Wire Wire Line
	6450 1500 6450 950 
Text Label 6450 1350 1    50   ~ 0
CA1
Text Label 6950 1350 1    50   ~ 0
CA6
Text Label 6850 1350 1    50   ~ 0
CA5
Text Label 6750 1350 1    50   ~ 0
CA4
Text Label 6650 1350 1    50   ~ 0
CA3
Text Label 6550 1350 1    50   ~ 0
CA2
Text Label 3050 1150 1    50   ~ 0
CA1
Text Label 3550 1150 1    50   ~ 0
CA6
Text Label 3450 1150 1    50   ~ 0
CA5
Text Label 3350 1150 1    50   ~ 0
CA4
Text Label 3250 1150 1    50   ~ 0
CA3
Text Label 3150 1150 1    50   ~ 0
CA2
Wire Wire Line
	3350 950  3350 1250
Wire Wire Line
	3450 950  3450 1250
Wire Wire Line
	3550 950  3550 1250
Wire Wire Line
	2500 950  2500 1250
Wire Wire Line
	2850 1250 2850 1150
Wire Wire Line
	2850 1150 2400 1150
Wire Wire Line
	2400 1050 2950 1050
Wire Wire Line
	2950 1050 2950 1250
Wire Wire Line
	2500 850  2500 950 
Connection ~ 2500 950 
Wire Wire Line
	2750 1250 2500 1250
Connection ~ 2500 1250
Wire Wire Line
	2500 1250 2500 1850
Text Label 4750 1150 1    50   ~ 0
CA1
Text Label 5350 1150 1    50   ~ 0
CA3
Text Label 5050 1150 1    50   ~ 0
CA2
Wire Wire Line
	4750 950  4750 1550
Wire Wire Line
	3050 950  3050 1250
Wire Wire Line
	3150 950  3150 1250
Wire Wire Line
	5050 950  5050 1550
Wire Wire Line
	3250 950  3250 1250
Wire Wire Line
	5350 950  5350 1550
Entry Wire Line
	5350 950  5250 850 
Entry Wire Line
	5050 950  4950 850 
Entry Wire Line
	4750 950  4650 850 
Text Label 4250 1050 1    50   ~ 0
CA12
Text Label 4050 1050 1    50   ~ 0
CA11
Text Label 3950 1050 1    50   ~ 0
CA10
Text Label 3850 1050 1    50   ~ 0
CA9
Text Label 3750 1050 1    50   ~ 0
CA8
Text Label 3650 1050 1    50   ~ 0
CA7
Wire Wire Line
	4050 2650 4250 2650
Entry Wire Line
	2950 850  3050 950 
Entry Wire Line
	3450 850  3550 950 
Entry Wire Line
	3350 850  3450 950 
Entry Wire Line
	3250 850  3350 950 
Entry Wire Line
	3150 850  3250 950 
Entry Wire Line
	3050 850  3150 950 
Wire Wire Line
	2750 2650 2500 2650
Connection ~ 2500 2650
Wire Wire Line
	2500 2650 2500 2050
Wire Wire Line
	2500 2650 2500 2750
Wire Wire Line
	2400 2650 2500 2650
Entry Wire Line
	4150 650  4250 750 
Entry Wire Line
	3950 650  4050 750 
Entry Wire Line
	3850 650  3950 750 
Entry Wire Line
	3750 650  3850 750 
Entry Wire Line
	3650 650  3750 750 
Wire Wire Line
	4250 750  4250 2650
Wire Wire Line
	3650 1250 3650 750 
Entry Wire Line
	3550 650  3650 750 
Wire Wire Line
	4750 2200 4750 2300
Wire Wire Line
	5050 2300 4750 2300
Connection ~ 5050 2300
Connection ~ 4750 2300
Wire Wire Line
	4750 2300 4750 2400
Wire Wire Line
	4050 1250 4050 750 
Wire Wire Line
	9150 1500 9150 750 
Wire Wire Line
	8850 1500 8850 750 
Wire Wire Line
	8750 1500 8750 750 
Wire Wire Line
	8650 1500 8650 750 
Wire Wire Line
	8950 1500 8950 750 
Wire Wire Line
	9050 1500 9050 750 
$Comp
L extsui:OSL60362_IX U?
U 1 1 64F0B404
P 8900 2000
F 0 "U?" H 9728 2071 50  0000 L CNN
F 1 "OSL60362_IX" H 9728 1980 50  0000 L CNN
F 2 "" H 9000 2750 50  0001 C CNN
F 3 "" H 9000 2750 50  0001 C CNN
	1    8900 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 1250 3750 750 
Wire Wire Line
	3850 1250 3850 750 
Wire Wire Line
	3950 1250 3950 750 
$Comp
L Building-rescue:HT16K33-28SOP-Garden-Grass-rescue U1
U 1 1 5C2B207A
P 3400 1950
F 0 "U1" H 2850 2700 50  0000 C CNN
F 1 "HT16K33-28SOP" H 3400 2700 50  0000 C CNN
F 2 "Package_SO:SOIC-28W_7.5x18.7mm_P1.27mm" H 3150 2700 50  0001 C CNN
F 3 "" H 3150 2700 50  0001 C CNN
	1    3400 1950
	0    -1   -1   0   
$EndComp
Wire Notes Line
	11200 4950 11050 4950
Wire Notes Line
	11050 7200 11050 5000
Wire Notes Line
	11050 5000 11200 5000
Wire Notes Line
	11200 5000 11200 7200
Wire Notes Line
	11200 7200 11050 7200
Wire Bus Line
	3550 650  9050 650 
Wire Bus Line
	2950 850  6850 850 
Wire Bus Line
	2750 2950 9150 2950
$EndSCHEMATC
