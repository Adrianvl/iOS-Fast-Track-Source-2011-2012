//
//  main.m
//  FunctionPointers
//
//  Created by Nicholas Outram on 27/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
void doSomethingInC(void);
void showNumberInC(int n);
void showTwoNumbersInC(int p, int q);
int addTheseInC(int a, int b);
double multiplyByPI(double a);


int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Demonstration of C Function Pointers");
        
        //Regular funcion calls in C
        doSomethingInC();
        showNumberInC(123);
        showTwoNumbersInC(10,20);
        int y = addTheseInC(11, 22);
        printf("11+22=%d",y);
        
        
        printf("\n*************************************** ");
        printf("\nNow for the function pointer equivalent ");
        printf("\n*************************************** ");
        
        //Function pointers - declare and assign
        void (*fun1)(void);
        fun1 = doSomethingInC;
        
        void (*fun2)(int);
        fun2 = showNumberInC;

        void (*fun3)(int,int);
        fun3 = showTwoNumbersInC;
        
        int (*fun4)(int,int);
        fun4 = addTheseInC;
        
        //Call as normal
        fun1();
        fun2(123);
        fun3(10,20);
        y = fun4(11,22);
        printf("11+22=%d",y);
        
        //Using a type definition
        typedef double(*myfunction)(double);        
        
        myfunction fun5 = multiplyByPI;
        double c = fun5(10.0);
        printf("\n10.0*PI=%3.6f",c);
        
        
    }
    return 0;
}

//C Functions
void doSomethingInC(void)
{
    printf("\nThis is a simple function call - no parameters, no return type");
}


void showNumberInC(int n)
{
    printf("\nThis is a simple function call - one parameter, no return type");
    printf("\nThe value passed was %d", n);
}

void showTwoNumbersInC(int p, int q)
{
    printf("\nThis is a simple function call - two parameters, no return type");
    printf("\nThe values passed are %d,%d", p,q);
}

int addTheseInC(int a, int b)
{
    printf("\nThis is a simple function call - two parameters, one return type");
    printf("\nYou passed %d,%d",a,b);
    return a+b;
}

double multiplyByPI(double a)
{
    return a*3.1415926;
}
