EESchema Schematic File Version 4
LIBS:Land-cache
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
L Land-rescue:HT16K33-28SOP-Garden-Gerden-rescue-Garden-rescue U1
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
Text Notes 1950 1100 0    50   ~ 0
The I2C pull-up resistor is \nattached at Garden Board\nthrough JP1, 2 (default open).
$Comp
L power:+5V #PWR03
U 1 1 5C2CBF57
P 3450 1250
F 0 "#PWR03" H 3450 1100 50  0001 C CNN
F 1 "+5V" H 3465 1423 50  0000 C CNN
F 2 "" H 3450 1250 50  0001 C CNN
F 3 "" H 3450 1250 50  0001 C CNN
	1    3450 1250
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
	3250 2200 3700 2200
Wire Wire Line
	3250 2300 3900 2300
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
Text GLabel 4100 2200 2    50   Input ~ 0
SDA
Text GLabel 4100 2300 2    50   Input ~ 0
SCL
Text GLabel 4100 1500 2    50   Input ~ 0
VCC
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
Wire Wire Line
	3450 1800 3450 1500
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
$Comp
L Device:LED_Small D25
U 1 1 5C5D61A6
P 6250 5350
F 0 "D25" H 6250 5450 50  0000 C CNN
F 1 "LED" H 6450 5450 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 6250 5350 50  0001 C CNN
F 3 "~" V 6250 5350 50  0001 C CNN
	1    6250 5350
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
	4350 5200 5150 5200
Wire Wire Line
	3250 3300 4250 3300
Wire Wire Line
	4250 3300 4250 5500
Wire Wire Line
	4250 5500 5400 5500
Wire Wire Line
	3250 3400 4150 3400
Wire Wire Line
	4150 3400 4150 5800
Wire Wire Line
	4150 5800 5400 5800
Wire Wire Line
	1400 6100 5400 6100
Wire Wire Line
	1400 3400 1400 6100
Wire Wire Line
	1300 3300 1300 6400
Wire Wire Line
	1300 6400 5400 6400
Wire Wire Line
	1200 6700 5400 6700
Wire Wire Line
	1200 3200 1200 6700
Wire Wire Line
	5400 7000 1100 7000
Wire Wire Line
	1100 3100 1100 7000
Wire Wire Line
	5400 7300 1000 7300
Wire Wire Line
	1000 7300 1000 3000
Wire Wire Line
	1000 3000 1850 3000
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
	6350 5350 6600 5350
Wire Wire Line
	1750 3650 1750 4500
Connection ~ 1750 3650
Wire Wire Line
	1650 2300 1650 4600
Wire Wire Line
	5700 3800 5700 4500
Wire Wire Line
	1750 4500 5700 4500
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
	5150 5200 5150 5350
Connection ~ 5150 5200
Wire Wire Line
	5150 5200 5400 5200
Wire Wire Line
	5150 5350 6150 5350
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
NoConn ~ 1850 2400
NoConn ~ 1850 2500
Wire Wire Line
	5700 4500 5700 5200
Connection ~ 5700 4500
Wire Wire Line
	1650 4600 6600 4600
Wire Wire Line
	6600 3950 6600 4600
Connection ~ 6600 4600
Wire Wire Line
	6600 4600 6600 5350
Text Notes 7150 2100 0    50   ~ 0
Tree Grwoing Board Pads (Back)
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 5C711B3C
P 8950 6050
F 0 "J2" V 8823 5762 50  0000 R CNN
F 1 "Conn_01x04" V 8914 5762 50  0000 R CNN
F 2 "Connector:NS-Tech_Grove_1x04_P2mm_Vertical" H 8950 6050 50  0001 C CNN
F 3 "~" H 8950 6050 50  0001 C CNN
	1    8950 6050
	0    -1   1    0   
$EndComp
Wire Wire Line
	7800 1650 7800 1550
Wire Wire Line
	7600 1650 7600 1450
Wire Wire Line
	7200 1650 7200 1250
