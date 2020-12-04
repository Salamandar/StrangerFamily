EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
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
L Transistor_FET:BSS138 Q?
U 1 1 5F0C7707
P 5500 2900
AR Path="/5F0C7707" Ref="Q?"  Part="1" 
AR Path="/5F0C0EC0/5F0C7707" Ref="Q1"  Part="1" 
AR Path="/5F0CC9C0/5F0C7707" Ref="Q2"  Part="1" 
AR Path="/5F0E3A96/5F0C7707" Ref="Q3"  Part="1" 
AR Path="/5F100AA1/5F0C7707" Ref="Q4"  Part="1" 
AR Path="/5FC9613F/5F0C7707" Ref="Q4"  Part="1" 
AR Path="/5FC7A580/5F0C7707" Ref="Q?"  Part="1" 
AR Path="/5FCCC92D/5F0C7707" Ref="Q?"  Part="1" 
AR Path="/5FCFD90D/5F0C7707" Ref="Q3"  Part="1" 
AR Path="/5FD019AC/5F0C7707" Ref="Q4"  Part="1" 
F 0 "Q4" V 5749 2900 50  0000 C CNN
F 1 "BSS138" V 5840 2900 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5700 2825 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 5500 2900 50  0001 L CNN
	1    5500 2900
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F0C770D
P 5200 2850
AR Path="/5F0C770D" Ref="R?"  Part="1" 
AR Path="/5F0C0EC0/5F0C770D" Ref="R2"  Part="1" 
AR Path="/5F0CC9C0/5F0C770D" Ref="R4"  Part="1" 
AR Path="/5F0E3A96/5F0C770D" Ref="R6"  Part="1" 
AR Path="/5F100AA1/5F0C770D" Ref="R8"  Part="1" 
AR Path="/5FC9613F/5F0C770D" Ref="R8"  Part="1" 
AR Path="/5FC7A580/5F0C770D" Ref="R?"  Part="1" 
AR Path="/5FCCC92D/5F0C770D" Ref="R?"  Part="1" 
AR Path="/5FCFD90D/5F0C770D" Ref="R6"  Part="1" 
AR Path="/5FD019AC/5F0C770D" Ref="R11"  Part="1" 
F 0 "R11" H 5150 2850 50  0000 R CNN
F 1 "10k" V 5200 2850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5130 2850 50  0001 C CNN
F 3 "~" H 5200 2850 50  0001 C CNN
	1    5200 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F0C7713
P 5800 2850
AR Path="/5F0C7713" Ref="R?"  Part="1" 
AR Path="/5F0C0EC0/5F0C7713" Ref="R3"  Part="1" 
AR Path="/5F0CC9C0/5F0C7713" Ref="R5"  Part="1" 
AR Path="/5F0E3A96/5F0C7713" Ref="R7"  Part="1" 
AR Path="/5F100AA1/5F0C7713" Ref="R9"  Part="1" 
AR Path="/5FC9613F/5F0C7713" Ref="R9"  Part="1" 
AR Path="/5FC7A580/5F0C7713" Ref="R?"  Part="1" 
AR Path="/5FCCC92D/5F0C7713" Ref="R?"  Part="1" 
AR Path="/5FCFD90D/5F0C7713" Ref="R7"  Part="1" 
AR Path="/5FD019AC/5F0C7713" Ref="R12"  Part="1" 
F 0 "R12" H 5850 2850 50  0000 L CNN
F 1 "10k" V 5800 2850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5730 2850 50  0001 C CNN
F 3 "~" H 5800 2850 50  0001 C CNN
	1    5800 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 3000 5300 3000
Wire Wire Line
	5800 2700 5800 2600
Wire Wire Line
	5700 3000 5800 3000
Connection ~ 5800 3000
Wire Wire Line
	5800 3000 6000 3000
Wire Wire Line
	5200 3000 5000 3000
Connection ~ 5200 3000
Wire Wire Line
	5500 2700 5500 2600
Wire Wire Line
	5500 2600 5200 2600
Wire Wire Line
	5200 2600 5200 2700
Text HLabel 5000 3000 0    50   Input ~ 0
LD
Text HLabel 6000 3000 2    50   Input ~ 0
HD
Text HLabel 5800 2600 1    50   Input ~ 0
HV
Text HLabel 5200 2600 1    50   Input ~ 0
LV
$EndSCHEMATC
