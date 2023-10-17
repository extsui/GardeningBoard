EESchema Schematic File Version 4
LIBS:Fountain-cache
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
P 2150 1100
F 0 "#PWR02" H 2150 850 50  0001 C CNN
F 1 "GND" H 2155 927 50  0000 C CNN
F 2 "" H 2150 1100 50  0001 C CNN
F 3 "" H 2150 1100 50  0001 C CNN
	1    2150 1100
	1    0    0    -1  
$EndComp
Wire Notes Line
	2400 1400 2400 800 
Wire Notes Line
	2400 800  800  800 
Wire Notes Line
	800  800  800  1400
Wire Notes Line
	800  1400 2400 1400
Text Notes 850  750  0    50   ~ 0
Power Flag
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
P 2150 1100
F 0 "#FLG02" H 2150 1175 50  0001 C CNN
F 1 "PWR_FLAG" H 2150 1300 50  0000 C CNN
F 2 "" H 2150 1100 50  0001 C CNN
F 3 "~" H 2150 1100 50  0001 C CNN
	1    2150 1100
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 5E8E347E
P 9700 4200
F 0 "H1" H 9800 4246 50  0000 L CNN
F 1 "MountingHole" H 9800 4155 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9700 4200 50  0001 C CNN
F 3 "~" H 9700 4200 50  0001 C CNN
	1    9700 4200
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5E8E3566
P 9700 4450
F 0 "H2" H 9800 4496 50  0000 L CNN
F 1 "MountingHole" H 9800 4405 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9700 4450 50  0001 C CNN
F 3 "~" H 9700 4450 50  0001 C CNN
	1    9700 4450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5E8E35F4
P 9700 4700
F 0 "H3" H 9800 4746 50  0000 L CNN
F 1 "MountingHole" H 9800 4655 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9700 4700 50  0001 C CNN
F 3 "~" H 9700 4700 50  0001 C CNN
	1    9700 4700
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5E8E3892
P 9700 4950
F 0 "H4" H 9800 4996 50  0000 L CNN
F 1 "MountingHole" H 9800 4905 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9700 4950 50  0001 C CNN
F 3 "~" H 9700 4950 50  0001 C CNN
	1    9700 4950
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H5
U 1 1 5E8E3899
P 9700 5200
F 0 "H5" H 9800 5246 50  0000 L CNN
F 1 "MountingHole" H 9800 5155 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9700 5200 50  0001 C CNN
F 3 "~" H 9700 5200 50  0001 C CNN
	1    9700 5200
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H6
U 1 1 5E8E38A0
P 9700 5450
F 0 "H6" H 9800 5496 50  0000 L CNN
F 1 "MountingHole" H 9800 5405 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9700 5450 50  0001 C CNN
F 3 "~" H 9700 5450 50  0001 C CNN
	1    9700 5450
	1    0    0    -1  
$EndComp
Wire Notes Line
	9500 4050 9500 5650
Wire Notes Line
	9500 5650 10500 5650
Wire Notes Line
	10500 5650 10500 4050
Wire Notes Line
	10500 4050 9500 4050
Text Notes 9500 4000 0    50   ~ 0
Spacers for Tile board
$Comp
L Connector_Generic:Conn_01x04 CN3
U 1 1 61333D2B
P 2700 4750
F 0 "CN3" H 2650 5100 50  0000 L CNN
F 1 "GROVE_IIC_5V" H 2600 5000 50  0000 L CNN
F 2 "OPL_Connector:HW4-2.0-90D" H 2700 4750 50  0001 C CNN
F 3 "~" H 2700 4750 50  0001 C CNN
	1    2700 4750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3000 4650 2900 4650
Wire Wire Line
	3000 4750 2900 4750
Wire Wire Line
	3100 4950 2900 4950
Text GLabel 3000 4650 2    50   Input ~ 0
SCL_5V
Text GLabel 3000 4750 2    50   Input ~ 0
SDA_5V
Wire Wire Line
	2900 4850 3000 4850
Text GLabel 3000 4850 2    50   Input ~ 0
5V
$Comp
L Connector_Generic:Conn_01x04 CN4
U 1 1 6135A67F
P 2700 5700
F 0 "CN4" H 2650 6050 50  0000 L CNN
F 1 "GROVE_IIC_5V" H 2600 5950 50  0000 L CNN
F 2 "OPL_Connector:HW4-2.0-90D" H 2700 5700 50  0001 C CNN
F 3 "~" H 2700 5700 50  0001 C CNN
	1    2700 5700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3000 5600 2900 5600