Text GLabel 7200 1150 1    50   Input ~ 0
VCC
Text GLabel 7400 1150 1    50   Input ~ 0
SCL
Text GLabel 7600 1150 1    50   Input ~ 0
SDA
Text GLabel 7800 1150 1    50   Input ~ 0
GND
$Comp
L Connector:TestPoint TP1
U 1 1 5C71C0BD
P 7200 1650
F 0 "TP1" H 7250 1900 50  0000 R CNN
F 1 "TestPoint" H 7142 1768 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 7400 1650 50  0001 C CNN
F 3 "~" H 7400 1650 50  0001 C CNN
	1    7200 1650
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 5C71C0C4
P 7400 1650
F 0 "TP2" H 7450 1900 50  0000 R CNN
F 1 "TestPoint" H 7342 1768 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 7600 1650 50  0001 C CNN
F 3 "~" H 7600 1650 50  0001 C CNN
	1    7400 1650
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 5C71C0CB
P 7600 1650
F 0 "TP3" H 7650 1900 50  0000 R CNN
F 1 "TestPoint" H 7542 1768 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 7800 1650 50  0001 C CNN
F 3 "~" H 7800 1650 50  0001 C CNN
	1    7600 1650
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 5C71C0D2
P 7800 1650
F 0 "TP4" H 7850 1900 50  0000 R CNN
F 1 "TestPoint" H 7742 1768 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 8000 1650 50  0001 C CNN
F 3 "~" H 8000 1650 50  0001 C CNN
	1    7800 1650
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP5
U 1 1 5C71C0D9
P 8200 1650
F 0 "TP5" H 8250 1900 50  0000 R CNN
F 1 "TestPoint" H 8142 1768 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 8400 1650 50  0001 C CNN
F 3 "~" H 8400 1650 50  0001 C CNN
	1    8200 1650
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP6
U 1 1 5C71C0E0
P 8400 1650
F 0 "TP6" H 8450 1900 50  0000 R CNN
F 1 "TestPoint" H 8342 1768 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 8600 1650 50  0001 C CNN
F 3 "~" H 8600 1650 50  0001 C CNN
	1    8400 1650
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP7
U 1 1 5C71C0E7
P 8600 1650
F 0 "TP7" H 8650 1900 50  0000 R CNN
F 1 "TestPoint" H 8542 1768 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 8800 1650 50  0001 C CNN
F 3 "~" H 8800 1650 50  0001 C CNN
	1    8600 1650
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP8
U 1 1 5C71C0EE
P 8800 1650
F 0 "TP8" H 8850 1900 50  0000 R CNN
F 1 "TestPoint" H 8742 1768 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 9000 1650 50  0001 C CNN
F 3 "~" H 9000 1650 50  0001 C CNN
	1    8800 1650
	-1   0    0    1   
$EndComp
Wire Wire Line
	7200 1250 8200 1250
Connection ~ 7200 1250
Wire Wire Line
	7200 1250 7200 1150
Wire Wire Line
	7400 1350 8400 1350
Connection ~ 7400 1350
Wire Wire Line
	7400 1350 7400 1150
Wire Wire Line
	7400 1350 7400 1650
Wire Wire Line
	7600 1450 8600 1450
Connection ~ 7600 1450
Wire Wire Line
	7600 1450 7600 1150
Wire Wire Line
	7800 1550 8800 1550
Connection ~ 7800 1550
Wire Wire Line
	7800 1550 7800 1150
Wire Wire Line
	8200 1650 8200 1250
Wire Wire Line
	8400 1350 8400 1650
Wire Wire Line
	8600 1450 8600 1650
Wire Wire Line
	8800 1550 8800 1650
Wire Wire Line
	7800 3050 7800 2950
Wire Wire Line
	7600 3050 7600 2850
Wire Wire Line
	7200 3050 7200 2650
