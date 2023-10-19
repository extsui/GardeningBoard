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
P 3050 4750
F 0 "CN3" H 3000 5100 50  0000 L CNN
F 1 "GROVE_IIC_5V" H 2950 5000 50  0000 L CNN
F 2 "OPL_Connector:HW4-2.0-90D" H 3050 4750 50  0001 C CNN
F 3 "~" H 3050 4750 50  0001 C CNN
	1    3050 4750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3350 4650 3250 4650
Wire Wire Line
	3350 4750 3250 4750
Wire Wire Line
	3450 4950 3250 4950
Text GLabel 3350 4650 2    50   Input ~ 0
SCL_5V
Text GLabel 3350 4750 2    50   Input ~ 0
SDA_5V
Wire Wire Line
	3250 4850 3350 4850
Text GLabel 3350 4850 2    50   Input ~ 0
5V
$Comp
L Connector_Generic:Conn_01x04 CN4
U 1 1 6135A67F
P 3050 5700
F 0 "CN4" H 3000 6050 50  0000 L CNN
F 1 "GROVE_IIC_5V" H 2950 5950 50  0000 L CNN
F 2 "OPL_Connector:HW4-2.0-90D" H 3050 5700 50  0001 C CNN
F 3 "~" H 3050 5700 50  0001 C CNN
	1    3050 5700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3350 5600 3250 5600
Wire Wire Line
	3350 5700 3250 5700
Text GLabel 3350 5600 2    50   Input ~ 0
SCL_5V
Text GLabel 3350 5700 2    50   Input ~ 0
SDA_5V
Wire Wire Line
	3250 5800 3350 5800
Text GLabel 3350 5800 2    50   Input ~ 0
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
P 3450 4950
F 0 "#PWR0109" H 3450 4700 50  0001 C CNN
F 1 "GND" H 3455 4777 50  0000 C CNN
F 2 "" H 3450 4950 50  0001 C CNN
F 3 "" H 3450 4950 50  0001 C CNN
	1    3450 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 61908E86
P 3450 5900
F 0 "#PWR0110" H 3450 5650 50  0001 C CNN
F 1 "GND" H 3455 5727 50  0000 C CNN
F 2 "" H 3450 5900 50  0001 C CNN
F 3 "" H 3450 5900 50  0001 C CNN
	1    3450 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 5900 3450 5900
Wire Wire Line
	6550 2600 6450 2600
$Comp
L power:GND #PWR0102
U 1 1 65281EC6
P 7350 2700
F 0 "#PWR0102" H 7350 2450 50  0001 C CNN
F 1 "GND" H 7355 2527 50  0000 C CNN
F 2 "" H 7350 2700 50  0001 C CNN
F 3 "" H 7350 2700 50  0001 C CNN
	1    7350 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 2700 7350 2700
Wire Wire Line
	6450 3200 6550 3200
Text GLabel 6550 2350 1    50   Input ~ 0
5V
Wire Wire Line
	6450 2900 6550 2900
Wire Wire Line
	6550 2350 6550 2600
Text GLabel 4500 2700 0    50   Input ~ 0
RV2
Text GLabel 4500 2600 0    50   Input ~ 0
RV1
Wire Wire Line
	4500 2600 4650 2600
Wire Wire Line
	4500 2700 4650 2700
$Comp
L Device:R_POT_Dual VOL1
U 1 1 6528578F
P 4750 5650
F 0 "VOL1" H 4500 6050 50  0000 C CNN
F 1 "(TBD)" H 4500 5950 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Alps_RK097_Dual_Horizontal" H 5000 5575 50  0001 C CNN
F 3 "~" H 5000 5575 50  0001 C CNN
	1    4750 5650
	1    0    0    -1  
$EndComp
NoConn ~ 4350 5750
NoConn ~ 4650 5750
NoConn ~ 4500 5550
Wire Wire Line
	5200 5450 5200 5750
Text GLabel 5200 5450 1    50   Input ~ 0
3V3
Wire Wire Line
	5200 5750 5150 5750
