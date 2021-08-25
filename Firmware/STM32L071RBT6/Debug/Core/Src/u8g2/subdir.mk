################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/u8g2/u8g2_bitmap.c \
../Core/Src/u8g2/u8g2_box.c \
../Core/Src/u8g2/u8g2_buffer.c \
../Core/Src/u8g2/u8g2_circle.c \
../Core/Src/u8g2/u8g2_cleardisplay.c \
../Core/Src/u8g2/u8g2_d_memory.c \
../Core/Src/u8g2/u8g2_d_setup.c \
../Core/Src/u8g2/u8g2_font.c \
../Core/Src/u8g2/u8g2_fonts.c \
../Core/Src/u8g2/u8g2_hvline.c \
../Core/Src/u8g2/u8g2_input_value.c \
../Core/Src/u8g2/u8g2_intersection.c \
../Core/Src/u8g2/u8g2_kerning.c \
../Core/Src/u8g2/u8g2_line.c \
../Core/Src/u8g2/u8g2_ll_hvline.c \
../Core/Src/u8g2/u8g2_message.c \
../Core/Src/u8g2/u8g2_polygon.c \
../Core/Src/u8g2/u8g2_selection_list.c \
../Core/Src/u8g2/u8g2_setup.c \
../Core/Src/u8g2/u8log.c \
../Core/Src/u8g2/u8log_u8g2.c \
../Core/Src/u8g2/u8log_u8x8.c \
../Core/Src/u8g2/u8x8_8x8.c \
../Core/Src/u8g2/u8x8_byte.c \
../Core/Src/u8g2/u8x8_cad.c \
../Core/Src/u8g2/u8x8_d_a2printer.c \
../Core/Src/u8g2/u8x8_d_il3820_296x128.c \
../Core/Src/u8g2/u8x8_d_ist3020.c \
../Core/Src/u8g2/u8x8_d_ks0108.c \
../Core/Src/u8g2/u8x8_d_lc7981.c \
../Core/Src/u8g2/u8x8_d_ld7032_60x32.c \
../Core/Src/u8g2/u8x8_d_ls013b7dh03.c \
../Core/Src/u8g2/u8x8_d_max7219.c \
../Core/Src/u8g2/u8x8_d_pcd8544_84x48.c \
../Core/Src/u8g2/u8x8_d_pcf8812.c \
../Core/Src/u8g2/u8x8_d_pcf8814_hx1230.c \
../Core/Src/u8g2/u8x8_d_sbn1661.c \
../Core/Src/u8g2/u8x8_d_sed1330.c \
../Core/Src/u8g2/u8x8_d_sh1106_64x32.c \
../Core/Src/u8g2/u8x8_d_sh1106_72x40.c \
../Core/Src/u8g2/u8x8_d_sh1107.c \
../Core/Src/u8g2/u8x8_d_sh1108.c \
../Core/Src/u8g2/u8x8_d_sh1122.c \
../Core/Src/u8g2/u8x8_d_ssd1305.c \
../Core/Src/u8g2/u8x8_d_ssd1306_128x32.c \
../Core/Src/u8g2/u8x8_d_ssd1306_128x64_noname.c \
../Core/Src/u8g2/u8x8_d_ssd1306_48x64.c \
../Core/Src/u8g2/u8x8_d_ssd1306_64x32.c \
../Core/Src/u8g2/u8x8_d_ssd1306_64x48.c \
../Core/Src/u8g2/u8x8_d_ssd1306_96x16.c \
../Core/Src/u8g2/u8x8_d_ssd1309.c \
../Core/Src/u8g2/u8x8_d_ssd1317.c \
../Core/Src/u8g2/u8x8_d_ssd1318.c \
../Core/Src/u8g2/u8x8_d_ssd1322.c \
../Core/Src/u8g2/u8x8_d_ssd1325.c \
../Core/Src/u8g2/u8x8_d_ssd1326.c \
../Core/Src/u8g2/u8x8_d_ssd1327.c \
../Core/Src/u8g2/u8x8_d_ssd1329.c \
../Core/Src/u8g2/u8x8_d_ssd1606_172x72.c \
../Core/Src/u8g2/u8x8_d_ssd1607_200x200.c \
../Core/Src/u8g2/u8x8_d_st75256.c \
../Core/Src/u8g2/u8x8_d_st7565.c \
../Core/Src/u8g2/u8x8_d_st7567.c \
../Core/Src/u8g2/u8x8_d_st7586s_erc240160.c \
../Core/Src/u8g2/u8x8_d_st7586s_s028hn118a.c \
../Core/Src/u8g2/u8x8_d_st7588.c \
../Core/Src/u8g2/u8x8_d_st7920.c \
../Core/Src/u8g2/u8x8_d_stdio.c \
../Core/Src/u8g2/u8x8_d_t6963.c \
../Core/Src/u8g2/u8x8_d_uc1601.c \
../Core/Src/u8g2/u8x8_d_uc1604.c \
../Core/Src/u8g2/u8x8_d_uc1608.c \
../Core/Src/u8g2/u8x8_d_uc1610.c \
../Core/Src/u8g2/u8x8_d_uc1611.c \
../Core/Src/u8g2/u8x8_d_uc1617.c \
../Core/Src/u8g2/u8x8_d_uc1638.c \
../Core/Src/u8g2/u8x8_d_uc1701_dogs102.c \
../Core/Src/u8g2/u8x8_d_uc1701_mini12864.c \
../Core/Src/u8g2/u8x8_debounce.c \
../Core/Src/u8g2/u8x8_display.c \
../Core/Src/u8g2/u8x8_fonts.c \
../Core/Src/u8g2/u8x8_gpio.c \
../Core/Src/u8g2/u8x8_input_value.c \
../Core/Src/u8g2/u8x8_message.c \
../Core/Src/u8g2/u8x8_selection_list.c \
../Core/Src/u8g2/u8x8_setup.c \
../Core/Src/u8g2/u8x8_string.c \
../Core/Src/u8g2/u8x8_u16toa.c \
../Core/Src/u8g2/u8x8_u8toa.c 

