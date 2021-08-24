# How to flash firmware via USB

1) Install both the driver and software in the "Win10" folder.

2) Put device in bootloader mode (side switch to B), connect to USB and switch on the button. Windows should have detected the STM32 as a DFU device now.

3) Open STM32CubeProgrammer, on the right hand side look for USB configuration and click refresh: USB1 should show up as a port. Click the green button "Connect".

5) Go to "Erasing and Programming" by clicking on the header in the top left. Under "File path" browse to the location where you saved the [.hex file](https://raw.githubusercontent.com/sh969/integrated-aq-sensor/main/Firmware/Debug/Firmware.hex) with open-seneca code. Tick "Verify programming" and "Run after programming". Then click "Start Programm..."

6) After a few seconds flash should be successful and the SPS30 sensor fan should be audible. Flick side switch on PCB back into run mode (R).

Debugging:
The STAT LED (next to the SD card slot) lights if there is anything wrong with your board. The colours mean the following:
- red: battery voltage reading not between 2.6V and 5V
- blue: humidity reading not between 0 and 100% (faulty SHT sensor?)
- purple: SD card is not found or cannot be read/written
- cyan: SPS sensor does not respond

------------------------------------

If you want to learn more about DIY electronics, we recommend the excellent website and Youtube channel of Philip Salmony who helped us design the open-seneca board.

[<img width="200" src="https://raw.githubusercontent.com/open-seneca/integrated-aq-sensor/main/.images/PhilsLabLogo.png">](http://philsal.co.uk/)
