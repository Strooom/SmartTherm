// #############################################################################
// ###                                                                       ###
// ### SmartTherm - IoT Heating Controller                                   ###
// ###                                                                       ###
// ### https://github.com/Strooom/......                                     ###
// ### Author(s) : Pascal Roobrouck - @strooom                               ###
// ### License : https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode ###
// ###                                                                       ###
// #############################################################################

#include <Blynk.h>
#include <ESP8266WiFi.h>				// needed to use the Wifi features of the ESP8266

#include <ESP8266mDNS.h>				// needed for Over-The-Air updating of the SW
#include <WiFiUdp.h>					// needed for Over-The-Air updating of the SW
#include <ArduinoOTA.h>					// needed for Over-The-Air updating of the SW

#include <BlynkSimpleEsp8266.h>			// needed for the basics of Blynk
#include <WidgetRTC.h>					// needed when getting the time from Blynk server
#include "TemperatureController.h"		// 
#include "myConfig.h"						// contains all local parameters for Wifi, Blynk, assigned pins etc..

constexpr unsigned long updateInterval{ 5000 };

WiFiClient client;
BlynkTimer theTimer;
WidgetRTC theRealTimeClock;
TemperatureController theController;

void setup()
    {
    Serial.begin(115200);

    theTimer.setInterval(updateInterval, run);
    Blynk.begin(blynkToken, ssid, password);
	theController.begin();

	ArduinoOTA.setHostname(hostname);
    ArduinoOTA.onStart([]()
        {
        String type;
        if (ArduinoOTA.getCommand() == U_FLASH)
            {
            type = "sketch";
            }
        else     // U_FS
            {
            type = "filesystem";
            }

        // NOTE: if updating FS this would be the place to unmount FS using FS.end()
        Serial.println("Start updating " + type);
        });
    ArduinoOTA.onEnd([]()
        {
        Serial.println("\nEnd");
        });
    ArduinoOTA.onProgress([](unsigned int progress, unsigned int total)
        {
        Serial.printf("Progress: %u%%\r", (progress / (total / 100)));
        });
    ArduinoOTA.onError([](ota_error_t error)
        {
        Serial.printf("Error[%u]: ", error);
        if (error == OTA_AUTH_ERROR)
            {
            Serial.println("Auth Failed");
            }
        else if (error == OTA_BEGIN_ERROR)
            {
            Serial.println("Begin Failed");
            }
        else if (error == OTA_CONNECT_ERROR)
            {
            Serial.println("Connect Failed");
            }
        else if (error == OTA_RECEIVE_ERROR)
            {
            Serial.println("Receive Failed");
            }
        else if (error == OTA_END_ERROR)
            {
            Serial.println("End Failed");
            }
        });
    ArduinoOTA.begin();
    }

void loop()
    {
    Blynk.run();
    theTimer.run();
    ArduinoOTA.handle();
    }

void run()
    {
    theController.run();
    Blynk.virtualWrite(V0, theController.getSetTemp());
    Blynk.virtualWrite(V1, theController.getIsTemp());					// send the temperature to the Blynk App widget
    Blynk.virtualWrite(V6, theController.getModulation());				// send the modulation to the Blynk App widget
    }

BLYNK_CONNECTED()
    {
    theRealTimeClock.begin();	// start using RTC from Blynk Server
    Blynk.syncAll();			// read state of all control widgets
    }

BLYNK_WRITE(V2)
    {
    theController.changeMode(param.asInt());
    run();
    }

BLYNK_WRITE(V3)
    {
    TimeInputParam t(param);

    if (t.hasStartTime() && t.hasStopTime())
        {
        theController.changeDayNightTimes(t.getStartHour() * 3600 + t.getStartMinute() * 60 + t.getStartSecond(), t.getStopHour() * 3600 + t.getStopMinute() * 60 + t.getStopSecond());
        }
    run();
    }

BLYNK_WRITE(V7)
    {
    if (param.asInt())
        {
        theController.changeSetTemp(false);
        run();
        }
    }

BLYNK_WRITE(V8)
    {
    if (param.asInt())
        {
        theController.changeSetTemp(true);
        run();
        }
    }