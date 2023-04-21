#include "gpio.h"

int main(void){
    gpio_t led_rojo = gpioCreate(1,6,true,true);
    gpio_t tecla = gpioCreate(1,7,false,true);


    while (true)
    {
        if(gpioGetValue(tecla)){
            gpioSetValue(led_rojo,true);
        }else{
            gpioSetValue(led_rojo,false);
        }

        return 0;
    }
    return 0;
}