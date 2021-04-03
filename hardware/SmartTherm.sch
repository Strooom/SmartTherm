EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "SmartTherm"
Date "2020-10-13"
Rev "V1.0"
Comp "Strooom"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Isolator:ILD74 U2
U 2 1 5F85EE3C
P 5550 4150
F 0 "U2" H 5550 4475 50  0000 C CNN
F 1 "ILD74" H 5550 4384 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 5350 3950 50  0001 L CIN
F 3 "https://www.vishay.com/docs/83640/ild74.pdf" H 5550 4150 50  0001 L CNN
	2    5550 4150
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM358 U3
U 1 1 5F860CD0
P 7600 3700
F 0 "U3" H 7600 4067 50  0000 C CNN
F 1 "LM358" H 7600 3976 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 7600 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 7600 3700 50  0001 C CNN
	1    7600 3700
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM358 U3
U 2 1 5F86234A
P 8850 3800
F 0 "U3" H 8850 4167 50  0000 C CNN
F 1 "LM358" H 8850 4076 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 8850 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 8850 3800 50  0001 C CNN
	2    8850 3800
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM358 U3
U 3 1 5F86483E
P 10050 3800
F 0 "U3" H 10008 3846 50  0000 L CNN
F 1 "LM358" H 10008 3755 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 10050 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 10050 3800 50  0001 C CNN
	3    10050 3800
	1    0    0    -1  
$EndComp
$Comp
L MCU_Module:WeMos_D1_mini U1
U 1 1 5F8673AF
P 2800 3850
F 0 "U1" H 3050 4600 50  0000 C CNN
F 1 "WeMos D1 mini" V 2400 3450 50  0000 C CNN
F 2 "Module:WEMOS_D1_mini_light" H 2800 2700 50  0001 C CNN
F 3 "https://wiki.wemos.cc/products:d1:d1_mini#documentation" H 950 2700 50  0001 C CNN
	1    2800 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5F86825E
P 2800 4900
F 0 "#PWR03" H 2800 4650 50  0001 C CNN
F 1 "GND" H 2805 4727 50  0000 C CNN
F 2 "" H 2800 4900 50  0001 C CNN
F 3 "" H 2800 4900 50  0001 C CNN
	1    2800 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5F86AC4D
P 6950 2800
F 0 "R5" H 7020 2846 50  0000 L CNN
F 1 "22K" H 7020 2755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6880 2800 50  0001 C CNN
F 3 "~" H 6950 2800 50  0001 C CNN
	1    6950 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5F86C4E4
P 4500 4050
F 0 "R7" V 4293 4050 50  0000 C CNN
F 1 "470" V 4384 4050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4430 4050 50  0001 C CNN
F 3 "~" H 4500 4050 50  0001 C CNN
	1    4500 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	4650 4050 5250 4050
Wire Wire Line
	5250 4250 5250 4900
$Comp
L Isolator:ILD74 U2
U 1 1 5F85EA1F
P 5550 3550
F 0 "U2" H 5550 3875 50  0000 C CNN
F 1 "ILD74" H 5550 3784 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 5350 3350 50  0001 L CIN
F 3 "https://www.vishay.com/docs/83640/ild74.pdf" H 5550 3550 50  0001 L CNN
	1    5550 3550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4900 3450 5250 3450
Wire Wire Line
	2900 2550 3100 2550
$Comp
L Transistor_BJT:BC546 Q1
U 1 1 5F87A279
P 6850 4050
F 0 "Q1" H 7041 4096 50  0000 L CNN
F 1 "BC546" H 7041 4005 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92L_Inline_Wide" H 7050 3975 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/BC550-D.pdf" H 6850 4050 50  0001 L CNN
	1    6850 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 2950 6950 3600
Wire Wire Line
	5850 4050 6650 4050
$Comp
L power:+24V #PWR02
U 1 1 5F88C62D
P 9950 2550
F 0 "#PWR02" H 9950 2400 50  0001 C CNN
F 1 "+24V" H 9965 2723 50  0000 C CNN
F 2 "" H 9950 2550 50  0001 C CNN
F 3 "" H 9950 2550 50  0001 C CNN
	1    9950 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND2 #PWR04
U 1 1 5F88F98C
P 9800 4900
F 0 "#PWR04" H 9800 4650 50  0001 C CNN
F 1 "GND2" H 9805 4727 50  0000 C CNN
F 2 "" H 9800 4900 50  0001 C CNN
F 3 "" H 9800 4900 50  0001 C CNN
	1    9800 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 4250 6950 4900
