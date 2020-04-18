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
L power:+5V #PWR01
U 1 1 5C2D1124
P 1050 1100
F 0 "#PWR01" H 1050 950 50  0001 C CNN
F 1 "+5V" H 1065 1273 50  0000 C CNN
F 2 "" H 1050 1100 50  0001 C CNN
F 3 "" H 1050 1100 50  0001 C CNN
	1    1050 1100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5C2D1EAE
P 1850 1100
F 0 "#PWR02" H 1850 850 50  0001 C CNN
F 1 "GND" H 1855 927 50  0000 C CNN
F 2 "" H 1850 1100 50  0001 C CNN
F 3 "" H 1850 1100 50  0001 C CNN
	1    1850 1100
	1    0    0    -1  
$EndComp
Wire Notes Line
	2150 1400 2150 800 
Wire Notes Line
	2150 800  800  800 
Wire Notes Line
	800  800  800  1400
Wire Notes Line
	800  1400 2150 1400
Text Notes 850  750  0    50   ~ 0
Power Flag
$Comp
L Device:C_Small C6
U 1 1 5C2DF16B
P 4550 1850
F 0 "C6" H 4650 1750 50  0000 C CNN
F 1 "0.1u" H 4650 1950 50  0000 C CNN
F 2 "extsui:C_1608_HandSolderingCustom" H 4550 1850 50  0001 C CNN
F 3 "~" H 4550 1850 50  0001 C CNN
	1    4550 1850
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5C353DD7
P 1050 1100
F 0 "#FLG01" H 1050 1175 50  0001 C CNN
F 1 "PWR_FLAG" H 1050 1300 50  0000 C CNN
F 2 "" H 1050 1100 50  0001 C CNN
F 3 "~" H 1050 1100 50  0001 C CNN
	1    1050 1100
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5C365F2A
P 1850 1100
F 0 "#FLG02" H 1850 1175 50  0001 C CNN
F 1 "PWR_FLAG" H 1850 1300 50  0000 C CNN
F 2 "" H 1850 1100 50  0001 C CNN
F 3 "~" H 1850 1100 50  0001 C CNN
	1    1850 1100
	1    0    0    -1  
$EndComp
Text GLabel 7200 2400 1    50   Input ~ 0
5V
Text GLabel 7300 2400 1    50   Input ~ 0
LOWER_SDA
Text GLabel 7400 2400 1    50   Input ~ 0
LOWER_SCL
Text GLabel 7600 2400 1    50   Input ~ 0
GND
Wire Wire Line
	7600 2400 7600 2500
Wire Wire Line
	7400 2400 7400 2600
Wire Wire Line
	7300 2400 7300 2700
Wire Wire Line
	7200 2400 7200 2800
NoConn ~ 7500 2950
$Comp
L Connector:Conn_01x05_Female CN8
U 1 1 5E6B51BB
P 7400 3150
F 0 "CN8" V 7500 3200 50  0000 R CNN
F 1 "Conn_01x05_Female" V 7600 3500 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 7400 3150 50  0001 C CNN
F 3 "~" H 7400 3150 50  0001 C CNN
	1    7400 3150
	0    -1   1    0   
$EndComp
Text Notes 6950 1750 0    50   ~ 0
The Conn_01x05_Female connector is \n connected to the Tile board.
Wire Notes Line
	6950 1800 9150 1800
Wire Notes Line
	6950 3600 6950 1800
$Comp
L Mechanical:MountingHole H1
U 1 1 5E8E347E
P 9700 1950
F 0 "H1" H 9800 1996 50  0000 L CNN
F 1 "MountingHole" H 9800 1905 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9700 1950 50  0001 C CNN
F 3 "~" H 9700 1950 50  0001 C CNN
	1    9700 1950
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5E8E3566
P 9700 2200
F 0 "H2" H 9800 2246 50  0000 L CNN
F 1 "MountingHole" H 9800 2155 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9700 2200 50  0001 C CNN
F 3 "~" H 9700 2200 50  0001 C CNN
	1    9700 2200
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5E8E35F4
P 9700 2450
F 0 "H3" H 9800 2496 50  0000 L CNN
F 1 "MountingHole" H 9800 2405 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9700 2450 50  0001 C CNN
F 3 "~" H 9700 2450 50  0001 C CNN
	1    9700 2450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5E8E3892