$Comp
L power:GND #PWR0103
U 1 1 6528D26E
P 4800 5800
F 0 "#PWR0103" H 4800 5550 50  0001 C CNN
F 1 "GND" H 4805 5627 50  0000 C CNN
F 2 "" H 4800 5800 50  0001 C CNN
F 3 "" H 4800 5800 50  0001 C CNN
	1    4800 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 5800 4800 5750
Wire Wire Line
	4800 5750 4850 5750
$Comp
L Device:R_POT_Dual VOL2
U 1 1 6528F329
P 5950 5650
F 0 "VOL2" H 5700 6050 50  0000 C CNN
F 1 "(TBD)" H 5700 5950 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Alps_RK097_Dual_Horizontal" H 6200 5575 50  0001 C CNN
F 3 "~" H 6200 5575 50  0001 C CNN
	1    5950 5650
	1    0    0    -1  
$EndComp
NoConn ~ 5550 5750
NoConn ~ 5850 5750
NoConn ~ 5700 5550
Wire Wire Line
	6400 5450 6400 5750
Text GLabel 6400 5450 1    50   Input ~ 0
3V3
Wire Wire Line
	6400 5750 6350 5750
$Comp
L power:GND #PWR0104
U 1 1 6528F336
P 6000 5800
F 0 "#PWR0104" H 6000 5550 50  0001 C CNN
F 1 "GND" H 6005 5627 50  0000 C CNN
F 2 "" H 6000 5800 50  0001 C CNN
F 3 "" H 6000 5800 50  0001 C CNN
	1    6000 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 5800 6000 5750
Wire Wire Line
	6000 5750 6050 5750
$Comp
L extsui:XIAO-ESP32-C3 IC1
U 1 1 65281C94
P 5550 2900
F 0 "IC1" H 5550 3465 50  0000 C CNN
F 1 "XIAO-ESP32-C3" H 5550 3374 50  0000 C CNN
F 2 "extsui:SeeeduinoXIAO" H 5550 3400 50  0001 C CNN
F 3 "" H 5550 3400 50  0001 C CNN
	1    5550 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:Buzzer BZ1
U 1 1 65296ED3
P 4050 3550
F 0 "BZ1" H 4056 3840 50  0000 C CNN
F 1 "Buzzer" H 4056 3749 50  0000 C CNN
F 2 "Buzzer_Beeper:Buzzer_TDK_PS1240P02BT_D12.2mm_H6.5mm" V 4025 3650 50  0001 C CNN
F 3 "~" V 4025 3650 50  0001 C CNN
	1    4050 3550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4150 3450 4250 3450
$Comp
L power:GND #PWR0105
U 1 1 652A41AE
P 4150 3650
F 0 "#PWR0105" H 4150 3400 50  0001 C CNN
F 1 "GND" H 4155 3477 50  0000 C CNN
F 2 "" H 4150 3650 50  0001 C CNN
F 3 "" H 4150 3650 50  0001 C CNN
	1    4150 3650
	1    0    0    -1  
$EndComp
$Comp
L extsui:AE-PCA9306 IC2
U 1 1 652A9266
P 5550 4350
F 0 "IC2" H 5550 4765 50  0000 C CNN
F 1 "AE-PCA9306" H 5550 4674 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 5500 4300 50  0001 C CNN
F 3 "" H 5500 4300 50  0001 C CNN
	1    5550 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R2
U 1 1 652A93D1
P 4350 3450
F 0 "R2" V 4154 3450 50  0000 C CNN
F 1 "1k" V 4245 3450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 4350 3450 50  0001 C CNN
F 3 "~" H 4350 3450 50  0001 C CNN
	1    4350 3450
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1
U 1 1 652AB595
P 6900 2550
F 0 "R1" V 6704 2550 50  0000 C CNN
F 1 "10k" V 6795 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 6900 2550 50  0001 C CNN
F 3 "~" H 6900 2550 50  0001 C CNN
	1    6900 2550
	0    1    1    0   
