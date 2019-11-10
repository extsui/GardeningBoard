EESchema Schematic File Version 4
LIBS:Base-cache
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
$Comp
L Connector_Generic:Conn_01x04 J1
U 1 1 5C711B3C
P 2900 1400
F 0 "J1" V 2800 2050 50  0000 R CNN
F 1 "Conn_01x04" V 2900 2050 50  0000 R CNN
F 2 "Connector:NS-Tech_Grove_1x04_P2mm_Vertical" H 2900 1400 50  0001 C CNN
F 3 "~" H 2900 1400 50  0001 C CNN
	1    2900 1400
	0    -1   1    0   
$EndComp
Text GLabel 3000 1100 1    50   Input ~ 0
+5V
Text GLabel 2800 1100 1    50   Input ~ 0
SCL
Text GLabel 2900 1100 1    50   Input ~ 0
SDA
Text GLabel 3100 1100 1    50   Input ~ 0
GND
Text Notes 2700 1600 0    50   ~ 0
GROVE Connector
$Comp
L Connector_Generic:Conn_01x05 J4
U 1 1 5DC80660
P 3000 4600
F 0 "J4" V 2900 5250 50  0000 L CNN
F 1 "Conn_01x05" V 3000 4900 50  0000 L CNN
F 2 "extsui:CONN_CARD_EDGE_395-010-521-201" H 3000 4600 50  0001 C CNN
F 3 "~" H 3000 4600 50  0001 C CNN
	1    3000 4600
	0    -1   1    0   
$EndComp
NoConn ~ 3100 4400
Wire Wire Line
	3200 4400 3200 4300
Wire Wire Line
	2800 1100 2800 1200
Wire Wire Line
	2900 1200 2900 1100
Wire Wire Line
	3000 1100 3000 1200
Wire Wire Line
	3100 1200 3100 1100
$Comp
L Connector_Generic:Conn_01x05 J3
U 1 1 5DC813DF
P 4500 3700
F 0 "J3" V 4400 3300 50  0000 L CNN
F 1 "Conn_01x05" V 4500 2950 50  0000 L CNN
F 2 "extsui:CONN_CARD_EDGE_395-010-521-201" H 4500 3700 50  0001 C CNN
F 3 "~" H 4500 3700 50  0001 C CNN
	1    4500 3700
	0    -1   1    0   
$EndComp
NoConn ~ 4600 3500
$Comp
L Connector_Generic:Conn_01x05 J2
U 1 1 5DC8154E
P 3000 2900
F 0 "J2" V 2900 3550 50  0000 L CNN
F 1 "Conn_01x05" V 3000 3200 50  0000 L CNN
F 2 "extsui:CONN_CARD_EDGE_395-010-521-201" H 3000 2900 50  0001 C CNN
F 3 "~" H 3000 2900 50  0001 C CNN
	1    3000 2900
	0    -1   1    0   
$EndComp
Text GLabel 2800 2100 1    50   Input ~ 0
+5V
Text GLabel 2900 2100 1    50   Input ~ 0
SDA
Text GLabel 3000 2100 1    50   Input ~ 0
SCL
Text GLabel 3200 2100 1    50   Input ~ 0
GND
NoConn ~ 3100 2700
Wire Wire Line
	2800 2700 2800 2300
Wire Wire Line
	2900 2100 2900 2400
Wire Wire Line
	3000 2700 3000 2500
Wire Wire Line
	3200 2700 3200 2600
Wire Wire Line
	3900 2600 3900 3400
Wire Wire Line
	2800 4000 3600 4000
Wire Wire Line
	2800 4000 2800 4400
Wire Wire Line
	2900 4100 3700 4100
Wire Wire Line
	2900 4100 2900 4400
Wire Wire Line
	3700 4100 3700 3200
Wire Wire Line
	3000 4200 3800 4200
Wire Wire Line
	3000 4200 3000 4400
Wire Wire Line
	3800 4200 3800 3300
Wire Wire Line
	3200 4300 3900 4300
Wire Wire Line
	4300 3100 3600 3100
Wire Wire Line
	4300 3100 4300 3500
Connection ~ 3600 3100
Wire Wire Line
	3600 3100 3600 4000
Wire Wire Line
	3700 3200 4400 3200
Wire Wire Line
	4400 3200 4400 3500
Connection ~ 3700 3200
Wire Wire Line
	3800 3300 4500 3300
Wire Wire Line
	4500 3300 4500 3500
Connection ~ 3800 3300
Wire Wire Line
	3900 3400 4700 3400
Wire Wire Line
	4700 3400 4700 3500
Connection ~ 3900 3400
Wire Wire Line
	3900 3400 3900 4300
Wire Wire Line
	3600 2300 2800 2300
Wire Wire Line
	3600 2300 3600 3100
Connection ~ 2800 2300
Wire Wire Line
	2800 2300 2800 2100
Wire Wire Line
	2900 2400 3700 2400
Wire Wire Line
	3700 2400 3700 3200
Connection ~ 2900 2400
Wire Wire Line
	2900 2400 2900 2700
Wire Wire Line
	3800 2500 3000 2500
Wire Wire Line
	3800 2500 3800 3300
Connection ~ 3000 2500
Wire Wire Line
	3000 2500 3000 2100
Wire Wire Line
	3200 2600 3900 2600
Connection ~ 3200 2600
Wire Wire Line
	3200 2600 3200 2100
Text Notes 2700 3200 0    50   ~ 0
Card Edge \nConnector 5-pin
Text Notes 2700 4900 0    50   ~ 0
Card Edge \nConnector 5-pin
Text Notes 4200 4000 0    50   ~ 0
Card Edge \nConnector 5-pin
$Comp
L power:+5V #PWR0101
U 1 1 5DC92BFA
P 1900 2100
F 0 "#PWR0101" H 1900 1950 50  0001 C CNN
F 1 "+5V" H 1915 2273 50  0000 C CNN
F 2 "" H 1900 2100 50  0001 C CNN
F 3 "" H 1900 2100 50  0001 C CNN
	1    1900 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5DC92C00
P 1900 2800
F 0 "#PWR0102" H 1900 2550 50  0001 C CNN
F 1 "GND" H 1905 2627 50  0000 C CNN
F 2 "" H 1900 2800 50  0001 C CNN
F 3 "" H 1900 2800 50  0001 C CNN
	1    1900 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 2800 1900 2600
Wire Wire Line
	3200 2600 1900 2600
Wire Wire Line
	2800 2300 1900 2300
Connection ~ 1900 2600
Wire Wire Line
	1900 2550 1900 2600
Wire Wire Line
	1900 2100 1900 2300
Wire Wire Line
	1900 2300 1900 2350
Connection ~ 1900 2300
$Comp
L Device:CP_Small C1
U 1 1 5DCA65A2
P 1900 2450
F 0 "C1" H 1988 2496 50  0000 L CNN
F 1 "10u" H 1988 2405 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 1900 2450 50  0001 C CNN
F 3 "~" H 1900 2450 50  0001 C CNN
	1    1900 2450
	1    0    0    -1  
$EndComp
$EndSCHEMATC
