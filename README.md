# mini-aq-sensor
 
Tutorial on how to flash the code via USB:

    Install driver for STM32 to be detected as DFU device in Windows.

    Put device in bootloader mode (side switch to B), connect to USB and switch PCB on. Windows should show STM32 BOOTLOADER in Device Manager now.

    Install STM32CubeProgrammer, open software, select USB, connect. You should now be able to see the current .hex machine code installed on the STM alongside some other parameters.

    Go to "Erasing and Programming", select .hex file with open-seneca code, tick "verify programming" and "run after programming". After a few seconds flash should be successful and the SPS30 sensor fan should be audible.

    Flick side switch on PCB back into run mode (R).