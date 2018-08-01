EESchema Schematic File Version 4
LIBS:StrangerFamily-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "15 nov 2012"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x13_Odd_Even P1
U 1 1 50A55ABA
P 2400 1800
F 0 "P1" H 2400 2500 60  0000 C CNN
F 1 "CONN_13X2" V 2450 1850 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x13_P2.54mm_Vertical" H 2200 1100 30  0001 C CNN
F 3 "" H 2400 1800 60  0001 C CNN
	1    2400 1800
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR01
U 1 1 50A55B18
P 2100 1050
F 0 "#PWR01" H 2100 900 50  0001 C CNN
F 1 "+3.3V" H 2100 1190 50  0000 C CNN
F 2 "" H 2100 1050 50  0000 C CNN
F 3 "" H 2100 1050 50  0000 C CNN
	1    2100 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 1050 2100 1200
Wire Wire Line
	2100 1200 2200 1200
$Comp
L power:+5V #PWR02
U 1 1 50A55B2E
P 2800 1050
F 0 "#PWR02" H 2800 900 50  0001 C CNN
F 1 "+5V" H 2800 1190 50  0000 C CNN
F 2 "" H 2800 1050 50  0000 C CNN
F 3 "" H 2800 1050 50  0000 C CNN
	1    2800 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 1050 2800 1200
Wire Wire Line
	2800 1200 2700 1200
Wire Wire Line
	2200 1300 1450 1300
Wire Wire Line
	2200 1400 1450 1400
Text Label 1450 1300 0    60   ~ 0
GPIO0(SDA)
Text Label 1450 1400 0    60   ~ 0
GPIO1(SCL)
Wire Wire Line
	2200 1500 1450 1500
Text Label 1450 1500 0    60   ~ 0
GPIO4
Wire Wire Line
	2200 1700 1450 1700
Wire Wire Line
	2200 1800 1450 1800
Wire Wire Line
	2200 1900 1450 1900
Text Label 1450 1700 0    60   ~ 0
GPIO17
Text Label 1450 1800 0    60   ~ 0
GPIO21
Text Label 1450 1900 0    60   ~ 0
GPIO22
Wire Wire Line
	2200 2100 1450 2100
Wire Wire Line
	2200 2200 1450 2200
Wire Wire Line
	2200 2300 1450 2300
Text Label 1450 2100 0    60   ~ 0
GPIO10(MOSI)
Text Label 1450 2200 0    60   ~ 0
GPIO9(MISO)
Text Label 1450 2300 0    60   ~ 0
GPIO11(SCLK)
$Comp
L power:GND #PWR03
U 1 1 50A55C3F
P 2700 1400
F 0 "#PWR03" H 2700 1150 50  0001 C CNN
F 1 "GND" V 2700 1200 50  0000 C CNN
F 2 "" H 2700 1400 50  0000 C CNN
F 3 "" H 2700 1400 50  0000 C CNN
	1    2700 1400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2700 1500 3400 1500
Wire Wire Line
	2700 1600 3400 1600
Text Label 3400 1500 2    60   ~ 0
TXD
Text Label 3400 1600 2    60   ~ 0
RXD
Text Label 3400 1700 2    60   ~ 0
GPIO18
Wire Wire Line
	2700 1900 3400 1900
Wire Wire Line
	2700 2000 3400 2000
Text Label 3400 1900 2    60   ~ 0
GPIO23
Text Label 3400 2000 2    60   ~ 0
GPIO24
Wire Wire Line
	2700 2200 3400 2200
Text Label 3400 2200 2    60   ~ 0
GPIO25
Wire Wire Line
	2700 2300 3400 2300
Wire Wire Line
	2700 2400 3400 2400