P 9700 2700
F 0 "H4" H 9800 2746 50  0000 L CNN
F 1 "MountingHole" H 9800 2655 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9700 2700 50  0001 C CNN
F 3 "~" H 9700 2700 50  0001 C CNN
	1    9700 2700
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H5
U 1 1 5E8E3899
P 9700 2950
F 0 "H5" H 9800 2996 50  0000 L CNN
F 1 "MountingHole" H 9800 2905 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9700 2950 50  0001 C CNN
F 3 "~" H 9700 2950 50  0001 C CNN
	1    9700 2950
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H6
U 1 1 5E8E38A0
P 9700 3200
F 0 "H6" H 9800 3246 50  0000 L CNN
F 1 "MountingHole" H 9800 3155 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9700 3200 50  0001 C CNN
F 3 "~" H 9700 3200 50  0001 C CNN
	1    9700 3200
	1    0    0    -1  
$EndComp
$Comp
L MCU_ST_STM32F3:STM32F303K8Tx U1
U 1 1 5E98BD14
P 3850 5500
F 0 "U1" H 3500 6350 50  0000 C CNN
F 1 "STM32F303K8T6" V 3800 5450 50  0000 C CNN
F 2 "Package_QFP:LQFP-32_7x7mm_P0.8mm" H 3350 4600 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00092070.pdf" H 3850 5500 50  0001 C CNN
	1    3850 5500
	1    0    0    -1  
$EndComp
Text GLabel 4650 6200 2    50   Input ~ 0
SWCLK
Text GLabel 4650 6100 2    50   Input ~ 0
SWDIO
$Comp
L Connector_Generic:Conn_01x06 CN7
U 1 1 5E9A792D
P 9700 5900
F 0 "CN7" H 9620 6317 50  0000 C CNN
F 1 "ST-LINK" H 9620 6226 50  0000 C CNN
F 2 "" H 9700 5900 50  0001 C CNN
F 3 "~" H 9700 5900 50  0001 C CNN
	1    9700 5900
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 CN6
U 1 1 5E9A7A8B
P 9800 4450
F 0 "CN6" H 9720 4867 50  0000 C CNN
F 1 "TTL-232R-3V3" H 9720 4776 50  0000 C CNN
F 2 "" H 9800 4450 50  0001 C CNN
F 3 "~" H 9800 4450 50  0001 C CNN
	1    9800 4450
	-1   0    0    -1  
$EndComp
Text GLabel 10200 5700 2    50   Input ~ 0
3V3
Text GLabel 10200 5800 2    50   Input ~ 0
SWCLK
Text GLabel 10200 5900 2    50   Input ~ 0
GND
Text GLabel 10200 6000 2    50   Input ~ 0
SWDIO
Text GLabel 10200 6100 2    50   Input ~ 0
NRST
Text GLabel 10200 6200 2    50   Input ~ 0
SWO
Wire Wire Line
	9900 5700 10200 5700
Wire Wire Line
	10200 5800 9900 5800
Wire Wire Line
	9900 5900 10200 5900
Wire Wire Line
	10200 6000 9900 6000
Wire Wire Line
	9900 6100 10200 6100
Wire Wire Line
	10200 6200 9900 6200
Text GLabel 10300 4250 2    50   Input ~ 0
GND
Text GLabel 10300 4350 2    50   Input ~ 0
CTS
Text GLabel 10300 4450 2    50   Input ~ 0
5V
Text GLabel 10300 4550 2    50   Input ~ 0
TXD
Text GLabel 10300 4650 2    50   Input ~ 0
RXD
Text GLabel 10300 4750 2    50   Input ~ 0
RTS
Wire Wire Line
	10000 4250 10300 4250
Wire Wire Line
	10300 4350 10000 4350
Wire Wire Line
	10000 4450 10300 4450
Wire Wire Line
	10300 4550 10000 4550
Wire Wire Line
	10000 4650 10300 4650
Wire Wire Line
	10300 4750 10000 4750
$Comp
L Device:Crystal Y1
U 1 1 5E9A9E73
P 2650 5450
F 0 "Y1" V 2604 5581 50  0000 L CNN
F 1 "8MHz" V 2695 5581 50  0000 L CNN
F 2 "" H 2650 5450 50  0001 C CNN
F 3 "~" H 2650 5450 50  0001 C CNN
	1    2650 5450
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5E9AA02E
P 5200 4850
F 0 "R3" V 5100 4850 50  0000 C CNN
F 1 "10k" V 5200 4850 50  0000 C CNN
F 2 "" V 5130 4850 50  0001 C CNN
F 3 "~" H 5200 4850 50  0001 C CNN
	1    5200 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5E9AA0AB
P 5400 4850
F 0 "R4" V 5300 4850 50  0000 C CNN
F 1 "10k" V 5400 4850 50  0000 C CNN
F 2 "" V 5330 4850 50  0001 C CNN
F 3 "~" H 5400 4850 50  0001 C CNN
	1    5400 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 5E9AA11C
P 5400 5950
F 0 "D2" H 5391 6166 50  0000 C CNN
F 1 "LED" H 5391 6075 50  0000 C CNN
F 2 "" H 5400 5950 50  0001 C CNN
F 3 "~" H 5400 5950 50  0001 C CNN
	1    5400 5950
	0    -1   -1   0   
