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
P 1850 1150
F 0 "#PWR02" H 1850 900 50  0001 C CNN
F 1 "GND" H 1855 977 50  0000 C CNN
F 2 "" H 1850 1150 50  0001 C CNN
F 3 "" H 1850 1150 50  0001 C CNN
	1    1850 1150
	1    0    0    -1  
$EndComp
Wire Notes Line
	2150 1450 2150 850 
Wire Notes Line
	2150 850  800  850 
Wire Notes Line
	800  850  800  1450
Wire Notes Line
	800  1450 2150 1450
Text Notes 850  800  0    50   ~ 0
Power Flag
$Comp
L Device:C_Small C?
U 1 1 5C2DF16B
P 4200 3600
F 0 "C?" H 4300 3500 50  0000 C CNN
F 1 "0.1u" H 4300 3700 50  0000 C CNN
F 2 "extsui:C_1608_HandSolderingCustom" H 4200 3600 50  0001 C CNN
F 3 "~" H 4200 3600 50  0001 C CNN
	1    4200 3600
	-1   0    0    1   
$EndComp
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
P 1850 1150
F 0 "#FLG02" H 1850 1225 50  0001 C CNN
F 1 "PWR_FLAG" H 1850 1350 50  0000 C CNN
F 2 "" H 1850 1150 50  0001 C CNN
F 3 "~" H 1850 1150 50  0001 C CNN
	1    1850 1150
	1    0    0    -1  
$EndComp
Text GLabel 7450 2200 1    50   Input ~ 0
5V
Text GLabel 7550 2200 1    50   Input ~ 0
LOWER_SDA
Text GLabel 7650 2200 1    50   Input ~ 0
LOWER_SCL
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
Text Notes 7200 1500 0    50   ~ 0
The Conn_01x05_Female connector is \n connected to the Tile board.
Wire Notes Line
	7200 1600 8800 1600
Wire Notes Line
	8800 1600 8800 2700
Wire Notes Line
	8800 2700 7200 2700
Wire Notes Line
	7200 2700 7200 1600
$Comp
L Mechanical:MountingHole H1
U 1 1 5E8E347E
P 9650 3850
F 0 "H1" H 9750 3896 50  0000 L CNN
F 1 "MountingHole" H 9750 3805 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9650 3850 50  0001 C CNN
F 3 "~" H 9650 3850 50  0001 C CNN
	1    9650 3850
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5E8E3566
P 9650 4100
F 0 "H2" H 9750 4146 50  0000 L CNN
F 1 "MountingHole" H 9750 4055 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9650 4100 50  0001 C CNN
F 3 "~" H 9650 4100 50  0001 C CNN
	1    9650 4100
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5E8E35F4
P 9650 4350
F 0 "H3" H 9750 4396 50  0000 L CNN
F 1 "MountingHole" H 9750 4305 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9650 4350 50  0001 C CNN
F 3 "~" H 9650 4350 50  0001 C CNN
	1    9650 4350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5E8E3892
P 9650 4600
F 0 "H4" H 9750 4646 50  0000 L CNN
F 1 "MountingHole" H 9750 4555 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9650 4600 50  0001 C CNN
F 3 "~" H 9650 4600 50  0001 C CNN
	1    9650 4600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H5
U 1 1 5E8E3899
P 9650 4850
F 0 "H5" H 9750 4896 50  0000 L CNN
F 1 "MountingHole" H 9750 4805 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9650 4850 50  0001 C CNN
F 3 "~" H 9650 4850 50  0001 C CNN
	1    9650 4850
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H6
U 1 1 5E8E38A0
P 9650 5100
F 0 "H6" H 9750 5146 50  0000 L CNN
F 1 "MountingHole" H 9750 5055 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9650 5100 50  0001 C CNN
F 3 "~" H 9650 5100 50  0001 C CNN
	1    9650 5100
	1    0    0    -1  
$EndComp
$Comp
L MCU_ST_STM32F3:STM32F303K8Tx U?
U 1 1 5E98BD14
P 3400 4900
F 0 "U?" H 3050 5750 50  0000 C CNN
F 1 "STM32F303K8Tx" V 3350 4850 50  0000 C CNN
F 2 "Package_QFP:LQFP-32_7x7mm_P0.8mm" H 2900 4000 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00092070.pdf" H 3400 4900 50  0001 C CNN
	1    3400 4900
	1    0    0    -1  