$EndComp
Text GLabel 6200 4200 2    50   Input ~ 0
5V
Wire Wire Line
	6200 4200 6050 4200
Wire Wire Line
	5050 4200 4900 4200
Wire Wire Line
	6050 4500 6150 4500
$Comp
L power:GND #PWR0106
U 1 1 652B2B11
P 6150 4500
F 0 "#PWR0106" H 6150 4250 50  0001 C CNN
F 1 "GND" H 6155 4327 50  0000 C CNN
F 2 "" H 6150 4500 50  0001 C CNN
F 3 "" H 6150 4500 50  0001 C CNN
	1    6150 4500
	1    0    0    -1  
$EndComp
Text GLabel 4900 4200 0    50   Input ~ 0
3V3
Text GLabel 4900 4300 0    50   Input ~ 0
SCL_3V3
Text GLabel 4900 4400 0    50   Input ~ 0
SDA_3V3
NoConn ~ 5050 4500
Wire Wire Line
	4900 4300 5050 4300
Wire Wire Line
	4900 4400 5050 4400
Text GLabel 6200 4300 2    50   Input ~ 0
SCL_5V
Text GLabel 6200 4400 2    50   Input ~ 0
SDA_5V
Wire Wire Line
	6050 4300 6200 4300
Wire Wire Line
	6050 4400 6200 4400
Text GLabel 6550 3200 2    50   Input ~ 0
SCL_3V3
Text GLabel 6550 2900 2    50   Input ~ 0
SDA_3V3
$Comp
L power:GND #PWR0111
U 1 1 652E1DA9
P 7600 3700
F 0 "#PWR0111" H 7600 3450 50  0001 C CNN
F 1 "GND" H 7605 3527 50  0000 C CNN
F 2 "" H 7600 3700 50  0001 C CNN
F 3 "" H 7600 3700 50  0001 C CNN
	1    7600 3700
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 652E1DAF
P 7100 3500
F 0 "SW1" V 7050 3750 50  0000 C CNN
F 1 "(TBD)" V 7150 3750 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H8.5mm" H 7100 3700 50  0001 C CNN
F 3 "" H 7100 3700 50  0001 C CNN
	1    7100 3500
	0    -1   1    0   
$EndComp
Wire Wire Line
	6450 2800 6700 2800
Wire Wire Line
	6700 2400 6700 2550
Text GLabel 6700 2400 1    50   Input ~ 0
3V3
Wire Wire Line
	6800 2550 6700 2550
Connection ~ 6700 2550
Wire Wire Line
	6700 2550 6700 2800
Wire Wire Line
	7000 2550 7100 2550
Wire Wire Line
	7100 2550 7100 3100
Wire Wire Line
	6450 3100 7100 3100
Wire Wire Line
	7100 3100 7100 3300
Connection ~ 7100 3100
$Comp
L Connector:Conn_01x05_Female CN1
U 1 1 6530C310
P 7300 5550
F 0 "CN1" V 7400 5600 50  0000 R CNN
F 1 "Conn_01x05_Female" V 7500 5900 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x05_P2.54mm_Vertical" H 7300 5550 50  0001 C CNN
F 3 "~" H 7300 5550 50  0001 C CNN
	1    7300 5550
	0    -1   1    0   
$EndComp
$Comp
L Connector:Conn_01x05_Female CN2
U 1 1 6530DA1A
P 8350 5550
F 0 "CN2" V 8450 5600 50  0000 R CNN
F 1 "CardEdgeConnector5P" V 8550 5950 50  0000 R CNN
F 2 "extsui:CONN_CARD_EDGE_395-010-521-201" H 8350 5550 50  0001 C CNN
F 3 "~" H 8350 5550 50  0001 C CNN
	1    8350 5550
	0    -1   1    0   
$EndComp
Wire Wire Line
	7100 5350 7100 5200
Wire Wire Line
	7200 4800 7200 5100
Wire Wire Line
	7300 5350 7300 5000