Text GLabel 7200 2550 1    50   Input ~ 0
VCC
Text GLabel 7400 2550 1    50   Input ~ 0
SCL
Text GLabel 7600 2550 1    50   Input ~ 0
SDA
Text GLabel 7800 2550 1    50   Input ~ 0
GND
$Comp
L Connector:TestPoint TP17
U 1 1 5C747014
P 7200 3050
F 0 "TP17" H 7250 3300 50  0000 R CNN
F 1 "TestPoint" H 7142 3168 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 7400 3050 50  0001 C CNN
F 3 "~" H 7400 3050 50  0001 C CNN
	1    7200 3050
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP18
U 1 1 5C74701B
P 7400 3050
F 0 "TP18" H 7450 3300 50  0000 R CNN
F 1 "TestPoint" H 7342 3168 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 7600 3050 50  0001 C CNN
F 3 "~" H 7600 3050 50  0001 C CNN
	1    7400 3050
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP19
U 1 1 5C747022
P 7600 3050
F 0 "TP19" H 7650 3300 50  0000 R CNN
F 1 "TestPoint" H 7542 3168 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 7800 3050 50  0001 C CNN
F 3 "~" H 7800 3050 50  0001 C CNN
	1    7600 3050
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP20
U 1 1 5C747029
P 7800 3050
F 0 "TP20" H 7850 3300 50  0000 R CNN
F 1 "TestPoint" H 7742 3168 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 8000 3050 50  0001 C CNN
F 3 "~" H 8000 3050 50  0001 C CNN
	1    7800 3050
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP21
U 1 1 5C747030
P 8200 3050
F 0 "TP21" H 8250 3300 50  0000 R CNN
F 1 "TestPoint" H 8142 3168 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 8400 3050 50  0001 C CNN
F 3 "~" H 8400 3050 50  0001 C CNN
	1    8200 3050
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP22
U 1 1 5C747037
P 8400 3050
F 0 "TP22" H 8450 3300 50  0000 R CNN
F 1 "TestPoint" H 8342 3168 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 8600 3050 50  0001 C CNN
F 3 "~" H 8600 3050 50  0001 C CNN
	1    8400 3050
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP23
U 1 1 5C74703E
P 8600 3050
F 0 "TP23" H 8650 3300 50  0000 R CNN
F 1 "TestPoint" H 8542 3168 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 8800 3050 50  0001 C CNN
F 3 "~" H 8800 3050 50  0001 C CNN
	1    8600 3050
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP24
U 1 1 5C747045
P 8800 3050
F 0 "TP24" H 8850 3300 50  0000 R CNN
F 1 "TestPoint" H 8742 3168 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 9000 3050 50  0001 C CNN
F 3 "~" H 9000 3050 50  0001 C CNN
	1    8800 3050
	-1   0    0    1   
$EndComp
Wire Wire Line
	7200 2650 8200 2650
Connection ~ 7200 2650
Wire Wire Line
	7200 2650 7200 2550
Wire Wire Line
	7400 2750 8400 2750
Connection ~ 7400 2750
Wire Wire Line
	7400 2750 7400 2550
Wire Wire Line
	7400 2750 7400 3050
Wire Wire Line
	7600 2850 8600 2850
Connection ~ 7600 2850
Wire Wire Line
	7600 2850 7600 2550
Wire Wire Line
	7800 2950 8800 2950
Connection ~ 7800 2950
Wire Wire Line
	7800 2950 7800 2550
Wire Wire Line
	8200 3050 8200 2650
Wire Wire Line
	8400 2750 8400 3050
Wire Wire Line
	8600 2850 8600 3050
Wire Wire Line
	8800 2950 8800 3050
Wire Wire Line
	7800 4450 7800 4350
Wire Wire Line
	7600 4450 7600 4250
Wire Wire Line
	7200 4450 7200 4050
