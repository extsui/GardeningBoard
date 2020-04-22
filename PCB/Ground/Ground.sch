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
P 1600 1100
F 0 "#PWR02" H 1600 850 50  0001 C CNN
F 1 "GND" H 1605 927 50  0000 C CNN
F 2 "" H 1600 1100 50  0001 C CNN
F 3 "" H 1600 1100 50  0001 C CNN
	1    1600 1100
	1    0    0    -1  
$EndComp
Wire Notes Line
	2200 1400 2200 800 
Wire Notes Line
	2200 800  800  800 
Wire Notes Line
	800  800  800  1400
Wire Notes Line
	800  1400 2200 1400
Text Notes 850  750  0    50   ~ 0
Power Flag
$Comp
L Device:C_Small C6
U 1 1 5C2DF16B
P 4250 1400
F 0 "C6" H 4350 1300 50  0000 C CNN
F 1 "0.1u" H 4350 1500 50  0000 C CNN
F 2 "extsui:C_1608_HandSolderingCustom" H 4250 1400 50  0001 C CNN
F 3 "~" H 4250 1400 50  0001 C CNN
	1    4250 1400
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
P 1600 1100
F 0 "#FLG02" H 1600 1175 50  0001 C CNN
F 1 "PWR_FLAG" H 1600 1300 50  0000 C CNN
F 2 "" H 1600 1100 50  0001 C CNN
F 3 "~" H 1600 1100 50  0001 C CNN
	1    1600 1100
	1    0    0    -1  
$EndComp
Text GLabel 8750 2250 1    50   Input ~ 0
5V
Text GLabel 8850 2250 1    50   Input ~ 0
LOWER_SDA
Text GLabel 8950 2250 1    50   Input ~ 0
LOWER_SCL
Text GLabel 9150 2250 1    50   Input ~ 0
GND
Wire Wire Line
	9150 2250 9150 2350
Wire Wire Line
	8950 2250 8950 2450
Wire Wire Line
	8850 2250 8850 2550
Wire Wire Line
	8750 2250 8750 2650
NoConn ~ 9050 2800
$Comp
L Connector:Conn_01x05_Female CN8
U 1 1 5E6B51BB
P 8950 3000
F 0 "CN8" V 9050 3050 50  0000 R CNN
F 1 "Conn_01x05_Female" V 9150 3350 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 8950 3000 50  0001 C CNN
F 3 "~" H 8950 3000 50  0001 C CNN
	1    8950 3000
	0    -1   1    0   
$EndComp
Text Notes 8500 1600 0    50   ~ 0
The Conn_01x05_Female connector is \n connected to the Tile board.
Wire Notes Line
	8500 1650 10500 1650
Wire Notes Line
	8500 3450 8500 1650
$Comp
L Mechanical:MountingHole H1
U 1 1 5E8E347E
P 9700 3900
F 0 "H1" H 9800 3946 50  0000 L CNN
F 1 "MountingHole" H 9800 3855 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9700 3900 50  0001 C CNN
F 3 "~" H 9700 3900 50  0001 C CNN
	1    9700 3900
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5E8E3566
P 9700 4150
F 0 "H2" H 9800 4196 50  0000 L CNN
F 1 "MountingHole" H 9800 4105 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9700 4150 50  0001 C CNN
F 3 "~" H 9700 4150 50  0001 C CNN
	1    9700 4150
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5E8E35F4
P 9700 4400
F 0 "H3" H 9800 4446 50  0000 L CNN
F 1 "MountingHole" H 9800 4355 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9700 4400 50  0001 C CNN
F 3 "~" H 9700 4400 50  0001 C CNN
	1    9700 4400
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5E8E3892
P 9700 4650
F 0 "H4" H 9800 4696 50  0000 L CNN
F 1 "MountingHole" H 9800 4605 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9700 4650 50  0001 C CNN
F 3 "~" H 9700 4650 50  0001 C CNN
	1    9700 4650
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H5
U 1 1 5E8E3899
P 9700 4900
F 0 "H5" H 9800 4946 50  0000 L CNN
F 1 "MountingHole" H 9800 4855 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9700 4900 50  0001 C CNN
F 3 "~" H 9700 4900 50  0001 C CNN
	1    9700 4900
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H6
U 1 1 5E8E38A0
P 9700 5150
F 0 "H6" H 9800 5196 50  0000 L CNN
F 1 "MountingHole" H 9800 5105 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9700 5150 50  0001 C CNN
F 3 "~" H 9700 5150 50  0001 C CNN
	1    9700 5150
	1    0    0    -1  
