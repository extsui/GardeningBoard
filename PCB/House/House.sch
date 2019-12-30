EESchema Schematic File Version 4
LIBS:House-cache
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
	1850 2050 1550 2050
Wire Wire Line
	3250 2050 3450 2050
Wire Wire Line
	3450 2050 3450 1800
Wire Wire Line
	3250 2150 3500 2150
Wire Wire Line
	3250 2250 3500 2250
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
	1750 2150 1750 3650
Wire Wire Line
	1750 3650 1800 3650
Wire Wire Line
	2950 3650 3350 3650
Wire Wire Line
	3350 3650 3350 2350
Wire Wire Line
	3350 2350 3250 2350
Wire Wire Line
	3250 2450 3450 2450
Wire Wire Line
	3450 2450 3450 3950
Wire Wire Line
	3450 3950 2950 3950
Wire Wire Line
	3250 2550 3550 2550
Wire Wire Line
	2950 4250 3550 4250
Connection ~ 2200 3950
Wire Wire Line
	3550 2550 3550 4250
Wire Wire Line
	2200 3950 2200 4250
Wire Wire Line
	2200 3650 2200 3950
Text GLabel 5450 1000 1    50   Input ~ 0
+5V
Text GLabel 5650 1000 1    50   Input ~ 0
SCL
Text GLabel 5550 1000 1    50   Input ~ 0
SDA
Text GLabel 5850 1000 1    50   Input ~ 0
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
L Device:D_Schottky_ALT D28
U 1 1 5C2E2B2F
P 1950 3650
F 0 "D28" H 1950 3550 50  0000 C CNN
F 1 "D" H 1950 3750 50  0000 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" H 1950 3650 50  0001 C CNN
F 3 "~" H 1950 3650 50  0001 C CNN
	1    1950 3650
	-1   0    0    1   
$EndComp
$Comp
L Device:LED_Small D1
U 1 1 5C2E323A
P 5050 2050
F 0 "D1" H 5050 2150 50  0000 C CNN
F 1 "LED" H 5250 2150 50  0000 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 2050 50  0001 C CNN
F 3 "~" V 5050 2050 50  0001 C CNN
	1    5050 2050
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D2
U 1 1 5C2E49C9
P 5050 2350
F 0 "D2" H 5050 2450 50  0000 C CNN
F 1 "LED" H 5050 2250 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 2350 50  0001 C CNN
F 3 "~" V 5050 2350 50  0001 C CNN
	1    5050 2350
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D7
U 1 1 5C2E4FE3
P 5050 3850
F 0 "D7" H 5050 3950 50  0000 C CNN
F 1 "LED" H 5050 3750 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 3850 50  0001 C CNN
F 3 "~" V 5050 3850 50  0001 C CNN
	1    5050 3850
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D9
U 1 1 5C2E55DC
P 5050 5000
F 0 "D9" H 5050 5100 50  0000 C CNN
F 1 "LED" H 5050 4900 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 5000 50  0001 C CNN
F 3 "~" V 5050 5000 50  0001 C CNN
	1    5050 5000
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D3
U 1 1 5C2E7A23
P 5050 2650
F 0 "D3" H 5050 2750 50  0000 C CNN
F 1 "LED" H 5050 2550 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 2650 50  0001 C CNN
F 3 "~" V 5050 2650 50  0001 C CNN
	1    5050 2650
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D6
U 1 1 5C2E803B
P 5050 3550
F 0 "D6" H 5050 3650 50  0000 C CNN
F 1 "LED" H 5050 3450 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 3550 50  0001 C CNN
F 3 "~" V 5050 3550 50  0001 C CNN
	1    5050 3550
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D11
U 1 1 5C2E864A
P 5050 5600
F 0 "D11" H 5050 5700 50  0000 C CNN
F 1 "LED" H 5050 5500 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 5600 50  0001 C CNN
F 3 "~" V 5050 5600 50  0001 C CNN
	1    5050 5600
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D5
U 1 1 5C2E8C64
P 5050 3250
F 0 "D5" H 5050 3350 50  0000 C CNN
F 1 "LED" H 5050 3150 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 3250 50  0001 C CNN
F 3 "~" V 5050 3250 50  0001 C CNN
	1    5050 3250
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D4
U 1 1 5C2FAC7B
P 5050 2950
F 0 "D4" H 5050 3050 50  0000 C CNN
F 1 "LED" H 5050 2850 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 2950 50  0001 C CNN
F 3 "~" V 5050 2950 50  0001 C CNN
	1    5050 2950
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D10
U 1 1 5C2FAC82
P 5050 5300
F 0 "D10" H 5050 5400 50  0000 C CNN
F 1 "LED" H 5050 5200 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 5300 50  0001 C CNN
F 3 "~" V 5050 5300 50  0001 C CNN
	1    5050 5300
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D8
U 1 1 5C2FAC89
P 5050 4150
F 0 "D8" H 5050 4250 50  0000 C CNN
F 1 "LED" H 5050 4050 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 4150 50  0001 C CNN
F 3 "~" V 5050 4150 50  0001 C CNN
	1    5050 4150
	-1   0    0    -1  