Connection ~ 9800 4900
$Comp
L Device:R R8
U 1 1 5F8A091A
P 9400 3800
F 0 "R8" V 9193 3800 50  0000 C CNN
F 1 "1K" V 9284 3800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9330 3800 50  0001 C CNN
F 3 "~" H 9400 3800 50  0001 C CNN
	1    9400 3800
	0    1    1    0   
$EndComp
$Comp
L Device:C C2
U 1 1 5F8A0ED9
P 9550 4600
F 0 "C2" H 9700 4700 50  0000 R CNN
F 1 "100 nF" H 9850 4500 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 9588 4450 50  0001 C CNN
F 3 "~" H 9550 4600 50  0001 C CNN
	1    9550 4600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9550 3800 9550 4450
Wire Wire Line
	9550 4750 9550 4900
Wire Wire Line
	9550 4900 9800 4900
$Comp
L Device:C C1
U 1 1 5F8ACFB5
P 8350 4600
F 0 "C1" H 8500 4700 50  0000 R CNN
F 1 "4.7uF" H 8550 4500 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 8388 4450 50  0001 C CNN
F 3 "~" H 8350 4600 50  0001 C CNN
	1    8350 4600
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5F8ADD68
P 8100 3700
F 0 "R6" V 7893 3700 50  0000 C CNN
F 1 "47K" V 7984 3700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8030 3700 50  0001 C CNN
F 3 "~" H 8100 3700 50  0001 C CNN
	1    8100 3700
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5F8B6AA2
P 6650 2800
F 0 "R4" H 6720 2846 50  0000 L CNN
F 1 "10K" H 6720 2755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6580 2800 50  0001 C CNN
F 3 "~" H 6650 2800 50  0001 C CNN
	1    6650 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 2950 6650 4050
Connection ~ 6650 4050
Wire Wire Line
	5850 4250 5850 4900
Wire Wire Line
	5850 4900 6250 4900
Connection ~ 6950 4900
Connection ~ 9550 4900
Wire Wire Line
	8550 3900 8550 4100
Wire Wire Line
	8550 4100 9150 4100
Wire Wire Line
	9150 4100 9150 3800
Wire Wire Line
	9250 3800 9150 3800
Connection ~ 9150 3800
Wire Wire Line
	8550 3700 8350 3700
Wire Wire Line
	8350 4450 8350 3700
Connection ~ 8350 3700
Wire Wire Line
	8350 3700 8250 3700
Wire Wire Line
	8350 4750 8350 4900
Connection ~ 8350 4900
Wire Wire Line
	8350 4900 9550 4900
Wire Wire Line
	7900 3700 7950 3700
Wire Wire Line
	7300 3800 7300 4100
Wire Wire Line
	7300 4100 7900 4100
Wire Wire Line
	7900 4100 7900 3700
Connection ~ 7900 3700
Wire Wire Line
	2800 4650 2800 4900
Wire Wire Line
	6950 2550 6950 2650
Connection ~ 9950 2550
Wire Wire Line
	6950 2550 6650 2550
Wire Wire Line
	6650 2550 6650 2650
Connection ~ 6950 2550
Wire Wire Line
	6250 2550 6650 2550
Connection ~ 6650 2550
Wire Wire Line
	5850 3450 6250 3450
Wire Wire Line
	5850 3650 6250 3650
Connection ~ 2800 4900
Wire Wire Line
	5250 3650 5000 3650
Wire Wire Line
	5000 3650 5000 4900
Connection ~ 5000 4900
Wire Wire Line
	5000 4900 5250 4900
Wire Wire Line
	2900 2550 2900 3050
Wire Wire Line
	2700 2550 2700 3050
$Comp
L Device:R R10
U 1 1 5F91FBC4
P 3550 2800
F 0 "R10" H 3620 2846 50  0000 L CNN
F 1 "4K7" H 3620 2755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3480 2800 50  0001 C CNN
F 3 "~" H 3550 2800 50  0001 C CNN
	1    3550 2800
	1    0    0    -1  
$EndComp
Connection ~ 4900 3450
Wire Wire Line
	6250 3650 6250 4900
Connection ~ 6250 4900
Wire Wire Line
	6250 4900 6950 4900
