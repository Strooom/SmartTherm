// #############################################################################
// ###                                                                       ###
// ### SmartTherm - IoT Heating Controller                                   ###
// ###                                                                       ###
// ### https://github.com/Strooom/SmartTherm                                 ###
// ### Author(s) : Pascal Roobrouck - @strooom                               ###
// ### License : https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode ###
// ###                                                                       ###
// #############################################################################

#include <NexConfig.h>
#include <Nextion.h>

//#include <NexWaveform.h>
//#include <NexVariable.h>
//#include <NexUpload.h>
//#include <NexHardware.h>
//#include <NexTouch.h>
//#include <NexTimer.h>
//#include <NexText.h>
//#include <NexSlider.h>
//#include <NexScrolltext.h>
//#include <NexRtc.h>
//#include <NexRadio.h>
//#include <NexProgressBar.h>
//#include <NexPicture.h>
//#include <NexPage.h>
//#include <NexObject.h>
//#include <NexNumber.h>
//#include <NexHotspot.h>
//#include <NexGpio.h>
//#include <NexGauge.h>
//#include <NexDualStateButton.h>
//#include <NexCrop.h>
//#include <NexCheckbox.h>
//#include <NexButton.h>
//#include <doxygen.h>

#include <Blynk.h>
#include <ESP8266WiFi.h>									// needed to use the Wifi features of the ESP8266

#include <ESP8266mDNS.h>									// needed for Over-The-Air updating of the SW
#include <WiFiUdp.h>										// needed for Over-The-Air updating of the SW
#include <ArduinoOTA.h>										// needed for Over-The-Air updating of the SW

#include <BlynkSimpleEsp8266.h>								// needed for the basics of Blynk
#include <WidgetRTC.h>										// needed when getting the time from Blynk server

#include "TemperatureController.h"							// header file for most of the SmartTherm functionality
#include "myConfig.h"										// contains all local parameters for Wifi, Blynk, assigned pins etc..

constexpr unsigned long updateInterval{ 5000 };				// 5000ms = 5 seconds

WiFiClient client;											// ?? why do I need this
BlynkTimer theTimer;										// object to handle the interval timer to do periodic stuff
WidgetRTC theRealTimeClock;									// object to sync time from Blynk server to local RealTimeClock
TemperatureController theController;						// object to handle the core functionality of a temperature controller

NexText textTime = NexText(0, 7, "textTime");				// textbox on the display to show current time
NexText textTemp = NexText(0, 4, "textTemp");				// textbox on the display to show current temperature or set temperature
NexButton buttonOnOff = NexButton(0, 3, "buttonOnOff");		// button on the display to switch between on and off
NexButton buttonMin = NexButton(0, 2, "buttonMin");			// button to decrease (the set temperature)
NexButton buttonPlus = NexButton(0, 1, "buttonPlus");		// button to increase (the set temperature)

NexTouch *displayObjects[] =								// list of Nextion display objects for which we want to listen to (touch) events
    {
    &buttonOnOff,
    &buttonMin,
    &buttonPlus,
    NULL
    };

//
// Over The Air (OTA) functions
//

void myOnStart()
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
    //Serial.println("Start updating " + type);
    };

void myOnEnd()
    {
    //Serial.println("\nEnd");
    };

void myOnProgress(unsigned int progress, unsigned int total)
    {
    //Serial.printf("Progress: %u%%\r", (progress / (total / 100)));
    };

void myOnError(ota_error_t error)
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
    };

//
// Blynk event handlers
//

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

//
// Nextion display event handlers
//

void buttonOnOffPress(void *ptr)
    {
    }

void buttonMinPress(void *ptr)
    {
    }

void buttonPlusPress(void *ptr)
    {
    }


void setup()
    {
    Serial.begin(9600);

    theTimer.setInterval(updateInterval, run);
    Blynk.begin(blynkToken, ssid, password);
    theController.begin();

    ArduinoOTA.setHostname(hostname);
    ArduinoOTA.onStart(myOnStart);
    ArduinoOTA.onEnd(myOnEnd);
    ArduinoOTA.onProgress(myOnProgress);
    ArduinoOTA.onError(myOnError);
    ArduinoOTA.begin();

    nexInit();

    buttonOnOff.attachPop(buttonOnOffPress);
    buttonMin.attachPush(buttonMinPress);
    buttonPlus.attachPush(buttonPlusPress);
    }

void loop()
    {
    Blynk.run();
    theTimer.run();
    ArduinoOTA.handle();
    nexLoop(displayObjects);
    }

void run()
    {
    theController.run();
    Blynk.virtualWrite(V0, theController.getSetTemp());			// send the 'set' temperature to the Blynk App widget
    Blynk.virtualWrite(V1, theController.getIsTemp());			// send the 'is' temperature to the Blynk App widget

    // Transform time to show it on the display
    char fullText[16] = "";
    uint8_t tmpHour = hour();
    if (tmpHour < 10)
        {
        fullText[0] = '0';										// add a leading zero
        itoa(tmpHour, fullText + 1, 10);						// convert to c-style string
        }
    else
        {
        itoa(tmpHour, fullText, 10);
        }

    strcat(fullText, ":");
    char partText[16] = "";

    uint8_t tmpMinute = minute();
    if (tmpMinute < 10)
        {
        partText[0] = '0';
        itoa(tmpMinute, partText + 1, 10);
        }
    else
        {
        itoa(tmpMinute, partText, 10);
        }
	strcat(fullText, partText);
    textTime.setText(fullText);

    // Transform temperature to show it on the display
    uint32_t tempIntPart;
    uint32_t tempFracPart;
    tempIntPart = static_cast<uint32_t>(theController.getIsTemp());
    tempFracPart = static_cast<uint32_t>((theController.getIsTemp() + 0.05) * 10) - (tempIntPart * 10);

    itoa(tempIntPart, fullText, 10);
    strcat(fullText, ".");
    itoa(tempFracPart, partText, 10);
    strcat(fullText, partText);
    textTemp.setText(fullText);

    Blynk.virtualWrite(V6, theController.getModulation());		// send the modulation to the Blynk App widget
    }



