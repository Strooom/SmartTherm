#ifndef TemperatureController_h
#define TemperatureController_h

#include <Arduino.h>
#include <OneWire.h>					// needed to read DS18B20 sensors
#include <DallasTemperature.h>			// needed for temperature calculation with DS18B20 sensors
#include "myConfig.h"						// contains all local parameters for Wifi, Blynk, assigned pins etc..


enum class ctrlState
    {
    off,
    day,
    night
    };

class TemperatureController
    {
    public:
        TemperatureController();																// constructor
        void begin();																			// initializes the temperature sensor

		void changeMode(int theMode);															// switch to OFF or to Day/Night
        void changeDayNightTimes(uint32_t dayTimeInSeconds, uint32_t nightTimeInSeconds);		// adjusts boundaries of Day/Night switching times
        void changeSetTemp(bool upDown);														// adjusts setTemp up (true) or down (false) with a delta

		void run();																				// read temperature, calculate how to drive heating and output that

		double getSetTemp() const;																// read private value for displaying on Phone
        double getIsTemp() const;																// read private value for displaying on Phone
		uint32_t getModulation() const;															// read private value for displaying on Phone


    private:
        OneWire theOneWireInterface = OneWire(temperatureSensorPin);								// ojbect to read the sensor
        DallasTemperature theDS18B20Sensor = DallasTemperature(&theOneWireInterface);				// object to read the DS18B20 sensor

        double setTemp{ 20.0 };							// temperature we try to achieve, in degrees (Celsius)
        double isTemp{ 20.0 };							// actual measured temperature, in degrees (Celsius)
        ctrlState theState{ ctrlState::off };			// are we off, on(day) or on(night)
        uint32_t dayTimeInSeconds{ 23400};				// start time of 'day', is end of 'night', in seconds. 23400 = 06:30h
        uint32_t nightTimeInSeconds{ 77400};			// start time of 'night', is end of 'day', in seconds, 77400 = 21:30h

		uint32_t modulation;							// value in [0..1023] which sets a PWM output towards the heater
		uint32_t calcModulation() const;				// takes isTemp and setTemp and calculates a PWM value to drive the heater
		bool isDay() const;																		// is the current time considered 'Day' (true) or 'Night' (false)
};

// heating = f(Temperature)
//
//------output = 1023 = 100% heating-----\		
//                                         \
//                                           \
//                                             \
//                                               \
//                                                 \
//                                                   \
//                                                     \
//                                                       \
//                                                         \
//------ouput = 0 = no heating--------------------------------------> Temp 		 
//                                       <--------|--------> = 2 * modulationBandWidth  : the temperature range over which we go from 100% to 0% heating.
//                                                <---> = tempOffset : with tempOffset = 0, this range is centered around 'setTemp'. tempOffset allows you to move the range left (tempOffset < 0) or right (tempOffset > 0) around setTemp
//                                                    | = setTemp

#endif