O_SRCS += \
../Core/Src/u8g2/u8g2_bitmap.o \
../Core/Src/u8g2/u8g2_box.o \
../Core/Src/u8g2/u8g2_buffer.o \
../Core/Src/u8g2/u8g2_circle.o \
../Core/Src/u8g2/u8g2_cleardisplay.o \
../Core/Src/u8g2/u8g2_d_memory.o \
../Core/Src/u8g2/u8g2_d_setup.o \
../Core/Src/u8g2/u8g2_font.o \
../Core/Src/u8g2/u8g2_fonts.o \
../Core/Src/u8g2/u8g2_hvline.o \
../Core/Src/u8g2/u8g2_input_value.o \
../Core/Src/u8g2/u8g2_intersection.o \
../Core/Src/u8g2/u8g2_kerning.o \
../Core/Src/u8g2/u8g2_line.o \
../Core/Src/u8g2/u8g2_ll_hvline.o \
../Core/Src/u8g2/u8g2_message.o \
../Core/Src/u8g2/u8g2_polygon.o \
../Core/Src/u8g2/u8g2_selection_list.o \
../Core/Src/u8g2/u8g2_setup.o \
../Core/Src/u8g2/u8log.o \
../Core/Src/u8g2/u8log_u8g2.o \
../Core/Src/u8g2/u8log_u8x8.o \
../Core/Src/u8g2/u8x8_8x8.o \
../Core/Src/u8g2/u8x8_byte.o \
../Core/Src/u8g2/u8x8_cad.o \
../Core/Src/u8g2/u8x8_d_a2printer.o \
../Core/Src/u8g2/u8x8_d_il3820_296x128.o \
../Core/Src/u8g2/u8x8_d_ist3020.o \
../Core/Src/u8g2/u8x8_d_ks0108.o \
../Core/Src/u8g2/u8x8_d_lc7981.o \
../Core/Src/u8g2/u8x8_d_ld7032_60x32.o \
../Core/Src/u8g2/u8x8_d_ls013b7dh03.o \
../Core/Src/u8g2/u8x8_d_max7219.o \
../Core/Src/u8g2/u8x8_d_pcd8544_84x48.o \
../Core/Src/u8g2/u8x8_d_pcf8812.o \
../Core/Src/u8g2/u8x8_d_pcf8814_hx1230.o \
../Core/Src/u8g2/u8x8_d_sbn1661.o \
../Core/Src/u8g2/u8x8_d_sed1330.o \
../Core/Src/u8g2/u8x8_d_sh1106_64x32.o \
../Core/Src/u8g2/u8x8_d_sh1106_72x40.o \
../Core/Src/u8g2/u8x8_d_sh1107.o \
../Core/Src/u8g2/u8x8_d_sh1108.o \
../Core/Src/u8g2/u8x8_d_sh1122.o \
../Core/Src/u8g2/u8x8_d_ssd1305.o \
../Core/Src/u8g2/u8x8_d_ssd1306_128x32.o \
../Core/Src/u8g2/u8x8_d_ssd1306_128x64_noname.o \
../Core/Src/u8g2/u8x8_d_ssd1306_48x64.o \
../Core/Src/u8g2/u8x8_d_ssd1306_64x32.o \
../Core/Src/u8g2/u8x8_d_ssd1306_64x48.o \
../Core/Src/u8g2/u8x8_d_ssd1306_96x16.o \
../Core/Src/u8g2/u8x8_d_ssd1309.o \
../Core/Src/u8g2/u8x8_d_ssd1317.o \
../Core/Src/u8g2/u8x8_d_ssd1318.o \
../Core/Src/u8g2/u8x8_d_ssd1322.o \
../Core/Src/u8g2/u8x8_d_ssd1325.o \
../Core/Src/u8g2/u8x8_d_ssd1326.o \
../Core/Src/u8g2/u8x8_d_ssd1327.o \
../Core/Src/u8g2/u8x8_d_ssd1329.o \
../Core/Src/u8g2/u8x8_d_ssd1606_172x72.o \
../Core/Src/u8g2/u8x8_d_ssd1607_200x200.o \
../Core/Src/u8g2/u8x8_d_st75256.o \
../Core/Src/u8g2/u8x8_d_st7565.o \
../Core/Src/u8g2/u8x8_d_st7567.o \
../Core/Src/u8g2/u8x8_d_st7586s_erc240160.o \
../Core/Src/u8g2/u8x8_d_st7586s_s028hn118a.o \
../Core/Src/u8g2/u8x8_d_st7588.o \
../Core/Src/u8g2/u8x8_d_st7920.o \
../Core/Src/u8g2/u8x8_d_stdio.o \
../Core/Src/u8g2/u8x8_d_t6963.o \
../Core/Src/u8g2/u8x8_d_uc1601.o \
../Core/Src/u8g2/u8x8_d_uc1604.o \
../Core/Src/u8g2/u8x8_d_uc1608.o \
../Core/Src/u8g2/u8x8_d_uc1610.o \
../Core/Src/u8g2/u8x8_d_uc1611.o \
../Core/Src/u8g2/u8x8_d_uc1617.o \
../Core/Src/u8g2/u8x8_d_uc1638.o \
../Core/Src/u8g2/u8x8_d_uc1701_dogs102.o \
../Core/Src/u8g2/u8x8_d_uc1701_mini12864.o \
../Core/Src/u8g2/u8x8_debounce.o \
../Core/Src/u8g2/u8x8_display.o \
../Core/Src/u8g2/u8x8_fonts.o \
../Core/Src/u8g2/u8x8_gpio.o \
../Core/Src/u8g2/u8x8_input_value.o \
../Core/Src/u8g2/u8x8_message.o \
../Core/Src/u8g2/u8x8_selection_list.o \
../Core/Src/u8g2/u8x8_setup.o \
../Core/Src/u8g2/u8x8_string.o \
../Core/Src/u8g2/u8x8_u16toa.o \
../Core/Src/u8g2/u8x8_u8toa.o 

