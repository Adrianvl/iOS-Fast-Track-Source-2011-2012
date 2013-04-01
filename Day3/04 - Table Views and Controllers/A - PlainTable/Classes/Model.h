//
//  Model.h
//  PlainTable
//
//  Created by Nicholas Outram on 30/03/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Model : NSObject {
	NSMutableArray *pets;
}

@property(readwrite, nonatomic, retain) NSMutableArray *pets;
@property(readonly) NSUInteger numberOfPets;
@end