$EndComp
Text GLabel 4200 5600 2    50   Input ~ 0
SWCLK
Text GLabel 4200 5500 2    50   Input ~ 0
SWDIO
$Comp
L Connector_Generic:Conn_01x06 J?
U 1 1 5E9A792D
P 5600 3100
F 0 "J?" H 5520 3517 50  0000 C CNN
F 1 "ST-LINK" H 5520 3426 50  0000 C CNN
F 2 "" H 5600 3100 50  0001 C CNN
F 3 "~" H 5600 3100 50  0001 C CNN
	1    5600 3100
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J?
U 1 1 5E9A7A8B
P 5600 4300
F 0 "J?" H 5520 4717 50  0000 C CNN
F 1 "TTL-232R-3V3" H 5520 4626 50  0000 C CNN
F 2 "" H 5600 4300 50  0001 C CNN
F 3 "~" H 5600 4300 50  0001 C CNN
	1    5600 4300
	-1   0    0    -1  
$EndComp
Text GLabel 6100 2900 2    50   Input ~ 0
3V3
Text GLabel 6100 3000 2    50   Input ~ 0
SWCLK
Text GLabel 6100 3100 2    50   Input ~ 0
GND
Text GLabel 6100 3200 2    50   Input ~ 0
SWDIO
Text GLabel 6100 3300 2    50   Input ~ 0
NRST
Text GLabel 6100 3400 2    50   Input ~ 0
SWO
Wire Wire Line
	5800 2900 6100 2900
Wire Wire Line
	6100 3000 5800 3000
Wire Wire Line
	5800 3100 6100 3100
Wire Wire Line
	6100 3200 5800 3200
Wire Wire Line
	5800 3300 6100 3300
Wire Wire Line
	6100 3400 5800 3400
Text GLabel 6100 4100 2    50   Input ~ 0
GND
Text GLabel 6100 4200 2    50   Input ~ 0
CTS
Text GLabel 6100 4300 2    50   Input ~ 0
5V
Text GLabel 6100 4400 2    50   Input ~ 0
TXD
Text GLabel 6100 4500 2    50   Input ~ 0
RXD
Text GLabel 6100 4600 2    50   Input ~ 0
RTS
Wire Wire Line
	5800 4100 6100 4100
Wire Wire Line
	6100 4200 5800 4200
Wire Wire Line
	5800 4300 6100 4300
Wire Wire Line
	6100 4400 5800 4400
Wire Wire Line
	5800 4500 6100 4500
Wire Wire Line
	6100 4600 5800 4600
$Comp
L Device:Crystal Y?
U 1 1 5E9A9E73
P 2200 4850
F 0 "Y?" V 2154 4981 50  0000 L CNN
F 1 "8MHz" V 2245 4981 50  0000 L CNN
F 2 "" H 2200 4850 50  0001 C CNN
F 3 "~" H 2200 4850 50  0001 C CNN
	1    2200 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5E9AA02E
P 3700 1950
F 0 "R?" V 3600 1950 50  0000 C CNN
F 1 "10k" V 3700 1950 50  0000 C CNN
F 2 "" V 3630 1950 50  0001 C CNN
F 3 "~" H 3700 1950 50  0001 C CNN
	1    3700 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E9AA0AB
P 3900 1950
F 0 "R?" V 3800 1950 50  0000 C CNN
F 1 "10k" V 3900 1950 50  0000 C CNN
F 2 "" V 3830 1950 50  0001 C CNN
F 3 "~" H 3900 1950 50  0001 C CNN
	1    3900 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5E9AA11C
P 5000 5150
F 0 "D?" H 4991 5366 50  0000 C CNN
F 1 "LED" H 4991 5275 50  0000 C CNN
F 2 "" H 5000 5150 50  0001 C CNN
F 3 "~" H 5000 5150 50  0001 C CNN
	1    5000 5150
	-1   0    0    1   
$EndComp
$Comp
L Regulator_Linear:LF33_TO252 U?
U 1 1 5E9AB172
P 2050 2400
F 0 "U?" H 2050 2642 50  0000 C CNN
F 1 "NJM2845DL1-33" H 2050 2551 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 2050 2625 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/c4/0e/7e/2a/be/bc/4c/bd/CD00000546.pdf/files/CD00000546.pdf/jcr:content/translations/en.CD00000546.pdf" H 2050 2350 50  0001 C CNN
	1    2050 2400
	1    0    0    -1  
