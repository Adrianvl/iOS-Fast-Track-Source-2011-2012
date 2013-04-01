//
//  Model.m
//  PlainTable
//
//  Created by Nicholas Outram on 30/03/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import "Model.h"


@implementation Model
@synthesize pets;

//Designated initialiser for this class
- (id) init
{
	self = [super init];
	if (self != nil) {

		//Lets keep things simple and populate the collection with all the data
		pets = [[NSMutableArray alloc] initWithObjects:
							@"Cat", @"Dog", @"Tortoise", 
							@"Snow Leopard", @"Spitting Cobra", 
							@"Rhino", @"Brick on a string", 
							@"Bird eating goldfish", @"Vampire Sheep", 
							@"Caged sponge",
				nil];
		
		
		
		
	}
	return self;
}

//This read-only accessor is simple to make the code more verbose
-(NSUInteger)numberOfPets
{
	return [pets count];
}

//Tidy up when the retain count == 0
- (void) dealloc
{
	//This will release the old and attempt to retain nil (which does nothing)
	//Releasing a collection will results in the 'contained' objecs also being released
	self.pets = nil;
	[super dealloc];
}

@end
