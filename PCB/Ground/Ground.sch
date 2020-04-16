EESchema Schematic File Version 4
LIBS:Ground-cache
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
L Ground-rescue:HT16K33-28SOP-Garden-Gerden-rescue-Garden-rescue-Land-rescue-Tile-rescue U1
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
L power:GND #PWR04
U 1 1 5C2C9BBC
P 1400 2200
F 0 "#PWR04" H 1400 1950 50  0001 C CNN
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
$Comp
L power:+5V #PWR03
U 1 1 5C2CBF57
P 3450 1600
F 0 "#PWR03" H 3450 1450 50  0001 C CNN
F 1 "+5V" H 3465 1773 50  0000 C CNN
F 2 "" H 3450 1600 50  0001 C CNN
F 3 "" H 3450 1600 50  0001 C CNN
	1    3450 1600
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
$Comp
L power:+5V #PWR01
U 1 1 5C2D1124
P 1050 1150
F 0 "#PWR01" H 1050 1000 50  0001 C CNN
F 1 "+5V" H 1065 1323 50  0000 C CNN
F 2 "" H 1050 1150 50  0001 C CNN
F 3 "" H 1050 1150 50  0001 C CNN
	1    1050 1150
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5C2D1EAE
P 1450 1150
F 0 "#PWR02" H 1450 900 50  0001 C CNN
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
Text GLabel 3500 2200 2    50   Input ~ 0
SDA
Text GLabel 3500 2300 2    50   Input ~ 0
SCL
Text GLabel 3700 2100 2    50   Input ~ 0
+5V
Text GLabel 1150 2100 0    50   Input ~ 0
GND
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
$Comp
L Device:D_Schottky_ALT D26
U 1 1 5C2E2B2F
P 1950 3650
F 0 "D26" H 1950 3550 50  0000 C CNN
F 1 "D" H 1950 3750 50  0000 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" H 1950 3650 50  0001 C CNN
F 3 "~" H 1950 3650 50  0001 C CNN
	1    1950 3650
	-1   0    0    1   
$EndComp
$Comp
L Device:LED_Small D1
U 1 1 5C2E323A
P 5500 1700
F 0 "D1" H 5500 1800 50  0000 C CNN
F 1 "LED" H 5700 1800 50  0000 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5500 1700 50  0001 C CNN
F 3 "~" V 5500 1700 50  0001 C CNN
	1    5500 1700
	-1   0    0    -1  
$EndComp
NoConn ~ 1850 2600
NoConn ~ 1850 2700
NoConn ~ 1850 2800
NoConn ~ 1850 2900
Connection ~ 3550 2600
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5C353DD7
P 1050 1150
F 0 "#FLG01" H 1050 1225 50  0001 C CNN
F 1 "PWR_FLAG" H 1050 1350 50  0000 C CNN
F 2 "" H 1050 1150 50  0001 C CNN
F 3 "~" H 1050 1150 50  0001 C CNN
	1    1050 1150
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5C365F2A
P 1450 1150
F 0 "#FLG02" H 1450 1225 50  0001 C CNN
F 1 "PWR_FLAG" H 1450 1350 50  0000 C CNN
F 2 "" H 1450 1150 50  0001 C CNN
F 3 "~" H 1450 1150 50  0001 C CNN
	1    1450 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 3400 1100 3400
Wire Wire Line
	1850 3300 1000 3300
Wire Wire Line
	1850 3200 900  3200
Wire Wire Line
	1850 3100 800  3100
Wire Wire Line
	1850 2300 1650 2300
