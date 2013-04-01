//
//  Model.m
//  PlainTable
//
//  Created by Nicholas Outram on 30/03/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import "Model.h"


@implementation Model
@synthesize dictionaryOfSections, categoriesOfPets;

//Designated initialiser for this class
- (id) init
{
	self = [super init];
	if (self != nil) {
		
		//Dictionary of arrays (one per section)
		dictionaryOfSections = [[NSMutableDictionary alloc] init];
		
		NSArray *records;
		
		//Section 0 - popular pets
		records = [NSArray arrayWithObjects:@"Cat", @"Dog", @"Tortoise", nil];
		[dictionaryOfSections setObject:[NSMutableArray arrayWithArray:records] forKey:@"Popular Pets"];
		
		//Section 1 - dangerous pets
		records = [NSArray arrayWithObjects:@"Snow Leopard", @"Spitting Cobra", @"Rhino", nil];
		[dictionaryOfSections setObject:[NSMutableArray arrayWithArray:records] forKey:@"Dangerous Pets"];
		
		//Section 2 - surreal pets
		records = [NSArray arrayWithObjects:@"Brick on a string", @"Bird eating goldfish", @"Vampire Sheep", @"Caged sponge", nil];
		[dictionaryOfSections setObject:[NSMutableArray arrayWithArray:records] forKey:@"Surreal Pets"];	
		
		//Array of category names (already exists - so no point duplicating in memory)
		self.categoriesOfPets = [self.dictionaryOfSections allKeys];
		
	}
	return self;
}


//Tidy up when the retain count == 0
- (void) dealloc
{
	//This will release the old and attempt to retain nil (which does nothing)
	//Releasing a collection will results in the 'contained' objecs also being released
	self.dictionaryOfSections = nil;
	self.categoriesOfPets = nil;
	[super dealloc];
}

@end
