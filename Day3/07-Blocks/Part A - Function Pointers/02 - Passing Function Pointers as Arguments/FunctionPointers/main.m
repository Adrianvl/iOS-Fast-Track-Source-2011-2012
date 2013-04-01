//
//  main.m
//  FunctionPointers
//
//  Created by Nicholas Outram on 27/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
int multiplyTheseInC(int a, int b);
int addTheseInC(int a, int b);
void doTheMath( int (*f)(int a1, int a2), int *a, int *b, int *y, int N );

unsigned long primeFactor(unsigned long u, void (*callback)(unsigned long progress) );
void logMessage(unsigned long m);

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Demonstration of C Function Pointers");
        
        //Function pointers - declare and assign
        int (*fun1)(int,int);
        fun1 = multiplyTheseInC;
        
        int (*fun2)(int,int);
        fun2 = addTheseInC;
            
        int array1[] = {2,4,6,8};
        int array2[] = {1,3,5,7};
        int arrayY[4];
        
        //Perform scalar function on the arrays of data - specifying the function at runtime
        //Note we also have to pass pointers to all the data, including the result
        doTheMath(fun1, array1, array2, arrayY, 4);
        doTheMath(fun2, array1, array2, arrayY, 4);
        
        //Call-backs
        //Call this (potentially slow) function with a call back every 10000000 iterations
        void (*cbf)(unsigned long) = logMessage;
        unsigned long y = primeFactor(1234162663u, cbf);
        
        //Print results
        if (y==0) {
            printf("\nPrime");
        } else {
            printf("\nFirst prime factor is %lu", y);
        }
        
    }
    return 0;
}

//Vectorise a scalar function - first argument is a function pointer f
//This is synchronous
void doTheMath( int (*f)(int a1, int a2), int *a, int *b, int *y, int N )
{
    for (unsigned int n=0; n<N; n++) {
        y[n] = f(a[n],b[n]);
    }
}

//C Scalar Functions
int multiplyTheseInC(int a, int b)
{
    printf("\nThis is a simple function call - two parameters, one return type");
    printf("\nYou passed %d,%d",a,b);
    return a*b;    
}

int addTheseInC(int a, int b)
{
    printf("\nThis is a simple function call - two parameters, one return type");
    printf("\nYou passed %d,%d",a,b);
    return a+b;
}

//Find the first factor, or return zero if prime
//Many thanks to http://www.bigprimes.net/primality_test/ for providing some examples
unsigned long primeFactor(unsigned long u, void (*callback)(unsigned long progress) )
{
    //Is it even?
    if ((u & 1) == 0) return 0;
    for (unsigned long v = 3; v<u/2; v+=2) {
        //Does u divide by v without any remainder?
        if (( (u/v) * v ) == u) {
            return v;
        }
        //Keep user informed of progress
        if (((v+1) % 10000000) == 0) {
            callback(v);
        }
    }
    return 0;
}

//Call back
void logMessage(unsigned long m)
{
    printf("\nI have reached index %lu", m);    
}