$EndComp
NoConn ~ 1850 2350
NoConn ~ 1850 2450
NoConn ~ 1850 2550
NoConn ~ 1850 2650
NoConn ~ 1850 2750
NoConn ~ 1850 2850
Wire Wire Line
	3350 2350 4450 2350
Connection ~ 3350 2350
Connection ~ 3450 2450
Wire Wire Line
	3450 2450 4550 2450
Wire Wire Line
	4950 2350 4800 2350
Wire Wire Line
	4550 2350 4550 2450
Wire Wire Line
	3550 2550 4550 2550
Wire Wire Line
	4550 2550 4550 2650
Wire Wire Line
	4550 2650 4800 2650
Connection ~ 3550 2550
Wire Wire Line
	3250 2650 4450 2650
Wire Wire Line
	4450 2650 4450 2950
Wire Wire Line
	4450 2950 4800 2950
Wire Wire Line
	3250 3350 3750 3350
Wire Wire Line
	3750 3350 3750 5600
Wire Wire Line
	3750 5600 4800 5600
Wire Wire Line
	4950 5300 4800 5300
Wire Wire Line
	3850 5300 3850 3250
Wire Wire Line
	3850 3250 3250 3250
Wire Wire Line
	3250 3150 3950 3150
Wire Wire Line
	3950 3150 3950 5000
Wire Wire Line
	3950 5000 4800 5000
Wire Wire Line
	4950 4150 4800 4150
Wire Wire Line
	4050 4150 4050 3050
Wire Wire Line
	4050 3050 3250 3050
Wire Wire Line
	3250 2950 4150 2950
Wire Wire Line
	4150 2950 4150 3850
Wire Wire Line
	4150 3850 4800 3850
Wire Wire Line
	4950 3550 4800 3550
Wire Wire Line
	4250 3550 4250 2850
Wire Wire Line
	4250 2850 3250 2850
Wire Wire Line
	3250 2750 4350 2750
Wire Wire Line
	4350 2750 4350 3250
Wire Wire Line
	4350 3250 4800 3250
Wire Wire Line
	5150 2050 5250 2050
Wire Wire Line
	5250 2050 5250 2350
Wire Wire Line
	5150 2350 5250 2350
Connection ~ 5250 2350
Wire Wire Line
	5250 2350 5250 2650
Wire Wire Line
	5150 2650 5250 2650
Connection ~ 5250 2650
Wire Wire Line
	5250 2650 5250 2950
Wire Wire Line
	5150 2950 5250 2950
Connection ~ 5250 2950
Wire Wire Line
	5250 2950 5250 3250
Wire Wire Line
	5150 3250 5250 3250
Connection ~ 5250 3250
Wire Wire Line
	5250 3250 5250 3550
Wire Wire Line
	5150 3550 5250 3550
Connection ~ 5250 3550
Wire Wire Line
	5250 3550 5250 3850
Wire Wire Line
	5150 3850 5250 3850
Connection ~ 5250 3850
Wire Wire Line
	5250 3850 5250 4150
Wire Wire Line
	5150 4150 5250 4150
Connection ~ 5250 4150
Wire Wire Line
	5250 4150 5250 4600
