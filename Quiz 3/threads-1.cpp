#include <iostream>
#include <pthread.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

/**
 * Sums the first 100 numbers from the provided number
 * @param arg - the argument
 */
void* sum(void* arg)
{
    // Typecast the pointer
    int number = *(int*)arg;

    // The sum
    int sum = 0;

    // Compute the sum
    for(int num = number; num < number + 100; ++num)
    {
        sum += num;
    }

    fprintf(stderr, "Sum = %d\n", sum);
}

int main()
{
    // An arbitrary number to start from
    int* startNum;
    *startNum = 10;

    pthread_t id;

    // Create a thread
    if(pthread_create(&id, NULL, sum, (void*)startNum) < 0)
    {
        perror("pthread_create");
        exit(1);
    }
    sum((void*)startNum);

    return 0;
}
