//
//  main.m
//  FunctionPointers
//
//  Created by Nicholas Outram on 27/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Demonstration of C Blocks Pointers");
                            
        //Blocks - declare and assign
//      void (*fun1)(void);
        void (^fun1)(void);     //Declare
        fun1 = ^(void) {        //Define
            printf("\nThis is a simple function call - no parameters, no return type");                
        };

//      void (*fun2)(int);
        void (^fun2)(int);
        fun2 = ^(int n) {
            printf("\nThis is a simple function call - one parameter, no return type");
            printf("\nThe value passed was %d", n);            
        };

//      void (*fun3)(int,int);
        void (^fun3)(int,int);
        fun3 = ^(int p, int q) {
            printf("\nThis is a simple function call - two parameters, no return type");
            printf("\nThe values passed are %d,%d", p,q);            
        };
        
//      int (*fun4)(int,int);
        int (^fun4)(int,int);
        fun4 = ^(int a, int b) {
            printf("\nThis is a simple function call - two parameters, one return type");
            printf("\nYou passed %d,%d",a,b);
            return a+b;            
        };
                
        //Call as normal
        fun1();
        fun2(123);
        fun3(10,20);
        int y = fun4(11,22);
        printf("11+22=%d",y);
        
        //Define a block as a type
        typedef double(^doMathOnDoubles)(double, double);

        //Define some blocks
        doMathOnDoubles fFunc1;
        doMathOnDoubles fFunc2;
        
        //Declare some blocks
        fFunc1 = ^(double a, double b) {
            return sqrt(a*a+b*b);
        };
        fFunc2 = ^(double a, double b) {
            return MAX(fabs(a), fabs(b));
        };
        
        //Call the code
        double yy;
        yy = fFunc1(4.0, 3.0);
        yy = fFunc2(4.0, 3.0);
        
    }
    return 0;
}