$Comp
L Device:LED_Small D4
U 1 1 5C5C3B6E
P 5500 2600
F 0 "D4" H 5500 2700 50  0000 C CNN
F 1 "LED" H 5700 2700 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5500 2600 50  0001 C CNN
F 3 "~" V 5500 2600 50  0001 C CNN
	1    5500 2600
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D5
U 1 1 5C5C93DF
P 5500 2900
F 0 "D5" H 5500 3000 50  0000 C CNN
F 1 "LED" H 5700 3000 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5500 2900 50  0001 C CNN
F 3 "~" V 5500 2900 50  0001 C CNN
	1    5500 2900
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D2
U 1 1 5C5CAAB2
P 5500 2000
F 0 "D2" H 5500 2100 50  0000 C CNN
F 1 "LED" H 5700 2100 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5500 2000 50  0001 C CNN
F 3 "~" V 5500 2000 50  0001 C CNN
	1    5500 2000
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D3
U 1 1 5C5CAAB9
P 5500 2300
F 0 "D3" H 5500 2400 50  0000 C CNN
F 1 "LED" H 5700 2400 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5500 2300 50  0001 C CNN
F 3 "~" V 5500 2300 50  0001 C CNN
	1    5500 2300
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D8
U 1 1 5C5CC13F
P 5500 3800
F 0 "D8" H 5500 3900 50  0000 C CNN
F 1 "LED" H 5700 3900 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5500 3800 50  0001 C CNN
F 3 "~" V 5500 3800 50  0001 C CNN
	1    5500 3800
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D9
U 1 1 5C5CC146
P 5500 5200
F 0 "D9" H 5500 5300 50  0000 C CNN
F 1 "LED" H 5700 5300 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5500 5200 50  0001 C CNN
F 3 "~" V 5500 5200 50  0001 C CNN
	1    5500 5200
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D6
U 1 1 5C5CC14D
P 5500 3200
F 0 "D6" H 5500 3300 50  0000 C CNN
F 1 "LED" H 5700 3300 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5500 3200 50  0001 C CNN
F 3 "~" V 5500 3200 50  0001 C CNN
	1    5500 3200
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D7
U 1 1 5C5CC154
P 5500 3500
F 0 "D7" H 5500 3600 50  0000 C CNN
F 1 "LED" H 5700 3600 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5500 3500 50  0001 C CNN
F 3 "~" V 5500 3500 50  0001 C CNN
	1    5500 3500
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D12
U 1 1 5C5CD97C
P 5500 6100
F 0 "D12" H 5500 6200 50  0000 C CNN
F 1 "LED" H 5700 6200 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5500 6100 50  0001 C CNN
F 3 "~" V 5500 6100 50  0001 C CNN
	1    5500 6100
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D13
U 1 1 5C5CD983
P 5500 6400
F 0 "D13" H 5500 6500 50  0000 C CNN
F 1 "LED" H 5700 6500 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5500 6400 50  0001 C CNN
F 3 "~" V 5500 6400 50  0001 C CNN
	1    5500 6400
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D10
U 1 1 5C5CD98A
P 5500 5500
F 0 "D10" H 5500 5600 50  0000 C CNN
F 1 "LED" H 5700 5600 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5500 5500 50  0001 C CNN
F 3 "~" V 5500 5500 50  0001 C CNN
	1    5500 5500
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D11
U 1 1 5C5CD991
P 5500 5800
F 0 "D11" H 5500 5900 50  0000 C CNN
F 1 "LED" H 5700 5900 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5500 5800 50  0001 C CNN
F 3 "~" V 5500 5800 50  0001 C CNN
	1    5500 5800
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D16
U 1 1 5C5CD998
P 5500 7300
F 0 "D16" H 5500 7400 50  0000 C CNN
F 1 "LED" H 5700 7400 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5500 7300 50  0001 C CNN
F 3 "~" V 5500 7300 50  0001 C CNN
	1    5500 7300
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D14
U 1 1 5C5CD9A6
P 5500 6700
F 0 "D14" H 5500 6800 50  0000 C CNN
F 1 "LED" H 5700 6800 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5500 6700 50  0001 C CNN
F 3 "~" V 5500 6700 50  0001 C CNN
	1    5500 6700
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D15
U 1 1 5C5CD9AD
P 5500 7000
F 0 "D15" H 5500 7100 50  0000 C CNN
F 1 "LED" H 5700 7100 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5500 7000 50  0001 C CNN
F 3 "~" V 5500 7000 50  0001 C CNN
	1    5500 7000
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D17
U 1 1 5C5D16A2
P 6250 1850
F 0 "D17" H 6250 1950 50  0000 C CNN
F 1 "LED" H 6450 1950 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 6250 1850 50  0001 C CNN
F 3 "~" V 6250 1850 50  0001 C CNN
	1    6250 1850
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D20
U 1 1 5C5D16A9
P 6250 2750
F 0 "D20" H 6250 2850 50  0000 C CNN
F 1 "LED" H 6450 2850 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 6250 2750 50  0001 C CNN
F 3 "~" V 6250 2750 50  0001 C CNN
	1    6250 2750
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D21
U 1 1 5C5D16B0
P 6250 3050
F 0 "D21" H 6250 3150 50  0000 C CNN
F 1 "LED" H 6450 3150 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 6250 3050 50  0001 C CNN
F 3 "~" V 6250 3050 50  0001 C CNN
	1    6250 3050
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D18
U 1 1 5C5D16B7
P 6250 2150
F 0 "D18" H 6250 2250 50  0000 C CNN
F 1 "LED" H 6450 2250 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 6250 2150 50  0001 C CNN
F 3 "~" V 6250 2150 50  0001 C CNN
	1    6250 2150
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D19
U 1 1 5C5D16BE
P 6250 2450
F 0 "D19" H 6250 2550 50  0000 C CNN
F 1 "LED" H 6450 2550 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 6250 2450 50  0001 C CNN
F 3 "~" V 6250 2450 50  0001 C CNN
	1    6250 2450
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D24
U 1 1 5C5D16C5
P 6250 3950
F 0 "D24" H 6250 4050 50  0000 C CNN
F 1 "LED" H 6450 4050 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 6250 3950 50  0001 C CNN
F 3 "~" V 6250 3950 50  0001 C CNN
	1    6250 3950
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D22
U 1 1 5C5D16CC
P 6250 3350
F 0 "D22" H 6250 3450 50  0000 C CNN
F 1 "LED" H 6450 3450 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 6250 3350 50  0001 C CNN
F 3 "~" V 6250 3350 50  0001 C CNN
	1    6250 3350
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D23
U 1 1 5C5D16D3
P 6250 3650
F 0 "D23" H 6250 3750 50  0000 C CNN
F 1 "LED" H 6450 3750 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 6250 3650 50  0001 C CNN
F 3 "~" V 6250 3650 50  0001 C CNN
	1    6250 3650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3550 2600 4650 2600
