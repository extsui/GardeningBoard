EESchema Schematic File Version 4
LIBS:Pillar-cache
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
L extsui:DFPlayerMini U2
U 1 1 612BFF9B
P 8550 2100
F 0 "U2" H 8550 2715 50  0000 C CNN
F 1 "DFPlayerMini" H 8550 2624 50  0000 C CNN
F 2 "" H 8550 2100 50  0001 C CNN
F 3 "" H 8550 2100 50  0001 C CNN
	1    8550 2100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Micro_SD_Card_Det_Hirose_DM3AT J5
U 1 1 612D2801
P 7850 4850
F 0 "J5" H 7800 5667 50  0000 C CNN
F 1 "Micro_SD_Card_Det_Hirose_DM3AT" H 7800 5576 50  0000 C CNN
F 2 "Connector_Card:microSD_HC_Hirose_DM3AT-SF-PEJM5" H 9900 5550 50  0001 C CNN
F 3 "https://www.hirose.com/product/en/download_file/key_name/DM3/category/Catalog/doc_file_id/49662/?file_category_id=4&item_id=195&is_series=1" H 7850 4950 50  0001 C CNN
	1    7850 4850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J2
U 1 1 612D2B60
P 4150 4250
F 0 "J2" H 4200 4250 50  0000 L CNN
F 1 "OLED_128x64_IIC" H 4177 4135 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 4150 4250 50  0001 C CNN
F 3 "~" H 4150 4250 50  0001 C CNN
	1    4150 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 4250 3850 4250
Text GLabel 3850 4250 0    50   Input ~ 0
3V3
Wire Wire Line
	3950 4150 3500 4150
Wire Wire Line
	3950 4450 3850 4450
Wire Wire Line
	3950 4350 3850 4350
Text GLabel 3850 4350 0    50   Input ~ 0
SCL
Text GLabel 3850 4450 0    50   Input ~ 0
SDA
$Comp
L Connector:USB_A J1
U 1 1 6132AE34
P 1650 3750
F 0 "J1" H 1705 4217 50  0000 C CNN
F 1 "USB_A" H 1705 4126 50  0000 C CNN
F 2 "OPL_Connector:USB4+2P-2.0-90D" H 1800 3700 50  0001 C CNN
F 3 " ~" H 1800 3700 50  0001 C CNN
	1    1650 3750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 CN1
U 1 1 61333D2B
P 1650 5500
F 0 "CN1" H 1600 5850 50  0000 L CNN
F 1 "GROVE_IIC_5V" H 1550 5750 50  0000 L CNN
F 2 "OPL_Connector:HW4-2.0-90D" H 1650 5500 50  0001 C CNN
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
F 2 "OPL_Connector:HW4-2.0-90D" H 1650 6450 50  0001 C CNN
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
L Connector:AudioJack2_Ground J4
U 1 1 61395BDD
P 8000 3000
F 0 "J4" H 7820 3020 50  0000 R CNN
F 1 "AudioJack2_Ground" H 7820 2929 50  0000 R CNN
F 2 "Connector_Audio:Jack_3.5mm_Ledino_KB3SPRS_Horizontal" H 8000 3000 50  0001 C CNN
F 3 "~" H 8000 3000 50  0001 C CNN
	1    8000 3000
	-1   0    0    -1  
$EndComp
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
NoConn ~ 9100 1750
NoConn ~ 9100 1850
NoConn ~ 9100 1950
NoConn ~ 9100 2050
NoConn ~ 9100 2150
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 614CB335
P 7150 2350
F 0 "J3" H 7250 2200 50  0000 C CNN
F 1 "Speaker" H 7250 2100 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7150 2350 50  0001 C CNN
F 3 "~" H 7150 2350 50  0001 C CNN
	1    7150 2350
	1    0    0    -1  
$EndComp
NoConn ~ 9100 2250
NoConn ~ 9100 2450
Wire Wire Line
	9100 2350 9200 2350
Wire Wire Line
	9200 2350 9200 2450
$Comp
L power:GND #PWR0102
U 1 1 614D1CAB
P 9200 2450
F 0 "#PWR0102" H 9200 2200 50  0001 C CNN
F 1 "GND" H 9205 2277 50  0000 C CNN
F 2 "" H 9200 2450 50  0001 C CNN
F 3 "" H 9200 2450 50  0001 C CNN
	1    9200 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 614D3EF4