$EndComp
$Comp
L MCU_ST_STM32F3:STM32F303K8Tx U1
U 1 1 5E98BD14
P 3850 5950
F 0 "U1" H 3500 6800 50  0000 C CNN
F 1 "STM32F303K8T6" V 3800 5900 50  0000 C CNN
F 2 "Package_QFP:LQFP-32_7x7mm_P0.8mm" H 3350 5050 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00092070.pdf" H 3850 5950 50  0001 C CNN
	1    3850 5950
	1    0    0    -1  
$EndComp
Text GLabel 4650 6650 2    50   Input ~ 0
SWCLK
Text GLabel 4650 6550 2    50   Input ~ 0
SWDIO
$Comp
L Connector_Generic:Conn_01x06 CN7
U 1 1 5E9A792D
P 7150 2950
F 0 "CN7" H 7070 3367 50  0000 C CNN
F 1 "ST-LINK" H 7070 3276 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 7150 2950 50  0001 C CNN
F 3 "~" H 7150 2950 50  0001 C CNN
	1    7150 2950
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 CN6
U 1 1 5E9A7A8B
P 1100 3600
F 0 "CN6" H 1020 4017 50  0000 C CNN
F 1 "TTL-232R-3V3" H 1020 3926 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 1100 3600 50  0001 C CNN
F 3 "~" H 1100 3600 50  0001 C CNN
	1    1100 3600
	-1   0    0    -1  
$EndComp
Text GLabel 7650 2750 2    50   Input ~ 0
3V3
Text GLabel 7650 2850 2    50   Input ~ 0
SWCLK
Text GLabel 7650 2950 2    50   Input ~ 0
GND
Text GLabel 7650 3050 2    50   Input ~ 0
SWDIO
Text GLabel 7650 3150 2    50   Input ~ 0
NRST
Text GLabel 7650 3250 2    50   Input ~ 0
SWO
Wire Wire Line
	7350 2750 7650 2750
Wire Wire Line
	7650 2850 7350 2850
Wire Wire Line
	7350 2950 7650 2950
Wire Wire Line
	7650 3050 7350 3050
Wire Wire Line
	7350 3150 7650 3150
Wire Wire Line
	7650 3250 7350 3250
Text GLabel 1400 3400 2    50   Input ~ 0
GND
Text GLabel 1400 3700 2    50   Input ~ 0
TXD
Text GLabel 1400 3800 2    50   Input ~ 0
RXD
Wire Wire Line
	1300 3400 1400 3400
Wire Wire Line
	1400 3700 1300 3700
Wire Wire Line
	1300 3800 1400 3800
$Comp
L Device:Crystal Y1
U 1 1 5E9A9E73
P 2650 5900
F 0 "Y1" V 2604 6031 50  0000 L CNN
F 1 "8MHz" V 2695 6031 50  0000 L CNN
F 2 "Crystal:Crystal_HC49-4H_Vertical" H 2650 5900 50  0001 C CNN
F 3 "~" H 2650 5900 50  0001 C CNN
	1    2650 5900
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5E9AA02E
P 5200 5300
F 0 "R3" V 5100 5300 50  0000 C CNN
F 1 "10k" V 5200 5300 50  0000 C CNN
F 2 "extsui:C_1608_HandSolderingCustom" V 5130 5300 50  0001 C CNN
F 3 "~" H 5200 5300 50  0001 C CNN
	1    5200 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5E9AA0AB
P 5400 5300
F 0 "R4" V 5300 5300 50  0000 C CNN
F 1 "10k" V 5400 5300 50  0000 C CNN
F 2 "extsui:C_1608_HandSolderingCustom" V 5330 5300 50  0001 C CNN
F 3 "~" H 5400 5300 50  0001 C CNN
	1    5400 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 5E9AA11C
P 5400 6400
F 0 "D3" H 5391 6616 50  0000 C CNN
F 1 "LED" H 5391 6525 50  0000 C CNN
F 2 "extsui:LED_1608_HandSolderingCustom" H 5400 6400 50  0001 C CNN
F 3 "~" H 5400 6400 50  0001 C CNN
	1    5400 6400
	0    -1   -1   0   
$EndComp
$Comp
L Regulator_Linear:LF33_TO252 U2
U 1 1 5E9AB172
P 5150 3100
F 0 "U2" H 5150 3342 50  0000 C CNN
F 1 "NJM2845DL1-33" H 5150 3251 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 5150 3325 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/c4/0e/7e/2a/be/bc/4c/bd/CD00000546.pdf/files/CD00000546.pdf/jcr:content/translations/en.CD00000546.pdf" H 5150 3050 50  0001 C CNN
	1    5150 3100
	1    0    0    -1  