Wire Wire Line
	3000 5700 2900 5700
Text GLabel 3000 5600 2    50   Input ~ 0
SCL_5V
Text GLabel 3000 5700 2    50   Input ~ 0
SDA_5V
Wire Wire Line
	2900 5800 3000 5800
Text GLabel 3000 5800 2    50   Input ~ 0
5V
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 6143FFBC
P 1600 1100
F 0 "#FLG0101" H 1600 1175 50  0001 C CNN
F 1 "PWR_FLAG" H 1600 1300 50  0000 C CNN
F 2 "" H 1600 1100 50  0001 C CNN
F 3 "~" H 1600 1100 50  0001 C CNN
	1    1600 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0101
U 1 1 61447C64
P 1600 1100
F 0 "#PWR0101" H 1600 950 50  0001 C CNN
F 1 "+3V3" H 1615 1273 50  0000 C CNN
F 2 "" H 1600 1100 50  0001 C CNN
F 3 "" H 1600 1100 50  0001 C CNN
	1    1600 1100
	-1   0    0    1   
$EndComp
$Comp
L power:+3V3 #PWR0107
U 1 1 6178EF60
P 1250 1950
F 0 "#PWR0107" H 1250 1800 50  0001 C CNN
F 1 "+3V3" H 1265 2123 50  0000 C CNN
F 2 "" H 1250 1950 50  0001 C CNN
F 3 "" H 1250 1950 50  0001 C CNN
	1    1250 1950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0108
U 1 1 617948E9
P 950 1950
F 0 "#PWR0108" H 950 1800 50  0001 C CNN
F 1 "+5V" H 965 2123 50  0000 C CNN
F 2 "" H 950 1950 50  0001 C CNN
F 3 "" H 950 1950 50  0001 C CNN
	1    950  1950
	1    0    0    -1  
$EndComp
Text GLabel 1250 2100 3    50   Input ~ 0
3V3
Text GLabel 950  2100 3    50   Input ~ 0
5V
Wire Wire Line
	950  2100 950  1950
Wire Wire Line
	1250 1950 1250 2100
$Comp
L power:GND #PWR0109
U 1 1 618F6855
P 3100 4950
F 0 "#PWR0109" H 3100 4700 50  0001 C CNN
F 1 "GND" H 3105 4777 50  0000 C CNN
F 2 "" H 3100 4950 50  0001 C CNN
F 3 "" H 3100 4950 50  0001 C CNN
	1    3100 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 61908E86
P 3100 5900
F 0 "#PWR0110" H 3100 5650 50  0001 C CNN
F 1 "GND" H 3105 5727 50  0000 C CNN
F 2 "" H 3100 5900 50  0001 C CNN
F 3 "" H 3100 5900 50  0001 C CNN
	1    3100 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 5900 3100 5900
Wire Wire Line
	6200 2600 6100 2600
$Comp
L power:GND #PWR0102
U 1 1 65281EC6
P 7000 2700
F 0 "#PWR0102" H 7000 2450 50  0001 C CNN
F 1 "GND" H 7005 2527 50  0000 C CNN
F 2 "" H 7000 2700 50  0001 C CNN
F 3 "" H 7000 2700 50  0001 C CNN
	1    7000 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 2700 7000 2700
Wire Wire Line
	6100 3200 6200 3200
Text GLabel 6200 2350 1    50   Input ~ 0
5V
Wire Wire Line
	6100 2900 6200 2900
Wire Wire Line
	6200 2350 6200 2600
Text GLabel 4150 2700 0    50   Input ~ 0
RV2
Text GLabel 4150 2600 0    50   Input ~ 0
RV1
Wire Wire Line
	4150 2600 4300 2600
Wire Wire Line
	4150 2700 4300 2700
$Comp
L Device:R_POT_Dual VOL1
U 1 1 6528578F
P 4400 5650
F 0 "VOL1" H 4150 6050 50  0000 C CNN
F 1 "(TBD)" H 4150 5950 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Alps_RK097_Dual_Horizontal" H 4650 5575 50  0001 C CNN
F 3 "~" H 4650 5575 50  0001 C CNN
	1    4400 5650
	1    0    0    -1  
$EndComp
NoConn ~ 4000 5750
NoConn ~ 4300 5750
NoConn ~ 4150 5550
Wire Wire Line
	4850 5450 4850 5750