OBJS += \
./Core/Src/u8g2/u8g2_bitmap.o \
./Core/Src/u8g2/u8g2_box.o \
./Core/Src/u8g2/u8g2_buffer.o \
./Core/Src/u8g2/u8g2_circle.o \
./Core/Src/u8g2/u8g2_cleardisplay.o \
./Core/Src/u8g2/u8g2_d_memory.o \
./Core/Src/u8g2/u8g2_d_setup.o \
./Core/Src/u8g2/u8g2_font.o \
./Core/Src/u8g2/u8g2_fonts.o \
./Core/Src/u8g2/u8g2_hvline.o \
./Core/Src/u8g2/u8g2_input_value.o \
./Core/Src/u8g2/u8g2_intersection.o \
./Core/Src/u8g2/u8g2_kerning.o \
./Core/Src/u8g2/u8g2_line.o \
./Core/Src/u8g2/u8g2_ll_hvline.o \
./Core/Src/u8g2/u8g2_message.o \
./Core/Src/u8g2/u8g2_polygon.o \
./Core/Src/u8g2/u8g2_selection_list.o \
./Core/Src/u8g2/u8g2_setup.o \
./Core/Src/u8g2/u8log.o \
./Core/Src/u8g2/u8log_u8g2.o \
./Core/Src/u8g2/u8log_u8x8.o \
./Core/Src/u8g2/u8x8_8x8.o \
./Core/Src/u8g2/u8x8_byte.o \
./Core/Src/u8g2/u8x8_cad.o \
./Core/Src/u8g2/u8x8_d_a2printer.o \
./Core/Src/u8g2/u8x8_d_il3820_296x128.o \
./Core/Src/u8g2/u8x8_d_ist3020.o \
./Core/Src/u8g2/u8x8_d_ks0108.o \
./Core/Src/u8g2/u8x8_d_lc7981.o \
./Core/Src/u8g2/u8x8_d_ld7032_60x32.o \
./Core/Src/u8g2/u8x8_d_ls013b7dh03.o \
./Core/Src/u8g2/u8x8_d_max7219.o \
./Core/Src/u8g2/u8x8_d_pcd8544_84x48.o \
./Core/Src/u8g2/u8x8_d_pcf8812.o \
./Core/Src/u8g2/u8x8_d_pcf8814_hx1230.o \
./Core/Src/u8g2/u8x8_d_sbn1661.o \
./Core/Src/u8g2/u8x8_d_sed1330.o \
./Core/Src/u8g2/u8x8_d_sh1106_64x32.o \
./Core/Src/u8g2/u8x8_d_sh1106_72x40.o \
./Core/Src/u8g2/u8x8_d_sh1107.o \
./Core/Src/u8g2/u8x8_d_sh1108.o \
./Core/Src/u8g2/u8x8_d_sh1122.o \
./Core/Src/u8g2/u8x8_d_ssd1305.o \
./Core/Src/u8g2/u8x8_d_ssd1306_128x32.o \
./Core/Src/u8g2/u8x8_d_ssd1306_128x64_noname.o \
./Core/Src/u8g2/u8x8_d_ssd1306_48x64.o \
./Core/Src/u8g2/u8x8_d_ssd1306_64x32.o \
./Core/Src/u8g2/u8x8_d_ssd1306_64x48.o \
./Core/Src/u8g2/u8x8_d_ssd1306_96x16.o \
./Core/Src/u8g2/u8x8_d_ssd1309.o \
./Core/Src/u8g2/u8x8_d_ssd1317.o \
./Core/Src/u8g2/u8x8_d_ssd1318.o \
./Core/Src/u8g2/u8x8_d_ssd1322.o \
./Core/Src/u8g2/u8x8_d_ssd1325.o \
./Core/Src/u8g2/u8x8_d_ssd1326.o \
./Core/Src/u8g2/u8x8_d_ssd1327.o \
./Core/Src/u8g2/u8x8_d_ssd1329.o \
./Core/Src/u8g2/u8x8_d_ssd1606_172x72.o \
./Core/Src/u8g2/u8x8_d_ssd1607_200x200.o \
./Core/Src/u8g2/u8x8_d_st75256.o \
./Core/Src/u8g2/u8x8_d_st7565.o \
./Core/Src/u8g2/u8x8_d_st7567.o \
./Core/Src/u8g2/u8x8_d_st7586s_erc240160.o \
./Core/Src/u8g2/u8x8_d_st7586s_s028hn118a.o \
./Core/Src/u8g2/u8x8_d_st7588.o \
./Core/Src/u8g2/u8x8_d_st7920.o \
./Core/Src/u8g2/u8x8_d_stdio.o \
./Core/Src/u8g2/u8x8_d_t6963.o \
./Core/Src/u8g2/u8x8_d_uc1601.o \
./Core/Src/u8g2/u8x8_d_uc1604.o \
./Core/Src/u8g2/u8x8_d_uc1608.o \
./Core/Src/u8g2/u8x8_d_uc1610.o \
./Core/Src/u8g2/u8x8_d_uc1611.o \
./Core/Src/u8g2/u8x8_d_uc1617.o \
./Core/Src/u8g2/u8x8_d_uc1638.o \
./Core/Src/u8g2/u8x8_d_uc1701_dogs102.o \
./Core/Src/u8g2/u8x8_d_uc1701_mini12864.o \
./Core/Src/u8g2/u8x8_debounce.o \
./Core/Src/u8g2/u8x8_display.o \
./Core/Src/u8g2/u8x8_fonts.o \
./Core/Src/u8g2/u8x8_gpio.o \
./Core/Src/u8g2/u8x8_input_value.o \
./Core/Src/u8g2/u8x8_message.o \
./Core/Src/u8g2/u8x8_selection_list.o \
./Core/Src/u8g2/u8x8_setup.o \
./Core/Src/u8g2/u8x8_string.o \
./Core/Src/u8g2/u8x8_u16toa.o \
./Core/Src/u8g2/u8x8_u8toa.o 