$EndComp
Text GLabel 1400 2400 0    50   Input ~ 0
+5V
Text GLabel 2750 2400 2    50   Input ~ 0
3V3
$Comp
L power:GND #PWR?
U 1 1 5E9AD322
P 2050 2800
F 0 "#PWR?" H 2050 2550 50  0001 C CNN
F 1 "GND" H 2055 2627 50  0000 C CNN
F 2 "" H 2050 2800 50  0001 C CNN
F 3 "" H 2050 2800 50  0001 C CNN
	1    2050 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 2800 2050 2700
$Comp
L power:GND #PWR?
U 1 1 5E9B14FF
P 1600 2800
F 0 "#PWR?" H 1600 2550 50  0001 C CNN
F 1 "GND" H 1605 2627 50  0000 C CNN
F 2 "" H 1600 2800 50  0001 C CNN
F 3 "" H 1600 2800 50  0001 C CNN
	1    1600 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E9B1832
P 2500 2800
F 0 "#PWR?" H 2500 2550 50  0001 C CNN
F 1 "GND" H 2505 2627 50  0000 C CNN
F 2 "" H 2500 2800 50  0001 C CNN
F 3 "" H 2500 2800 50  0001 C CNN
	1    2500 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2400 2500 2400
Wire Wire Line
	2500 2500 2500 2400
Connection ~ 2500 2400
Wire Wire Line
	2500 2400 2750 2400
Wire Wire Line
	1400 2400 1600 2400
Wire Wire Line
	1600 2500 1600 2400
Connection ~ 1600 2400
Wire Wire Line
	1600 2400 1750 2400
$Comp
L Device:R 10k
U 1 1 5E9B4F2D
P 1200 4750
F 0 "10k" H 1270 4796 50  0000 L CNN
F 1 "R" H 1270 4705 50  0000 L CNN
F 2 "" V 1130 4750 50  0001 C CNN
F 3 "~" H 1200 4750 50  0001 C CNN
	1    1200 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E9B88C8
P 1200 5000
F 0 "#PWR?" H 1200 4750 50  0001 C CNN
F 1 "GND" H 1205 4827 50  0000 C CNN
F 2 "" H 1200 5000 50  0001 C CNN
F 3 "" H 1200 5000 50  0001 C CNN
	1    1200 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 5000 1200 4900
Wire Wire Line
	2800 4400 1200 4400
Wire Wire Line
	1200 4400 1200 4600
$Comp
L power:+3.3V #PWR?
U 1 1 5E9BA395
P 3400 3600
F 0 "#PWR?" H 3400 3450 50  0001 C CNN
F 1 "+3.3V" H 3415 3773 50  0000 C CNN
F 2 "" H 3400 3600 50  0001 C CNN
F 3 "" H 3400 3600 50  0001 C CNN
	1    3400 3600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5E9BA3F4
P 1600 2200
F 0 "#PWR?" H 1600 2050 50  0001 C CNN
F 1 "+5V" H 1615 2373 50  0000 C CNN
F 2 "" H 1600 2200 50  0001 C CNN
F 3 "" H 1600 2200 50  0001 C CNN
	1    1600 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 4000 3300 3800
Wire Wire Line
	3300 3800 3400 3800
Wire Wire Line
	3500 3800 3500 4000
Wire Wire Line
	3400 4000 3400 3800
Connection ~ 3400 3800
Wire Wire Line
	3400 3800 3500 3800
Wire Wire Line
	3400 3600 3400 3800
$Comp
L Switch:SW_Push SW?
U 1 1 5E9E7CF3
P 2200 4000
F 0 "SW?" H 2200 4300 50  0000 R CNN
F 1 "RESET" H 2300 4200 50  0000 R CNN
F 2 "" H 2200 4200 50  0001 C CNN
F 3 "" H 2200 4200 50  0001 C CNN
	1    2200 4000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 CN?
U 1 1 5E9E8238
P 8450 4000
F 0 "CN?" H 8530 3992 50  0000 L CNN
F 1 "Conn_01x04" H 8530 3901 50  0000 L CNN
F 2 "" H 8450 4000 50  0001 C CNN
F 3 "~" H 8450 4000 50  0001 C CNN
	1    8450 4000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 CN?