$EndComp
$Comp
L Regulator_Linear:LF33_TO252 U2
U 1 1 5E9AB172
P 2200 2650
F 0 "U2" H 2200 2892 50  0000 C CNN
F 1 "NJM2845DL1-33" H 2200 2801 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 2200 2875 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/c4/0e/7e/2a/be/bc/4c/bd/CD00000546.pdf/files/CD00000546.pdf/jcr:content/translations/en.CD00000546.pdf" H 2200 2600 50  0001 C CNN
	1    2200 2650
	1    0    0    -1  
$EndComp
Text GLabel 1150 2650 0    50   Input ~ 0
5V
Text GLabel 3200 2650 2    50   Input ~ 0
3V3
$Comp
L power:GND #PWR0101
U 1 1 5E9AD322
P 2200 3150
F 0 "#PWR0101" H 2200 2900 50  0001 C CNN
F 1 "GND" H 2205 2977 50  0000 C CNN
F 2 "" H 2200 3150 50  0001 C CNN
F 3 "" H 2200 3150 50  0001 C CNN
	1    2200 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 3150 2200 2950
$Comp
L power:GND #PWR0102
U 1 1 5E9B14FF
P 1750 3150
F 0 "#PWR0102" H 1750 2900 50  0001 C CNN
F 1 "GND" H 1755 2977 50  0000 C CNN
F 2 "" H 1750 3150 50  0001 C CNN
F 3 "" H 1750 3150 50  0001 C CNN
	1    1750 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5E9B1832
P 2650 3150
F 0 "#PWR0103" H 2650 2900 50  0001 C CNN
F 1 "GND" H 2655 2977 50  0000 C CNN
F 2 "" H 2650 3150 50  0001 C CNN
F 3 "" H 2650 3150 50  0001 C CNN
	1    2650 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 2650 2650 2650
Wire Wire Line
	2650 2850 2650 2650
Connection ~ 2650 2650
Wire Wire Line
	2650 2650 2950 2650
Wire Wire Line
	1150 2650 1450 2650
Wire Wire Line
	1750 2850 1750 2650
Connection ~ 1750 2650
Wire Wire Line
	1750 2650 1900 2650
$Comp
L Device:R R1
U 1 1 5E9B4F2D
P 1650 5350
F 0 "R1" V 1550 5300 50  0000 L CNN
F 1 "10k" V 1650 5275 50  0000 L CNN
F 2 "" V 1580 5350 50  0001 C CNN
F 3 "~" H 1650 5350 50  0001 C CNN
	1    1650 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5E9B88C8
P 1650 5600
F 0 "#PWR0104" H 1650 5350 50  0001 C CNN
F 1 "GND" H 1655 5427 50  0000 C CNN
F 2 "" H 1650 5600 50  0001 C CNN
F 3 "" H 1650 5600 50  0001 C CNN
	1    1650 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 5600 1650 5500
Wire Wire Line
	3250 5000 1650 5000
Wire Wire Line
	1650 5000 1650 5200
$Comp
L power:+3.3V #PWR0105
U 1 1 5E9BA395
P 3850 4200
F 0 "#PWR0105" H 3850 4050 50  0001 C CNN
F 1 "+3.3V" H 3865 4373 50  0000 C CNN
F 2 "" H 3850 4200 50  0001 C CNN
F 3 "" H 3850 4200 50  0001 C CNN
	1    3850 4200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 5E9BA3F4
P 1450 2200
F 0 "#PWR0106" H 1450 2050 50  0001 C CNN
F 1 "+5V" H 1465 2373 50  0000 C CNN
F 2 "" H 1450 2200 50  0001 C CNN
F 3 "" H 1450 2200 50  0001 C CNN
	1    1450 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 4600 3750 4400
Wire Wire Line
	3750 4400 3850 4400
Wire Wire Line
	3950 4400 3950 4600
Wire Wire Line
	3850 4600 3850 4400
Connection ~ 3850 4400
Wire Wire Line
	3850 4400 3950 4400
Wire Wire Line
	3850 4200 3850 4400
$Comp
L Switch:SW_Push SW1
U 1 1 5E9E7CF3
P 2650 4600
F 0 "SW1" H 2650 4900 50  0000 R CNN
F 1 "RESET" H 2750 4800 50  0000 R CNN
F 2 "" H 2650 4800 50  0001 C CNN
F 3 "" H 2650 4800 50  0001 C CNN
	1    2650 4600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 CN2
