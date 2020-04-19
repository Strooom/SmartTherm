// #############################################################################
// ###                                                                       ###
// ### SmarttHerm - Internet Controllled Heating Control                     ###
// ###                                                                       ###
// ### https://github.com/Strooom/SmartTherm                                 ###
// ### Author(s) : Pascal Roobrouck - @strooom                               ###
// ### License : https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode ###
// ###                                                                       ###
// ###                                                                       ###
// #############################################################################

class Blynk;
#include <TimeLib.h>					// needed to get access to time functions such as hour()
#include <OneWire.h>					// needed to read DS18B20 sensors
#include <DallasTemperature.h>			// needed for temperature calculation in DS18B20 sensors
#include "TemperatureController.h"
#include "myConfig.h"					// contains all local parameters for Wifi, Blynk, assigned pins etc..


TemperatureController::TemperatureController()
    {
    }

void TemperatureController::begin()
    {
    theDS18B20Sensor.begin();											// start DS18B20 sensor
    theDS18B20Sensor.setResolution(temperatureSensorAddress, 11);		// set resolution to 11 bits = 0.125 `C
    theDS18B20Sensor.setWaitForConversion(false);						// using the sensor in a non-blocking way
    }

void TemperatureController::run()										// update Day / Night and drive output
    {
    // Read actual temperature from sensor
    isTemp = theDS18B20Sensor.getTempC(temperatureSensorAddress);		//read the temperature from the previous 'conversion'

    // Check if we switch from day to night or night to day
    if ((ctrlState::day == theState) && (!isDay()))
        {
        theState = ctrlState::night;									// change from day to night,
        setTemp = setTempNight;											// resets setTemp
        }

    if ((ctrlState::night == theState) && (isDay()))
        {
        theState = ctrlState::day;
        setTemp = setTempDay;
        }

    // calculate how to drive the heating
    modulation = calcModulation();										// calculates the control of the heating from all internal state variables
    analogWrite(heatingDrivePin, modulation);							// calculates the control of the heating from all internal state variables

    theDS18B20Sensor.requestTemperatures();								// request a new conversion
    }

void TemperatureController::changeMode(int theMode)		// toggle between Off and On (Day or Night)
    {
    if (0 == theMode)
        {
        theState = ctrlState::off;
        setTemp = setTempOff;
        }
    else
        {
        if (isDay())
            {
            theState = ctrlState::day;
            setTemp = setTempDay;
            }
        else
            {
            theState = ctrlState::night;
            setTemp = setTempNight;
            }
        }
    }

void TemperatureController::changeDayNightTimes(uint32_t newDayTimeInSeconds, uint32_t newNightTimeInSeconds)
    {
    dayTimeInSeconds = newDayTimeInSeconds;
    nightTimeInSeconds = newNightTimeInSeconds;
    }

void TemperatureController::changeSetTemp(bool upDown)
    {
    if (upDown)
        {
        setTemp = setTemp + 0.5;
        }
    else
        {
        setTemp = setTemp - 0.5;
        }
    }

double TemperatureController::getSetTemp() const
    {
    return setTemp;
    }

double TemperatureController::getIsTemp() const
    {
    return isTemp;
    }

uint32_t TemperatureController::getModulation() const
    {
    return modulation;
    }

bool TemperatureController::isDay() const
    {
    uint32_t currentTimeInSeconds = (hour() * 3600) + (minute() * 60) + second();
    return ((currentTimeInSeconds >= dayTimeInSeconds) && (currentTimeInSeconds <= nightTimeInSeconds));
    }

uint32_t TemperatureController::calcModulation() const
    {
    // Calculate a signal to drive the heater, based upon the difference between isTemp and setTemp
    if (isTemp <= (setTemp + tempOffset - modulationBandWidth))
        {
        return 1023;
        }
    else if (isTemp >= (setTemp + tempOffset + modulationBandWidth))
        {
        return 0;
        }
    else
        {
        double tmpValue;
        tmpValue = (-1023.0 / (2.0 * modulationBandWidth)) * (isTemp - (setTemp + tempOffset - modulationBandWidth)) + 1023.0;
        if (tmpValue < 0.0)
            {
            tmpValue = 0.0;
            }
        if (tmpValue > 1023.0)
            {
            tmpValue = 1023.0;
            }

        return static_cast<uint32_t>(tmpValue);
        }
    }