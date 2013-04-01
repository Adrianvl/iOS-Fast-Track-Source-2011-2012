//
//  main.m
//  FunctionPointers
//
//  Created by Nicholas Outram on 27/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

unsigned long primeFactor(unsigned long u, void (^callback)(unsigned long progress) );

int main (int argc, const char * argv[])
{

    @autoreleasepool {

        
        // insert code here...
        int N=0;    //Local stack variable
        int M=99;   //Local stack variable (not referenced by a block)
        NSNumber *nn = [NSNumber numberWithInt:N];  //Object - pointer is local, the object is on the heap
        
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:1];   //BREAKPOINT THIS LINE
        
        //This block makes a copy of N by value and nn by reference
        void(^block1)(void) = ^ {
            NSLog(@" N=%d", N);     
            NSLog(@"nn=%@", nn); 
            [array addObject:nn];
            NSLog(@"array = %@", array);
        };
        
        N++;
        nn = [NSNumber numberWithInt:N];        
        
        //This block makes a copy of N by value and nn by reference
        void(^block2)(void) = ^ {                                       //BREAKPOINT THIS LINE
            NSLog(@" N=%d", N);
            NSLog(@"nn=%@", nn); 
            [array addObject:nn];
            NSLog(@"array = %@", array);
        };

        block1();
        block2();
        
        M++;
    }
    return 0;
}