U 1 1 5E9E8238
P 8450 4200
F 0 "CN2" H 8530 4192 50  0000 L CNN
F 1 "Conn_01x04" H 8530 4101 50  0000 L CNN
F 2 "" H 8450 4200 50  0001 C CNN
F 3 "~" H 8450 4200 50  0001 C CNN
	1    8450 4200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 CN3
U 1 1 5E9E9131
P 8450 4800
F 0 "CN3" H 8530 4792 50  0000 L CNN
F 1 "Conn_01x04" H 8530 4701 50  0000 L CNN
F 2 "" H 8450 4800 50  0001 C CNN
F 3 "~" H 8450 4800 50  0001 C CNN
	1    8450 4800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 CN4
U 1 1 5E9E9802
P 8450 5400
F 0 "CN4" H 8530 5392 50  0000 L CNN
F 1 "Conn_01x04" H 8530 5301 50  0000 L CNN
F 2 "" H 8450 5400 50  0001 C CNN
F 3 "~" H 8450 5400 50  0001 C CNN
	1    8450 5400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 CN5
U 1 1 5E9E9ED8
P 8450 6000
F 0 "CN5" H 8530 5992 50  0000 L CNN
F 1 "Conn_01x04" H 8530 5901 50  0000 L CNN
F 2 "" H 8450 6000 50  0001 C CNN
F 3 "~" H 8450 6000 50  0001 C CNN
	1    8450 6000
	1    0    0    -1  
$EndComp
Text GLabel 7550 4300 0    50   Input ~ 0
5V
Text GLabel 7550 4400 0    50   Input ~ 0
GND
Text GLabel 3050 6200 0    50   Input ~ 0
UPPER_SCL
Text GLabel 3050 6300 0    50   Input ~ 0
UPPER_SDA
Text GLabel 7550 4100 0    50   Input ~ 0
LOWER_SCL
Text GLabel 7550 4200 0    50   Input ~ 0
LOWER_SDA
Wire Wire Line
	7550 4100 8050 4100
Wire Wire Line
	7550 4200 7950 4200
Wire Wire Line
	7550 4300 7850 4300
Wire Wire Line
	7550 4400 7750 4400
Wire Wire Line
	8050 4100 8050 4700
Wire Wire Line
	8050 4700 8250 4700
Connection ~ 8050 4100
Wire Wire Line
	8050 4100 8250 4100
Wire Wire Line
	8050 4700 8050 5300
Wire Wire Line
	8050 5300 8250 5300
Connection ~ 8050 4700
Wire Wire Line
	8050 5300 8050 5900
Wire Wire Line
	8050 5900 8250 5900
Connection ~ 8050 5300
Wire Wire Line
	7950 4200 7950 4800
Wire Wire Line
	7950 4800 8250 4800
Connection ~ 7950 4200
Wire Wire Line
	7950 4200 8250 4200
Wire Wire Line
	7950 4800 7950 5400
Wire Wire Line
	7950 5400 8250 5400
Connection ~ 7950 4800
Wire Wire Line
	7950 5400 7950 6000
Wire Wire Line
	7950 6000 8250 6000
Connection ~ 7950 5400
Wire Wire Line
	8250 6100 7850 6100
Wire Wire Line
	7850 6100 7850 5500
Connection ~ 7850 4300
Wire Wire Line
	7850 4300 8250 4300
Wire Wire Line
	8250 4900 7850 4900
Connection ~ 7850 4900
Wire Wire Line
	7850 4900 7850 4300
Wire Wire Line
	8250 5000 7750 5000
Wire Wire Line
	7750 5000 7750 4400
Connection ~ 7750 4400
Wire Wire Line
	7750 4400 8250 4400
Wire Wire Line
	7750 5000 7750 5600
Wire Wire Line
	7750 6200 8250 6200
Connection ~ 7750 5000
Wire Wire Line
	8250 5500 7850 5500
Connection ~ 7850 5500
Wire Wire Line
	7850 5500 7850 4900
Wire Wire Line
	7750 5600 8250 5600
Connection ~ 7750 5600
Wire Wire Line
	7750 5600 7750 6200
$Comp
L Connector:Conn_01x02_Male JP1
U 1 1 5EA09134
P 1450 4700
F 0 "JP1" H 1250 4900 50  0000 C CNN
F 1 "JP_BOOT" H 1250 4800 50  0000 C CNN
F 2 "" H 1450 4700 50  0001 C CNN
F 3 "~" H 1450 4700 50  0001 C CNN
	1    1450 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 4800 1650 5000
Connection ~ 1650 5000
Wire Wire Line
	1650 4700 1650 4400
$Comp
L power:+3.3V #PWR0107
U 1 1 5EA0F457
P 1650 4400
F 0 "#PWR0107" H 1650 4250 50  0001 C CNN
F 1 "+3.3V" H 1665 4573 50  0000 C CNN
F 2 "" H 1650 4400 50  0001 C CNN
F 3 "" H 1650 4400 50  0001 C CNN
	1    1650 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 6500 3750 6600