C_DEPS += \
./Core/Src/u8g2/u8g2_bitmap.d \
./Core/Src/u8g2/u8g2_box.d \
./Core/Src/u8g2/u8g2_buffer.d \
./Core/Src/u8g2/u8g2_circle.d \
./Core/Src/u8g2/u8g2_cleardisplay.d \
./Core/Src/u8g2/u8g2_d_memory.d \
./Core/Src/u8g2/u8g2_d_setup.d \
./Core/Src/u8g2/u8g2_font.d \
./Core/Src/u8g2/u8g2_fonts.d \
./Core/Src/u8g2/u8g2_hvline.d \
./Core/Src/u8g2/u8g2_input_value.d \
./Core/Src/u8g2/u8g2_intersection.d \
./Core/Src/u8g2/u8g2_kerning.d \
./Core/Src/u8g2/u8g2_line.d \
./Core/Src/u8g2/u8g2_ll_hvline.d \
./Core/Src/u8g2/u8g2_message.d \
./Core/Src/u8g2/u8g2_polygon.d \
./Core/Src/u8g2/u8g2_selection_list.d \
./Core/Src/u8g2/u8g2_setup.d \
./Core/Src/u8g2/u8log.d \
./Core/Src/u8g2/u8log_u8g2.d \
./Core/Src/u8g2/u8log_u8x8.d \
./Core/Src/u8g2/u8x8_8x8.d \
./Core/Src/u8g2/u8x8_byte.d \
./Core/Src/u8g2/u8x8_cad.d \
./Core/Src/u8g2/u8x8_d_a2printer.d \
./Core/Src/u8g2/u8x8_d_il3820_296x128.d \
./Core/Src/u8g2/u8x8_d_ist3020.d \
./Core/Src/u8g2/u8x8_d_ks0108.d \
./Core/Src/u8g2/u8x8_d_lc7981.d \
./Core/Src/u8g2/u8x8_d_ld7032_60x32.d \
./Core/Src/u8g2/u8x8_d_ls013b7dh03.d \
./Core/Src/u8g2/u8x8_d_max7219.d \
./Core/Src/u8g2/u8x8_d_pcd8544_84x48.d \
./Core/Src/u8g2/u8x8_d_pcf8812.d \
./Core/Src/u8g2/u8x8_d_pcf8814_hx1230.d \
./Core/Src/u8g2/u8x8_d_sbn1661.d \
./Core/Src/u8g2/u8x8_d_sed1330.d \
./Core/Src/u8g2/u8x8_d_sh1106_64x32.d \
./Core/Src/u8g2/u8x8_d_sh1106_72x40.d \
./Core/Src/u8g2/u8x8_d_sh1107.d \
./Core/Src/u8g2/u8x8_d_sh1108.d \
./Core/Src/u8g2/u8x8_d_sh1122.d \
./Core/Src/u8g2/u8x8_d_ssd1305.d \
./Core/Src/u8g2/u8x8_d_ssd1306_128x32.d \
./Core/Src/u8g2/u8x8_d_ssd1306_128x64_noname.d \
./Core/Src/u8g2/u8x8_d_ssd1306_48x64.d \
./Core/Src/u8g2/u8x8_d_ssd1306_64x32.d \
./Core/Src/u8g2/u8x8_d_ssd1306_64x48.d \
./Core/Src/u8g2/u8x8_d_ssd1306_96x16.d \
./Core/Src/u8g2/u8x8_d_ssd1309.d \
./Core/Src/u8g2/u8x8_d_ssd1317.d \
./Core/Src/u8g2/u8x8_d_ssd1318.d \
./Core/Src/u8g2/u8x8_d_ssd1322.d \
./Core/Src/u8g2/u8x8_d_ssd1325.d \
./Core/Src/u8g2/u8x8_d_ssd1326.d \
./Core/Src/u8g2/u8x8_d_ssd1327.d \
./Core/Src/u8g2/u8x8_d_ssd1329.d \
./Core/Src/u8g2/u8x8_d_ssd1606_172x72.d \
./Core/Src/u8g2/u8x8_d_ssd1607_200x200.d \
./Core/Src/u8g2/u8x8_d_st75256.d \
./Core/Src/u8g2/u8x8_d_st7565.d \
./Core/Src/u8g2/u8x8_d_st7567.d \
./Core/Src/u8g2/u8x8_d_st7586s_erc240160.d \
./Core/Src/u8g2/u8x8_d_st7586s_s028hn118a.d \
./Core/Src/u8g2/u8x8_d_st7588.d \
./Core/Src/u8g2/u8x8_d_st7920.d \
./Core/Src/u8g2/u8x8_d_stdio.d \
./Core/Src/u8g2/u8x8_d_t6963.d \
./Core/Src/u8g2/u8x8_d_uc1601.d \
./Core/Src/u8g2/u8x8_d_uc1604.d \
./Core/Src/u8g2/u8x8_d_uc1608.d \
./Core/Src/u8g2/u8x8_d_uc1610.d \
./Core/Src/u8g2/u8x8_d_uc1611.d \
./Core/Src/u8g2/u8x8_d_uc1617.d \
./Core/Src/u8g2/u8x8_d_uc1638.d \
./Core/Src/u8g2/u8x8_d_uc1701_dogs102.d \
./Core/Src/u8g2/u8x8_d_uc1701_mini12864.d \
./Core/Src/u8g2/u8x8_debounce.d \
./Core/Src/u8g2/u8x8_display.d \
./Core/Src/u8g2/u8x8_fonts.d \
./Core/Src/u8g2/u8x8_gpio.d \
./Core/Src/u8g2/u8x8_input_value.d \
./Core/Src/u8g2/u8x8_message.d \
./Core/Src/u8g2/u8x8_selection_list.d \
./Core/Src/u8g2/u8x8_setup.d \
./Core/Src/u8g2/u8x8_string.d \
./Core/Src/u8g2/u8x8_u16toa.d \
./Core/Src/u8g2/u8x8_u8toa.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/u8g2/u8g2_bitmap.o: ../Core/Src/u8g2/u8g2_bitmap.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8g2_bitmap.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8g2_box.o: ../Core/Src/u8g2/u8g2_box.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8g2_box.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8g2_buffer.o: ../Core/Src/u8g2/u8g2_buffer.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8g2_buffer.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8g2_circle.o: ../Core/Src/u8g2/u8g2_circle.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8g2_circle.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8g2_cleardisplay.o: ../Core/Src/u8g2/u8g2_cleardisplay.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8g2_cleardisplay.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8g2_d_memory.o: ../Core/Src/u8g2/u8g2_d_memory.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8g2_d_memory.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8g2_d_setup.o: ../Core/Src/u8g2/u8g2_d_setup.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8g2_d_setup.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8g2_font.o: ../Core/Src/u8g2/u8g2_font.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8g2_font.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8g2_fonts.o: ../Core/Src/u8g2/u8g2_fonts.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8g2_fonts.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8g2_hvline.o: ../Core/Src/u8g2/u8g2_hvline.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8g2_hvline.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8g2_input_value.o: ../Core/Src/u8g2/u8g2_input_value.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8g2_input_value.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8g2_intersection.o: ../Core/Src/u8g2/u8g2_intersection.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8g2_intersection.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8g2_kerning.o: ../Core/Src/u8g2/u8g2_kerning.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8g2_kerning.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8g2_line.o: ../Core/Src/u8g2/u8g2_line.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8g2_line.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8g2_ll_hvline.o: ../Core/Src/u8g2/u8g2_ll_hvline.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8g2_ll_hvline.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8g2_message.o: ../Core/Src/u8g2/u8g2_message.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8g2_message.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8g2_polygon.o: ../Core/Src/u8g2/u8g2_polygon.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8g2_polygon.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8g2_selection_list.o: ../Core/Src/u8g2/u8g2_selection_list.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8g2_selection_list.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8g2_setup.o: ../Core/Src/u8g2/u8g2_setup.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8g2_setup.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8log.o: ../Core/Src/u8g2/u8log.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8log.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8log_u8g2.o: ../Core/Src/u8g2/u8log_u8g2.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8log_u8g2.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8log_u8x8.o: ../Core/Src/u8g2/u8log_u8x8.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8log_u8x8.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_8x8.o: ../Core/Src/u8g2/u8x8_8x8.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_8x8.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_byte.o: ../Core/Src/u8g2/u8x8_byte.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_byte.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_cad.o: ../Core/Src/u8g2/u8x8_cad.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_cad.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_a2printer.o: ../Core/Src/u8g2/u8x8_d_a2printer.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_a2printer.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_il3820_296x128.o: ../Core/Src/u8g2/u8x8_d_il3820_296x128.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_il3820_296x128.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_ist3020.o: ../Core/Src/u8g2/u8x8_d_ist3020.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_ist3020.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_ks0108.o: ../Core/Src/u8g2/u8x8_d_ks0108.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_ks0108.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_lc7981.o: ../Core/Src/u8g2/u8x8_d_lc7981.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_lc7981.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_ld7032_60x32.o: ../Core/Src/u8g2/u8x8_d_ld7032_60x32.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_ld7032_60x32.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_ls013b7dh03.o: ../Core/Src/u8g2/u8x8_d_ls013b7dh03.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_ls013b7dh03.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_max7219.o: ../Core/Src/u8g2/u8x8_d_max7219.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_max7219.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_pcd8544_84x48.o: ../Core/Src/u8g2/u8x8_d_pcd8544_84x48.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_pcd8544_84x48.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_pcf8812.o: ../Core/Src/u8g2/u8x8_d_pcf8812.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_pcf8812.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_pcf8814_hx1230.o: ../Core/Src/u8g2/u8x8_d_pcf8814_hx1230.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_pcf8814_hx1230.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_sbn1661.o: ../Core/Src/u8g2/u8x8_d_sbn1661.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_sbn1661.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_sed1330.o: ../Core/Src/u8g2/u8x8_d_sed1330.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_sed1330.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_sh1106_64x32.o: ../Core/Src/u8g2/u8x8_d_sh1106_64x32.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_sh1106_64x32.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_sh1106_72x40.o: ../Core/Src/u8g2/u8x8_d_sh1106_72x40.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_sh1106_72x40.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_sh1107.o: ../Core/Src/u8g2/u8x8_d_sh1107.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_sh1107.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_sh1108.o: ../Core/Src/u8g2/u8x8_d_sh1108.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_sh1108.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_sh1122.o: ../Core/Src/u8g2/u8x8_d_sh1122.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_sh1122.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_ssd1305.o: ../Core/Src/u8g2/u8x8_d_ssd1305.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_ssd1305.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_ssd1306_128x32.o: ../Core/Src/u8g2/u8x8_d_ssd1306_128x32.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_ssd1306_128x32.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_ssd1306_128x64_noname.o: ../Core/Src/u8g2/u8x8_d_ssd1306_128x64_noname.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_ssd1306_128x64_noname.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_ssd1306_48x64.o: ../Core/Src/u8g2/u8x8_d_ssd1306_48x64.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_ssd1306_48x64.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_ssd1306_64x32.o: ../Core/Src/u8g2/u8x8_d_ssd1306_64x32.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_ssd1306_64x32.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_ssd1306_64x48.o: ../Core/Src/u8g2/u8x8_d_ssd1306_64x48.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_ssd1306_64x48.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_ssd1306_96x16.o: ../Core/Src/u8g2/u8x8_d_ssd1306_96x16.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_ssd1306_96x16.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_ssd1309.o: ../Core/Src/u8g2/u8x8_d_ssd1309.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_ssd1309.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_ssd1317.o: ../Core/Src/u8g2/u8x8_d_ssd1317.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_ssd1317.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_ssd1318.o: ../Core/Src/u8g2/u8x8_d_ssd1318.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_ssd1318.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_ssd1322.o: ../Core/Src/u8g2/u8x8_d_ssd1322.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_ssd1322.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_ssd1325.o: ../Core/Src/u8g2/u8x8_d_ssd1325.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_ssd1325.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_ssd1326.o: ../Core/Src/u8g2/u8x8_d_ssd1326.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_ssd1326.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_ssd1327.o: ../Core/Src/u8g2/u8x8_d_ssd1327.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_ssd1327.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_ssd1329.o: ../Core/Src/u8g2/u8x8_d_ssd1329.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_ssd1329.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_ssd1606_172x72.o: ../Core/Src/u8g2/u8x8_d_ssd1606_172x72.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_ssd1606_172x72.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_ssd1607_200x200.o: ../Core/Src/u8g2/u8x8_d_ssd1607_200x200.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_ssd1607_200x200.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_st75256.o: ../Core/Src/u8g2/u8x8_d_st75256.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_st75256.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_st7565.o: ../Core/Src/u8g2/u8x8_d_st7565.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_st7565.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_st7567.o: ../Core/Src/u8g2/u8x8_d_st7567.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_st7567.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_st7586s_erc240160.o: ../Core/Src/u8g2/u8x8_d_st7586s_erc240160.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_st7586s_erc240160.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_st7586s_s028hn118a.o: ../Core/Src/u8g2/u8x8_d_st7586s_s028hn118a.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_st7586s_s028hn118a.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_st7588.o: ../Core/Src/u8g2/u8x8_d_st7588.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_st7588.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_st7920.o: ../Core/Src/u8g2/u8x8_d_st7920.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_st7920.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_stdio.o: ../Core/Src/u8g2/u8x8_d_stdio.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_stdio.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_t6963.o: ../Core/Src/u8g2/u8x8_d_t6963.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_t6963.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_uc1601.o: ../Core/Src/u8g2/u8x8_d_uc1601.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_uc1601.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_uc1604.o: ../Core/Src/u8g2/u8x8_d_uc1604.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_uc1604.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_uc1608.o: ../Core/Src/u8g2/u8x8_d_uc1608.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_uc1608.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_uc1610.o: ../Core/Src/u8g2/u8x8_d_uc1610.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_uc1610.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_uc1611.o: ../Core/Src/u8g2/u8x8_d_uc1611.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_uc1611.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_uc1617.o: ../Core/Src/u8g2/u8x8_d_uc1617.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_uc1617.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_uc1638.o: ../Core/Src/u8g2/u8x8_d_uc1638.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_uc1638.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_uc1701_dogs102.o: ../Core/Src/u8g2/u8x8_d_uc1701_dogs102.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_uc1701_dogs102.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_d_uc1701_mini12864.o: ../Core/Src/u8g2/u8x8_d_uc1701_mini12864.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_d_uc1701_mini12864.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_debounce.o: ../Core/Src/u8g2/u8x8_debounce.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_debounce.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_display.o: ../Core/Src/u8g2/u8x8_display.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_display.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_fonts.o: ../Core/Src/u8g2/u8x8_fonts.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_fonts.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_gpio.o: ../Core/Src/u8g2/u8x8_gpio.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_gpio.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_input_value.o: ../Core/Src/u8g2/u8x8_input_value.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_input_value.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_message.o: ../Core/Src/u8g2/u8x8_message.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_message.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_selection_list.o: ../Core/Src/u8g2/u8x8_selection_list.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_selection_list.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_setup.o: ../Core/Src/u8g2/u8x8_setup.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_setup.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_string.o: ../Core/Src/u8g2/u8x8_string.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_string.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_u16toa.o: ../Core/Src/u8g2/u8x8_u16toa.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_u16toa.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/u8g2/u8x8_u8toa.o: ../Core/Src/u8g2/u8x8_u8toa.c Core/Src/u8g2/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L071xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/u8g2/u8x8_u8toa.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