$EndComp
Text GLabel 5800 3100 2    50   Input ~ 0
3V3
$Comp
L power:GND #PWR0101
U 1 1 5E9AD322
P 5150 3600
F 0 "#PWR0101" H 5150 3350 50  0001 C CNN
F 1 "GND" H 5155 3427 50  0000 C CNN
F 2 "" H 5150 3600 50  0001 C CNN
F 3 "" H 5150 3600 50  0001 C CNN
	1    5150 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 3600 5150 3400
$Comp
L power:GND #PWR0102
U 1 1 5E9B14FF
P 4700 3600
F 0 "#PWR0102" H 4700 3350 50  0001 C CNN
F 1 "GND" H 4705 3427 50  0000 C CNN
F 2 "" H 4700 3600 50  0001 C CNN
F 3 "" H 4700 3600 50  0001 C CNN
	1    4700 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5E9B1832
P 5600 3600
F 0 "#PWR0103" H 5600 3350 50  0001 C CNN
F 1 "GND" H 5605 3427 50  0000 C CNN
F 2 "" H 5600 3600 50  0001 C CNN
F 3 "" H 5600 3600 50  0001 C CNN
	1    5600 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 3100 5600 3100
Wire Wire Line
	5600 3300 5600 3100
Connection ~ 5600 3100
Wire Wire Line
	4700 3300 4700 3100
Connection ~ 4700 3100
Wire Wire Line
	4700 3100 4850 3100
$Comp
L Device:R R1
U 1 1 5E9B4F2D
P 1650 5800
F 0 "R1" V 1550 5750 50  0000 L CNN
F 1 "10k" V 1650 5725 50  0000 L CNN
F 2 "extsui:C_1608_HandSolderingCustom" V 1580 5800 50  0001 C CNN
F 3 "~" H 1650 5800 50  0001 C CNN
	1    1650 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5E9B88C8
P 1650 6050
F 0 "#PWR0104" H 1650 5800 50  0001 C CNN
F 1 "GND" H 1655 5877 50  0000 C CNN
F 2 "" H 1650 6050 50  0001 C CNN
F 3 "" H 1650 6050 50  0001 C CNN
	1    1650 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 6050 1650 5950
Wire Wire Line
	3250 5450 1650 5450
Wire Wire Line
	1650 5450 1650 5650
$Comp
L power:+5V #PWR0106
U 1 1 5E9BA3F4
P 4400 2650
F 0 "#PWR0106" H 4400 2500 50  0001 C CNN
F 1 "+5V" H 4415 2823 50  0000 C CNN
F 2 "" H 4400 2650 50  0001 C CNN
F 3 "" H 4400 2650 50  0001 C CNN
	1    4400 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 5050 3750 4850
Wire Wire Line
	3750 4850 3850 4850
Wire Wire Line
	3950 4850 3950 5050
Wire Wire Line
	3850 5050 3850 4850
Connection ~ 3850 4850
Wire Wire Line
	3850 4850 3950 4850
Wire Wire Line
	3850 4650 3850 4850
$Comp
L Switch:SW_Push SW1
U 1 1 5E9E7CF3
P 2650 5050
F 0 "SW1" H 2700 5350 50  0000 R CNN
F 1 "RESET" H 2750 5250 50  0000 R CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H8mm" H 2650 5250 50  0001 C CNN
F 3 "" H 2650 5250 50  0001 C CNN
	1    2650 5050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 CN2
U 1 1 5E9E8238
P 8450 4050
F 0 "CN2" H 8530 4042 50  0000 L CNN
F 1 "GROVE" H 8530 3951 50  0000 L CNN
F 2 "OPL_Connector:HW4-2.0-90D" H 8450 4050 50  0001 C CNN
F 3 "~" H 8450 4050 50  0001 C CNN
	1    8450 4050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 CN3
U 1 1 5E9E9131
P 8450 4650
F 0 "CN3" H 8530 4642 50  0000 L CNN
F 1 "GROVE" H 8530 4551 50  0000 L CNN
F 2 "OPL_Connector:HW4-2.0-90D" H 8450 4650 50  0001 C CNN
F 3 "~" H 8450 4650 50  0001 C CNN
	1    8450 4650
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 CN4
U 1 1 5E9E9802
P 8450 5250
F 0 "CN4" H 8530 5242 50  0000 L CNN
F 1 "GROVE" H 8530 5151 50  0000 L CNN
F 2 "OPL_Connector:HW4-2.0-90D" H 8450 5250 50  0001 C CNN
F 3 "~" H 8450 5250 50  0001 C CNN
	1    8450 5250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 CN5