Wire Wire Line
	3750 6600 3850 6600
Wire Wire Line
	3850 6600 3850 6500
Wire Wire Line
	3750 6600 3750 6700
Connection ~ 3750 6600
$Comp
L power:GND #PWR0108
U 1 1 5EA1545D
P 3750 6700
F 0 "#PWR0108" H 3750 6450 50  0001 C CNN
F 1 "GND" H 3755 6527 50  0000 C CNN
F 2 "" H 3750 6700 50  0001 C CNN
F 3 "" H 3750 6700 50  0001 C CNN
	1    3750 6700
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5EA19374
P 1450 1100
F 0 "#FLG0101" H 1450 1175 50  0001 C CNN
F 1 "PWR_FLAG" H 1450 1300 50  0000 C CNN
F 2 "" H 1450 1100 50  0001 C CNN
F 3 "~" H 1450 1100 50  0001 C CNN
	1    1450 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0109
U 1 1 5EA1B0C5
P 1450 1100
F 0 "#PWR0109" H 1450 950 50  0001 C CNN
F 1 "+3.3V" H 1465 1273 50  0000 C CNN
F 2 "" H 1450 1100 50  0001 C CNN
F 3 "" H 1450 1100 50  0001 C CNN
	1    1450 1100
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 CN1
U 1 1 5EA2EA80
P 4900 3200
F 0 "CN1" H 4980 3192 50  0000 L CNN
F 1 "Conn_01x04" H 4980 3101 50  0000 L CNN
F 2 "" H 4900 3200 50  0001 C CNN
F 3 "~" H 4900 3200 50  0001 C CNN
	1    4900 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 3100 4700 3100
Wire Wire Line
	4600 3200 4700 3200
Wire Wire Line
	4600 3300 4700 3300
Wire Wire Line
	4600 3400 4700 3400
Text GLabel 4600 3300 0    50   Input ~ 0
5V
Text GLabel 4600 3400 0    50   Input ~ 0
GND
Text GLabel 4600 3100 0    50   Input ~ 0
UPPER_SCL
Text GLabel 4600 3200 0    50   Input ~ 0
UPPER_SDA
Text GLabel 5650 5400 2    50   Input ~ 0
LOWER_SCL
Text GLabel 5650 5500 2    50   Input ~ 0
LOWER_SDA
Text GLabel 2950 4400 1    50   Input ~ 0
NRST
Text GLabel 3050 5900 0    50   Input ~ 0
SWO
Wire Wire Line
	4350 6100 4650 6100
Wire Wire Line
	4650 6200 4350 6200
Wire Wire Line
	3050 6200 3250 6200
Wire Wire Line
	3050 5900 3250 5900
Wire Wire Line
	3050 6300 3250 6300
$Comp
L power:GND #PWR0110
U 1 1 5EA76301
P 4850 2150
F 0 "#PWR0110" H 4850 1900 50  0001 C CNN
F 1 "GND" H 4855 1977 50  0000 C CNN
F 2 "" H 4850 2150 50  0001 C CNN
F 3 "" H 4850 2150 50  0001 C CNN
	1    4850 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 4700 2450 4600
Wire Wire Line
	2850 4600 2950 4600
Wire Wire Line
	2950 4600 2950 4800
Wire Wire Line
	2950 4800 3250 4800
Wire Wire Line
	2950 4400 2950 4600
Connection ~ 2950 4600
Wire Wire Line
	2650 5300 3100 5300
Wire Wire Line
	3100 5300 3100 5400
Wire Wire Line
	3100 5400 3250 5400
Wire Wire Line
	3250 5500 3100 5500
Wire Wire Line
	3100 5500 3100 5600
Wire Wire Line
	3100 5600 2650 5600
Wire Wire Line
	2650 5600 2450 5600
Wire Wire Line
	2450 5300 2650 5300
Connection ~ 2650 5300
$Comp
L power:GND #PWR0111
U 1 1 5EAA081C
P 2050 5800
F 0 "#PWR0111" H 2050 5550 50  0001 C CNN
F 1 "GND" H 2055 5627 50  0000 C CNN
F 2 "" H 2050 5800 50  0001 C CNN
F 3 "" H 2050 5800 50  0001 C CNN
	1    2050 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5EAA5F74
