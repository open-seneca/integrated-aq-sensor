# How to flash firmware via USB

1) Install both the driver and software in the "Win10" folder.

2) Put device in bootloader mode (side switch to B), connect to USB and switch on the button. Windows should have detected the STM32 as a DFU device now.

3) Open STM32CubeProgrammer, on the right hand side look for USB configuration and click refresh: USB1 should show up as a port. Click the green button "Connect".

5) Go to "Erasing and Programming" by clicking on the header in the top left. Under "File path" browse to the location where you saved the [.hex file(https://raw.githubusercontent.com/sh969/integrated-aq-sensor/main/Firmware/Debug/Firmware.hex)] with open-seneca code. Tick "Verify programming" and "Run after programming". Then click "Start Programm..."

6) After a few seconds flash should be successful and the SPS30 sensor fan should be audible. Flick side switch on PCB back into run mode (R).