U 1 1 5E9E9131
P 8450 4600
F 0 "CN?" H 8530 4592 50  0000 L CNN
F 1 "Conn_01x04" H 8530 4501 50  0000 L CNN
F 2 "" H 8450 4600 50  0001 C CNN
F 3 "~" H 8450 4600 50  0001 C CNN
	1    8450 4600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 CN?
U 1 1 5E9E9802
P 8450 5200
F 0 "CN?" H 8530 5192 50  0000 L CNN
F 1 "Conn_01x04" H 8530 5101 50  0000 L CNN
F 2 "" H 8450 5200 50  0001 C CNN
F 3 "~" H 8450 5200 50  0001 C CNN
	1    8450 5200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 CN?
U 1 1 5E9E9ED8
P 8450 5800
F 0 "CN?" H 8530 5792 50  0000 L CNN
F 1 "Conn_01x04" H 8530 5701 50  0000 L CNN
F 2 "" H 8450 5800 50  0001 C CNN
F 3 "~" H 8450 5800 50  0001 C CNN
	1    8450 5800
	1    0    0    -1  
$EndComp
Text GLabel 7550 4100 0    50   Input ~ 0
5V
Text GLabel 7550 4200 0    50   Input ~ 0
GND
Text GLabel 2600 5600 0    50   Input ~ 0
UPPER_SCL
Text GLabel 2600 5700 0    50   Input ~ 0
UPPER_SDA
Text GLabel 7550 3900 0    50   Input ~ 0
LOWER_SCL
Text GLabel 7550 4000 0    50   Input ~ 0
LOWER_SDA
Wire Wire Line
	7550 3900 8050 3900
Wire Wire Line
	7550 4000 7950 4000
Wire Wire Line
	7550 4100 7850 4100
Wire Wire Line
	7550 4200 7750 4200
Wire Wire Line
	8050 3900 8050 4500
Wire Wire Line
	8050 4500 8250 4500
Connection ~ 8050 3900
Wire Wire Line
	8050 3900 8250 3900
Wire Wire Line
	8050 4500 8050 5100
Wire Wire Line
	8050 5100 8250 5100
Connection ~ 8050 4500
Wire Wire Line
	8050 5100 8050 5700
Wire Wire Line
	8050 5700 8250 5700
Connection ~ 8050 5100
Wire Wire Line
	7950 4000 7950 4600
Wire Wire Line
	7950 4600 8250 4600
Connection ~ 7950 4000
Wire Wire Line
	7950 4000 8250 4000
Wire Wire Line
	7950 4600 7950 5200
Wire Wire Line
	7950 5200 8250 5200
Connection ~ 7950 4600
Wire Wire Line
	7950 5200 7950 5800
Wire Wire Line
	7950 5800 8250 5800
Connection ~ 7950 5200
Wire Wire Line
	8250 5900 7850 5900
Wire Wire Line
	7850 5900 7850 5300
Connection ~ 7850 4100
Wire Wire Line
	7850 4100 8250 4100
Wire Wire Line
	8250 4700 7850 4700
Connection ~ 7850 4700
Wire Wire Line
	7850 4700 7850 4100
Wire Wire Line
	8250 4800 7750 4800
Wire Wire Line
	7750 4800 7750 4200
Connection ~ 7750 4200
Wire Wire Line
	7750 4200 8250 4200
Wire Wire Line
	7750 4800 7750 5400
Wire Wire Line
	7750 6000 8250 6000
Connection ~ 7750 4800
Wire Wire Line
	8250 5300 7850 5300
Connection ~ 7850 5300
Wire Wire Line
	7850 5300 7850 4700
Wire Wire Line
	7750 5400 8250 5400
Connection ~ 7750 5400
Wire Wire Line
	7750 5400 7750 6000
$Comp
L Connector:Conn_01x02_Male CN?
U 1 1 5EA09134
P 1000 4100
F 0 "CN?" H 800 4300 50  0000 C CNN
F 1 "JP_BOOT" H 800 4200 50  0000 C CNN
F 2 "" H 1000 4100 50  0001 C CNN
F 3 "~" H 1000 4100 50  0001 C CNN
	1    1000 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 4200 1200 4400
