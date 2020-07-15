EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 5
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
L Connector_Generic:Conn_01x02 J2
U 1 1 5B617D4C
P 6100 1200
F 0 "J2" V 6100 1050 50  0000 R CNN
F 1 "Power_LEDs" V 6200 1150 50  0000 C CNN
F 2 "Connector_Phoenix_MC:PhoenixContact_MC_1,5_2-G-3.5_1x02_P3.50mm_Horizontal" H 6100 1200 50  0001 C CNN
F 3 "~" H 6100 1200 50  0001 C CNN
	1    6100 1200
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J3
U 1 1 5B618089
P 8000 1300
F 0 "J3" V 8000 1450 50  0000 L CNN
F 1 "Output_LED" V 8100 1300 50  0000 C CNN
F 2 "Connector_JST:JST_XH_S3B-XH-A_1x03_P2.50mm_Horizontal" H 8000 1300 50  0001 C CNN
F 3 "~" H 8000 1300 50  0001 C CNN
	1    8000 1300
	0    -1   -1   0   
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
L power:GND #PWR014
U 1 1 5B61AED1
P 7900 1500
F 0 "#PWR014" H 7900 1250 50  0001 C CNN
F 1 "GND" H 7905 1327 50  0000 C CNN
F 2 "" H 7900 1500 50  0001 C CNN
F 3 "" H 7900 1500 50  0001 C CNN
	1    7900 1500
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
L power:VDD #PWR015
U 1 1 5B61B5CB
P 8100 1500
F 0 "#PWR015" H 8100 1350 50  0001 C CNN
F 1 "VDD" H 8118 1673 50  0000 C CNN
F 2 "" H 8100 1500 50  0001 C CNN
F 3 "" H 8100 1500 50  0001 C CNN
	1    8100 1500
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J1
U 1 1 5B7E98DE
P 7650 4400
F 0 "J1" H 7729 4392 50  0000 L CNN
F 1 "LCD_Conn" H 7729 4301 50  0000 L CNN
F 2 "Connector_JST:JST_XH_S4B-XH-A_1x04_P2.50mm_Horizontal" H 7650 4400 50  0001 C CNN
F 3 "~" H 7650 4400 50  0001 C CNN
	1    7650 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5B7EABE4
P 7450 4300
F 0 "#PWR0103" H 7450 4050 50  0001 C CNN
F 1 "GND" V 7450 4100 50  0000 C CNN
F 2 "" H 7450 4300 50  0001 C CNN
F 3 "" H 7450 4300 50  0001 C CNN
	1    7450 4300
	0    1    1    0   
$EndComp
$Comp
L power:+3V3 #PWR0104
U 1 1 5B7EAC48
P 7450 4400
F 0 "#PWR0104" H 7450 4250 50  0001 C CNN
F 1 "+3V3" V 7450 4600 50  0000 C CNN
F 2 "" H 7450 4400 50  0001 C CNN
F 3 "" H 7450 4400 50  0001 C CNN
	1    7450 4400
	0    -1   -1   0   
$EndComp
Text Label 7450 4500 2    50   ~ 0
LCD_SDA
Text Label 7450 4600 2    50   ~ 0
LCD_SLC
$Comp
L Device:D D1
U 1 1 5B7ED788
P 6700 1100
F 0 "D1" V 6746 1021 50  0000 R CNN
F 1 "D" V 6655 1021 50  0000 R CNN
F 2 "Diode_SMD:D_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6700 1100 50  0001 C CNN
F 3 "~" H 6700 1100 50  0001 C CNN
	1    6700 1100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5B7EDEE1
P 6700 1400
F 0 "R1" H 6770 1446 50  0000 L CNN
F 1 "R" H 6770 1355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6630 1400 50  0001 C CNN
F 3 "~" H 6700 1400 50  0001 C CNN
	1    6700 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5B7EDF76
P 6700 1550
F 0 "#PWR0113" H 6700 1300 50  0001 C CNN
F 1 "GND" H 6705 1377 50  0000 C CNN
F 2 "" H 6700 1550 50  0001 C CNN
F 3 "" H 6700 1550 50  0001 C CNN
	1    6700 1550
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR0114
U 1 1 5B7EDFF5
P 6700 950
F 0 "#PWR0114" H 6700 800 50  0001 C CNN
F 1 "VDD" H 6717 1123 50  0000 C CNN
F 2 "" H 6700 950 50  0001 C CNN
F 3 "" H 6700 950 50  0001 C CNN
	1    6700 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5F0B34DA
