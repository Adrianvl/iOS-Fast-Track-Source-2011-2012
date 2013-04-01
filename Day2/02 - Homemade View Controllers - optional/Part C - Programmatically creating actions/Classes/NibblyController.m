//
//  NibblyController.m
//  Nibbly
//
//  Created by noutram on 05/02/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import "NibblyController.h"


@implementation NibblyController
@synthesize view, button, label, otherViewController;

-(id) init
{
    NSString *nibName = NSStringFromClass([self class]);
    return [self initWithNibName:nibName];
}

//New Designated Initialiser
- (id) initWithNibName:(NSString*)nibName
{
    self = [super init];
    if (self != nil) {
        //Initialise here
        NSArray *objects = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
        NSLog(@"Loaded %d objects of type:", [objects count]);
        for (NSUInteger n=0; n<[objects count]; n++) {
            NSLog(@"\tObject %d is of type %@", n, [[objects objectAtIndex:n] class]);
            NSLog(@"and it has the following %d child views", [[[objects objectAtIndex:n] subviews] count]);
            NSArray *subViews = [[objects objectAtIndex:n] subviews];
            for (UIView *theview in subViews) {
                NSLog(@"    %@", [theview class]);
            }
        }
    }
    return self;
}


- (void) dealloc
{
    //Dealloc here
    self.label = nil;
    self.button = nil;
    self.view = nil;
    self.otherViewController = nil;
    [super dealloc];
}


-(IBAction)doSomething:(id)sender
{
    NSLog(@"Click!");
    if (self.otherViewController == nil) {
        otherViewController = [[SimpleController alloc] initWithNibName:@"SimpleController"];
        CGRect r = self.otherViewController.view.frame;
        r.origin.x = 50; r.origin.y = 50;
        self.otherViewController.view.frame = r;
        [self.view addSubview:self.otherViewController.view];  
        
        //Hook up an action
        [self.otherViewController.button addTarget:self 
                                            action:@selector(doSomethingElse:) 
                                  forControlEvents:UIControlEventTouchDown ];
        
    } else {
        //Unhook the action
        [self.otherViewController.button removeTarget:self 
                                               action:@selector(doSomethingElse:) 
                                     forControlEvents:UIControlEventTouchDown ];
        //Remove the parent view
        [self.otherViewController.view removeFromSuperview];
        
        //Release
        self.otherViewController = nil;
    }
}

-(IBAction)doSomethingElse:(id)sender
{
    NSLog(@"YES!");
}
@end
