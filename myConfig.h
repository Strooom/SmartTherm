#ifndef myConfig_h
#define myConfig_h


constexpr char blynkToken[] =	"<enter your token here>";					// token to identify the matching Blynk app 
constexpr char ssid[] =			"<enter your ssid here>";					// Wifi SSID name
constexpr char password[] =		"<enter your wifi pw here>";				// Wifi password
constexpr char hostname[] =		"SmartTherm V1.0";							// Hostname, appears in OTA ports

constexpr int temperatureSensorPin = D7;									// I/O pin to which the DS18B20 sensor is connected
constexpr int heatingDrivePin = D8;											// I/O pin to which the output stage of the heater driver is connected

constexpr double setTempOff = 10.0;											// wanted temperature when Off, away from home. Protects against freezing
constexpr double setTempDay = 20.5;											// wanted temperature when home, during the day
constexpr double setTempNight = 17.5;										// wanted temperature when home, during the night

const double tempOffset{ -1.25 };				// in degrees  (Celsius), see drawing below
const double modulationBandWidth{ 2.0 };		// in degrees  (Celsius), see drawing below

const DeviceAddress temperatureSensorAddress = 
	{ 0x28, 0x79, 0xD8, 0x00, 0x00, 0x00, 0x80, 0xFC };						// <enter the unique address of the DS18B20 sensor>

#endif