Wire Wire Line
	3250 2700 4750 2700
Wire Wire Line
	3250 2800 4750 2800
Wire Wire Line
	3250 2900 4650 2900
Wire Wire Line
	3250 3000 4550 3000
Wire Wire Line
	4550 3500 5150 3500
Wire Wire Line
	3250 3100 4450 3100
Wire Wire Line
	4450 3800 5150 3800
Wire Wire Line
	3250 3200 4350 3200
Wire Wire Line
	4350 3200 4350 5200
Wire Wire Line
	3250 3300 4250 3300
Wire Wire Line
	4250 3300 4250 5500
Wire Wire Line
	3250 3400 4150 3400
Wire Wire Line
	4150 3400 4150 5800
Wire Wire Line
	1100 3400 1100 6100
Wire Wire Line
	1000 3300 1000 6400
Wire Wire Line
	900  3200 900  6700
Wire Wire Line
	5400 7000 800  7000
Wire Wire Line
	800  3100 800  7000
Wire Wire Line
	5400 7300 700  7300
Wire Wire Line
	700  7300 700  3000
Wire Wire Line
	700  3000 1850 3000
Wire Wire Line
	5700 1700 5600 1700
Wire Wire Line
	5600 2000 5700 2000
Wire Wire Line
	5700 2300 5600 2300
Wire Wire Line
	5600 2600 5700 2600
Wire Wire Line
	5700 2900 5600 2900
Wire Wire Line
	5700 3200 5600 3200
Wire Wire Line
	5600 3500 5700 3500
Wire Wire Line
	5600 3800 5700 3800
Wire Wire Line
	5700 5200 5600 5200
Wire Wire Line
	5600 5500 5700 5500
Wire Wire Line
	5700 5800 5600 5800
Wire Wire Line
	5600 6100 5700 6100
Wire Wire Line
	5700 6400 5600 6400
Wire Wire Line
	5700 6700 5600 6700
Wire Wire Line
	5600 7000 5700 7000
Wire Wire Line
	5600 7300 5700 7300
Wire Wire Line
	5700 1700 5700 2000
Connection ~ 5700 2000
Wire Wire Line
	5700 2000 5700 2300
Connection ~ 5700 2300
Wire Wire Line
	5700 2300 5700 2600
Connection ~ 5700 2600
Wire Wire Line
	5700 2600 5700 2900
Connection ~ 5700 2900
Wire Wire Line
	5700 2900 5700 3200
Connection ~ 5700 3200
Wire Wire Line
	5700 3200 5700 3500
