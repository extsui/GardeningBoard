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
L Connector_Generic:Conn_01x04 CN1
U 1 1 61333D2B
P 1650 5500
F 0 "CN1" H 1600 5850 50  0000 L CNN
F 1 "GROVE_IIC_5V" H 1550 5750 50  0000 L CNN
F 2 "Connector:NS-Tech_Grove_1x04_P2mm_Vertical" H 1650 5500 50  0001 C CNN
F 3 "~" H 1650 5500 50  0001 C CNN
	1    1650 5500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1950 5400 1850 5400
Wire Wire Line
	1950 5500 1850 5500
Wire Wire Line
	2050 5700 1850 5700
Text GLabel 1950 5400 2    50   Input ~ 0
SCL
Text GLabel 1950 5500 2    50   Input ~ 0
SDA
Wire Wire Line
	1850 5600 1950 5600
Text GLabel 1950 5600 2    50   Input ~ 0
5V
$Comp
L Connector_Generic:Conn_01x04 CN2
U 1 1 6135A67F
P 1650 6450
F 0 "CN2" H 1600 6800 50  0000 L CNN
F 1 "GROVE_IIC_5V" H 1550 6700 50  0000 L CNN
F 2 "Connector:NS-Tech_Grove_1x04_P2mm_Vertical" H 1650 6450 50  0001 C CNN
F 3 "~" H 1650 6450 50  0001 C CNN
	1    1650 6450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1950 6350 1850 6350
Wire Wire Line
	1950 6450 1850 6450
Text GLabel 1950 6350 2    50   Input ~ 0
SCL
Text GLabel 1950 6450 2    50   Input ~ 0
SDA
Wire Wire Line
	1850 6550 1950 6550
Text GLabel 1950 6550 2    50   Input ~ 0
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
Text GLabel 3800 2650 0    50   Input ~ 0
TXD
Text GLabel 5800 2650 2    50   Input ~ 0
RXD
Wire Wire Line
	3800 2650 3900 2650
Wire Wire Line
	5700 2650 5800 2650
$Comp
L Device:R R1
U 1 1 615667FD
P 3150 2000
F 0 "R1" V 3100 1800 50  0000 C CNN
F 1 "4.7k" V 3150 2000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3080 2000 50  0001 C CNN
F 3 "~" H 3150 2000 50  0001 C CNN
	1    3150 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 61566804
P 3300 2000
F 0 "R2" V 3250 1800 50  0000 C CNN
F 1 "4.7k" V 3300 2000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3230 2000 50  0001 C CNN
F 3 "~" H 3300 2000 50  0001 C CNN
	1    3300 2000
	1    0    0    -1  
$EndComp
Text GLabel 3000 2550 0    50   Input ~ 0
SCL
Text GLabel 3000 2450 0    50   Input ~ 0
SDA
Wire Wire Line
	3150 1600 3150 1700
Wire Wire Line
	3150 1700 3300 1700
Wire Wire Line
	3300 1700 3300 1850
Connection ~ 3150 1700
Wire Wire Line
	3150 1700 3150 1850
Wire Wire Line
	3000 2450 3150 2450
Wire Wire Line
	3900 2550 3300 2550
Wire Wire Line
	3150 2150 3150 2450
Wire Wire Line
	3150 2450 3900 2450
Wire Wire Line
	3300 2150 3300 2550
Wire Wire Line
	3300 2550 3000 2550
Connection ~ 3300 2550
Connection ~ 3150 2450
Text GLabel 3750 2250 0    50   Input ~ 0
CS
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
Text GLabel 3150 1600 1    50   Input ~ 0
3V3
Text GLabel 5850 1950 1    50   Input ~ 0
3V3
Text GLabel 5800 2350 2    50   Input ~ 0
MOSI
Text GLabel 5800 2450 2    50   Input ~ 0
MISO
Text GLabel 5800 2550 2    50   Input ~ 0
SCK
Wire Wire Line
	5700 2350 5800 2350
Wire Wire Line
	5800 2450 5700 2450
Wire Wire Line
	5700 2550 5800 2550
Wire Wire Line
	3750 2250 3900 2250
$Comp
L power:GND #PWR0109
U 1 1 618F6855
P 2050 5700
F 0 "#PWR0109" H 2050 5450 50  0001 C CNN
F 1 "GND" H 2055 5527 50  0000 C CNN
F 2 "" H 2050 5700 50  0001 C CNN
F 3 "" H 2050 5700 50  0001 C CNN
	1    2050 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 61908E86
P 2050 6650
F 0 "#PWR0110" H 2050 6400 50  0001 C CNN
F 1 "GND" H 2055 6477 50  0000 C CNN
F 2 "" H 2050 6650 50  0001 C CNN
F 3 "" H 2050 6650 50  0001 C CNN
	1    2050 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 6650 2050 6650
$Comp
L power:GND #PWR0113
U 1 1 612EFE67
P 3850 3300
F 0 "#PWR0113" H 3850 3050 50  0001 C CNN
F 1 "GND" H 3855 3127 50  0000 C CNN
F 2 "" H 3850 3300 50  0001 C CNN
F 3 "" H 3850 3300 50  0001 C CNN
	1    3850 3300
	1    0    0    -1  
$EndComp
Text Notes 2750 3200 0    50   ~ 0
Require internal\n  input-pullup.
Text GLabel 3750 2350 0    50   Input ~ 0
RV_B
Text GLabel 3750 2050 0    50   Input ~ 0
RV_V
Wire Wire Line
	3750 2050 3900 2050
Wire Wire Line
	3450 2150 3900 2150
$Comp
L extsui:SeeeduinoXIAO U1
U 1 1 613BB9DE
P 4800 2350
F 0 "U1" H 4800 2915 50  0000 C CNN
F 1 "SeeeduinoXIAO" H 4800 2824 50  0000 C CNN
F 2 "extsui:SeeeduinoXIAO" H 4750 2450 50  0001 C CNN
F 3 "" H 4750 2450 50  0001 C CNN
	1    4800 2350
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 612D291C
P 3650 3200
F 0 "SW1" H 3650 3485 50  0000 C CNN
F 1 "MDOE" H 3650 3394 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H8.5mm" H 3650 3400 50  0001 C CNN
F 3 "" H 3650 3400 50  0001 C CNN
	1    3650 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 2150 3450 3200
Wire Wire Line
	3850 3200 3850 3300
Wire Wire Line
	3750 2350 3900 2350
Text Notes 3500 1450 0    50   ~ 0
Volume (A0) and Switch (D1) pin numbers are\ncompatible with the XIAO expansion board.\n
Wire Notes Line
	3700 1500 3700 1950
Wire Wire Line
	6150 1650 6150 2050
$EndSCHEMATC