P 2350 5300
F 0 "C3" V 2150 5200 50  0000 C CNN
F 1 "22pF" V 2250 5250 50  0000 C CNN
F 2 "" H 2350 5300 50  0001 C CNN
F 3 "~" H 2350 5300 50  0001 C CNN
	1    2350 5300
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5EAA8BC5
P 2350 5600
F 0 "C4" V 2150 5500 50  0000 C CNN
F 1 "22pF" V 2250 5550 50  0000 C CNN
F 2 "" H 2350 5600 50  0001 C CNN
F 3 "~" H 2350 5600 50  0001 C CNN
	1    2350 5600
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 5800 2050 5600
Wire Wire Line
	2050 5300 2250 5300
Wire Wire Line
	2250 5600 2050 5600
Connection ~ 2050 5600
Wire Wire Line
	2050 5600 2050 5300
Connection ~ 2650 5600
$Comp
L Device:C_Small C2
U 1 1 5EAC709A
P 1750 2950
F 0 "C2" H 1850 3000 50  0000 L CNN
F 1 "0.1uF" H 1850 2900 50  0000 L CNN
F 2 "" H 1750 2950 50  0001 C CNN
F 3 "~" H 1750 2950 50  0001 C CNN
	1    1750 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 3150 1750 3050
Wire Wire Line
	2650 3150 2650 3050
$Comp
L power:+3.3V #PWR0112
U 1 1 5EAF2665
P 2950 2200
F 0 "#PWR0112" H 2950 2050 50  0001 C CNN
F 1 "+3.3V" H 2965 2373 50  0000 C CNN
F 2 "" H 2950 2200 50  0001 C CNN
F 3 "" H 2950 2200 50  0001 C CNN
	1    2950 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 2200 2950 2650
Wire Wire Line
	1450 2200 1450 2650
Text GLabel 4650 5000 2    50   Input ~ 0
RXD
Text GLabel 4650 6300 2    50   Input ~ 0
TXD
Wire Wire Line
	4650 5000 4350 5000
Wire Wire Line
	4350 6300 4650 6300
Text Notes 4350 5200 0    50   ~ 0
Cross wiring \n   (UART)
Text Notes 4350 6500 0    50   ~ 0
Cross wiring\n   (UART)
Wire Notes Line
	6950 3900 6950 6400
Wire Notes Line
	6950 6400 9150 6400
Wire Notes Line
	9150 6400 9150 3900
Wire Notes Line
	9150 3900 6950 3900
Text Notes 6950 3850 0    50   ~ 0
GROVE connectors for connecting\n to the surrounding Ground boards.
Wire Notes Line
	9500 1800 9500 3400
Wire Notes Line
	9500 3400 10500 3400
Wire Notes Line
	10500 3400 10500 1800
Wire Notes Line
	10500 1800 9500 1800
Text Notes 9500 1750 0    50   ~ 0
Spacers for Tile board
$Comp
L power:+3.3V #PWR0113
U 1 1 5EB68C43
P 4850 1550
F 0 "#PWR0113" H 4850 1400 50  0001 C CNN
F 1 "+3.3V" H 4865 1723 50  0000 C CNN
F 2 "" H 4850 1550 50  0001 C CNN
F 3 "" H 4850 1550 50  0001 C CNN
	1    4850 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C7
U 1 1 5EB6BF5E
P 4850 1850
F 0 "C7" H 4950 1750 50  0000 C CNN
F 1 "0.1u" H 4950 1950 50  0000 C CNN
F 2 "extsui:C_1608_HandSolderingCustom" H 4850 1850 50  0001 C CNN
F 3 "~" H 4850 1850 50  0001 C CNN
	1    4850 1850
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C8
U 1 1 5EB6F20B
P 5150 1850
F 0 "C8" H 5250 1750 50  0000 C CNN
F 1 "0.1u" H 5250 1950 50  0000 C CNN
F 2 "extsui:C_1608_HandSolderingCustom" H 5150 1850 50  0001 C CNN
F 3 "~" H 5150 1850 50  0001 C CNN
	1    5150 1850
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5EB725E6
P 2450 4700
F 0 "#PWR0114" H 2450 4450 50  0001 C CNN
F 1 "GND" H 2455 4527 50  0000 C CNN
F 2 "" H 2450 4700 50  0001 C CNN
F 3 "" H 2450 4700 50  0001 C CNN
	1    2450 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0115
U 1 1 5EBC604F
P 5200 4500
F 0 "#PWR0115" H 5200 4350 50  0001 C CNN
F 1 "+3.3V" H 5215 4673 50  0000 C CNN
F 2 "" H 5200 4500 50  0001 C CNN
F 3 "" H 5200 4500 50  0001 C CNN
	1    5200 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NO_Small JP2
U 1 1 5EBD7372
P 5200 5100
F 0 "JP2" V 5200 5148 50  0000 L CNN
F 1 "Jumper_NO_Small" V 5245 5148 50  0001 L CNN
F 2 "" H 5200 5100 50  0001 C CNN
F 3 "~" H 5200 5100 50  0001 C CNN
	1    5200 5100
	0    1    1    0   
