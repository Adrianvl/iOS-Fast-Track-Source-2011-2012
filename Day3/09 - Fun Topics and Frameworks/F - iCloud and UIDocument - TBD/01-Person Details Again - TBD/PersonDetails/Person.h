//
//  Person.h
//  PersonDetails
//
//  Created by Nicholas Outram on 28/09/2011.
//  Copyright (c) 2011 University of Plymouth. All rights reserved.
//

#import <Foundation/Foundation.h>

//Create a custom enumerated type
typedef enum {
    FEMALE, MALE
} PERSON_GENDER;

@interface Person : UIDocument

//Initialisation
- (id) initWithName:(NSString *)pName gender:(PERSON_GENDER)gen;
-(id)initwithDocumentName:(NSString*)doc;

//Class methods
+(float)calculateBodyMassIndexGivenWeight:(float)weight andHeight:(float)height;

//Properties (replacing the manual setters and getters)
@property (readwrite, nonatomic, copy) NSString *personName;
@property (readwrite, nonatomic, assign) NSUInteger age;
@property (readwrite, nonatomic, assign) float weightInKg;
@property (readwrite, nonatomic, assign) float heightInM;
@property (readwrite, nonatomic, assign) PERSON_GENDER gender;

//Derived accessors
-(float)bmi;


// To create a new document, allocate and initialize an instance of your subclass and then call saveToURL:forSaveOperation:completionHandler: on the instance.
// To open an existing document (selected by the user), allocate and initialize an instance of your subclass and then call openWithCompletionHandler: on the instance.
//
// to flag a document has been updated, send the message updateChangeCount: to the instance 
//
// to close - Call closeWithCompletionHandler: on the document instance
@end