Text GLabel 7200 3950 1    50   Input ~ 0
VCC
Text GLabel 7400 3950 1    50   Input ~ 0
SCL
Text GLabel 7600 3950 1    50   Input ~ 0
SDA
Text GLabel 7800 3950 1    50   Input ~ 0
GND
$Comp
L Connector:TestPoint TP33
U 1 1 5C76C7F4
P 7200 4450
F 0 "TP33" H 7250 4700 50  0000 R CNN
F 1 "TestPoint" H 7142 4568 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 7400 4450 50  0001 C CNN
F 3 "~" H 7400 4450 50  0001 C CNN
	1    7200 4450
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP34
U 1 1 5C76C7FB
P 7400 4450
F 0 "TP34" H 7450 4700 50  0000 R CNN
F 1 "TestPoint" H 7342 4568 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 7600 4450 50  0001 C CNN
F 3 "~" H 7600 4450 50  0001 C CNN
	1    7400 4450
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP35
U 1 1 5C76C802
P 7600 4450
F 0 "TP35" H 7650 4700 50  0000 R CNN
F 1 "TestPoint" H 7542 4568 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 7800 4450 50  0001 C CNN
F 3 "~" H 7800 4450 50  0001 C CNN
	1    7600 4450
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP36
U 1 1 5C76C809
P 7800 4450
F 0 "TP36" H 7850 4700 50  0000 R CNN
F 1 "TestPoint" H 7742 4568 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 8000 4450 50  0001 C CNN
F 3 "~" H 8000 4450 50  0001 C CNN
	1    7800 4450
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP37
U 1 1 5C76C810
P 8200 4450
F 0 "TP37" H 8250 4700 50  0000 R CNN
F 1 "TestPoint" H 8142 4568 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 8400 4450 50  0001 C CNN
F 3 "~" H 8400 4450 50  0001 C CNN
	1    8200 4450
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP38
U 1 1 5C76C817
P 8400 4450
F 0 "TP38" H 8450 4700 50  0000 R CNN
F 1 "TestPoint" H 8342 4568 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 8600 4450 50  0001 C CNN
F 3 "~" H 8600 4450 50  0001 C CNN
	1    8400 4450
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP39
U 1 1 5C76C81E
P 8600 4450
F 0 "TP39" H 8650 4700 50  0000 R CNN
F 1 "TestPoint" H 8542 4568 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 8800 4450 50  0001 C CNN
F 3 "~" H 8800 4450 50  0001 C CNN
	1    8600 4450
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP40
U 1 1 5C76C825
P 8800 4450
F 0 "TP40" H 8850 4700 50  0000 R CNN
F 1 "TestPoint" H 8742 4568 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 9000 4450 50  0001 C CNN
F 3 "~" H 9000 4450 50  0001 C CNN
	1    8800 4450
	-1   0    0    1   
$EndComp
Wire Wire Line
	7200 4050 8200 4050
Connection ~ 7200 4050
Wire Wire Line
	7200 4050 7200 3950
Wire Wire Line
	7400 4150 8400 4150
Connection ~ 7400 4150
Wire Wire Line
	7400 4150 7400 3950
Wire Wire Line
	7400 4150 7400 4450
Wire Wire Line
	7600 4250 8600 4250
Connection ~ 7600 4250
Wire Wire Line
	7600 4250 7600 3950
Wire Wire Line
	7800 4350 8800 4350
Connection ~ 7800 4350
Wire Wire Line
	7800 4350 7800 3950
Wire Wire Line
	8200 4450 8200 4050
Wire Wire Line
	8400 4150 8400 4450
Wire Wire Line
	8600 4250 8600 4450
Wire Wire Line
	8800 4350 8800 4450
Text Notes 7150 3500 0    50   ~ 0
Grass Grwoing Board Pads (Middle)
Text Notes 7150 4900 0    50   ~ 0
Grass Grwoing Board Pads (Front)
Text GLabel 7400 5350 1    50   Input ~ 0
VCC
Text GLabel 7200 5350 1    50   Input ~ 0
SCL
Text GLabel 7300 5350 1    50   Input ~ 0
SDA
Text GLabel 7500 5350 1    50   Input ~ 0
GND
$Comp
L Device:Jumper_NO_Small JP4
U 1 1 5C90AA51
P 3700 2000
F 0 "JP4" H 3650 2100 50  0000 L CNN
F 1 "Jumper_NO_Small" V 3745 2048 50  0001 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3700 2000 50  0001 C CNN
F 3 "~" H 3700 2000 50  0001 C CNN
	1    3700 2000
	0    1    1    0   
$EndComp
$Comp
L Device:Jumper_NO_Small JP5
U 1 1 5C92DBE1
P 3900 2000
F 0 "JP5" H 3850 2100 50  0000 L CNN
F 1 "Jumper_NO_Small" V 3945 2048 50  0001 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3900 2000 50  0001 C CNN
F 3 "~" H 3900 2000 50  0001 C CNN
	1    3900 2000
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5C95D497
P 3700 1750
F 0 "R4" V 3600 1700 50  0000 L CNN
F 1 "4.7k" V 3700 1650 50  0000 L CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 3630 1750 50  0001 C CNN
F 3 "~" H 3700 1750 50  0001 C CNN
	1    3700 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5C95D828