U 1 1 5E9E9ED8
P 8450 5850
F 0 "CN5" H 8530 5842 50  0000 L CNN
F 1 "GROVE" H 8530 5751 50  0000 L CNN
F 2 "OPL_Connector:HW4-2.0-90D" H 8450 5850 50  0001 C CNN
F 3 "~" H 8450 5850 50  0001 C CNN
	1    8450 5850
	1    0    0    -1  
$EndComp
Text GLabel 7550 4150 0    50   Input ~ 0
5V
Text GLabel 7550 4250 0    50   Input ~ 0
GND
Text GLabel 2900 6650 0    50   Input ~ 0
UPPER_SCL
Text GLabel 2900 6750 0    50   Input ~ 0
UPPER_SDA
Text GLabel 7550 3950 0    50   Input ~ 0
LOWER_SCL
Text GLabel 7550 4050 0    50   Input ~ 0
LOWER_SDA
Wire Wire Line
	7550 3950 8050 3950
Wire Wire Line
	7550 4050 7950 4050
Wire Wire Line
	7550 4150 7850 4150
Wire Wire Line
	7550 4250 7750 4250
Wire Wire Line
	8050 3950 8050 4550
Wire Wire Line
	8050 4550 8250 4550
Connection ~ 8050 3950
Wire Wire Line
	8050 3950 8250 3950
Wire Wire Line
	8050 4550 8050 5150
Wire Wire Line
	8050 5150 8250 5150
Connection ~ 8050 4550
Wire Wire Line
	8050 5150 8050 5750
Wire Wire Line
	8050 5750 8250 5750
Connection ~ 8050 5150
Wire Wire Line
	7950 4050 7950 4650
Wire Wire Line
	7950 4650 8250 4650
Connection ~ 7950 4050
Wire Wire Line
	7950 4050 8250 4050
Wire Wire Line
	7950 4650 7950 5250
Wire Wire Line
	7950 5250 8250 5250
Connection ~ 7950 4650
Wire Wire Line
	7950 5250 7950 5850
Wire Wire Line
	7950 5850 8250 5850
Connection ~ 7950 5250
Wire Wire Line
	8250 5950 7850 5950
Wire Wire Line
	7850 5950 7850 5350
Connection ~ 7850 4150
Wire Wire Line
	7850 4150 8250 4150
Wire Wire Line
	8250 4750 7850 4750
Connection ~ 7850 4750
Wire Wire Line
	7850 4750 7850 4150
Wire Wire Line
	8250 4850 7750 4850
Wire Wire Line
	7750 4850 7750 4250
Connection ~ 7750 4250
Wire Wire Line
	7750 4250 8250 4250
Wire Wire Line
	7750 4850 7750 5450
Wire Wire Line
	7750 6050 8250 6050
Connection ~ 7750 4850
Wire Wire Line
	8250 5350 7850 5350
Connection ~ 7850 5350
Wire Wire Line
	7850 5350 7850 4750
Wire Wire Line
	7750 5450 8250 5450
Connection ~ 7750 5450
Wire Wire Line
	7750 5450 7750 6050
$Comp
L Connector:Conn_01x02_Male JP1
U 1 1 5EA09134
P 1450 5150
F 0 "JP1" H 1250 5350 50  0000 C CNN
F 1 "JP_BOOT" H 1250 5250 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Horizontal" H 1450 5150 50  0001 C CNN
F 3 "~" H 1450 5150 50  0001 C CNN
	1    1450 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 5250 1650 5450
Connection ~ 1650 5450
Wire Wire Line
	1650 5150 1650 4850
Wire Wire Line
	3750 6950 3750 7050
Wire Wire Line
	3750 7050 3850 7050
Wire Wire Line
	3850 7050 3850 6950
Wire Wire Line
	3750 7050 3750 7150
Connection ~ 3750 7050
$Comp
L power:GND #PWR0108
U 1 1 5EA1545D
P 3750 7150
F 0 "#PWR0108" H 3750 6900 50  0001 C CNN
F 1 "GND" H 3755 6977 50  0000 C CNN
F 2 "" H 3750 7150 50  0001 C CNN
F 3 "" H 3750 7150 50  0001 C CNN
	1    3750 7150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 CN1
