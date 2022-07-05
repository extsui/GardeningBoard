EESchema Schematic File Version 4
LIBS:Ship-cache
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
L Connector_Generic:Conn_01x04 CN1
U 1 1 61333D2B
P 2800 3200
F 0 "CN1" H 2750 3550 50  0000 L CNN
F 1 "GROVE_IIC_5V" H 2700 3450 50  0000 L CNN
F 2 "Connector:NS-Tech_Grove_1x04_P2mm_Vertical" H 2800 3200 50  0001 C CNN
F 3 "~" H 2800 3200 50  0001 C CNN
	1    2800 3200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3100 3100 3000 3100
Wire Wire Line
	3100 3200 3000 3200
Wire Wire Line
	3200 3400 3000 3400
Text GLabel 3100 3100 2    50   Input ~ 0
SCL_5V
Text GLabel 3100 3200 2    50   Input ~ 0
SDA_5V
Wire Wire Line
	3000 3300 3100 3300
Text GLabel 3100 3300 2    50   Input ~ 0
5V
$Comp
L Connector_Generic:Conn_01x04 CN2
U 1 1 6135A67F
P 2800 4150
F 0 "CN2" H 2750 4500 50  0000 L CNN
F 1 "GROVE_IIC_5V" H 2700 4400 50  0000 L CNN
F 2 "Connector:NS-Tech_Grove_1x04_P2mm_Vertical" H 2800 4150 50  0001 C CNN
F 3 "~" H 2800 4150 50  0001 C CNN
	1    2800 4150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3100 4050 3000 4050
Wire Wire Line
	3100 4150 3000 4150
Wire Wire Line
	3000 4250 3100 4250
Text GLabel 3100 4250 2    50   Input ~ 0
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
Wire Wire Line
	6150 2050 5700 2050
Wire Wire Line
	5850 1950 5850 2250
Wire Wire Line
	5850 2250 5700 2250
$Comp
L power:GND #PWR0104
U 1 1 6152DD53
P 6150 2350
F 0 "#PWR0104" H 6150 2100 50  0001 C CNN
F 1 "GND" H 6155 2177 50  0000 C CNN
F 2 "" H 6150 2350 50  0001 C CNN
F 3 "" H 6150 2350 50  0001 C CNN
	1    6150 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 2150 6150 2150
Wire Wire Line
	6150 2150 6150 2350
Text GLabel 3650 2550 0    50   Input ~ 0
SCL_3V3
Text GLabel 3650 2450 0    50   Input ~ 0
SDA_3V3
$Comp
L power:+3V3 #PWR0107
U 1 1 6178EF60
P 1250 2150
F 0 "#PWR0107" H 1250 2000 50  0001 C CNN
F 1 "+3V3" H 1265 2323 50  0000 C CNN
F 2 "" H 1250 2150 50  0001 C CNN
F 3 "" H 1250 2150 50  0001 C CNN
	1    1250 2150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0108
U 1 1 617948E9
P 950 2150
F 0 "#PWR0108" H 950 2000 50  0001 C CNN
F 1 "+5V" H 965 2323 50  0000 C CNN
F 2 "" H 950 2150 50  0001 C CNN
F 3 "" H 950 2150 50  0001 C CNN
	1    950  2150
	1    0    0    -1  
$EndComp
Text GLabel 1250 2300 3    50   Input ~ 0
3V3
Text GLabel 950  2300 3    50   Input ~ 0
5V
Wire Wire Line
	950  2300 950  2150
Wire Wire Line
	1250 2150 1250 2300
Text GLabel 6150 1650 1    50   Input ~ 0
5V
Text GLabel 5850 1950 1    50   Input ~ 0
3V3
$Comp
L power:GND #PWR0109
U 1 1 618F6855
P 3200 3400
F 0 "#PWR0109" H 3200 3150 50  0001 C CNN
F 1 "GND" H 3205 3227 50  0000 C CNN
F 2 "" H 3200 3400 50  0001 C CNN
F 3 "" H 3200 3400 50  0001 C CNN
	1    3200 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 61908E86
P 3200 4350
F 0 "#PWR0110" H 3200 4100 50  0001 C CNN
F 1 "GND" H 3205 4177 50  0000 C CNN
F 2 "" H 3200 4350 50  0001 C CNN
F 3 "" H 3200 4350 50  0001 C CNN
	1    3200 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 4350 3200 4350
$Comp
L power:GND #PWR0113
U 1 1 612EFE67
P 6850 4200
F 0 "#PWR0113" H 6850 3950 50  0001 C CNN
F 1 "GND" H 6855 4027 50  0000 C CNN
F 2 "" H 6850 4200 50  0001 C CNN
F 3 "" H 6850 4200 50  0001 C CNN
	1    6850 4200
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 612D291C
P 6650 4100
F 0 "SW1" H 6650 4385 50  0000 C CNN
F 1 "RESET" H 6650 4294 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H8.5mm" H 6650 4300 50  0001 C CNN
F 3 "" H 6650 4300 50  0001 C CNN
	1    6650 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 4100 6850 4200
Wire Wire Line
	6150 1650 6150 2050
$Comp
L extsui:AE-PCA9306 U?
U 1 1 62C44B6C
P 4800 4150
F 0 "U?" H 4800 4565 50  0000 C CNN
F 1 "AE-PCA9306" H 4800 4474 50  0000 C CNN
F 2 "" H 4750 4100 50  0001 C CNN
F 3 "" H 4750 4100 50  0001 C CNN
	1    4800 4150
	1    0    0    -1  