P 3900 1750
F 0 "R5" V 3800 1700 50  0000 L CNN
F 1 "4.7k" V 3900 1650 50  0000 L CNN
F 2 "extsui:R_1608_HandSolderingCustom" V 3830 1750 50  0001 C CNN
F 3 "~" H 3900 1750 50  0001 C CNN
	1    3900 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2100 3700 2200
Connection ~ 3700 2200
Wire Wire Line
	3700 2200 4100 2200
Wire Wire Line
	3900 2100 3900 2300
Connection ~ 3900 2300
Wire Wire Line
	3900 2300 4100 2300
Wire Wire Line
	3450 1500 3700 1500
Wire Wire Line
	3900 1500 3900 1600
Connection ~ 3450 1500
Wire Wire Line
	3450 1500 3450 1250
Wire Wire Line
	3700 1600 3700 1500
Connection ~ 3700 1500
Wire Wire Line
	3700 1500 3900 1500
Wire Wire Line
	4100 1500 3900 1500
Connection ~ 3900 1500
Text Notes 1950 1350 0    50   ~ 0
(Grass and Tree Board is\n not attached.)
Wire Notes Line
	3000 1250 3350 1600
Wire Notes Line
	3250 1600 3350 1600
Wire Notes Line
	3350 1600 3350 1500
Wire Notes Line
	3550 1600 4050 1600
Wire Notes Line
	4050 1600 4050 2100
Wire Notes Line
	4050 2100 3550 2100
Wire Notes Line
	3550 2100 3550 1600
$Comp
L Connector:TestPoint TP9
U 1 1 5C6338B1
P 9200 1650
F 0 "TP9" H 9250 1900 50  0000 R CNN
F 1 "TestPoint" H 9142 1768 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 9400 1650 50  0001 C CNN
F 3 "~" H 9400 1650 50  0001 C CNN
	1    9200 1650
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP10
U 1 1 5C6338B8
P 9400 1650
F 0 "TP10" H 9450 1900 50  0000 R CNN
F 1 "TestPoint" H 9342 1768 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 9600 1650 50  0001 C CNN
F 3 "~" H 9600 1650 50  0001 C CNN
	1    9400 1650
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP11
U 1 1 5C6338BF
P 9600 1650
F 0 "TP11" H 9650 1900 50  0000 R CNN
F 1 "TestPoint" H 9542 1768 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 9800 1650 50  0001 C CNN
F 3 "~" H 9800 1650 50  0001 C CNN
	1    9600 1650
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP12
U 1 1 5C6338C6
P 9800 1650
F 0 "TP12" H 9850 1900 50  0000 R CNN
F 1 "TestPoint" H 9742 1768 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 10000 1650 50  0001 C CNN
F 3 "~" H 10000 1650 50  0001 C CNN
	1    9800 1650
	-1   0    0    1   
$EndComp
Wire Wire Line
	8200 1250 9200 1250
Wire Wire Line
	8400 1350 9400 1350
Wire Wire Line
	8600 1450 9600 1450
Wire Wire Line
	8800 1550 9800 1550
Wire Wire Line
	9200 1650 9200 1250
Wire Wire Line
	9400 1350 9400 1650
Wire Wire Line
	9600 1450 9600 1650
Wire Wire Line
	9800 1550 9800 1650
$Comp
L Connector:TestPoint TP13
U 1 1 5C640A9C
P 10200 1650
F 0 "TP13" H 10250 1900 50  0000 R CNN
F 1 "TestPoint" H 10142 1768 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 10400 1650 50  0001 C CNN
F 3 "~" H 10400 1650 50  0001 C CNN
	1    10200 1650
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP14
U 1 1 5C640AA3
P 10400 1650
F 0 "TP14" H 10450 1900 50  0000 R CNN
F 1 "TestPoint" H 10342 1768 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 10600 1650 50  0001 C CNN
F 3 "~" H 10600 1650 50  0001 C CNN
	1    10400 1650
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP15
U 1 1 5C640AAA
P 10600 1650
F 0 "TP15" H 10650 1900 50  0000 R CNN
F 1 "TestPoint" H 10542 1768 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 10800 1650 50  0001 C CNN
F 3 "~" H 10800 1650 50  0001 C CNN
	1    10600 1650
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP16
U 1 1 5C640AB1
P 10800 1650
F 0 "TP16" H 10850 1900 50  0000 R CNN
F 1 "TestPoint" H 10742 1768 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 11000 1650 50  0001 C CNN
F 3 "~" H 11000 1650 50  0001 C CNN
	1    10800 1650
	-1   0    0    1   