$EndComp
$Comp
L Device:Jumper_NO_Small JP3
U 1 1 5EBDA269
P 5400 5100
F 0 "JP3" V 5400 5148 50  0000 L CNN
F 1 "Jumper_NO_Small" V 5445 5148 50  0001 L CNN
F 2 "" H 5400 5100 50  0001 C CNN
F 3 "~" H 5400 5100 50  0001 C CNN
	1    5400 5100
	0    1    1    0   
$EndComp
Wire Wire Line
	5200 4500 5200 4600
Wire Wire Line
	5200 4600 5400 4600
Wire Wire Line
	5400 4600 5400 4700
Connection ~ 5200 4600
Wire Wire Line
	5200 4600 5200 4700
Wire Wire Line
	5400 6100 5400 6300
$Comp
L power:GND #PWR0116
U 1 1 5EC36494
P 5400 6300
F 0 "#PWR0116" H 5400 6050 50  0001 C CNN
F 1 "GND" H 5405 6127 50  0000 C CNN
F 2 "" H 5400 6300 50  0001 C CNN
F 3 "" H 5400 6300 50  0001 C CNN
	1    5400 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 1750 4550 1650
Wire Wire Line
	4550 1650 4850 1650
Wire Wire Line
	5150 1650 5150 1750
Wire Wire Line
	4850 1750 4850 1650
Wire Wire Line
	4550 1950 4550 2050
Wire Wire Line
	4550 2050 4850 2050
Wire Wire Line
	5150 2050 5150 1950
Wire Wire Line
	4850 1950 4850 2050
Connection ~ 4850 1650
Wire Wire Line
	4850 1650 5150 1650
Wire Wire Line
	4850 1650 4850 1550
Connection ~ 4850 2050
Wire Wire Line
	4850 2050 5150 2050
Wire Wire Line
	4850 2050 4850 2150
Wire Notes Line
	4000 3600 4000 2900
Wire Notes Line
	4000 2900 5650 2900
Wire Notes Line
	5650 2900 5650 3600
Wire Notes Line
	5650 3600 4000 3600
Text Notes 4000 2850 0    50   ~ 0
The upper I2C is supposed to be M5Stack,\n  so pull-up resistor is not prepared.
Wire Notes Line
	4000 1250 5650 1250
Wire Notes Line
	5650 1250 5650 2450
Wire Notes Line
	5650 2450 4000 2450
Wire Notes Line
	4000 2450 4000 1250