Text GLabel 4850 5450 1    50   Input ~ 0
3V3
Wire Wire Line
	4850 5750 4800 5750
$Comp
L power:GND #PWR0103
U 1 1 6528D26E
P 4450 5800
F 0 "#PWR0103" H 4450 5550 50  0001 C CNN
F 1 "GND" H 4455 5627 50  0000 C CNN
F 2 "" H 4450 5800 50  0001 C CNN
F 3 "" H 4450 5800 50  0001 C CNN
	1    4450 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 5800 4450 5750
Wire Wire Line
	4450 5750 4500 5750
$Comp
L Device:R_POT_Dual VOL2
U 1 1 6528F329
P 5600 5650
F 0 "VOL2" H 5350 6050 50  0000 C CNN
F 1 "(TBD)" H 5350 5950 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Alps_RK097_Dual_Horizontal" H 5850 5575 50  0001 C CNN
F 3 "~" H 5850 5575 50  0001 C CNN
	1    5600 5650
	1    0    0    -1  
$EndComp
NoConn ~ 5200 5750
NoConn ~ 5500 5750
NoConn ~ 5350 5550
Wire Wire Line
	6050 5450 6050 5750
Text GLabel 6050 5450 1    50   Input ~ 0
3V3
Wire Wire Line
	6050 5750 6000 5750
$Comp
L power:GND #PWR0104
U 1 1 6528F336
P 5650 5800
F 0 "#PWR0104" H 5650 5550 50  0001 C CNN
F 1 "GND" H 5655 5627 50  0000 C CNN
F 2 "" H 5650 5800 50  0001 C CNN
F 3 "" H 5650 5800 50  0001 C CNN
	1    5650 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 5800 5650 5750
Wire Wire Line
	5650 5750 5700 5750
$Comp
L extsui:XIAO-ESP32-C3 IC1
U 1 1 65281C94
P 5200 2900
F 0 "IC1" H 5200 3465 50  0000 C CNN
F 1 "XIAO-ESP32-C3" H 5200 3374 50  0000 C CNN
F 2 "extsui:SeeeduinoXIAO" H 5200 3400 50  0001 C CNN
F 3 "" H 5200 3400 50  0001 C CNN
	1    5200 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:Buzzer BZ1
U 1 1 65296ED3
P 3700 3550
F 0 "BZ1" H 3706 3840 50  0000 C CNN
F 1 "Buzzer" H 3706 3749 50  0000 C CNN
F 2 "Buzzer_Beeper:Buzzer_TDK_PS1240P02BT_D12.2mm_H6.5mm" V 3675 3650 50  0001 C CNN
F 3 "~" V 3675 3650 50  0001 C CNN
	1    3700 3550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3800 3450 3900 3450
$Comp
L power:GND #PWR0105
U 1 1 652A41AE
P 3800 3650
F 0 "#PWR0105" H 3800 3400 50  0001 C CNN
F 1 "GND" H 3805 3477 50  0000 C CNN
F 2 "" H 3800 3650 50  0001 C CNN
F 3 "" H 3800 3650 50  0001 C CNN
	1    3800 3650
	1    0    0    -1  
$EndComp
$Comp
L extsui:AE-PCA9306 IC2
U 1 1 652A9266
P 5200 4350
F 0 "IC2" H 5200 4765 50  0000 C CNN
F 1 "AE-PCA9306" H 5200 4674 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 5150 4300 50  0001 C CNN
F 3 "" H 5150 4300 50  0001 C CNN
	1    5200 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R2
U 1 1 652A93D1
P 4000 3450
F 0 "R2" V 3804 3450 50  0000 C CNN
F 1 "1k" V 3895 3450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 4000 3450 50  0001 C CNN
F 3 "~" H 4000 3450 50  0001 C CNN
	1    4000 3450
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1
U 1 1 652AB595
P 6550 2550
F 0 "R1" V 6354 2550 50  0000 C CNN
F 1 "10k" V 6445 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 6550 2550 50  0001 C CNN
F 3 "~" H 6550 2550 50  0001 C CNN
	1    6550 2550
	0    1    1    0   
$EndComp
Text GLabel 5850 4200 2    50   Input ~ 0
5V
Wire Wire Line
	5850 4200 5700 4200
Wire Wire Line
	4700 4200 4550 4200
Wire Wire Line
	5700 4500 5800 4500
