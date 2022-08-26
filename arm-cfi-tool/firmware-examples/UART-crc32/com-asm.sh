#!/bin/bash

#call gcc-arm-none-eabi ASM assembler

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as gpio.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/gpio.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as main.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/main.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as startup_stm32f429nihx.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/startup_stm32f429nihx.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as stm32f4xx_hal_cortex.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/stm32f4xx_hal_cortex.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as stm32f4xx_hal_dma.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/stm32f4xx_hal_dma.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as stm32f4xx_hal_dma_ex.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/stm32f4xx_hal_dma_ex.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as stm32f4xx_hal_exti.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/stm32f4xx_hal_exti.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as stm32f4xx_hal_flash_ex.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/stm32f4xx_hal_flash_ex.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as stm32f4xx_hal_flash_ramfunc.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/stm32f4xx_hal_flash_ramfunc.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as stm32f4xx_hal_flash.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/stm32f4xx_hal_flash.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as stm32f4xx_hal_gpio.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/stm32f4xx_hal_gpio.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as stm32f4xx_hal_msp.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/stm32f4xx_hal_msp.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as stm32f4xx_hal_pwr_ex.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/stm32f4xx_hal_pwr_ex.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as stm32f4xx_hal_pwr.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/stm32f4xx_hal_pwr.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as stm32f4xx_hal_rcc_ex.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/stm32f4xx_hal_rcc_ex.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as stm32f4xx_hal_rcc.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/stm32f4xx_hal_rcc.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as stm32f4xx_hal_tim_ex.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/stm32f4xx_hal_tim_ex.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as stm32f4xx_hal_tim.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/stm32f4xx_hal_tim.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as stm32f4xx_hal_uart.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/stm32f4xx_hal_uart.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as stm32f4xx_hal.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/stm32f4xx_hal.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as stm32f4xx_it.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/stm32f4xx_it.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as system_stm32f4xx.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/system_stm32f4xx.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as tim.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/tim.o

/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-as usart.s -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -o obj/usart.o


#FILE
# command
# gpio
# main
# startup_stm32f429nihx
# stm32f4xx_hal_cortex
# stm32f4xx_hal_dma_ex
# stm32f4xx_hal_dma
# stm32f4xx_hal_exti
# stm32f4xx_hal_flash_ex
# stm32f4xx_hal_flash_ramfunc
# stm32f4xx_hal_flash
# stm32f4xx_hal_gpio
# stm32f4xx_hal_msp
# stm32f4xx_hal_pwr_ex
# stm32f4xx_hal_pwr
# stm32f4xx_hal_rcc_ex
# stm32f4xx_hal_rcc
# stm32f4xx_hal_tim_ex
# stm32f4xx_hal_tim
# stm32f4xx_hal_uart
# stm32f4xx_hal
# stm32f4xx_it
# system_stm32f4xx
# usart