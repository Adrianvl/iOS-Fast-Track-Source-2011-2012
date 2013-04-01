//
//  Model.h
//  PlainTable
//
//  Created by Nicholas Outram on 30/03/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Model : NSObject {
	NSMutableDictionary *dictionaryOfSections;
	NSArray *categoriesOfPets;
}

@property (readwrite, nonatomic, retain) NSMutableDictionary *dictionaryOfSections;
@property (readwrite, nonatomic, retain) NSArray *categoriesOfPets;


@end