$Comp
L power:GND #PWR0106
U 1 1 652B2B11
P 5800 4500
F 0 "#PWR0106" H 5800 4250 50  0001 C CNN
F 1 "GND" H 5805 4327 50  0000 C CNN
F 2 "" H 5800 4500 50  0001 C CNN
F 3 "" H 5800 4500 50  0001 C CNN
	1    5800 4500
	1    0    0    -1  
$EndComp
Text GLabel 4550 4200 0    50   Input ~ 0
3V3
Text GLabel 4550 4300 0    50   Input ~ 0
SCL_3V3
Text GLabel 4550 4400 0    50   Input ~ 0
SDA_3V3
NoConn ~ 4700 4500
Wire Wire Line
	4550 4300 4700 4300
Wire Wire Line
	4550 4400 4700 4400
Text GLabel 5850 4300 2    50   Input ~ 0
SCL_5V
Text GLabel 5850 4400 2    50   Input ~ 0
SDA_5V
Wire Wire Line
	5700 4300 5850 4300
Wire Wire Line
	5700 4400 5850 4400
Text GLabel 6200 3200 2    50   Input ~ 0
SCL_3V3
Text GLabel 6200 2900 2    50   Input ~ 0
SDA_3V3
$Comp
L power:GND #PWR0111
U 1 1 652E1DA9
P 7250 3700
F 0 "#PWR0111" H 7250 3450 50  0001 C CNN
F 1 "GND" H 7255 3527 50  0000 C CNN
F 2 "" H 7250 3700 50  0001 C CNN
F 3 "" H 7250 3700 50  0001 C CNN
	1    7250 3700
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 652E1DAF
P 6750 3500
F 0 "SW1" V 6700 3750 50  0000 C CNN
F 1 "(TBD)" V 6800 3750 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H8.5mm" H 6750 3700 50  0001 C CNN
F 3 "" H 6750 3700 50  0001 C CNN
	1    6750 3500
	0    -1   1    0   
$EndComp
Wire Wire Line
	6100 2800 6350 2800
Wire Wire Line
	6350 2400 6350 2550
Text GLabel 6350 2400 1    50   Input ~ 0
3V3
Wire Wire Line
	6450 2550 6350 2550
Connection ~ 6350 2550
Wire Wire Line
	6350 2550 6350 2800
Wire Wire Line
	6650 2550 6750 2550
Wire Wire Line
	6750 2550 6750 3100
Wire Wire Line
	6100 3100 6750 3100
Wire Wire Line
	6750 3100 6750 3300
Connection ~ 6750 3100
$Comp
L Connector:Conn_01x05_Female CN1
U 1 1 6530C310
P 6950 5550
F 0 "CN1" V 7050 5600 50  0000 R CNN
F 1 "Conn_01x05_Female" V 7150 5900 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 6950 5550 50  0001 C CNN
F 3 "~" H 6950 5550 50  0001 C CNN
	1    6950 5550
	0    -1   1    0   
$EndComp
$Comp
L Connector:Conn_01x05_Female CN2
U 1 1 6530DA1A
P 8000 5550
F 0 "CN2" V 8100 5600 50  0000 R CNN
F 1 "CardEdgeConnector5P" V 8200 5950 50  0000 R CNN
F 2 "extsui:CONN_CARD_EDGE_395-010-521-201" H 8000 5550 50  0001 C CNN
F 3 "~" H 8000 5550 50  0001 C CNN
	1    8000 5550
	0    -1   1    0   
$EndComp
Wire Wire Line
	6750 5350 6750 5200
Wire Wire Line
	6850 4800 6850 5100
Wire Wire Line
	6950 5350 6950 5000
Wire Wire Line
	6750 5200 7800 5200
Wire Wire Line
	7800 5200 7800 5350
Connection ~ 6750 5200
Wire Wire Line
	6750 5200 6750 4800
Wire Wire Line
	6850 5100 7900 5100
Wire Wire Line
	7900 5100 7900 5350
Connection ~ 6850 5100
Wire Wire Line
	6850 5100 6850 5350
Wire Wire Line
	6950 5000 8000 5000
Wire Wire Line
	8000 5000 8000 5350
Connection ~ 6950 5000
Wire Wire Line
	6950 5000 6950 4800
Wire Wire Line
	8200 5350 8200 4900
Wire Wire Line
	8200 4900 7150 4900
NoConn ~ 8100 5350
NoConn ~ 7050 5350
$Comp
L power:GND #PWR0112
U 1 1 65320A7F
P 7350 4550
F 0 "#PWR0112" H 7350 4300 50  0001 C CNN
F 1 "GND" H 7355 4377 50  0000 C CNN
F 2 "" H 7350 4550 50  0001 C CNN
F 3 "" H 7350 4550 50  0001 C CNN
	1    7350 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 4550 7350 4550
