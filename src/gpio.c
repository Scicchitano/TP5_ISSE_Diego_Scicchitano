#include "gpio.h"

#ifndef GPIO_COUNT
#define GPIO_COUNT 6
#endif

typedef struct gpio_s{
    uint8_t port;
    uint8_t pin;
    bool output;
    bool inverted;
} *gpio_t;

gpio_t gpioCreate(uint8_t port, uint8_t pin, bool output, bool inverted){
    gpio_t result = malloc(sizeof(struct gpio_s));
    if(result){
        result->port = port;
        result->pin = pin;
        result->output = output;
        result->inverted = inverted;
    }

    return result;
}

bool gpioGetValue(gpio_t output){
    /*Deberia leer el valor actual*/
}

void gpioSetValue(gpio_t output, bool value){
    /*Cambio de estado*/

}