P 5400 6900
F 0 "#PWR01" H 5400 6650 50  0001 C CNN
F 1 "GND" H 5400 6750 50  0000 C CNN
F 2 "" H 5400 6900 50  0000 C CNN
F 3 "" H 5400 6900 50  0000 C CNN
	1    5400 6900
	1    0    0    -1  
$EndComp
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5F0B1A5D
P 5400 5900
F 0 "A1" H 5750 4950 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 4900 4950 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 5400 5900 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 5400 5900 50  0001 C CNN
	1    5400 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 6900 5500 6900
Connection ~ 5400 6900
$Comp
L power:+3V3 #PWR02
U 1 1 5F0B501A
P 5500 4900
F 0 "#PWR02" H 5500 4750 50  0001 C CNN
F 1 "+3.3V" H 5550 5050 50  0000 C CNN
F 2 "" H 5500 4900 50  0000 C CNN
F 3 "" H 5500 4900 50  0000 C CNN
	1    5500 4900
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 5F0B4499
P 5600 4900
F 0 "#PWR03" H 5600 4750 50  0001 C CNN
F 1 "+5V" H 5650 5050 50  0000 C CNN
F 2 "" H 5600 4900 50  0000 C CNN
F 3 "" H 5600 4900 50  0000 C CNN
	1    5600 4900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Raspberry_Pi_2_3 J5
U 1 1 5F077715
P 2300 2700
F 0 "J5" H 1650 3950 50  0000 C CNN
F 1 "Raspberry_Pi_zero" H 2850 3950 50  0000 C CNN
F 2 "Module:Raspberry_Pi_Zero_Socketed_THT_FaceDown_MountingHoles" H 2300 2700 50  0001 C CNN
F 3 "https://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/rpi_SCH_3bplus_1p0_reduced.pdf" H 2300 2700 50  0001 C CNN
	1    2300 2700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 5F07C6D7
P 2100 1250
F 0 "#PWR0102" H 2100 1100 50  0001 C CNN
F 1 "+5V" H 2100 1390 50  0000 C CNN
F 2 "" H 2100 1250 50  0000 C CNN
F 3 "" H 2100 1250 50  0000 C CNN
	1    2100 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 1250 2100 1400
$Comp
L power:+3V3 #PWR0105
U 1 1 5F07E777
P 2500 1250
F 0 "#PWR0105" H 2500 1100 50  0001 C CNN
F 1 "+3.3V" H 2500 1390 50  0000 C CNN
F 2 "" H 2500 1250 50  0000 C CNN
F 3 "" H 2500 1250 50  0000 C CNN
	1    2500 1250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2500 1250 2500 1400
$Comp
L power:VCC #PWR0106
U 1 1 5F07E782
P 2500 1250
F 0 "#PWR0106" H 2500 1100 50  0001 C CNN
F 1 "VCC" V 2500 1450 50  0000 C CNN
F 2 "" H 2500 1250 50  0001 C CNN
F 3 "" H 2500 1250 50  0001 C CNN
	1    2500 1250
	0    1    -1   0   
$EndComp
Connection ~ 2500 1250
Wire Wire Line
	2400 1400 2500 1400
Connection ~ 2500 1400
Wire Wire Line
	2200 1400 2100 1400
Connection ~ 2100 1400
$Comp
L power:GND #PWR0107
U 1 1 5F0834AA
P 2300 4000
F 0 "#PWR0107" H 2300 3750 50  0001 C CNN
F 1 "GND" H 2300 3850 50  0000 C CNN
F 2 "" H 2300 4000 50  0000 C CNN
F 3 "" H 2300 4000 50  0000 C CNN
	1    2300 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 4000 2000 4000
Connection ~ 2000 4000
Wire Wire Line
	2000 4000 2100 4000
Connection ~ 2100 4000
Wire Wire Line
	2100 4000 2200 4000
Connection ~ 2200 4000
Wire Wire Line
	2200 4000 2300 4000
Connection ~ 2300 4000
Wire Wire Line
	2300 4000 2400 4000
Connection ~ 2400 4000
Wire Wire Line
	2400 4000 2500 4000
Connection ~ 2500 4000
Wire Wire Line
	2500 4000 2600 4000