$EndComp
Wire Wire Line
	9200 1250 10200 1250
Wire Wire Line
	9400 1350 10400 1350
Wire Wire Line
	9600 1450 10600 1450
Wire Wire Line
	9800 1550 10800 1550
Wire Wire Line
	10200 1650 10200 1250
Wire Wire Line
	10400 1350 10400 1650
Wire Wire Line
	10600 1450 10600 1650
Wire Wire Line
	10800 1550 10800 1650
Connection ~ 8200 1250
Connection ~ 8400 1350
Connection ~ 8600 1450
Connection ~ 8800 1550
Connection ~ 9200 1250
Connection ~ 9400 1350
Connection ~ 9600 1450
Connection ~ 9800 1550
$Comp
L Connector:TestPoint TP25
U 1 1 5C64F13B
P 9200 3050
F 0 "TP25" H 9250 3300 50  0000 R CNN
F 1 "TestPoint" H 9142 3168 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 9400 3050 50  0001 C CNN
F 3 "~" H 9400 3050 50  0001 C CNN
	1    9200 3050
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP26
U 1 1 5C64F142
P 9400 3050
F 0 "TP26" H 9450 3300 50  0000 R CNN
F 1 "TestPoint" H 9342 3168 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 9600 3050 50  0001 C CNN
F 3 "~" H 9600 3050 50  0001 C CNN
	1    9400 3050
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP27
U 1 1 5C64F149
P 9600 3050
F 0 "TP27" H 9650 3300 50  0000 R CNN
F 1 "TestPoint" H 9542 3168 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 9800 3050 50  0001 C CNN
F 3 "~" H 9800 3050 50  0001 C CNN
	1    9600 3050
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP28
U 1 1 5C64F150
P 9800 3050
F 0 "TP28" H 9850 3300 50  0000 R CNN
F 1 "TestPoint" H 9742 3168 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 10000 3050 50  0001 C CNN
F 3 "~" H 10000 3050 50  0001 C CNN
	1    9800 3050
	-1   0    0    1   
$EndComp
Wire Wire Line
	8200 2650 9200 2650
Wire Wire Line
	8400 2750 9400 2750
Wire Wire Line
	8600 2850 9600 2850
Wire Wire Line
	8800 2950 9800 2950
Wire Wire Line
	9200 3050 9200 2650
Wire Wire Line
	9400 2750 9400 3050
Wire Wire Line
	9600 2850 9600 3050
Wire Wire Line
	9800 2950 9800 3050
$Comp
L Connector:TestPoint TP29
U 1 1 5C65DB32
P 10200 3050
F 0 "TP29" H 10250 3300 50  0000 R CNN
F 1 "TestPoint" H 10142 3168 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 10400 3050 50  0001 C CNN
F 3 "~" H 10400 3050 50  0001 C CNN
	1    10200 3050
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP30
U 1 1 5C65DB39
P 10400 3050
F 0 "TP30" H 10450 3300 50  0000 R CNN
F 1 "TestPoint" H 10342 3168 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 10600 3050 50  0001 C CNN
F 3 "~" H 10600 3050 50  0001 C CNN
	1    10400 3050
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP31
U 1 1 5C65DB40
P 10600 3050
F 0 "TP31" H 10650 3300 50  0000 R CNN
F 1 "TestPoint" H 10542 3168 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 10800 3050 50  0001 C CNN
F 3 "~" H 10800 3050 50  0001 C CNN
	1    10600 3050
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP32
U 1 1 5C65DB47
P 10800 3050
F 0 "TP32" H 10850 3300 50  0000 R CNN
F 1 "TestPoint" H 10742 3168 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 11000 3050 50  0001 C CNN
F 3 "~" H 11000 3050 50  0001 C CNN
	1    10800 3050
	-1   0    0    1   