P 9350 1900
F 0 "C1" H 9468 1946 50  0000 L CNN
F 1 "100u" H 9468 1855 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 9388 1750 50  0001 C CNN
F 3 "~" H 9350 1900 50  0001 C CNN
	1    9350 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 2350 8000 2350
Wire Wire Line
	7900 2350 7900 2500
$Comp
L power:GND #PWR0103
U 1 1 614E390C
P 7900 2500
F 0 "#PWR0103" H 7900 2250 50  0001 C CNN
F 1 "GND" H 7905 2327 50  0000 C CNN
F 2 "" H 7900 2500 50  0001 C CNN
F 3 "" H 7900 2500 50  0001 C CNN
	1    7900 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 1550 7900 1750
Wire Wire Line
	7900 1750 8000 1750
Wire Wire Line
	8000 1850 7650 1850
Wire Wire Line
	8000 1950 7650 1950
$Comp
L Device:R R6
U 1 1 614FC897
P 7500 1850
F 0 "R6" V 7400 1800 50  0000 L CNN
F 1 "1k" V 7500 1800 50  0000 L CNN
F 2 "extsui:C_1608_HandSolderingCustom" V 7430 1850 50  0001 C CNN
F 3 "~" H 7500 1850 50  0001 C CNN
	1    7500 1850
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 615013D5
P 7500 1950
F 0 "R7" V 7600 1900 50  0000 L CNN
F 1 "1k" V 7500 1900 50  0000 L CNN
F 2 "extsui:C_1608_HandSolderingCustom" V 7430 1950 50  0001 C CNN
F 3 "~" H 7500 1950 50  0001 C CNN
	1    7500 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	5850 1900 5850 2050
Wire Wire Line
	5850 2050 5700 2050
Wire Wire Line
	6100 1950 6100 2250
Wire Wire Line
	6100 2250 5700 2250
$Comp
L power:GND #PWR0104
U 1 1 6152DD53
P 6450 2350
F 0 "#PWR0104" H 6450 2100 50  0001 C CNN
F 1 "GND" H 6455 2177 50  0000 C CNN
F 2 "" H 6450 2350 50  0001 C CNN
F 3 "" H 6450 2350 50  0001 C CNN
	1    6450 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 2150 6450 2150
Wire Wire Line
	6450 2150 6450 2350
Text GLabel 7200 1850 0    50   Input ~ 0
TXD
Text GLabel 7200 1950 0    50   Input ~ 0
RXD
Wire Wire Line
	7350 1850 7200 1850
Wire Wire Line
	7350 1950 7200 1950
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
F 2 "extsui:C_1608_HandSolderingCustom" V 3080 2000 50  0001 C CNN
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
F 2 "extsui:C_1608_HandSolderingCustom" V 3230 2000 50  0001 C CNN
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
$Comp
L power:GND #PWR0105
U 1 1 61591E5A
P 8000 3200
F 0 "#PWR0105" H 8000 2950 50  0001 C CNN
F 1 "GND" H 8005 3027 50  0000 C CNN
F 2 "" H 8000 3200 50  0001 C CNN
F 3 "" H 8000 3200 50  0001 C CNN
	1    8000 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 2250 8000 2250
Wire Wire Line
	7350 2450 8000 2450
Wire Wire Line
	8000 2050 7600 2050
Wire Wire Line
	7600 2050 7600 2900
Wire Wire Line
	7600 2900 7800 2900
Wire Wire Line
	8000 2150 7700 2150
Wire Wire Line
	7700 2150 7700 3000
Wire Wire Line
	7700 3000 7800 3000
Wire Wire Line
	7350 2250 7350 2350
Wire Wire Line
	9350 2050 9350 2350
Wire Wire Line
	9350 2350 9200 2350
Connection ~ 9200 2350
NoConn ~ 6950 4450
NoConn ~ 6950 5350
NoConn ~ 6950 5250
Wire Wire Line
	6950 4750 6750 4750
Wire Wire Line
	6950 4950 6750 4950
Wire Wire Line
	6750 4950 6750 5650
$Comp
L power:GND #PWR0106
U 1 1 6167BAAF
P 6750 5750
F 0 "#PWR0106" H 6750 5500 50  0001 C CNN
F 1 "GND" H 6755 5577 50  0000 C CNN
F 2 "" H 6750 5750 50  0001 C CNN
F 3 "" H 6750 5750 50  0001 C CNN
	1    6750 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 5350 8650 5650
Wire Wire Line
	8650 5650 6750 5650