Text Label 3400 2300 2    60   ~ 0
GPIO8(CE0)
Text Label 3400 2400 2    60   ~ 0
GPIO7(CE1)
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 5B617D4C
P 6100 1200
F 0 "J2" V 6100 1050 50  0000 R CNN
F 1 "Power_LEDs" V 6200 1150 50  0000 C CNN
F 2 "Connector_Phoenix_GMSTB:PhoenixContact_GMSTBA_2,5_2-G_1x02_P7.50mm_Horizontal" H 6100 1200 50  0001 C CNN
F 3 "~" H 6100 1200 50  0001 C CNN
	1    6100 1200
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5B617F07
P 5400 1200
F 0 "J1" V 5400 1050 50  0000 R CNN
F 1 "Power_Raspi" V 5500 1150 50  0000 C CNN
F 2 "" H 5400 1200 50  0001 C CNN
F 3 "~" H 5400 1200 50  0001 C CNN
	1    5400 1200
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J3
U 1 1 5B618089
P 7850 2300
F 0 "J3" H 7800 2500 50  0000 L CNN
F 1 "Output_LEDs" V 7950 2250 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S03B-XH-A-1_1x03_P2.50mm_Horizontal" H 7850 2300 50  0001 C CNN
F 3 "~" H 7850 2300 50  0001 C CNN
	1    7850 2300
	0    -1   -1   0   
$EndComp
$Comp
L Logic_LevelTranslator:TXB0104PW U1
U 1 1 5B61A231
P 6000 3300
F 0 "U1" H 5750 2650 50  0000 C CNN
F 1 "TXB0104PW" H 6250 2650 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 6000 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/txb0104.pdf" H 6110 3395 50  0001 C CNN
	1    6000 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5B61A491
P 5400 1400
F 0 "#PWR04" H 5400 1150 50  0001 C CNN
F 1 "GND" H 5405 1227 50  0000 C CNN
F 2 "" H 5400 1400 50  0001 C CNN
F 3 "" H 5400 1400 50  0001 C CNN
	1    5400 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5B61A4D2
P 6100 1400
F 0 "#PWR010" H 6100 1150 50  0001 C CNN
F 1 "GND" H 6105 1227 50  0000 C CNN
F 2 "" H 6100 1400 50  0001 C CNN
F 3 "" H 6100 1400 50  0001 C CNN
	1    6100 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5B61A648
P 6000 4000
F 0 "#PWR09" H 6000 3750 50  0001 C CNN
F 1 "GND" H 6005 3827 50  0000 C CNN
F 2 "" H 6000 4000 50  0001 C CNN
F 3 "" H 6000 4000 50  0001 C CNN
	1    6000 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5B61AED1
P 7750 2500
F 0 "#PWR014" H 7750 2250 50  0001 C CNN
F 1 "GND" H 7755 2327 50  0000 C CNN
F 2 "" H 7750 2500 50  0001 C CNN
F 3 "" H 7750 2500 50  0001 C CNN
	1    7750 2500
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR012
U 1 1 5B61B331
P 6200 1400
F 0 "#PWR012" H 6200 1250 50  0001 C CNN
F 1 "VDD" V 6217 1528 50  0000 L CNN
F 2 "" H 6200 1400 50  0001 C CNN
F 3 "" H 6200 1400 50  0001 C CNN
	1    6200 1400
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR05
U 1 1 5B61B390
P 5500 1400
F 0 "#PWR05" H 5500 1250 50  0001 C CNN
F 1 "VCC" V 5517 1528 50  0000 L CNN
F 2 "" H 5500 1400 50  0001 C CNN
F 3 "" H 5500 1400 50  0001 C CNN
	1    5500 1400
	0    1    1    0   