Wire Wire Line
	7100 5200 8150 5200
Wire Wire Line
	8150 5200 8150 5350
Connection ~ 7100 5200
Wire Wire Line
	7100 5200 7100 4800
Wire Wire Line
	7200 5100 8250 5100
Wire Wire Line
	8250 5100 8250 5350
Connection ~ 7200 5100
Wire Wire Line
	7200 5100 7200 5350
Wire Wire Line
	7300 5000 8350 5000
Wire Wire Line
	8350 5000 8350 5350
Connection ~ 7300 5000
Wire Wire Line
	7300 5000 7300 4800
Wire Wire Line
	8550 5350 8550 4900
Wire Wire Line
	8550 4900 7500 4900
NoConn ~ 8450 5350
NoConn ~ 7400 5350
$Comp
L power:GND #PWR0112
U 1 1 65320A7F
P 7700 4550
F 0 "#PWR0112" H 7700 4300 50  0001 C CNN
F 1 "GND" H 7705 4377 50  0000 C CNN
F 2 "" H 7700 4550 50  0001 C CNN
F 3 "" H 7700 4550 50  0001 C CNN
	1    7700 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 4550 7700 4550
Text GLabel 7100 4800 1    50   Input ~ 0
5V
Text GLabel 7300 4800 1    50   Input ~ 0
SCL_5V
Text GLabel 7200 4800 1    50   Input ~ 0
SDA_5V
Text Notes 8000 5900 0    50   ~ 0
To Building board
Text Notes 7050 5900 0    50   ~ 0
To Tile board
Text GLabel 5000 5450 1    50   Input ~ 0
RV1
Text GLabel 6200 5450 1    50   Input ~ 0
RV2
Wire Wire Line
	6200 5450 6200 5550
Wire Wire Line
	5000 5550 5000 5450
Wire Wire Line
	6450 3000 7600 3000
$Comp
L Switch:SW_Push SW2
U 1 1 6534B768
P 7600 3500
F 0 "SW2" V 7550 3750 50  0000 C CNN
F 1 "(TBD)" V 7650 3750 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H8.5mm" H 7600 3700 50  0001 C CNN
F 3 "" H 7600 3700 50  0001 C CNN
	1    7600 3500
	0    -1   1    0   
$EndComp
Wire Wire Line
	7600 3000 7600 3300
$Comp
L power:GND #PWR0113
U 1 1 65352D3C
P 7100 3700
F 0 "#PWR0113" H 7100 3450 50  0001 C CNN
F 1 "GND" H 7105 3527 50  0000 C CNN
F 2 "" H 7100 3700 50  0001 C CNN
F 3 "" H 7100 3700 50  0001 C CNN
	1    7100 3700
	1    0    0    -1  
$EndComp
$Comp
L extsui:DIPSW-4P SW3
U 1 1 6535A61C
P 3350 3550
F 0 "SW3" V 3400 4100 50  0000 R CNN
F 1 "DIPSW-4P" V 3300 4250 50  0000 R CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx04_Slide_9.78x12.34mm_W7.62mm_P2.54mm" H 3350 3900 60  0001 C CNN
F 3 "" H 3350 3900 60  0000 C CNN
	1    3350 3550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3200 3100 3200 2800
Wire Wire Line
	3200 2800 4650 2800
Wire Wire Line
	4650 2900 3300 2900
Wire Wire Line
	3300 2900 3300 3100
Wire Wire Line
	3400 3100 3400 3000
Wire Wire Line
	3400 3000 4650 3000
Wire Wire Line
	4650 3100 3500 3100
$Comp
L power:GND #PWR0114
U 1 1 6536CC6D
P 3600 4050
F 0 "#PWR0114" H 3600 3800 50  0001 C CNN
F 1 "GND" H 3605 3877 50  0000 C CNN
F 2 "" H 3600 4050 50  0001 C CNN
F 3 "" H 3600 4050 50  0001 C CNN
	1    3600 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 4000 3400 4000