Connection ~ 5700 3500
Wire Wire Line
	5700 3500 5700 3800
Connection ~ 5700 3800
Wire Wire Line
	5700 7300 5700 7000
Connection ~ 5700 5500
Wire Wire Line
	5700 5500 5700 5200
Connection ~ 5700 5800
Wire Wire Line
	5700 5800 5700 5500
Connection ~ 5700 6100
Wire Wire Line
	5700 6100 5700 5800
Connection ~ 5700 6400
Wire Wire Line
	5700 6400 5700 6100
Connection ~ 5700 6700
Wire Wire Line
	5700 6700 5700 6400
Connection ~ 5700 7000
Wire Wire Line
	5700 7000 5700 6700
Wire Wire Line
	1750 3650 1750 4500
Connection ~ 1750 3650
Wire Wire Line
	1650 2300 1650 4600
Connection ~ 5700 5200
Wire Wire Line
	4450 3100 4450 3800
Wire Wire Line
	4550 3000 4550 3500
Wire Wire Line
	3350 2400 4450 2400
Wire Wire Line
	4450 2400 4450 1700
Wire Wire Line
	4450 1700 5150 1700
Connection ~ 3350 2400
Wire Wire Line
	3450 2500 4550 2500
Wire Wire Line
	4550 2500 4550 2000
Wire Wire Line
	4550 2000 5150 2000
Connection ~ 3450 2500
Wire Wire Line
	4650 2600 4650 2300
Wire Wire Line
	4650 2300 5150 2300
Wire Wire Line
	4750 2700 4750 2600
Wire Wire Line
	4750 2600 5150 2600
Wire Wire Line
	4750 2800 4750 2900
Wire Wire Line
	4750 2900 5150 2900
Wire Wire Line
	4650 2900 4650 3200
Wire Wire Line
	4650 3200 5150 3200
Wire Wire Line
	5150 1700 5150 1850
Wire Wire Line
	5150 1850 6150 1850
Connection ~ 5150 1700
Wire Wire Line
	5150 1700 5400 1700
Wire Wire Line
	5150 2000 5150 2150
Wire Wire Line
	5150 2150 6150 2150
Connection ~ 5150 2000
Wire Wire Line
	5150 2000 5400 2000
Wire Wire Line
	5150 2300 5150 2450
Wire Wire Line
	5150 2450 6150 2450
Connection ~ 5150 2300
Wire Wire Line
	5150 2300 5400 2300
Wire Wire Line
	5150 2600 5150 2750
Wire Wire Line
	5150 2750 6150 2750
Connection ~ 5150 2600
Wire Wire Line
	5150 2600 5400 2600
Wire Wire Line
	5150 2900 5150 3050
Wire Wire Line
	5150 3050 6150 3050
Connection ~ 5150 2900
Wire Wire Line
	5150 2900 5400 2900
Wire Wire Line
	5150 3200 5150 3350
Wire Wire Line
	5150 3350 6150 3350
Connection ~ 5150 3200
Wire Wire Line
	5150 3200 5400 3200
Wire Wire Line
	5150 3500 5150 3650
Wire Wire Line
	5150 3650 6150 3650
Connection ~ 5150 3500
Wire Wire Line
	5150 3500 5400 3500
Wire Wire Line
	5150 3800 5150 3950
Connection ~ 5150 3800
Wire Wire Line
	5150 3800 5400 3800
Wire Wire Line
	5150 3950 6150 3950
Wire Wire Line
	6600 1850 6600 2150
Wire Wire Line
	6350 1850 6600 1850
Wire Wire Line
	6350 2150 6600 2150
Connection ~ 6600 2150
Wire Wire Line
	6350 2450 6600 2450
Wire Wire Line
	6600 2150 6600 2450
Connection ~ 6600 2450
Wire Wire Line
	6600 2450 6600 2750
Wire Wire Line
	6350 2750 6600 2750
Connection ~ 6600 2750
Wire Wire Line
	6600 2750 6600 3050
Wire Wire Line
	6350 3050 6600 3050
Connection ~ 6600 3050
Wire Wire Line
	6600 3050 6600 3350
Wire Wire Line
	6350 3350 6600 3350
Connection ~ 6600 3350
Wire Wire Line
	6600 3350 6600 3650
Wire Wire Line
	6350 3650 6600 3650