$Comp
L power:+3.3V #PWR01
U 1 1 5F95C2DE
P 3100 2550
F 0 "#PWR01" H 3100 2400 50  0001 C CNN
F 1 "+3.3V" H 3115 2723 50  0000 C CNN
F 2 "" H 3100 2550 50  0001 C CNN
F 3 "" H 3100 2550 50  0001 C CNN
	1    3100 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5F873E42
P 4050 4500
F 0 "R9" H 4120 4546 50  0000 L CNN
F 1 "1K" H 4120 4455 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3980 4500 50  0001 C CNN
F 3 "~" H 4050 4500 50  0001 C CNN
	1    4050 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 4650 4050 4900
Connection ~ 4050 4900
Wire Wire Line
	4050 4900 5000 4900
Wire Wire Line
	3200 3350 4050 3350
Connection ~ 4050 3350
Wire Wire Line
	4050 3350 4050 4350
Wire Wire Line
	6250 2550 6250 2650
Wire Wire Line
	6250 3450 6250 2950
Wire Wire Line
	4900 2950 4900 3450
Wire Wire Line
	9950 4100 9950 4900
Wire Wire Line
	9950 4900 9800 4900
Wire Wire Line
	9950 3500 9950 2550
$Comp
L Device:R R3
U 1 1 5F86FC1A
P 4900 2800
F 0 "R3" H 4970 2846 50  0000 L CNN
F 1 "10K" H 4970 2755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4830 2800 50  0001 C CNN
F 3 "~" H 4900 2800 50  0001 C CNN
	1    4900 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 2650 3550 2550
Connection ~ 3550 2550
Wire Wire Line
	3550 2950 3550 3000
$Comp
L power:+5V #PWR0101
U 1 1 5FAC4F98
P 2500 2550
F 0 "#PWR0101" H 2500 2400 50  0001 C CNN
F 1 "+5V" H 2515 2723 50  0000 C CNN
F 2 "" H 2500 2550 50  0001 C CNN
F 3 "" H 2500 2550 50  0001 C CNN
	1    2500 2550
	1    0    0    -1  
$EndComp
Connection ~ 3100 2550
Wire Wire Line
	3100 2550 3550 2550
Connection ~ 2500 2550
Wire Wire Line
	2500 2550 2700 2550
Wire Wire Line
	4050 2550 4900 2550
Wire Wire Line
	4900 2550 4900 2650
Connection ~ 4050 2550
Wire Wire Line
	7300 3600 6950 3600
Connection ~ 6950 3600
Wire Wire Line
	6950 3600 6950 3850
$Comp
L Device:R R1
U 1 1 5F86BCE9
P 6250 2800
F 0 "R1" H 6180 2754 50  0000 R CNN
F 1 "3K3" H 6180 2845 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6180 2800 50  0001 C CNN
F 3 "~" H 6250 2800 50  0001 C CNN
	1    6250 2800
	-1   0    0    1   
$EndComp
Wire Wire Line
	1900 2550 2500 2550
Wire Wire Line
	2800 4900 4050 4900
Wire Wire Line
	3550 2550 4050 2550
Wire Wire Line
	2200 3000 3550 3000
Connection ~ 3550 3000
Wire Wire Line
	4050 2850 4050 3350
Wire Wire Line
	2000 2850 3100 2850
Wire Wire Line
	3100 2850 3100 2550
NoConn ~ 3250 3550
NoConn ~ 3250 3650
NoConn ~ 3250 3750
NoConn ~ 3250 3850
NoConn ~ 3250 3950
NoConn ~ 3250 4150
Wire Wire Line
	3250 3850 3200 3850
Wire Wire Line
	3250 3950 3200 3950
Wire Wire Line
	3250 4150 3200 4150
NoConn ~ 2350 3450
Wire Wire Line
	2350 3450 2400 3450
Text Label 4900 3450 0    50   ~ 0
24Present
Text Label 3550 3000 0    50   ~ 0
Tin
Text Label 2200 3750 0    50   ~ 0
RX
Text Label 2200 3850 0    50   ~ 0
TX
Text Label 3700 4050 0    50   ~ 0
Drive1
Text Label 6000 4050 0    50   ~ 0
Drive2
$Comp
L Connector:Screw_Terminal_01x04 J1
U 1 1 605D3600
P 10600 2750
F 0 "J1" H 10550 3000 50  0000 L CNN
F 1 "Junkers" V 10750 2550 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-4-5.0-H_1x04_P5.00mm_Horizontal" H 10600 2750 50  0001 C CNN
F 3 "~" H 10600 2750 50  0001 C CNN
	1    10600 2750
	1    0    0    1   