Text Label 1400 2300 2    50   ~ 0
PWM0
Text Label 3200 3100 0    50   ~ 0
MOSI
Text Label 3200 2100 0    50   ~ 0
LCD_SDA
Text Label 3200 2200 0    50   ~ 0
LCD_SLC
Wire Wire Line
	1400 2300 1500 2300
Wire Wire Line
	3100 2100 3200 2100
Wire Wire Line
	3200 2200 3100 2200
Wire Wire Line
	3200 3100 3100 3100
Wire Wire Line
	3000 5100 3100 5100
Wire Wire Line
	3100 5100 3100 5600
Wire Wire Line
	3100 5600 3000 5600
$Comp
L power:+5V #PWR06
U 1 1 5F0D5177
P 3100 5100
F 0 "#PWR06" H 3100 4950 50  0001 C CNN
F 1 "+5V" H 3100 5240 50  0000 C CNN
F 2 "" H 3100 5100 50  0000 C CNN
F 3 "" H 3100 5100 50  0000 C CNN
	1    3100 5100
	-1   0    0    -1  
$EndComp
Connection ~ 3100 5100
$Sheet
S 2000 5000 1000 300 
U 5F0C0EC0
F0 "Sheet5F0C0EBF" 50
F1 "level_shifter.sch" 50
F2 "LD" I L 2000 5200 50 
F3 "HD" I R 3000 5200 50 
F4 "HV" I R 3000 5100 50 
F5 "LV" I L 2000 5100 50 
$EndSheet
$Sheet
S 2000 5500 1000 300 
U 5F0CC9C0
F0 "sheet5F0CC9BA" 50
F1 "level_shifter.sch" 50
F2 "LD" I L 2000 5700 50 
F3 "HD" I R 3000 5700 50 
F4 "HV" I R 3000 5600 50 
F5 "LV" I L 2000 5600 50 
$EndSheet
Wire Wire Line
	3000 5700 3200 5700
Wire Wire Line
	3000 5200 3200 5200
$Comp
L power:+3V3 #PWR04
U 1 1 5F0CEA75
P 1900 5100
F 0 "#PWR04" H 1900 4950 50  0001 C CNN
F 1 "+3.3V" H 1900 5240 50  0000 C CNN
F 2 "" H 1900 5100 50  0000 C CNN
F 3 "" H 1900 5100 50  0000 C CNN
	1    1900 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 5600 1900 5100
Wire Wire Line
	1900 5600 2000 5600
Wire Wire Line
	2000 5100 1900 5100
Connection ~ 1900 5100
Wire Wire Line
	2000 5200 1800 5200
Wire Wire Line
	2000 5700 1800 5700
Text Label 1800 5200 2    50   ~ 0
RPi_TX
Text Label 1800 5700 2    50   ~ 0
RPi_RX
Text Label 3200 5200 0    50   ~ 0
Nano_RX
Text Label 3200 5700 0    50   ~ 0
Nano_TX
Text Label 1500 1800 2    50   ~ 0
RPi_TX
Text Label 1500 1900 2    50   ~ 0
RPi_RX
$Sheet
S 2000 6100 1000 300 
U 5F0E3A96
F0 "sheet5F0E3A90" 50
F1 "level_shifter.sch" 50
F2 "LD" I L 2000 6300 50 
F3 "HD" I R 3000 6300 50 
F4 "HV" I R 3000 6200 50 
F5 "LV" I L 2000 6200 50 
$EndSheet
$Comp
L power:+3V3 #PWR05
U 1 1 5F0E3A9C
P 1900 6200
F 0 "#PWR05" H 1900 6050 50  0001 C CNN
F 1 "+3.3V" H 1900 6340 50  0000 C CNN
F 2 "" H 1900 6200 50  0000 C CNN
F 3 "" H 1900 6200 50  0000 C CNN
	1    1900 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 6700 1900 6200
Wire Wire Line
	3000 6200 3100 6200
Wire Wire Line
	3100 6200 3100 6700
$Comp
L power:+5V #PWR07
U 1 1 5F0E3AA5
P 3100 6200
F 0 "#PWR07" H 3100 6050 50  0001 C CNN
F 1 "+5V" H 3100 6340 50  0000 C CNN
F 2 "" H 3100 6200 50  0000 C CNN
F 3 "" H 3100 6200 50  0000 C CNN
	1    3100 6200
	-1   0    0    -1  
