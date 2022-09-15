/* CS 254 Program 0
|  Author: Christiano Carta
|  Date: 09/01/2022
|
| Compute N factorial for N=1 to 50.
*/

#include<stdio.h>

int nfactorial(int counter);

int main(void)
{
    int counter;
    printf("Number n, 1-50 \n");
    scanf("%d", &counter);
    printf("%d Factorial = %d \n", counter, nfactorial(counter));
}

int nfactorial(int counter)
{
    if (counter <= 1)
        return 1;

    return counter * nfactorial((counter - 1));
}