$EndComp
Wire Wire Line
	9200 2650 10200 2650
Wire Wire Line
	9400 2750 10400 2750
Wire Wire Line
	9600 2850 10600 2850
Wire Wire Line
	9800 2950 10800 2950
Wire Wire Line
	10200 3050 10200 2650
Wire Wire Line
	10400 2750 10400 3050
Wire Wire Line
	10600 2850 10600 3050
Wire Wire Line
	10800 2950 10800 3050
$Comp
L Connector:TestPoint TP41
U 1 1 5C66D607
P 9200 4450
F 0 "TP41" H 9250 4700 50  0000 R CNN
F 1 "TestPoint" H 9142 4568 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 9400 4450 50  0001 C CNN
F 3 "~" H 9400 4450 50  0001 C CNN
	1    9200 4450
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP42
U 1 1 5C66D60E
P 9400 4450
F 0 "TP42" H 9450 4700 50  0000 R CNN
F 1 "TestPoint" H 9342 4568 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 9600 4450 50  0001 C CNN
F 3 "~" H 9600 4450 50  0001 C CNN
	1    9400 4450
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP43
U 1 1 5C66D615
P 9600 4450
F 0 "TP43" H 9650 4700 50  0000 R CNN
F 1 "TestPoint" H 9542 4568 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 9800 4450 50  0001 C CNN
F 3 "~" H 9800 4450 50  0001 C CNN
	1    9600 4450
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP44
U 1 1 5C66D61C
P 9800 4450
F 0 "TP44" H 9850 4700 50  0000 R CNN
F 1 "TestPoint" H 9742 4568 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 10000 4450 50  0001 C CNN
F 3 "~" H 10000 4450 50  0001 C CNN
	1    9800 4450
	-1   0    0    1   
$EndComp
Wire Wire Line
	8200 4050 9200 4050
Wire Wire Line
	8400 4150 9400 4150
Wire Wire Line
	8600 4250 9600 4250
Wire Wire Line
	8800 4350 9800 4350
Wire Wire Line
	9200 4450 9200 4050
Wire Wire Line
	9400 4150 9400 4450
Wire Wire Line
	9600 4250 9600 4450
Wire Wire Line
	9800 4350 9800 4450
$Comp
L Connector:TestPoint TP45
U 1 1 5C67DA42
P 10200 4450
F 0 "TP45" H 10250 4700 50  0000 R CNN
F 1 "TestPoint" H 10142 4568 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 10400 4450 50  0001 C CNN
F 3 "~" H 10400 4450 50  0001 C CNN
	1    10200 4450
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP46
U 1 1 5C67DA49
P 10400 4450
F 0 "TP46" H 10450 4700 50  0000 R CNN
F 1 "TestPoint" H 10342 4568 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 10600 4450 50  0001 C CNN
F 3 "~" H 10600 4450 50  0001 C CNN
	1    10400 4450
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP47
U 1 1 5C67DA50
P 10600 4450
F 0 "TP47" H 10650 4700 50  0000 R CNN
F 1 "TestPoint" H 10542 4568 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 10800 4450 50  0001 C CNN
F 3 "~" H 10800 4450 50  0001 C CNN
	1    10600 4450
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP48
U 1 1 5C67DA57
P 10800 4450
F 0 "TP48" H 10850 4700 50  0000 R CNN
F 1 "TestPoint" H 10742 4568 50  0001 R CNN
F 2 "extsui:TestPoint_Pad_2.0x2.0mm_NoSilk" H 11000 4450 50  0001 C CNN
F 3 "~" H 11000 4450 50  0001 C CNN
	1    10800 4450
	-1   0    0    1   
$EndComp
Wire Wire Line
	9200 4050 10200 4050
Wire Wire Line
	9400 4150 10400 4150
Wire Wire Line
	9600 4250 10600 4250
Wire Wire Line
	9800 4350 10800 4350
Wire Wire Line
	10200 4450 10200 4050
Wire Wire Line
	10400 4150 10400 4450
Wire Wire Line
	10600 4250 10600 4450
Wire Wire Line
	10800 4350 10800 4450