Wire Wire Line
	5150 5000 5250 5000
Wire Wire Line
	5250 5000 5250 5300
Wire Wire Line
	5150 5300 5250 5300
Wire Wire Line
	5250 5300 5250 5600
Wire Wire Line
	5150 5600 5250 5600
Wire Wire Line
	1750 3650 1750 4600
Wire Wire Line
	1750 4600 5250 4600
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
Text Notes 5150 1700 0    50   ~ 0
2.54mm pitch to Mother Board (both sides)\n(Card Edge Connector)
$Comp
L Connector_Generic:Conn_01x05 J1
U 1 1 5CEBBC43
P 5650 1400
F 0 "J1" V 5523 1112 50  0000 R CNN
F 1 "Conn_01x05" V 5614 1112 50  0000 R CNN
F 2 "extsui:EDAC_5P_P2.54mm" H 5650 1400 50  0001 C CNN
F 3 "~" H 5650 1400 50  0001 C CNN
	1    5650 1400
	0    -1   1    0   
$EndComp
Wire Wire Line
	5450 1000 5450 1200
Wire Wire Line
	5550 1200 5550 1000
Wire Wire Line
	5650 1000 5650 1200
Wire Wire Line
	5850 1200 5850 1000
NoConn ~ 5750 1200
Connection ~ 5250 5300
$Comp
L Device:LED_Small D12
U 1 1 5E0A44C3
P 5050 5900
F 0 "D12" H 5050 6000 50  0000 C CNN
F 1 "LED" H 5050 5800 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 5900 50  0001 C CNN
F 3 "~" V 5050 5900 50  0001 C CNN
	1    5050 5900
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D14
U 1 1 5E0A44CA
P 5050 6500
F 0 "D14" H 5050 6600 50  0000 C CNN
F 1 "LED" H 5050 6400 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 6500 50  0001 C CNN
F 3 "~" V 5050 6500 50  0001 C CNN
	1    5050 6500
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D13
U 1 1 5E0A44D1
P 5050 6200
F 0 "D13" H 5050 6300 50  0000 C CNN
F 1 "LED" H 5050 6100 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 6200 50  0001 C CNN
F 3 "~" V 5050 6200 50  0001 C CNN
	1    5050 6200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5150 5900 5250 5900
Wire Wire Line
	5150 6200 5250 6200
Wire Wire Line
	5150 6500 5250 6500
$Comp
L Device:LED_Small D16
U 1 1 5E0A6923
P 5050 7100
F 0 "D16" H 5050 7200 50  0000 C CNN
F 1 "LED" H 5050 7000 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 7100 50  0001 C CNN
F 3 "~" V 5050 7100 50  0001 C CNN
	1    5050 7100
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D15
U 1 1 5E0A692A
P 5050 6800
F 0 "D15" H 5050 6900 50  0000 C CNN
F 1 "LED" H 5050 6700 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5050 6800 50  0001 C CNN
F 3 "~" V 5050 6800 50  0001 C CNN
	1    5050 6800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5150 6800 5250 6800
Wire Wire Line
	5150 7100 5250 7100
Wire Wire Line
	5250 4600 5250 5000
Connection ~ 5250 4600
Connection ~ 5250 5000
Wire Wire Line
	5250 5600 5250 5900
Connection ~ 5250 5600
Connection ~ 5250 5900
Wire Wire Line
	5250 5900 5250 6200
Connection ~ 5250 6200
Wire Wire Line
	5250 6200 5250 6500
Connection ~ 5250 6500
Wire Wire Line
	5250 6500 5250 6800
Connection ~ 5250 6800
Wire Wire Line
	5250 6800 5250 7100
Wire Wire Line
	1400 5900 1400 3350
Wire Wire Line
	1400 3350 1850 3350
Wire Wire Line
	1300 6200 1300 3250
Wire Wire Line
	1300 3250 1850 3250
Wire Wire Line
	1200 6500 1200 3150
Wire Wire Line
	1200 3150 1850 3150
Wire Wire Line
	1100 6800 1100 3050
Wire Wire Line
	1100 3050 1850 3050
Wire Wire Line
	1000 7100 1000 2950