$EndComp
$Comp
L power:VDD #PWR011
U 1 1 5B61B439
P 6100 2600
F 0 "#PWR011" H 6100 2450 50  0001 C CNN
F 1 "VDD" H 6100 2750 50  0000 C CNN
F 2 "" H 6100 2600 50  0001 C CNN
F 3 "" H 6100 2600 50  0001 C CNN
	1    6100 2600
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR08
U 1 1 5B61B47A
P 5900 2600
F 0 "#PWR08" H 5900 2450 50  0001 C CNN
F 1 "VCC" H 5900 2750 50  0000 C CNN
F 2 "" H 5900 2600 50  0001 C CNN
F 3 "" H 5900 2600 50  0001 C CNN
	1    5900 2600
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR015
U 1 1 5B61B5CB
P 7950 2500
F 0 "#PWR015" H 7950 2350 50  0001 C CNN
F 1 "VDD" H 7968 2673 50  0000 C CNN
F 2 "" H 7950 2500 50  0001 C CNN
F 3 "" H 7950 2500 50  0001 C CNN
	1    7950 2500
	-1   0    0    1   
$EndComp
Wire Wire Line
	7850 2500 7850 3000
Wire Wire Line
	7850 3000 6400 3000
Text Label 3600 1700 0    50   ~ 0
PWM0
Wire Wire Line
	2700 1700 3600 1700
Text Label 5600 3000 2    50   ~ 0
PWM0
NoConn ~ 6400 3200
NoConn ~ 6400 3400
NoConn ~ 6400 3600
NoConn ~ 5600 3600
NoConn ~ 5600 3400
NoConn ~ 5600 3200
$Comp
L Device:C_Small C1
U 1 1 5B61D30C
P 5600 2600
F 0 "C1" V 5500 2600 50  0000 C CNN
F 1 "100n" V 5700 2600 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5600 2600 50  0001 C CNN
F 3 "~" H 5600 2600 50  0001 C CNN
	1    5600 2600
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5B61D3BE
P 5500 2600
F 0 "#PWR06" H 5500 2350 50  0001 C CNN
F 1 "GND" V 5505 2472 50  0000 R CNN
F 2 "" H 5500 2600 50  0001 C CNN
F 3 "" H 5500 2600 50  0001 C CNN
	1    5500 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	5700 2600 5900 2600
Connection ~ 5900 2600
$Comp
L Device:C_Small C2
U 1 1 5B62537A
P 6400 2600
F 0 "C2" V 6500 2600 50  0000 C CNN
F 1 "100n" V 6300 2600 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6400 2600 50  0001 C CNN
F 3 "~" H 6400 2600 50  0001 C CNN
	1    6400 2600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5B625380
P 6500 2600
F 0 "#PWR013" H 6500 2350 50  0001 C CNN
F 1 "GND" V 6505 2472 50  0000 R CNN
F 2 "" H 6500 2600 50  0001 C CNN
F 3 "" H 6500 2600 50  0001 C CNN
	1    6500 2600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6100 2600 6300 2600
Connection ~ 6100 2600
$Comp
L power:VCC #PWR0101
U 1 1 5B62655C
P 5600 2800
F 0 "#PWR0101" H 5600 2650 50  0001 C CNN
F 1 "VCC" V 5600 3000 50  0000 C CNN
F 2 "" H 5600 2800 50  0001 C CNN
F 3 "" H 5600 2800 50  0001 C CNN
	1    5600 2800
	0    -1   -1   0   
$EndComp
$Comp
L power:VCC #PWR0102
U 1 1 5B626762
P 2100 1050
F 0 "#PWR0102" H 2100 900 50  0001 C CNN
F 1 "VCC" V 2100 1250 50  0000 C CNN
F 2 "" H 2100 1050 50  0001 C CNN
F 3 "" H 2100 1050 50  0001 C CNN
	1    2100 1050
	0    -1   -1   0   
$EndComp
Connection ~ 2100 1050
$Comp
L Device:C C3
U 1 1 5B6268EF
P 3300 900
F 0 "C3" H 3200 1000 50  0000 L CNN
F 1 "10u" H 3300 1000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3338 750 50  0001 C CNN
F 3 "~" H 3300 900 50  0001 C CNN
	1    3300 900 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5B62696B