$EndComp
$Comp
L extsui:SeeeduinoXAIO_BLE U?
U 1 1 62C44D1B
P 4800 2450
F 0 "U?" H 4800 3115 50  0000 C CNN
F 1 "SeeeduinoXAIO_BLE" H 4800 3024 50  0000 C CNN
F 2 "" H 4800 3100 50  0001 C CNN
F 3 "" H 4800 3100 50  0001 C CNN
	1    4800 2450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J1
U 1 1 62C47BC6
P 6200 3150
F 0 "J1" H 6280 3142 50  0000 L CNN
F 1 "Conn_01x04" H 6280 3051 50  0000 L CNN
F 2 "" H 6200 3150 50  0001 C CNN
F 3 "~" H 6200 3150 50  0001 C CNN
	1    6200 3150
	0    -1   1    0   
$EndComp
NoConn ~ 5700 2350
NoConn ~ 5700 2450
NoConn ~ 5700 2550
NoConn ~ 5700 2650
NoConn ~ 5450 3100
NoConn ~ 5350 3100
Wire Wire Line
	3650 2450 3900 2450
Wire Wire Line
	3650 2550 3900 2550
Text Notes 3850 4750 0    50   ~ 0
AE-PCA9306 has pull-up\n1k ohm registers in both sides.
NoConn ~ 3900 2050
NoConn ~ 3900 2150
NoConn ~ 3900 2250
NoConn ~ 3900 2350
NoConn ~ 3900 2650
Text GLabel 4100 4200 0    50   Input ~ 0
SCL_3V3
Text GLabel 4100 4100 0    50   Input ~ 0
SDA_3V3
Wire Wire Line
	4100 4100 4300 4100
Wire Wire Line
	4100 4200 4300 4200
Wire Wire Line
	5600 4100 5300 4100
Wire Wire Line
	5600 4200 5300 4200
Text GLabel 5600 4100 2    50   Input ~ 0
SCL_5V
Text GLabel 5600 4200 2    50   Input ~ 0
SDA_5V
Text GLabel 3100 4050 2    50   Input ~ 0
SCL_5V
Text GLabel 3100 4150 2    50   Input ~ 0
SDA_5V
Wire Wire Line
	4200 3900 4200 4000
Text GLabel 4200 3900 1    50   Input ~ 0
3V3
Wire Wire Line
	4200 4000 4300 4000
Wire Wire Line
	4300 4300 4300 4500
Wire Wire Line
	5400 4500 5400 4000
Wire Wire Line
	5400 4000 5300 4000
Wire Wire Line
	5400 3850 5400 4000
Connection ~ 5400 4000
Text GLabel 5400 3850 1    50   Input ~ 0
5V
$Comp
L power:GND #PWR?
U 1 1 62C514AD
P 5300 4600
F 0 "#PWR?" H 5300 4350 50  0001 C CNN
F 1 "GND" H 5305 4427 50  0000 C CNN
F 2 "" H 5300 4600 50  0001 C CNN
F 3 "" H 5300 4600 50  0001 C CNN
	1    5300 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 4500 5400 4500
Wire Wire Line
	5300 4300 5300 4600
Text Notes 6550 3200 0    50   ~ 0
<-- Which is #1 pin ?\n(GND, 3V3, SWDIO, SWCLK)
Text GLabel 4850 3200 3    50   Input ~ 0
RST
Wire Wire Line
	4850 3100 4850 3200
Text GLabel 6350 4100 0    50   Input ~ 0
RST
Wire Wire Line
	6450 4100 6350 4100
$Comp
L power:GND #PWR?
U 1 1 62C59F2A
P 4950 3350
F 0 "#PWR?" H 4950 3100 50  0001 C CNN
F 1 "GND" H 4955 3177 50  0000 C CNN
F 2 "" H 4950 3350 50  0001 C CNN
F 3 "" H 4950 3350 50  0001 C CNN
	1    4950 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 3100 4950 3350
$Comp
L Connector_Generic:Conn_01x04 CN3
U 1 1 62C5CC0B
P 2800 5000
F 0 "CN3" H 2750 5350 50  0000 L CNN
F 1 "GROVE_IIC_5V" H 2700 5250 50  0000 L CNN
F 2 "Connector:NS-Tech_Grove_1x04_P2mm_Vertical" H 2800 5000 50  0001 C CNN
F 3 "~" H 2800 5000 50  0001 C CNN
	1    2800 5000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3100 4900 3000 4900
Wire Wire Line
	3100 5000 3000 5000
Wire Wire Line
	3000 5100 3100 5100
Text GLabel 3100 5100 2    50   Input ~ 0
5V
$Comp
L power:GND #PWR?
U 1 1 62C5CC16
P 3200 5200
F 0 "#PWR?" H 3200 4950 50  0001 C CNN
F 1 "GND" H 3205 5027 50  0000 C CNN
F 2 "" H 3200 5200 50  0001 C CNN
F 3 "" H 3200 5200 50  0001 C CNN
	1    3200 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 5200 3200 5200
Text GLabel 3100 4900 2    50   Input ~ 0
SCL_5V
Text GLabel 3100 5000 2    50   Input ~ 0
SDA_5V
Text GLabel 4650 3200 3    50   Input ~ 0
SWDIO
Text GLabel 4750 3200 3    50   Input ~ 0
SWCLK
Wire Wire Line
	4750 3200 4750 3100
Wire Wire Line
	4650 3100 4650 3200
$Comp
L Switch:SW_Push SW?
U 1 1 62C5E8E9
P 2950 2100
F 0 "SW?" H 2950 2385 50  0000 C CNN
F 1 "USER" H 2950 2294 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H8.5mm" H 2950 2300 50  0001 C CNN
F 3 "" H 2950 2300 50  0001 C CNN
	1    2950 2100
	1    0    0    -1  
$EndComp
$EndSCHEMATC