Wire Wire Line
	1000 2950 1850 2950
Wire Wire Line
	1000 7100 4950 7100
$Comp
L House-rescue:HT16K33-28SOP-Garden-Grass-rescue U1
U 1 1 5C2B207A
P 2550 2700
F 0 "U1" H 2000 3450 50  0000 C CNN
F 1 "HT16K33-28SOP" H 2550 3450 50  0000 C CNN
F 2 "Package_SO:SOIC-28W_7.5x18.7mm_P1.27mm" H 2300 3450 50  0001 C CNN
F 3 "" H 2300 3450 50  0001 C CNN
	1    2550 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 2250 1650 2250
Wire Wire Line
	1650 2250 1650 4700
Wire Wire Line
	4450 2350 4450 2050
Wire Wire Line
	4450 2050 4800 2050
Wire Wire Line
	4800 2050 4800 2200
Wire Wire Line
	4800 2200 5650 2200
Connection ~ 4800 2050
Wire Wire Line
	4800 2050 4950 2050
Wire Wire Line
	4800 2350 4800 2500
Wire Wire Line
	4800 2500 5650 2500
Connection ~ 4800 2350
Wire Wire Line
	4800 2350 4550 2350
Wire Wire Line
	4800 2650 4800 2800
Wire Wire Line
	4800 2800 5650 2800
Connection ~ 4800 2650
Wire Wire Line
	4800 2650 4950 2650
Wire Wire Line
	4800 2950 4800 3100
Wire Wire Line
	4800 3100 5650 3100
Connection ~ 4800 2950
Wire Wire Line
	4800 2950 4950 2950
Wire Wire Line
	4800 3250 4800 3400
Wire Wire Line
	4800 3400 5650 3400
Connection ~ 4800 3250
Wire Wire Line
	4800 3250 4950 3250
Wire Wire Line
	4800 3550 4800 3700
Wire Wire Line
	4800 3700 5650 3700
Connection ~ 4800 3550
Wire Wire Line
	4800 3550 4250 3550
Wire Wire Line
	4800 3850 4800 4000
Wire Wire Line
	4800 4000 5650 4000
Connection ~ 4800 3850
Wire Wire Line
	4800 3850 4950 3850
Wire Wire Line
	4800 4150 4800 4300
Wire Wire Line
	4800 4300 5650 4300
Connection ~ 4800 4150
Wire Wire Line
	4800 4150 4050 4150
Wire Wire Line
	4800 5000 4800 5150
Wire Wire Line
	4800 5150 5650 5150
Connection ~ 4800 5000
Wire Wire Line
	4800 5000 4950 5000
Wire Wire Line
	4800 5300 4800 5450
Wire Wire Line
	4800 5450 5650 5450
Connection ~ 4800 5300
Wire Wire Line
	4800 5300 3850 5300
Wire Wire Line
	4800 5600 4800 5750
Wire Wire Line
	4800 5750 5650 5750
Connection ~ 4800 5600
Wire Wire Line
	4800 5600 4950 5600