Connection ~ 1200 4400
Wire Wire Line
	1200 4100 1200 3800
$Comp
L power:+3.3V #PWR?
U 1 1 5EA0F457
P 1200 3800
F 0 "#PWR?" H 1200 3650 50  0001 C CNN
F 1 "+3.3V" H 1215 3973 50  0000 C CNN
F 2 "" H 1200 3800 50  0001 C CNN
F 3 "" H 1200 3800 50  0001 C CNN
	1    1200 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 5900 3300 6050
Wire Wire Line
	3300 6050 3400 6050
Wire Wire Line
	3400 6050 3400 5900
Wire Wire Line
	3300 6050 3300 6250
Connection ~ 3300 6050
$Comp
L power:GND #PWR?
U 1 1 5EA1545D
P 3300 6250
F 0 "#PWR?" H 3300 6000 50  0001 C CNN
F 1 "GND" H 3305 6077 50  0000 C CNN
F 2 "" H 3300 6250 50  0001 C CNN
F 3 "" H 3300 6250 50  0001 C CNN
	1    3300 6250
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 5EA19374
P 1450 1150
F 0 "#FLG?" H 1450 1225 50  0001 C CNN
F 1 "PWR_FLAG" H 1450 1350 50  0000 C CNN
F 2 "" H 1450 1150 50  0001 C CNN
F 3 "~" H 1450 1150 50  0001 C CNN
	1    1450 1150
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5EA1B0C5
P 1450 1150
F 0 "#PWR?" H 1450 1000 50  0001 C CNN
F 1 "+3.3V" H 1465 1323 50  0000 C CNN
F 2 "" H 1450 1150 50  0001 C CNN
F 3 "" H 1450 1150 50  0001 C CNN
	1    1450 1150
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 CN?
U 1 1 5EA2EA80
P 9800 3000
F 0 "CN?" H 9880 2992 50  0000 L CNN
F 1 "Conn_01x04" H 9880 2901 50  0000 L CNN
F 2 "" H 9800 3000 50  0001 C CNN
F 3 "~" H 9800 3000 50  0001 C CNN
	1    9800 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 2900 9600 2900
Wire Wire Line
	8900 3000 9600 3000
Wire Wire Line
	8900 3100 9600 3100
Wire Wire Line
	8900 3200 9600 3200
Text GLabel 8900 3100 0    50   Input ~ 0
5V
Text GLabel 8900 3200 0    50   Input ~ 0
GND
Text GLabel 8900 2900 0    50   Input ~ 0
UPPER_SCL
Text GLabel 8900 3000 0    50   Input ~ 0
UPPER_SDA
Text GLabel 4200 4850 2    50   Input ~ 0
LOWER_SCL
Text GLabel 4200 4750 2    50   Input ~ 0
LOWER_SDA
Text GLabel 2500 3800 1    50   Input ~ 0
NRST
Text GLabel 2600 5300 0    50   Input ~ 0
SWO
Wire Wire Line
	3900 5500 4200 5500
Wire Wire Line
	4200 5600 3900 5600
Wire Wire Line
	2600 5600 2800 5600
Wire Wire Line
	2600 5300 2800 5300
Wire Wire Line
	2600 5700 2800 5700
$Comp
L power:GND #PWR?
U 1 1 5EA76301
P 4500 3900
F 0 "#PWR?" H 4500 3650 50  0001 C CNN
F 1 "GND" H 4505 3727 50  0000 C CNN
F 2 "" H 4500 3900 50  0001 C CNN
F 3 "" H 4500 3900 50  0001 C CNN
	1    4500 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 4100 2000 4000
Wire Wire Line
	2400 4000 2500 4000
Wire Wire Line
	2500 4000 2500 4200
Wire Wire Line
	2500 4200 2800 4200
Wire Wire Line
	2500 3800 2500 4000
Connection ~ 2500 4000
Wire Wire Line
	2200 4700 2650 4700
Wire Wire Line
	2650 4700 2650 4800
Wire Wire Line
	2650 4800 2800 4800
Wire Wire Line
	2800 4900 2650 4900
Wire Wire Line
	2650 4900 2650 5000
Wire Wire Line
	2650 5000 2200 5000
Wire Wire Line
	2200 5000 2000 5000
Wire Wire Line
	2000 4700 2200 4700