$EndComp
Connection ~ 3100 6200
Wire Wire Line
	3000 6300 3200 6300
Wire Wire Line
	2000 6200 1900 6200
Connection ~ 1900 6200
Wire Wire Line
	2000 6300 1800 6300
$Sheet
S 2000 6600 1000 300 
U 5F100AA1
F0 "sheet5F100A9B" 50
F1 "level_shifter.sch" 50
F2 "LD" I L 2000 6800 50 
F3 "HD" I R 3000 6800 50 
F4 "HV" I R 3000 6700 50 
F5 "LV" I L 2000 6700 50 
$EndSheet
Wire Wire Line
	3000 6700 3100 6700
Wire Wire Line
	2000 6700 1900 6700
Wire Wire Line
	2000 6800 1800 6800
Wire Wire Line
	3000 6800 3200 6800
Text Label 1800 6300 2    50   ~ 0
PWM0
Text Label 1800 6800 2    50   ~ 0
MOSI
Text Label 3200 6300 0    50   ~ 0
PWM0_5V
Text Label 3200 6800 0    50   ~ 0
MOSI_5V
Text Label 4900 5300 2    50   ~ 0
Nano_RX
Text Label 4900 5400 2    50   ~ 0
Nano_TX
Text Label 7400 2200 2    50   ~ 0
PWM0_5V
Text Label 7400 2400 2    50   ~ 0
MOSI_5V
$Comp
L Device:Jumper_NC_Small JP1
U 1 1 5F12EECA
P 7700 2200
F 0 "JP1" H 7850 2250 50  0000 C CNN
F 1 "Jumper_NC" H 7700 2321 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_TrianglePad1.0x1.5mm" H 7700 2200 50  0001 C CNN
F 3 "~" H 7700 2200 50  0001 C CNN
	1    7700 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NC_Small JP2
U 1 1 5F130623
P 7700 2400
F 0 "JP2" H 7850 2450 50  0000 C CNN
F 1 "Jumper_NC" H 7700 2521 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_TrianglePad1.0x1.5mm" H 7700 2400 50  0001 C CNN
F 3 "~" H 7700 2400 50  0001 C CNN
	1    7700 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NC_Small JP3
U 1 1 5F130BF6
P 7700 2600
F 0 "JP3" H 7850 2650 50  0000 C CNN
F 1 "Jumper_NC" H 7700 2721 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_TrianglePad1.0x1.5mm" H 7700 2600 50  0001 C CNN
F 3 "~" H 7700 2600 50  0001 C CNN
	1    7700 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 2200 8000 2200
Wire Wire Line
	8000 2200 8000 2400
Wire Wire Line
	8000 2600 7800 2600
Wire Wire Line
	7800 2400 8000 2400
Connection ~ 8000 2400
Wire Wire Line
	8000 2400 8000 2600
Text Label 7400 2600 2    50   ~ 0
Arduino_out
Wire Wire Line
	7400 2200 7600 2200
Wire Wire Line
	7600 2400 7400 2400
Wire Wire Line
	7400 2600 7600 2600
Connection ~ 8000 2200
$Comp
L Device:R R10
U 1 1 5F176AE7
P 8000 1950
F 0 "R10" H 8050 1950 50  0000 L CNN
F 1 "470" V 8000 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7930 1950 50  0001 C CNN
F 3 "~" H 8000 1950 50  0001 C CNN
	1    8000 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 2100 8000 2200
Wire Wire Line
	8000 1800 8000 1500
Text Label 4900 5900 2    50   ~ 0
Arduino_out
$Comp
L Device:C C1
U 1 1 5F1840C9
P 8250 1500
F 0 "C1" V 8100 1500 50  0000 C CNN
F 1 "C" V 8200 1600 50  0000 C CNN
F 2 "" H 8288 1350 50  0001 C CNN
F 3 "~" H 8250 1500 50  0001 C CNN
	1    8250 1500
	0    1    1    0   
$EndComp
Connection ~ 8100 1500
$Comp
L power:GND #PWR0101
U 1 1 5F18555A
P 8400 1500
F 0 "#PWR0101" H 8400 1250 50  0001 C CNN
F 1 "GND" H 8405 1327 50  0000 C CNN
F 2 "" H 8400 1500 50  0001 C CNN
F 3 "" H 8400 1500 50  0001 C CNN
	1    8400 1500
	1    0    0    -1  
$EndComp
$EndSCHEMATC
