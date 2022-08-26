OBJS += \
./obj/bmhasrch.o \
./obj/bmhisrch.o \
./obj/bmhsrch.o \
./obj/gpio.o \
./obj/main.o \
./obj/startup_stm32f429nihx.o \
./obj/stm32f4xx_hal_cortex.o \
./obj/stm32f4xx_hal_dma.o \
./obj/stm32f4xx_hal_dma_ex.o \
./obj/stm32f4xx_hal_exti.o \
./obj/stm32f4xx_hal_flash_ex.o \
./obj/stm32f4xx_hal_flash_ramfunc.o \
./obj/stm32f4xx_hal_flash.o \
./obj/stm32f4xx_hal_gpio.o \
./obj/stm32f4xx_hal_msp.o \
./obj/stm32f4xx_hal_pwr_ex.o \
./obj/stm32f4xx_hal_pwr.o \
./obj/stm32f4xx_hal_rcc_ex.o \
./obj/stm32f4xx_hal_rcc.o \
./obj/stm32f4xx_hal_tim_ex.o \
./obj/stm32f4xx_hal_tim.o \
./obj/stm32f4xx_hal_uart.o \
./obj/stm32f4xx_hal.o \
./obj/stm32f4xx_it.o \
./obj/system_stm32f4xx.o \
./obj/tim.o \
./obj/usart.o


USER_OBJS :=

LIBS :=


# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
UART-string.elf \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
UART-string.list \

OBJCOPY_BIN += \
UART-string.bin \


# All Target
all: UART-string.elf secondary-outputs


UART-string.elf: $(OBJS) ./STM32F429NIHX_FLASH.ld
	/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-gcc -o "UART-string.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"./STM32F429NIHX_FLASH.ld" --specs=nosys.specs -Wl,-Map="UART-string.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES)
	/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

UART-string.list: $(EXECUTABLES)
	/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-objdump -h -S $(EXECUTABLES) > "UART-string.list"
	@echo 'Finished building: $@'
	@echo ' '

UART-string.bin: $(EXECUTABLES)
	/Users/nico/gcc-arm-none-eabi-9-2019-q4-major/bin/arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "UART-string.bin"
	@echo 'Finished building: $@'
	@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_BIN)