Wire Wire Line
	6750 5750 6750 5650
Connection ~ 6750 5650
$Comp
L Device:R R5
U 1 1 61694FDA
P 6500 4100
F 0 "R5" V 6450 3900 50  0000 C CNN
F 1 "4.7k" V 6500 4100 50  0000 C CNN
F 2 "extsui:C_1608_HandSolderingCustom" V 6430 4100 50  0001 C CNN
F 3 "~" H 6500 4100 50  0001 C CNN
	1    6500 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 5050 6500 5050
NoConn ~ 6950 5150
Text GLabel 5950 4650 0    50   Input ~ 0
MOSI
Text GLabel 5950 5050 0    50   Input ~ 0
MISO
Text GLabel 3750 2250 0    50   Input ~ 0
CS
Text GLabel 5950 4850 0    50   Input ~ 0
SCK
Wire Wire Line
	5950 4850 6950 4850
Wire Wire Line
	5950 4650 6350 4650
Wire Wire Line
	5950 4550 6200 4550
$Comp
L Device:R R3
U 1 1 616E51A2
P 6200 4100
F 0 "R3" V 6150 3900 50  0000 C CNN
F 1 "4.7k" V 6200 4100 50  0000 C CNN
F 2 "extsui:C_1608_HandSolderingCustom" V 6130 4100 50  0001 C CNN
F 3 "~" H 6200 4100 50  0001 C CNN
	1    6200 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 616E99B5
P 6350 4100
F 0 "R4" V 6300 3900 50  0000 C CNN
F 1 "4.7k" V 6350 4100 50  0000 C CNN
F 2 "extsui:C_1608_HandSolderingCustom" V 6280 4100 50  0001 C CNN
F 3 "~" H 6350 4100 50  0001 C CNN
	1    6350 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 3750 6200 3850
Wire Wire Line
	6200 3850 6350 3850
Wire Wire Line
	6350 3850 6350 3950
Connection ~ 6200 3850
Wire Wire Line
	6200 3850 6200 3950
Wire Wire Line
	6350 3850 6500 3850
Wire Wire Line
	6500 3850 6500 3950
Connection ~ 6350 3850
Wire Wire Line
	6200 4250 6200 4550
Connection ~ 6200 4550
Wire Wire Line
	6200 4550 6950 4550
Wire Wire Line
	6350 4250 6350 4650
Wire Wire Line
	6500 4250 6500 5050
Connection ~ 6500 5050
Wire Wire Line
	6500 5050 5950 5050
Connection ~ 6350 4650
Wire Wire Line
	6350 4650 6950 4650
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
Text GLabel 5850 1900 1    50   Input ~ 0
5V
Text GLabel 3150 1600 1    50   Input ~ 0
3V3
Text GLabel 6100 1950 1    50   Input ~ 0
3V3
Text GLabel 7900 1550 1    50   Input ~ 0
5V
Text GLabel 9350 1550 1    50   Input ~ 0
5V
Wire Wire Line
	9350 1550 9350 1750
Text GLabel 6200 3750 1    50   Input ~ 0
3V3
Wire Wire Line
	6750 4750 6750 3850
Wire Wire Line
	6750 3850 6500 3850
Connection ~ 6500 3850
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
Text GLabel 5950 4550 0    50   Input ~ 0
CS
Wire Wire Line
	3500 2350 3900 2350
Text GLabel 2050 3550 2    50   Input ~ 0
5V
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
L power:GND #PWR0111
U 1 1 6190FDCB
P 3500 4250
F 0 "#PWR0111" H 3500 4000 50  0001 C CNN
F 1 "GND" H 3505 4077 50  0000 C CNN
F 2 "" H 3500 4250 50  0001 C CNN
F 3 "" H 3500 4250 50  0001 C CNN
	1    3500 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 4250 3500 4150
$Comp
L power:GND #PWR0112
U 1 1 619357D2
P 1650 4350
F 0 "#PWR0112" H 1650 4100 50  0001 C CNN
F 1 "GND" H 1655 4177 50  0000 C CNN
F 2 "" H 1650 4350 50  0001 C CNN
F 3 "" H 1650 4350 50  0001 C CNN
	1    1650 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 4150 1550 4250
Wire Wire Line
	1550 4250 1650 4250
Wire Wire Line
	1650 4150 1650 4250
Connection ~ 1650 4250
Wire Wire Line
	1650 4250 1650 4350
Wire Wire Line
	1950 3550 2050 3550