Connection ~ 2200 4700
$Comp
L power:GND #PWR?
U 1 1 5EAA081C
P 1600 5200
F 0 "#PWR?" H 1600 4950 50  0001 C CNN
F 1 "GND" H 1605 5027 50  0000 C CNN
F 2 "" H 1600 5200 50  0001 C CNN
F 3 "" H 1600 5200 50  0001 C CNN
	1    1600 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EAA5F74
P 1900 4700
F 0 "C?" V 1700 4600 50  0000 C CNN
F 1 "22pF" V 1800 4650 50  0000 C CNN
F 2 "" H 1900 4700 50  0001 C CNN
F 3 "~" H 1900 4700 50  0001 C CNN
	1    1900 4700
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EAA8BC5
P 1900 5000
F 0 "C?" V 1700 4900 50  0000 C CNN
F 1 "22pF" V 1800 4950 50  0000 C CNN
F 2 "" H 1900 5000 50  0001 C CNN
F 3 "~" H 1900 5000 50  0001 C CNN
	1    1900 5000
	0    1    1    0   
$EndComp
Wire Wire Line
	1600 5200 1600 5000
Wire Wire Line
	1600 4700 1800 4700
Wire Wire Line
	1800 5000 1600 5000
Connection ~ 1600 5000
Wire Wire Line
	1600 5000 1600 4700
Connection ~ 2200 5000
$Comp
L Device:CP_Small C?
U 1 1 5EAC6D30
P 2500 2600
F 0 "C?" H 2588 2646 50  0000 L CNN
F 1 "47uF" H 2588 2555 50  0000 L CNN
F 2 "" H 2500 2600 50  0001 C CNN
F 3 "~" H 2500 2600 50  0001 C CNN
	1    2500 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EAC709A
P 1600 2600
F 0 "C?" H 1300 2650 50  0000 L CNN
F 1 "??uF" H 1300 2550 50  0000 L CNN
F 2 "" H 1600 2600 50  0001 C CNN
F 3 "~" H 1600 2600 50  0001 C CNN
	1    1600 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2800 1600 2700
Wire Wire Line
	2500 2800 2500 2700
$Comp
L power:+3.3V #PWR?
U 1 1 5EAF2665
P 2500 2200
F 0 "#PWR?" H 2500 2050 50  0001 C CNN
F 1 "+3.3V" H 2515 2373 50  0000 C CNN
F 2 "" H 2500 2200 50  0001 C CNN
F 3 "" H 2500 2200 50  0001 C CNN
	1    2500 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 2200 2500 2400
Wire Wire Line
	1600 2200 1600 2400
Text GLabel 4200 4400 2    50   Input ~ 0
RXD
Text GLabel 4200 5700 2    50   Input ~ 0
TXD
Wire Wire Line
	4200 4400 3900 4400
Wire Wire Line
	3900 5700 4200 5700
Text Notes 4450 4450 0    50   ~ 0
Cross wiring (UART)
Text Notes 4450 5750 0    50   ~ 0
Cross wiring (UART)
$Comp
L Connector:Conn_01x05_Male J?
U 1 1 5EB47A21
P 5800 1700
F 0 "J?" V 5953 1413 50  0000 R CNN
F 1 "Conn_01x05_Male" V 5862 1413 50  0000 R CNN
F 2 "" H 5800 1700 50  0001 C CNN
F 3 "~" H 5800 1700 50  0001 C CNN
	1    5800 1700
	0    -1   -1   0   
$EndComp
Wire Notes Line
	6950 3700 6950 6200
Wire Notes Line
	6950 6200 9150 6200
Wire Notes Line
	9150 6200 9150 3700
Wire Notes Line
	9150 3700 6950 3700
Text Notes 6950 3600 0    50   ~ 0
GROVE connectors for connecting\n to the surrounding Ground boards.
Wire Notes Line
	9450 3700 9450 5300
Wire Notes Line
	9450 5300 10450 5300
Wire Notes Line
	10450 5300 10450 3700
Wire Notes Line
	10450 3700 9450 3700