U 1 1 5EA2EA80
P 1100 2400
F 0 "CN1" H 1050 2750 50  0000 L CNN
F 1 "GROVE" H 1000 2650 50  0000 L CNN
F 2 "OPL_Connector:HW4-2.0-90D" H 1100 2400 50  0001 C CNN
F 3 "~" H 1100 2400 50  0001 C CNN
	1    1100 2400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1400 2300 1300 2300
Wire Wire Line
	1400 2400 1300 2400
Wire Wire Line
	1400 2600 1300 2600
Text GLabel 1400 2600 2    50   Input ~ 0
GND
Text GLabel 1400 2300 2    50   Input ~ 0
UPPER_SCL
Text GLabel 1400 2400 2    50   Input ~ 0
UPPER_SDA
Text GLabel 5650 5850 2    50   Input ~ 0
LOWER_SCL
Text GLabel 5650 5950 2    50   Input ~ 0
LOWER_SDA
Text GLabel 2950 4850 1    50   Input ~ 0
NRST
Text GLabel 3050 6350 0    50   Input ~ 0
SWO
Wire Wire Line
	4350 6550 4650 6550
Wire Wire Line
	4650 6650 4350 6650
Wire Wire Line
	2900 6650 3250 6650
Wire Wire Line
	3050 6350 3250 6350
Wire Wire Line
	2900 6750 3250 6750
$Comp
L power:GND #PWR0110
U 1 1 5EA76301
P 4550 1700
F 0 "#PWR0110" H 4550 1450 50  0001 C CNN
F 1 "GND" H 4555 1527 50  0000 C CNN
F 2 "" H 4550 1700 50  0001 C CNN
F 3 "" H 4550 1700 50  0001 C CNN
	1    4550 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 5150 2450 5050
Wire Wire Line
	2850 5050 2950 5050
Wire Wire Line
	2950 5050 2950 5250
Wire Wire Line
	2950 5250 3250 5250
Wire Wire Line
	2950 4850 2950 5050
Connection ~ 2950 5050
Wire Wire Line
	2650 5750 3100 5750
Wire Wire Line
	3100 5750 3100 5850
Wire Wire Line
	3100 5850 3250 5850
Wire Wire Line
	3250 5950 3100 5950
Wire Wire Line
	3100 5950 3100 6050
Wire Wire Line
	3100 6050 2650 6050
Wire Wire Line
	2650 6050 2450 6050
Wire Wire Line
	2450 5750 2650 5750
Connection ~ 2650 5750
$Comp
L power:GND #PWR0111
U 1 1 5EAA081C
P 2050 6250
F 0 "#PWR0111" H 2050 6000 50  0001 C CNN
F 1 "GND" H 2055 6077 50  0000 C CNN
F 2 "" H 2050 6250 50  0001 C CNN
F 3 "" H 2050 6250 50  0001 C CNN
	1    2050 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5EAA5F74
P 2350 5750
F 0 "C3" V 2150 5650 50  0000 C CNN
F 1 "22pF" V 2250 5700 50  0000 C CNN
F 2 "extsui:C_1608_HandSolderingCustom" H 2350 5750 50  0001 C CNN
F 3 "~" H 2350 5750 50  0001 C CNN
	1    2350 5750
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5EAA8BC5
P 2350 6050
F 0 "C4" V 2150 5950 50  0000 C CNN
F 1 "22pF" V 2250 6000 50  0000 C CNN
F 2 "extsui:C_1608_HandSolderingCustom" H 2350 6050 50  0001 C CNN
F 3 "~" H 2350 6050 50  0001 C CNN
	1    2350 6050
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 6250 2050 6050
Wire Wire Line
	2050 5750 2250 5750
Wire Wire Line
	2250 6050 2050 6050
Connection ~ 2050 6050
Wire Wire Line
	2050 6050 2050 5750
Connection ~ 2650 6050
$Comp
L Device:C_Small C2
U 1 1 5EAC709A
P 4700 3400
F 0 "C2" H 4800 3450 50  0000 L CNN
F 1 "0.1uF" H 4800 3350 50  0000 L CNN
F 2 "extsui:C_1608_HandSolderingCustom" H 4700 3400 50  0001 C CNN
F 3 "~" H 4700 3400 50  0001 C CNN
	1    4700 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 3600 4700 3500
Wire Wire Line
	5600 3600 5600 3500
Wire Wire Line
	4400 2650 4400 3100
Text GLabel 4650 5450 2    50   Input ~ 0
RXD
Text GLabel 4650 6750 2    50   Input ~ 0
TXD
Wire Wire Line
	4650 5450 4350 5450
