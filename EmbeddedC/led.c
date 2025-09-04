#include <LPC17xx.h>

unsigned int i, j;
unsigned long LED = 0x00000010; // Initial LED mask (starts at P0.4)

int main(void)
{
    SystemInit();                 // Initialize system (PLL, Clock, etc.)
    SystemCoreClockUpdate();     // Update SystemCoreClock variable

    // Configure Port0 PINS P0.4 - P0.11 as GPIO
    LPC_PINCON->PINSEL0 &= 0xFF0000FF; // Clear function bits for P0.4 - P0.11

    // Set P0.4 - P0.11 as output
    LPC_GPIO0->FIODIR |= 0x00000FF0;

    while (1)
    {
        // Turn ON LEDs from P0.4 to P0.11 one by one
        LED = 0x00000010; // Reset to P0.4
        for (i = 1; i < 9; i++)
        {
            LPC_GPIO0->FIOSET = LED; // Turn ON current LED
            for (j = 0; j < 100000; j++); // Software delay
            LED <<= 1; // Shift to next LED
        }

        // Turn OFF LEDs from P0.4 to P0.11 one by one
        LED = 0x00000010; // Reset to P0.4
        for (i = 1; i < 9; i++)
        {
            LPC_GPIO0->FIOCLR = LED; // Turn OFF current LED
            for (j = 0; j < 100000; j++); // Software delay
            LED <<= 1; // Shift to next LED
        }
    }
}