Connection ~ 6600 3650
Wire Wire Line
	6600 3650 6600 3950
Wire Wire Line
	6350 3950 6600 3950
Connection ~ 6600 3950
Wire Wire Line
	5700 3800 5700 4500
Wire Wire Line
	6600 3950 6600 4600
NoConn ~ 1850 2400
NoConn ~ 1850 2500
Wire Wire Line
	1750 4500 5700 4500
Connection ~ 5700 4500
Wire Wire Line
	5700 4500 5700 5200
Wire Wire Line
	1650 4600 6600 4600
Wire Wire Line
	4350 5200 5400 5200
Wire Wire Line
	4250 5500 5400 5500
Wire Wire Line
	4150 5800 5400 5800
Wire Wire Line
	1100 6100 5400 6100
Wire Wire Line
	1000 6400 5400 6400
Wire Wire Line
	900  6700 5400 6700
Wire Wire Line
	3250 2200 3500 2200
Wire Wire Line
	3250 2300 3500 2300
Wire Wire Line
	3450 2100 3700 2100
Connection ~ 3450 2100
Wire Wire Line
	3450 1600 3450 1800
Text GLabel 7450 2200 1    50   Input ~ 0
+5V
Text GLabel 7550 2200 1    50   Input ~ 0
SDA
Text GLabel 7650 2200 1    50   Input ~ 0
SCL
Text GLabel 7850 2200 1    50   Input ~ 0
GND
Wire Wire Line
	7850 2200 7850 2400
Wire Wire Line
	7650 2200 7650 2400
Wire Wire Line
	7550 2200 7550 2400
Wire Wire Line
	7450 2200 7450 2400
NoConn ~ 7750 2400
$Comp
L Connector:Conn_01x05_Female J1
U 1 1 5E6B51BB
P 7650 2600
F 0 "J1" V 7497 2312 50  0000 R CNN
F 1 "Conn_01x05_Female" V 7588 2312 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 7650 2600 50  0001 C CNN
F 3 "~" H 7650 2600 50  0001 C CNN
	1    7650 2600
	0    -1   1    0   
$EndComp
Text Notes 7200 1750 0    50   ~ 0
The Conn_01x05_Female connector is \n   connected to the ground board.
Wire Notes Line
	7200 1900 8800 1900
Wire Notes Line
	8800 1900 8800 2700
Wire Notes Line
	8800 2700 7200 2700
Wire Notes Line
	7200 2700 7200 1900
$Comp
L Mechanical:MountingHole H1
U 1 1 5E8E347E
P 7300 3250
F 0 "H1" H 7400 3296 50  0000 L CNN
F 1 "MountingHole" H 7400 3205 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 7300 3250 50  0001 C CNN
F 3 "~" H 7300 3250 50  0001 C CNN
	1    7300 3250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5E8E3566
P 7300 3500
F 0 "H2" H 7400 3546 50  0000 L CNN
F 1 "MountingHole" H 7400 3455 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 7300 3500 50  0001 C CNN
F 3 "~" H 7300 3500 50  0001 C CNN
	1    7300 3500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5E8E35F4
P 7300 3750
F 0 "H3" H 7400 3796 50  0000 L CNN
F 1 "MountingHole" H 7400 3705 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 7300 3750 50  0001 C CNN
F 3 "~" H 7300 3750 50  0001 C CNN
	1    7300 3750
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5E8E3892
P 7300 4000
F 0 "H4" H 7400 4046 50  0000 L CNN
F 1 "MountingHole" H 7400 3955 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 7300 4000 50  0001 C CNN
F 3 "~" H 7300 4000 50  0001 C CNN
	1    7300 4000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H5
U 1 1 5E8E3899
P 7300 4250
F 0 "H5" H 7400 4296 50  0000 L CNN
F 1 "MountingHole" H 7400 4205 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 7300 4250 50  0001 C CNN
F 3 "~" H 7300 4250 50  0001 C CNN
	1    7300 4250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H6
U 1 1 5E8E38A0
P 7300 4500
F 0 "H6" H 7400 4546 50  0000 L CNN
F 1 "MountingHole" H 7400 4455 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 7300 4500 50  0001 C CNN
F 3 "~" H 7300 4500 50  0001 C CNN
	1    7300 4500
	1    0    0    -1  
$EndComp
$EndSCHEMATC