Connection ~ 3300 4000
Wire Wire Line
	3300 4000 3200 4000
Connection ~ 3400 4000
Wire Wire Line
	3400 4000 3300 4000
Wire Wire Line
	3500 4000 3600 4000
Connection ~ 3500 4000
Wire Wire Line
	3600 4000 3600 4050
Wire Wire Line
	4500 3450 4450 3450
Wire Wire Line
	4500 3200 4650 3200
Wire Wire Line
	4500 3200 4500 3450
Connection ~ 7500 4900
Wire Wire Line
	7500 4900 7500 4550
Wire Wire Line
	7500 5350 7500 4900
Text Notes 4100 2050 0    50   ~ 0
XIAO-ESP32-C3 Notes:\n* The D6 pin becomes a UART output at startup, so it should be used as an output.\n* The D8 pin must be pulled up because it must be HIGH during download boot.\n* The D9 pin is also used as the BOOT switch, so it should be used as an input only.
Text Notes 1900 3150 0    50   ~ 0
It is possible that\nyou will use it for purposes\nsuch as JTAG without\nimplementing DIPSW-4P.
Wire Notes Line
	2400 3250 2400 3500
Wire Notes Line
	2400 3500 2700 3500
Wire Notes Line
	4400 2100 4400 2400
Wire Notes Line
	4400 2400 4650 2400
Text Notes 5050 4850 0    50   ~ 0
AE-PCA9306 has pull-up\nresistors (1k) on both sides.
Wire Wire Line
	3200 2300 3200 2800
Connection ~ 3200 2800
Wire Wire Line
	3300 2300 3300 2900
Connection ~ 3300 2900
Wire Wire Line
	3400 2300 3400 3000
Connection ~ 3400 3000
Wire Wire Line
	3500 2300 3500 3100
Connection ~ 3500 3100
$Comp
L Device:CP C1
U 1 1 65331131
P 8000 2600
F 0 "C1" H 8118 2646 50  0000 L CNN
F 1 "CP" H 8118 2555 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 8038 2450 50  0001 C CNN
F 3 "~" H 8000 2600 50  0001 C CNN
	1    8000 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 6533303C
P 8000 2750
F 0 "#PWR0115" H 8000 2500 50  0001 C CNN
F 1 "GND" H 8005 2577 50  0000 C CNN
F 2 "" H 8000 2750 50  0001 C CNN
F 3 "" H 8000 2750 50  0001 C CNN
	1    8000 2750
	1    0    0    -1  
$EndComp
Text GLabel 8000 2350 1    50   Input ~ 0
5V
Wire Wire Line
	8000 2350 8000 2450
$Comp
L Connector:Conn_01x06_Male CN5
U 1 1 6533C0A3
P 3200 2100
F 0 "CN5" V 3000 2150 50  0000 R CNN
F 1 "JTAG" V 3100 2150 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 3200 2100 50  0001 C CNN
F 3 "~" H 3200 2100 50  0001 C CNN
	1    3200 2100
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 6533E078
P 2650 2400
F 0 "#PWR0116" H 2650 2150 50  0001 C CNN
F 1 "GND" H 2655 2227 50  0000 C CNN
F 2 "" H 2650 2400 50  0001 C CNN
F 3 "" H 2650 2400 50  0001 C CNN
	1    2650 2400
	1    0    0    -1  
$EndComp
Text GLabel 2900 2500 0    50   Input ~ 0
5V
Wire Wire Line
	3100 2500 3100 2300
Wire Wire Line
	3100 2500 2900 2500
Wire Wire Line
	2650 2400 3000 2400
Wire Wire Line
	3000 2400 3000 2300
Text Notes 2000 6350 0    50   ~ 0
If you want to use 3V3 I2C,\ndetach AE-PCA9306.
Wire Notes Line
	2400 5750 2700 5750
Wire Notes Line
	2400 4800 2700 4800
Wire Notes Line
	2400 4800 2400 6100
$EndSCHEMATC