NoConn ~ 1950 3750
NoConn ~ 1950 3850
$Comp
L Device:R_POT_Dual RV1
U 1 1 612D6439
P 3400 5650
F 0 "RV1" H 3400 5400 50  0000 C CNN
F 1 "BRIGHTNESS" H 3400 5300 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Alps_RK097_Dual_Horizontal" H 3650 5575 50  0001 C CNN
F 3 "~" H 3650 5575 50  0001 C CNN
	1    3400 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT_Dual RV2
U 1 1 612D661F
P 4750 5650
F 0 "RV2" H 4750 5400 50  0000 C CNN
F 1 "MP3_VOLUME" H 4750 5300 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Alps_RK097_Dual_Horizontal" H 5000 5575 50  0001 C CNN
F 3 "~" H 5000 5575 50  0001 C CNN
	1    4750 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 2350 3500 3150
$Comp
L Switch:SW_Push_Dual SW1
U 1 1 61387757
P 3700 3150
F 0 "SW1" H 3700 3435 50  0000 C CNN
F 1 "MODE" H 3700 3344 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H8mm" H 3700 3350 50  0001 C CNN
F 3 "" H 3700 3350 50  0001 C CNN
	1    3700 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3150 3500 3350
Connection ~ 3500 3150
Wire Wire Line
	3900 3350 3900 3150
Wire Wire Line
	3900 3350 3900 3500
Connection ~ 3900 3350
$Comp
L power:GND #PWR0113
U 1 1 612EFE67
P 3900 3500
F 0 "#PWR0113" H 3900 3250 50  0001 C CNN
F 1 "GND" H 3905 3327 50  0000 C CNN
F 2 "" H 3900 3500 50  0001 C CNN
F 3 "" H 3900 3500 50  0001 C CNN
	1    3900 3500
	1    0    0    -1  
$EndComp
Text Notes 2750 3200 0    50   ~ 0
Require internal\n  input-pullup.
$Comp
L power:GND #PWR0114
U 1 1 612FA899
P 2950 5800
F 0 "#PWR0114" H 2950 5550 50  0001 C CNN
F 1 "GND" H 2955 5627 50  0000 C CNN
F 2 "" H 2950 5800 50  0001 C CNN
F 3 "" H 2950 5800 50  0001 C CNN
	1    2950 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 5750 3000 5750
$Comp
L power:GND #PWR0115
U 1 1 61307FF9
P 4300 5800
F 0 "#PWR0115" H 4300 5550 50  0001 C CNN
F 1 "GND" H 4305 5627 50  0000 C CNN
F 2 "" H 4300 5800 50  0001 C CNN
F 3 "" H 4300 5800 50  0001 C CNN
	1    4300 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 5800 4300 5750
Wire Wire Line
	4300 5750 4350 5750
Text GLabel 3750 2050 0    50   Input ~ 0
RV_B
Text GLabel 3750 2150 0    50   Input ~ 0
RV_V
Wire Wire Line
	3750 2050 3900 2050
Wire Wire Line
	3750 2150 3900 2150
Text GLabel 3150 5450 1    50   Input ~ 0
RV_B
Text GLabel 4500 5450 1    50   Input ~ 0
RV_V
Wire Wire Line
	2950 5750 2950 5800
NoConn ~ 3500 5750
NoConn ~ 3800 5750
NoConn ~ 3650 5550
NoConn ~ 5000 5550
NoConn ~ 4850 5750
NoConn ~ 5150 5750
Wire Wire Line
	4500 5450 4500 5550
Wire Wire Line
	3150 5550 3150 5450
Wire Wire Line
	3350 5450 3350 5750
Text GLabel 3350 5450 1    50   Input ~ 0
3V3
Wire Wire Line
	3300 5750 3350 5750
Wire Wire Line
	4650 5750 4700 5750
Wire Wire Line
	4700 5750 4700 5450
Text GLabel 4700 5450 1    50   Input ~ 0
3V3
$Comp
L extsui:SeeeduinoXIAO U1
U 1 1 613BB9DE
P 4800 2350
F 0 "U1" H 4800 2915 50  0000 C CNN
F 1 "SeeeduinoXIAO" H 4800 2824 50  0000 C CNN
F 2 "" H 4750 2450 50  0001 C CNN
F 3 "" H 4750 2450 50  0001 C CNN
	1    4800 2350
	1    0    0    -1  
$EndComp
$EndSCHEMATC