P 3550 900
F 0 "C4" H 3450 1000 50  0000 L CNN
F 1 "10u" H 3550 1000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3588 750 50  0001 C CNN
F 3 "~" H 3550 900 50  0001 C CNN
	1    3550 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 750  3550 750 
Wire Wire Line
	3300 1050 3550 1050
$Comp
L power:+5V #PWR0103
U 1 1 5B6272E8
P 3300 750
F 0 "#PWR0103" H 3300 600 50  0001 C CNN
F 1 "+5V" H 3315 923 50  0000 C CNN
F 2 "" H 3300 750 50  0001 C CNN
F 3 "" H 3300 750 50  0001 C CNN
	1    3300 750 
	1    0    0    -1  
$EndComp
Connection ~ 3300 750 
$Comp
L power:GND #PWR0104
U 1 1 5B627331
P 3300 1050
F 0 "#PWR0104" H 3300 800 50  0001 C CNN
F 1 "GND" H 3305 877 50  0000 C CNN
F 2 "" H 3300 1050 50  0001 C CNN
F 3 "" H 3300 1050 50  0001 C CNN
	1    3300 1050
	1    0    0    -1  
$EndComp
Connection ~ 3300 1050
$Comp
L power:GND #PWR0105
U 1 1 5B6279D5
P 2700 1800
F 0 "#PWR0105" H 2700 1550 50  0001 C CNN
F 1 "GND" V 2700 1600 50  0000 C CNN
F 2 "" H 2700 1800 50  0000 C CNN
F 3 "" H 2700 1800 50  0000 C CNN
	1    2700 1800
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5B6279F2
P 2700 2100
F 0 "#PWR0106" H 2700 1850 50  0001 C CNN
F 1 "GND" V 2700 1900 50  0000 C CNN
F 2 "" H 2700 2100 50  0000 C CNN
F 3 "" H 2700 2100 50  0000 C CNN
	1    2700 2100
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5B627A0F
P 2200 2400
F 0 "#PWR0107" H 2200 2150 50  0001 C CNN
F 1 "GND" V 2200 2200 50  0000 C CNN
F 2 "" H 2200 2400 50  0000 C CNN
F 3 "" H 2200 2400 50  0000 C CNN
	1    2200 2400
	0    1    1    0   
$EndComp
$Comp
L power:+3V3 #PWR0108
U 1 1 5B627A7D
P 2200 2000
F 0 "#PWR0108" H 2200 1850 50  0001 C CNN
F 1 "+3.3V" V 2200 2200 50  0000 C CNN
F 2 "" H 2200 2000 50  0000 C CNN
F 3 "" H 2200 2000 50  0000 C CNN
	1    2200 2000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5B627C16
P 2200 1600
F 0 "#PWR0109" H 2200 1350 50  0001 C CNN
F 1 "GND" V 2200 1400 50  0000 C CNN
F 2 "" H 2200 1600 50  0000 C CNN
F 3 "" H 2200 1600 50  0000 C CNN
	1    2200 1600
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0110
U 1 1 5B627DC3
P 2700 1300
F 0 "#PWR0110" H 2700 1150 50  0001 C CNN
F 1 "+5V" V 2700 1500 50  0000 C CNN
F 2 "" H 2700 1300 50  0000 C CNN
F 3 "" H 2700 1300 50  0000 C CNN
	1    2700 1300
	0    1    1    0   
$EndComp
NoConn ~ 2200 1300
NoConn ~ 2200 1400
NoConn ~ 2200 1500
NoConn ~ 2700 1500
NoConn ~ 2700 1600
NoConn ~ 2200 1700
NoConn ~ 2200 1800
NoConn ~ 2200 1900
NoConn ~ 2200 2100
NoConn ~ 2200 2200
NoConn ~ 2200 2300
NoConn ~ 2700 2400
NoConn ~ 2700 2300
NoConn ~ 2700 2200
NoConn ~ 2700 2000
NoConn ~ 2700 1900
$EndSCHEMATC