Connection ~ 8200 2650
Connection ~ 8200 4050
Connection ~ 8400 2750
Connection ~ 8400 4150
Connection ~ 8600 2850
Connection ~ 8600 4250
Connection ~ 8800 2950
Connection ~ 8800 4350
Connection ~ 9200 2650
Connection ~ 9200 4050
Connection ~ 9400 2750
Connection ~ 9400 4150
Connection ~ 9600 2850
Connection ~ 9600 4250
Connection ~ 9800 2950
Connection ~ 9800 4350
Text Notes 9150 2200 0    50   ~ 0
Left 8 Pads: F.Cu / Right 8 Pads: R.Cu\n(Back, Middle, and Front are also the same.)
$Comp
L Connector:Conn_01x04_Male J1
U 1 1 5C6FE202
P 7300 6050
F 0 "J1" V 7453 5763 50  0000 R CNN
F 1 "Conn_01x04_Male" V 7362 5763 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 7300 6050 50  0001 C CNN
F 3 "~" H 7300 6050 50  0001 C CNN
	1    7300 6050
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 5C6FE4D5
P 10150 6100
F 0 "J3" V 10303 5913 50  0000 R CNN
F 1 "Conn_01x02_Male" V 10212 5913 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 10150 6100 50  0001 C CNN
F 3 "~" H 10150 6100 50  0001 C CNN
	1    10150 6100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7200 5850 7200 5450
Wire Wire Line
	7300 5350 7300 5550
Wire Wire Line
	7400 5850 7400 5650
Wire Wire Line
	7500 5350 7500 5750
Wire Wire Line
	7200 5450 8850 5450
Wire Wire Line
	8850 5450 8850 5850
Connection ~ 7200 5450
Wire Wire Line
	7200 5450 7200 5350
Wire Wire Line
	7300 5550 8950 5550
Wire Wire Line
	8950 5550 8950 5850
Connection ~ 7300 5550
Wire Wire Line
	7300 5550 7300 5850
Wire Wire Line
	7400 5650 9050 5650
Wire Wire Line
	9050 5650 9050 5850
Connection ~ 7400 5650
Wire Wire Line
	7400 5650 7400 5350
Wire Wire Line
	7500 5750 9150 5750
Wire Wire Line
	9150 5750 9150 5850
Connection ~ 7500 5750
Wire Wire Line
	7500 5750 7500 5850
Text Notes 8750 6250 0    50   ~ 0
GROVE Connector
Text Notes 7050 6350 0    50   ~ 0
\n(Note that there is a difference\n from the placement of board pads)
Wire Wire Line
	10250 5450 10250 5900
$Comp
L Device:CP C2
U 1 1 5C6A1628
P 6300 6100
F 0 "C2" H 6418 6146 50  0000 L CNN
F 1 "100u" H 6418 6055 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 6338 5950 50  0001 C CNN
F 3 "~" H 6300 6100 50  0001 C CNN
	1    6300 6100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 5C6A40C3
P 6300 5950
F 0 "#PWR0102" H 6300 5800 50  0001 C CNN
F 1 "+5V" H 6315 6123 50  0000 C CNN
F 2 "" H 6300 5950 50  0001 C CNN
F 3 "" H 6300 5950 50  0001 C CNN
	1    6300 5950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5C6A4A26
P 6300 6250
F 0 "#PWR0103" H 6300 6000 50  0001 C CNN
F 1 "GND" H 6305 6077 50  0000 C CNN
F 2 "" H 6300 6250 50  0001 C CNN
F 3 "" H 6300 6250 50  0001 C CNN
	1    6300 6250
	1    0    0    -1  
$EndComp
Text Notes 3700 1300 0    50   ~ 0
If you use M5Stack's Grove, don't attach resistors.\n\n(Grove VCC is 5V, but Grove I2C is 3.3V level.\n And Grove has a pull-up resistor by default.)
$Comp
L Device:Speaker LS1
U 1 1 5C753C58
P 10150 5250
F 0 "LS1" V 10161 4970 50  0000 R CNN
F 1 "Speaker" V 10070 4970 50  0000 R CNN
F 2 "extsui:Speaker_UGSM23A" H 10150 5050 50  0001 C CNN
F 3 "~" H 10140 5200 50  0001 C CNN
	1    10150 5250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10150 5450 10150 5900
$EndSCHEMATC