Wire Wire Line
	4350 6750 4650 6750
Text Notes 4500 5650 0    50   ~ 0
Cross wiring \n   (UART)
Text Notes 4500 6950 0    50   ~ 0
Cross wiring\n   (UART)
Wire Notes Line
	6950 3750 6950 6250
Wire Notes Line
	6950 6250 9150 6250
Wire Notes Line
	9150 6250 9150 3750
Wire Notes Line
	9150 3750 6950 3750
Text Notes 6950 3700 0    50   ~ 0
GROVE connectors for connecting\n to the surrounding Ground boards.
Wire Notes Line
	9500 3750 9500 5350
Wire Notes Line
	9500 5350 10500 5350
Wire Notes Line
	10500 5350 10500 3750
Wire Notes Line
	10500 3750 9500 3750
Text Notes 9500 3700 0    50   ~ 0
Spacers for Tile board
$Comp
L Device:C_Small C7
U 1 1 5EB6BF5E
P 4550 1400
F 0 "C7" H 4650 1300 50  0000 C CNN
F 1 "0.1u" H 4650 1500 50  0000 C CNN
F 2 "extsui:C_1608_HandSolderingCustom" H 4550 1400 50  0001 C CNN
F 3 "~" H 4550 1400 50  0001 C CNN
	1    4550 1400
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C8
U 1 1 5EB6F20B
P 4850 1400
F 0 "C8" H 4950 1300 50  0000 C CNN
F 1 "0.1u" H 4950 1500 50  0000 C CNN
F 2 "extsui:C_1608_HandSolderingCustom" H 4850 1400 50  0001 C CNN
F 3 "~" H 4850 1400 50  0001 C CNN
	1    4850 1400
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5EB725E6
P 2450 5150
F 0 "#PWR0114" H 2450 4900 50  0001 C CNN
F 1 "GND" H 2455 4977 50  0000 C CNN
F 2 "" H 2450 5150 50  0001 C CNN
F 3 "" H 2450 5150 50  0001 C CNN
	1    2450 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NO_Small JP2
U 1 1 5EBD7372
P 5200 5550
F 0 "JP2" V 5200 5598 50  0000 L CNN
F 1 "Jumper_NO_Small" V 5245 5598 50  0001 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 5200 5550 50  0001 C CNN
F 3 "~" H 5200 5550 50  0001 C CNN
	1    5200 5550
	0    1    1    0   
$EndComp
$Comp
L Device:Jumper_NO_Small JP3
U 1 1 5EBDA269
P 5400 5550
F 0 "JP3" V 5400 5598 50  0000 L CNN
F 1 "Jumper_NO_Small" V 5445 5598 50  0001 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 5400 5550 50  0001 C CNN
F 3 "~" H 5400 5550 50  0001 C CNN
	1    5400 5550
	0    1    1    0   
$EndComp
Wire Wire Line
	5200 4950 5200 5050
Wire Wire Line
	5200 5050 5400 5050
Wire Wire Line
	5400 5050 5400 5150
Connection ~ 5200 5050
Wire Wire Line
	5200 5050 5200 5150
Wire Wire Line
	5400 6550 5400 6750
$Comp
L power:GND #PWR0116
U 1 1 5EC36494
P 5400 6750
F 0 "#PWR0116" H 5400 6500 50  0001 C CNN
F 1 "GND" H 5405 6577 50  0000 C CNN
F 2 "" H 5400 6750 50  0001 C CNN
F 3 "" H 5400 6750 50  0001 C CNN
	1    5400 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 1300 4250 1200
Wire Wire Line
	4250 1200 4550 1200
Wire Wire Line
	4850 1200 4850 1300
Wire Wire Line
	4550 1300 4550 1200
Wire Wire Line
	4250 1500 4250 1600
Wire Wire Line
	4250 1600 4550 1600
Wire Wire Line
	4850 1600 4850 1500
Wire Wire Line
	4550 1500 4550 1600
Connection ~ 4550 1200
Wire Wire Line
	4550 1200 4850 1200
Wire Wire Line
	4550 1200 4550 1100
Connection ~ 4550 1600
Wire Wire Line
	4550 1600 4850 1600
Wire Wire Line
	4550 1600 4550 1700
Wire Notes Line
	800  2800 800  1950
Wire Notes Line
	800  1950 2200 1950
Wire Notes Line
	2200 1950 2200 2800
Wire Notes Line
	2200 2800 800  2800