Text Notes 9450 3600 0    50   ~ 0
Spacers for Tile board
$Comp
L power:+3.3V #PWR?
U 1 1 5EB68C43
P 4500 3300
F 0 "#PWR?" H 4500 3150 50  0001 C CNN
F 1 "+3.3V" H 4515 3473 50  0000 C CNN
F 2 "" H 4500 3300 50  0001 C CNN
F 3 "" H 4500 3300 50  0001 C CNN
	1    4500 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EB6BF5E
P 4500 3600
F 0 "C?" H 4600 3500 50  0000 C CNN
F 1 "0.1u" H 4600 3700 50  0000 C CNN
F 2 "extsui:C_1608_HandSolderingCustom" H 4500 3600 50  0001 C CNN
F 3 "~" H 4500 3600 50  0001 C CNN
	1    4500 3600
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5EB6F20B
P 4800 3600
F 0 "C?" H 4900 3500 50  0000 C CNN
F 1 "0.1u" H 4900 3700 50  0000 C CNN
F 2 "extsui:C_1608_HandSolderingCustom" H 4800 3600 50  0001 C CNN
F 3 "~" H 4800 3600 50  0001 C CNN
	1    4800 3600
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EB725E6
P 2000 4100
F 0 "#PWR?" H 2000 3850 50  0001 C CNN
F 1 "GND" H 2005 3927 50  0000 C CNN
F 2 "" H 2000 4100 50  0001 C CNN
F 3 "" H 2000 4100 50  0001 C CNN
	1    2000 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5EBC604F
P 3700 1600
F 0 "#PWR?" H 3700 1450 50  0001 C CNN
F 1 "+3.3V" H 3715 1773 50  0000 C CNN
F 2 "" H 3700 1600 50  0001 C CNN
F 3 "" H 3700 1600 50  0001 C CNN
	1    3700 1600
	1    0    0    -1  
$EndComp
Text GLabel 3700 2450 3    50   Input ~ 0
LOWER_SCL
Text GLabel 3900 2450 3    50   Input ~ 0
LOWER_SDA
$Comp
L Device:Jumper_NO_Small JP?
U 1 1 5EBD7372
P 3700 2200
F 0 "JP?" V 3700 2248 50  0000 L CNN
F 1 "Jumper_NO_Small" V 3745 2248 50  0001 L CNN
F 2 "" H 3700 2200 50  0001 C CNN
F 3 "~" H 3700 2200 50  0001 C CNN
	1    3700 2200
	0    1    1    0   
$EndComp
$Comp
L Device:Jumper_NO_Small JP?
U 1 1 5EBDA269
P 3900 2200
F 0 "JP?" V 3900 2248 50  0000 L CNN
F 1 "Jumper_NO_Small" V 3945 2248 50  0001 L CNN
F 2 "" H 3900 2200 50  0001 C CNN
F 3 "~" H 3900 2200 50  0001 C CNN
	1    3900 2200
	0    1    1    0   
$EndComp
Wire Wire Line
	3700 2450 3700 2300
Wire Wire Line
	3900 2450 3900 2300
Wire Wire Line
	3700 1600 3700 1700
Wire Wire Line
	3700 1700 3900 1700
Wire Wire Line
	3900 1700 3900 1800
Connection ~ 3700 1700
Wire Wire Line
	3700 1700 3700 1800
Wire Wire Line
	5350 5150 5350 5350
$Comp
L power:GND #PWR?
U 1 1 5EC36494
P 5350 5350
F 0 "#PWR?" H 5350 5100 50  0001 C CNN
F 1 "GND" H 5355 5177 50  0000 C CNN
F 2 "" H 5350 5350 50  0001 C CNN
F 3 "" H 5350 5350 50  0001 C CNN
	1    5350 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 5150 5150 5150
Wire Wire Line
	4200 3500 4200 3400
Wire Wire Line
	4200 3400 4500 3400
Wire Wire Line
	4800 3400 4800 3500
Wire Wire Line
	4500 3500 4500 3400
Wire Wire Line
	4200 3700 4200 3800
Wire Wire Line
	4200 3800 4500 3800
Wire Wire Line
	4800 3800 4800 3700
Wire Wire Line
	4500 3700 4500 3800
Connection ~ 4500 3400
Wire Wire Line
	4500 3400 4800 3400
Wire Wire Line
	4500 3400 4500 3300
Connection ~ 4500 3800
Wire Wire Line
	4500 3800 4800 3800
Wire Wire Line
	4500 3800 4500 3900
$EndSCHEMATC