$EndComp
Wire Wire Line
	6950 4900 8350 4900
Wire Wire Line
	9950 4900 10400 4900
Wire Wire Line
	10400 4900 10400 2850
Connection ~ 9950 4900
Wire Wire Line
	9950 2550 10400 2550
Wire Wire Line
	6950 2550 9950 2550
Wire Wire Line
	9550 3800 9550 2650
Wire Wire Line
	9550 2650 10400 2650
Connection ~ 9550 3800
Wire Wire Line
	1700 4900 2800 4900
Wire Wire Line
	1900 2550 1900 3650
$Comp
L Connector:Screw_Terminal_01x06 J2
U 1 1 6060DE19
P 1350 3550
F 0 "J2" H 1350 3100 50  0000 C CNN
F 1 "Display - Sensor" V 1500 3500 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-6-5.0-H_1x06_P5.00mm_Horizontal" H 1350 3550 50  0001 C CNN
F 3 "~" H 1350 3550 50  0001 C CNN
	1    1350 3550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1700 4900 1700 4700
Wire Wire Line
	1550 3850 2400 3850
Wire Wire Line
	1550 3750 2400 3750
Wire Wire Line
	1550 3650 1900 3650
Wire Wire Line
	10400 2750 10400 2650
Connection ~ 10400 2650
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 6063C5D6
P 4250 2850
F 0 "J3" H 4330 2842 50  0000 L CNN
F 1 "Ext LDR" H 4330 2751 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-2-5.0-H_1x02_P5.00mm_Horizontal" H 4250 2850 50  0001 C CNN
F 3 "~" H 4250 2850 50  0001 C CNN
	1    4250 2850
	1    0    0    1   
$EndComp
Wire Wire Line
	4050 2550 4050 2750
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 605F43B9
P 1400 4300
F 0 "H1" V 1400 4500 50  0000 C CNN
F 1 "Mounting" V 1400 4750 50  0000 C CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad" H 1400 4300 50  0001 C CNN
F 3 "~" H 1400 4300 50  0001 C CNN
	1    1400 4300
	0    -1   -1   0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 605F4CD1
P 1400 4500
F 0 "H2" V 1400 4700 50  0000 C CNN
F 1 "Mounting" V 1400 4950 50  0000 C CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad" H 1400 4500 50  0001 C CNN
F 3 "~" H 1400 4500 50  0001 C CNN
	1    1400 4500
	0    -1   -1   0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 605F5630
P 1400 4700
F 0 "H3" V 1400 4900 50  0000 C CNN
F 1 "Mounting" V 1400 5150 50  0000 C CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad" H 1400 4700 50  0001 C CNN
F 3 "~" H 1400 4700 50  0001 C CNN
	1    1400 4700
	0    -1   -1   0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 605F5C3F
P 1400 4900
F 0 "H4" V 1400 5100 50  0000 C CNN
F 1 "Mounting" V 1400 5350 50  0000 C CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad" H 1400 4900 50  0001 C CNN
F 3 "~" H 1400 4900 50  0001 C CNN
	1    1400 4900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1500 4300 1700 4300
Connection ~ 1700 4300
Wire Wire Line
	1500 4500 1700 4500
Connection ~ 1700 4500
Wire Wire Line
	1700 4500 1700 4300
Wire Wire Line
	1500 4700 1700 4700
Connection ~ 1700 4700
Wire Wire Line
	1700 4700 1700 4500
Wire Wire Line
	1500 4900 1700 4900
Connection ~ 1700 4900
Wire Wire Line
	1550 3350 2000 3350
Wire Wire Line
	2000 3350 2000 2850
Wire Wire Line
	1550 3450 2200 3450
Wire Wire Line
	2200 3450 2200 3000
Wire Wire Line
	1700 3550 1550 3550
Wire Wire Line
	1700 3550 1700 4300
Wire Wire Line
	3200 4250 3550 4250
Wire Wire Line
	3550 4250 3550 4050
Wire Wire Line
	3550 4050 4350 4050
Wire Wire Line
	3400 3550 3400 3450
Wire Wire Line
	3200 3550 3400 3550
Wire Wire Line
	3400 3450 4900 3450
Wire Wire Line
	3550 3000 3550 3750
Wire Wire Line
	3200 3750 3550 3750
$EndSCHEMATC