Text Notes 4000 1200 0    50   ~ 0
Put CAPs near to VDD (PIN #1, #17) \n and AVDD (pin #5) .
Wire Notes Line
	800  1700 3700 1700
Wire Notes Line
	3700 1700 3700 3600
Wire Notes Line
	3700 3600 800  3600
Wire Notes Line
	800  3600 800  1700
Text Notes 800  1650 0    50   ~ 0
Power Supply
Wire Notes Line
	10600 5350 10600 6400
Wire Notes Line
	10600 6400 9500 6400
Wire Notes Line
	9500 6400 9500 5350
Wire Notes Line
	9500 5350 10600 5350
Text Notes 9500 5300 0    50   ~ 0
Debbuger
Text Notes 9500 3850 0    50   ~ 0
Debug-UART and Power Supply
Wire Notes Line
	9500 3900 9500 4950
Wire Notes Line
	9500 4950 10700 4950
Wire Notes Line
	10700 4950 10700 3900
Wire Notes Line
	10700 3900 9500 3900
$Comp
L Switch:SW_Push SW2
U 1 1 5EA4D072
P 5700 6000
F 0 "SW2" V 5650 6300 50  0000 R CNN
F 1 "MODE" V 5750 6350 50  0000 R CNN
F 2 "" H 5700 6200 50  0001 C CNN
F 3 "" H 5700 6200 50  0001 C CNN
	1    5700 6000
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 5400 5200 5400
Wire Wire Line
	5650 5500 5400 5500
Wire Wire Line
	5200 5200 5200 5400
Connection ~ 5200 5400
Wire Wire Line
	5200 5400 5650 5400
Wire Wire Line
	5400 5200 5400 5500
Connection ~ 5400 5500
Wire Wire Line
	5400 5500 4350 5500
NoConn ~ 8450 2950
$Comp
L Connector:Conn_01x05_Female CN9
U 1 1 5EA9F51E
P 8350 3150
F 0 "CN9" V 8450 3100 50  0000 L CNN
F 1 "CardEdgeConnector-5P" V 8550 2700 50  0000 L CNN
F 2 "" H 8350 3150 50  0001 C CNN
F 3 "~" H 8350 3150 50  0001 C CNN
	1    8350 3150
	0    -1   1    0   
$EndComp
Wire Wire Line
	7600 2500 8550 2500
Wire Wire Line
	8550 2500 8550 2950
Connection ~ 7600 2500
Wire Wire Line
	7600 2500 7600 2950
Wire Wire Line
	7400 2600 8350 2600
Wire Wire Line
	8350 2600 8350 2950
Connection ~ 7400 2600
Wire Wire Line
	7400 2600 7400 2950
Wire Wire Line
	7300 2700 8250 2700
Wire Wire Line
	8250 2700 8250 2950
Connection ~ 7300 2700
Wire Wire Line
	7300 2700 7300 2950
Wire Wire Line
	8150 2950 8150 2800
Wire Wire Line
	8150 2800 7200 2800
Connection ~ 7200 2800
Wire Wire Line
	7200 2800 7200 2950
Wire Notes Line
	6950 3600 9150 3600
Wire Notes Line
	9150 3600 9150 1800
Text Notes 7150 3500 0    50   ~ 0
To Tile board
Text Notes 8000 3500 0    50   ~ 0
To inserted board
Text Notes 800  3850 0    50   ~ 0
STM32F303K8T6
Wire Notes Line
	800  3900 800  7050
Wire Notes Line
	800  7050 6700 7050
Wire Notes Line
	6700 7050 6700 3900
Wire Notes Line
	6700 3900 800  3900
NoConn ~ 3250 5700
NoConn ~ 3250 5800
NoConn ~ 3250 6000
NoConn ~ 3250 6100
NoConn ~ 4350 6000
NoConn ~ 4350 5900
NoConn ~ 4350 5800
NoConn ~ 4350 5300
NoConn ~ 4350 5200
NoConn ~ 4350 5100
NoConn ~ 4350 4900
NoConn ~ 4350 4800
Wire Wire Line
	5700 6200 5700 6300
$Comp
L power:GND #PWR0117
U 1 1 5EC27331
P 5700 6300
F 0 "#PWR0117" H 5700 6050 50  0001 C CNN
F 1 "GND" H 5705 6127 50  0000 C CNN
F 2 "" H 5700 6300 50  0001 C CNN
F 3 "" H 5700 6300 50  0001 C CNN
	1    5700 6300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5EC338C8
P 4700 5700
F 0 "R2" V 4600 5650 50  0000 L CNN
F 1 "10k" V 4700 5625 50  0000 L CNN
F 2 "" V 4630 5700 50  0001 C CNN
F 3 "~" H 4700 5700 50  0001 C CNN
	1    4700 5700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4350 5700 4550 5700
Wire Wire Line
	4850 5700 5400 5700
Wire Wire Line
	4350 5600 5700 5600
Wire Wire Line
	5700 5600 5700 5800
Wire Wire Line
	5400 5800 5400 5700
$Comp
L Device:CP_Small C1
U 1 1 5ED47556
P 1450 2950
F 0 "C1" H 1538 2996 50  0000 L CNN
F 1 "47uF" H 1538 2905 50  0000 L CNN
F 2 "" H 1450 2950 50  0001 C CNN
F 3 "~" H 1450 2950 50  0001 C CNN
	1    1450 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 3150 1450 3050
$Comp
L power:GND #PWR0118
U 1 1 5ED54257
P 1450 3150
F 0 "#PWR0118" H 1450 2900 50  0001 C CNN
F 1 "GND" H 1455 2977 50  0000 C CNN
F 2 "" H 1450 3150 50  0001 C CNN
F 3 "" H 1450 3150 50  0001 C CNN
	1    1450 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 2850 1450 2650
Connection ~ 1450 2650
Wire Wire Line
	1450 2650 1750 2650
$Comp
L Device:D_Schottky D1
U 1 1 5EDA4386
P 2200 2250
F 0 "D1" H 2200 2466 50  0000 C CNN
F 1 "D_Schottky" H 2200 2375 50  0000 C CNN
F 2 "" H 2200 2250 50  0001 C CNN
F 3 "~" H 2200 2250 50  0001 C CNN
	1    2200 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2250 2650 2250
Wire Wire Line
	2650 2250 2650 2650
Wire Wire Line
	2050 2250 1750 2250
Wire Wire Line
	1750 2250 1750 2650
Connection ~ 2950 2650
Wire Wire Line
	2950 2650 3200 2650
$Comp
L Device:C_Small C5
U 1 1 5EE6AF35
P 2650 2950
F 0 "C5" H 2750 3000 50  0000 L CNN
F 1 "10uF" H 2750 2900 50  0000 L CNN
F 2 "" H 2650 2950 50  0001 C CNN
F 3 "~" H 2650 2950 50  0001 C CNN
	1    2650 2950
	1    0    0    -1  
$EndComp
$EndSCHEMATC