$Comp
L Device:LED_Small D17
U 1 1 5E1AD61C
P 5750 2200
F 0 "D17" H 5750 2300 50  0000 C CNN
F 1 "LED" H 5750 2100 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5750 2200 50  0001 C CNN
F 3 "~" V 5750 2200 50  0001 C CNN
	1    5750 2200
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D18
U 1 1 5E1AD6F9
P 5750 2500
F 0 "D18" H 5750 2600 50  0000 C CNN
F 1 "LED" H 5750 2400 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5750 2500 50  0001 C CNN
F 3 "~" V 5750 2500 50  0001 C CNN
	1    5750 2500
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D19
U 1 1 5E1B4B9F
P 5750 2800
F 0 "D19" H 5750 2900 50  0000 C CNN
F 1 "LED" H 5750 2700 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5750 2800 50  0001 C CNN
F 3 "~" V 5750 2800 50  0001 C CNN
	1    5750 2800
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D20
U 1 1 5E1B4BA6
P 5750 3100
F 0 "D20" H 5750 3200 50  0000 C CNN
F 1 "LED" H 5750 3000 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5750 3100 50  0001 C CNN
F 3 "~" V 5750 3100 50  0001 C CNN
	1    5750 3100
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D21
U 1 1 5E1BC06E
P 5750 3400
F 0 "D21" H 5750 3500 50  0000 C CNN
F 1 "LED" H 5750 3300 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5750 3400 50  0001 C CNN
F 3 "~" V 5750 3400 50  0001 C CNN
	1    5750 3400
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D22
U 1 1 5E1BC075
P 5750 3700
F 0 "D22" H 5750 3800 50  0000 C CNN
F 1 "LED" H 5750 3600 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5750 3700 50  0001 C CNN
F 3 "~" V 5750 3700 50  0001 C CNN
	1    5750 3700
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D23
U 1 1 5E1BC07C
P 5750 4000
F 0 "D23" H 5750 4100 50  0000 C CNN
F 1 "LED" H 5750 3900 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5750 4000 50  0001 C CNN
F 3 "~" V 5750 4000 50  0001 C CNN
	1    5750 4000
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D24
U 1 1 5E1BC083
P 5750 4300
F 0 "D24" H 5750 4400 50  0000 C CNN
F 1 "LED" H 5750 4200 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5750 4300 50  0001 C CNN
F 3 "~" V 5750 4300 50  0001 C CNN
	1    5750 4300
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D25
U 1 1 5E1C39DF
P 5750 5150
F 0 "D25" H 5750 5250 50  0000 C CNN
F 1 "LED" H 5750 5050 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5750 5150 50  0001 C CNN
F 3 "~" V 5750 5150 50  0001 C CNN
	1    5750 5150
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D26
U 1 1 5E1C39E6
P 5750 5450
F 0 "D26" H 5750 5550 50  0000 C CNN
F 1 "LED" H 5750 5350 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5750 5450 50  0001 C CNN
F 3 "~" V 5750 5450 50  0001 C CNN
	1    5750 5450
	-1   0    0    -1  
$EndComp
$Comp
L Device:LED_Small D27
U 1 1 5E1C39ED
P 5750 5750
F 0 "D27" H 5750 5850 50  0000 C CNN
F 1 "LED" H 5750 5650 50  0001 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" V 5750 5750 50  0001 C CNN
F 3 "~" V 5750 5750 50  0001 C CNN
	1    5750 5750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1400 5900 4950 5900
Wire Wire Line
	1300 6200 4950 6200
Wire Wire Line
	1200 6500 4950 6500
Wire Wire Line
	1100 6800 4950 6800
Wire Wire Line
	5850 2200 5950 2200
Wire Wire Line
	5950 2200 5950 2500
Wire Wire Line
	1650 4700 5950 4700
Wire Wire Line
	5850 2500 5950 2500
Connection ~ 5950 2500
Wire Wire Line
	5950 2500 5950 2800
Wire Wire Line
	5850 2800 5950 2800
Connection ~ 5950 2800
Wire Wire Line
	5950 2800 5950 3100
Wire Wire Line
	5850 3100 5950 3100
Connection ~ 5950 3100
Wire Wire Line
	5950 3100 5950 3400
Wire Wire Line
	5850 3400 5950 3400
Connection ~ 5950 3400
Wire Wire Line
	5950 3400 5950 3700
Wire Wire Line
	5850 3700 5950 3700
Connection ~ 5950 3700
Wire Wire Line
	5950 3700 5950 4000
Wire Wire Line
	5850 4000 5950 4000
Connection ~ 5950 4000
Wire Wire Line
	5950 4000 5950 4300
Wire Wire Line
	5850 4300 5950 4300
Connection ~ 5950 4300
Wire Wire Line
	5950 4300 5950 4700
Wire Wire Line
	5850 5750 5950 5750
Wire Wire Line
	5950 5750 5950 5450
Connection ~ 5950 4700
Wire Wire Line
	5850 5450 5950 5450
Connection ~ 5950 5450
Wire Wire Line
	5950 5450 5950 5150
Wire Wire Line
	5850 5150 5950 5150
Connection ~ 5950 5150
Wire Wire Line
	5950 5150 5950 4700
$EndSCHEMATC