Text GLabel 6750 4800 1    50   Input ~ 0
5V
Text GLabel 6950 4800 1    50   Input ~ 0
SCL_5V
Text GLabel 6850 4800 1    50   Input ~ 0
SDA_5V
Text Notes 7650 5900 0    50   ~ 0
To Building board
Text Notes 6700 5900 0    50   ~ 0
To Tile board
Text GLabel 4650 5450 1    50   Input ~ 0
RV1
Text GLabel 5850 5450 1    50   Input ~ 0
RV2
Wire Wire Line
	5850 5450 5850 5550
Wire Wire Line
	4650 5550 4650 5450
Wire Wire Line
	6100 3000 7250 3000
$Comp
L Switch:SW_Push SW2
U 1 1 6534B768
P 7250 3500
F 0 "SW2" V 7200 3750 50  0000 C CNN
F 1 "(TBD)" V 7300 3750 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H8.5mm" H 7250 3700 50  0001 C CNN
F 3 "" H 7250 3700 50  0001 C CNN
	1    7250 3500
	0    -1   1    0   
$EndComp
Wire Wire Line
	7250 3000 7250 3300
$Comp
L power:GND #PWR0113
U 1 1 65352D3C
P 6750 3700
F 0 "#PWR0113" H 6750 3450 50  0001 C CNN
F 1 "GND" H 6755 3527 50  0000 C CNN
F 2 "" H 6750 3700 50  0001 C CNN
F 3 "" H 6750 3700 50  0001 C CNN
	1    6750 3700
	1    0    0    -1  
$EndComp
$Comp
L extsui:DIPSW-4P SW3
U 1 1 6535A61C
P 3000 3550
F 0 "SW3" V 3050 4100 50  0000 R CNN
F 1 "DIPSW-4P" V 2950 4250 50  0000 R CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx04_Slide_9.78x12.34mm_W7.62mm_P2.54mm" H 3000 3900 60  0001 C CNN
F 3 "" H 3000 3900 60  0000 C CNN
	1    3000 3550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2850 3100 2850 2800
Wire Wire Line
	2850 2800 4300 2800
Wire Wire Line
	4300 2900 2950 2900
Wire Wire Line
	2950 2900 2950 3100
Wire Wire Line
	3050 3100 3050 3000
Wire Wire Line
	3050 3000 4300 3000
Wire Wire Line
	4300 3100 3150 3100
$Comp
L power:GND #PWR0114
U 1 1 6536CC6D
P 3250 4050
F 0 "#PWR0114" H 3250 3800 50  0001 C CNN
F 1 "GND" H 3255 3877 50  0000 C CNN
F 2 "" H 3250 4050 50  0001 C CNN
F 3 "" H 3250 4050 50  0001 C CNN
	1    3250 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 4000 3050 4000
Connection ~ 2950 4000
Wire Wire Line
	2950 4000 2850 4000
Connection ~ 3050 4000
Wire Wire Line
	3050 4000 2950 4000
Wire Wire Line
	3150 4000 3250 4000
Connection ~ 3150 4000
Wire Wire Line
	3250 4000 3250 4050
Wire Wire Line
	4150 3450 4100 3450
Wire Wire Line
	4150 3200 4300 3200
Wire Wire Line
	4150 3200 4150 3450
Connection ~ 7150 4900
Wire Wire Line
	7150 4900 7150 4550
Wire Wire Line
	7150 5350 7150 4900
Text Notes 3750 2050 0    50   ~ 0
XIAO-ESP32-C3 Notes:\n* The D6 pin becomes a UART output at startup, so it should be used as an output.\n* The D8 pin must be pulled up because it must be HIGH during download boot.\n* The D9 pin is also used as the BOOT switch, so it should be used as an input only.
Text Notes 1850 2650 0    50   ~ 0
It is possible that you will use it for purposes\nsuch as JTAG without implementing DIPSW-4P.
Wire Notes Line
	2050 2750 2050 3500
Wire Notes Line
	2050 3500 2350 3500
Wire Notes Line
	4050 2100 4050 2400
Wire Notes Line
	4050 2400 4300 2400
Text Notes 4700 4850 0    50   ~ 0
AE-PCA9306 has pull-up\nresistors (1k) on both sides.
$EndSCHEMATC