Text Notes 800  1900 0    50   ~ 0
Main Power Supply (M5Stack I2C)
Wire Notes Line
	3700 800  5350 800 
Wire Notes Line
	5350 800  5350 2000
Wire Notes Line
	5350 2000 3700 2000
Wire Notes Line
	3700 2000 3700 800 
Text Notes 3700 750  0    50   ~ 0
Put CAPs near to VDD (PIN #1, #17) \n and AVDD (pin #5) .
Wire Notes Line
	3700 2350 6650 2350
Wire Notes Line
	6650 2350 6650 4100
Wire Notes Line
	6650 4100 3700 4100
Wire Notes Line
	3700 4100 3700 2350
Text Notes 3700 2300 0    50   ~ 0
Power Supply for 3.3V
Wire Notes Line
	8050 2400 8050 3450
Wire Notes Line
	8050 3450 6950 3450
Wire Notes Line
	6950 3450 6950 2400
Wire Notes Line
	6950 2400 8050 2400
Text Notes 6950 2350 0    50   ~ 0
Debbuger
Text Notes 800  3000 0    50   ~ 0
Sub Power Supply (Debug-UART)
Wire Notes Line
	800  3050 800  4100
Wire Notes Line
	800  4100 2200 4100
Wire Notes Line
	2200 4100 2200 3050
Wire Notes Line
	2200 3050 800  3050
$Comp
L Switch:SW_Push SW2
U 1 1 5EA4D072
P 5700 6450
F 0 "SW2" V 5650 6750 50  0000 R CNN
F 1 "MODE" V 5750 6800 50  0000 R CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H8mm" H 5700 6650 50  0001 C CNN
F 3 "" H 5700 6650 50  0001 C CNN
	1    5700 6450
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 5850 5200 5850
Wire Wire Line
	5650 5950 5400 5950
Wire Wire Line
	5200 5650 5200 5850
Connection ~ 5200 5850
Wire Wire Line
	5200 5850 5650 5850
Wire Wire Line
	5400 5650 5400 5950
Connection ~ 5400 5950
Wire Wire Line
	5400 5950 4350 5950
NoConn ~ 10000 2800
$Comp
L Connector:Conn_01x05_Female CN9
U 1 1 5EA9F51E
P 9900 3000
F 0 "CN9" V 10000 2950 50  0000 L CNN
F 1 "CardEdgeConnector5P" V 10100 2550 50  0000 L CNN
F 2 "extsui:CONN_CARD_EDGE_395-010-521-201" H 9900 3000 50  0001 C CNN
F 3 "~" H 9900 3000 50  0001 C CNN
	1    9900 3000
	0    -1   1    0   
$EndComp
Wire Wire Line
	9150 2350 10100 2350
Wire Wire Line
	10100 2350 10100 2800
Connection ~ 9150 2350
Wire Wire Line
	9150 2350 9150 2800
Wire Wire Line
	8950 2450 9900 2450
Wire Wire Line
	9900 2450 9900 2800
Connection ~ 8950 2450
Wire Wire Line
	8950 2450 8950 2800
Wire Wire Line
	8850 2550 9800 2550
Wire Wire Line
	9800 2550 9800 2800
Connection ~ 8850 2550
Wire Wire Line
	8850 2550 8850 2800
Wire Wire Line
	9700 2800 9700 2650
Wire Wire Line
	9700 2650 8750 2650
Connection ~ 8750 2650
Wire Wire Line
	8750 2650 8750 2800
Wire Notes Line
	8500 3450 10500 3450
Wire Notes Line
	10500 3450 10500 1650
Text Notes 8700 3350 0    50   ~ 0
To Tile board
Text Notes 9550 3350 0    50   ~ 0
To inserted board
Text Notes 800  4300 0    50   ~ 0
STM32F303K8T6
Wire Notes Line
	800  4350 800  7500
Wire Notes Line
	800  7500 6650 7500
Wire Notes Line
	6650 7500 6650 4350
Wire Notes Line
	6650 4350 800  4350
NoConn ~ 3250 6150
NoConn ~ 3250 6250
NoConn ~ 3250 6450
NoConn ~ 3250 6550
NoConn ~ 4350 6450
NoConn ~ 4350 6350
NoConn ~ 4350 6250
NoConn ~ 4350 5750
NoConn ~ 4350 5650
NoConn ~ 4350 5550
NoConn ~ 4350 5350
NoConn ~ 4350 5250
Wire Wire Line
	5700 6650 5700 6750
$Comp
L power:GND #PWR0117
U 1 1 5EC27331
P 5700 6750
F 0 "#PWR0117" H 5700 6500 50  0001 C CNN
F 1 "GND" H 5705 6577 50  0000 C CNN
F 2 "" H 5700 6750 50  0001 C CNN
F 3 "" H 5700 6750 50  0001 C CNN
	1    5700 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5EC338C8
P 4700 6150
F 0 "R2" V 4600 6100 50  0000 L CNN
F 1 "10k" V 4700 6075 50  0000 L CNN
F 2 "extsui:C_1608_HandSolderingCustom" V 4630 6150 50  0001 C CNN
F 3 "~" H 4700 6150 50  0001 C CNN
	1    4700 6150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4350 6150 4550 6150
Wire Wire Line
	4850 6150 5400 6150
Wire Wire Line
	4350 6050 5700 6050
Wire Wire Line
	5700 6050 5700 6250
Wire Wire Line
	5400 6250 5400 6150
$Comp
L Device:CP_Small C1
U 1 1 5ED47556
P 4400 3400
F 0 "C1" H 4488 3446 50  0000 L CNN
F 1 "47uF" H 4488 3355 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 4400 3400 50  0001 C CNN
F 3 "~" H 4400 3400 50  0001 C CNN
	1    4400 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3600 4400 3500
$Comp
L power:GND #PWR0118
U 1 1 5ED54257
P 4400 3600
F 0 "#PWR0118" H 4400 3350 50  0001 C CNN
F 1 "GND" H 4405 3427 50  0000 C CNN
F 2 "" H 4400 3600 50  0001 C CNN
F 3 "" H 4400 3600 50  0001 C CNN
	1    4400 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3300 4400 3100
Connection ~ 4400 3100
Wire Wire Line
	4400 3100 4700 3100
$Comp
L Device:D_Schottky D2
U 1 1 5EDA4386
P 5150 2700
F 0 "D2" H 5150 2916 50  0000 C CNN
F 1 "SS2040FL" H 5150 2825 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 5150 2700 50  0001 C CNN
F 3 "~" H 5150 2700 50  0001 C CNN
	1    5150 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 2700 5600 2700
Wire Wire Line
	5600 2700 5600 3100
Wire Wire Line
	5000 2700 4700 2700
Wire Wire Line
	4700 2700 4700 3100
$Comp
L Device:C_Small C5
U 1 1 5EE6AF35
P 5600 3400
F 0 "C5" H 5700 3450 50  0000 L CNN
F 1 "10uF" H 5700 3350 50  0000 L CNN
F 2 "extsui:C_1608_HandSolderingCustom" H 5600 3400 50  0001 C CNN
F 3 "~" H 5600 3400 50  0001 C CNN
	1    5600 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D1
U 1 1 5EA098BC
P 2900 3350
F 0 "D1" V 2850 3450 50  0000 L CNN
F 1 "SS2040FL" V 2950 3450 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123F" H 2900 3350 50  0001 C CNN
F 3 "~" H 2900 3350 50  0001 C CNN
	1    2900 3350
	0    1    1    0   
$EndComp
Text Notes 1800 7100 0    50   ~ 0
The upper I2C is supposed to be M5Stack,\n  so pull-up resistor is not prepared.
Wire Notes Line
	3100 6500 2250 6500
Wire Notes Line
	2250 6500 2250 6900
Wire Notes Line
	2250 6900 3100 6900
Wire Notes Line
	3100 6500 3100 6900
Wire Wire Line
	1300 3600 2900 3600
Wire Wire Line
	2900 2500 2900 3100
Wire Wire Line
	2900 3100 4100 3100
Wire Wire Line
	1300 2500 2900 2500
Wire Wire Line
	2900 3100 2900 3200
Connection ~ 2900 3100
Wire Wire Line
	2900 3500 2900 3600
Wire Wire Line
	4100 2950 4100 3100
Connection ~ 4100 3100
Wire Wire Line
	4100 3100 4400 3100
Text GLabel 4100 2950 1    50   Input ~ 0
5V
Text Notes 2800 3850 0    50   ~ 0
For USB protection
Wire Notes Line
	3100 3450 3100 3750
NoConn ~ 1300 3500
NoConn ~ 1300 3900
Text GLabel 5200 4950 1    50   Input ~ 0
3V3
Text GLabel 3850 4650 1    50   Input ~ 0
3V3
Text GLabel 1650 4850 1    50   Input ~ 0
3V3
Text GLabel 4550 1100 1    50   Input ~ 0
3V3
Wire Wire Line
	5600 3100 5800 3100
$EndSCHEMATC
