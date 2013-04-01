//
//  Person.m
//  PersonDetails
//
//  Created by Nicholas Outram on 28/09/2011.
//  Copyright (c) 2011 University of Plymouth. All rights reserved.
//

#import "Person.h"
#import "NSBundleUOPCategory.h"

@implementation Person {
    
    //Model data members
    NSString *personName;
    NSUInteger age;
    float weightInKg;
    float heightInM;
    PERSON_GENDER gender;
}

@synthesize personName, age, weightInKg, heightInM, gender;

//Default initialiser
- (id) init
{
    //Not allowed
    NSException *e = [[NSException alloc] initWithName:@"Parameterless init not allowed" reason:@"No document name provided" userInfo:nil];
    [e raise];
    return nil;
}

-(id)initwithDocumentName:(NSString*)doc
{
    //Call parent class designated initialiser
    NSString *filePath = [NSBundle pathToFileInDocumentsFolder:doc];
    self = [super initWithFileURL:[NSURL fileURLWithPath:filePath]];
    //Try and open
    [self openWithCompletionHandler:^(BOOL success) {
        if (success == NO) {
            //Create new document
            NSLog(@"Creating new document");
            self.age = 18;
            self.weightInKg = 65.0;
            self.heightInM = 1.6;
            self.personName  = @"";            
            self.gender = MALE;
            [self saveToURL:self.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
                //Create new document
                if (success == YES) {
                    NSLog(@"Document created sucessfully");
                }
                
            }];
        }
    }];
    return self;
}
- (id) initWithName:(NSString *)pName  gender:(PERSON_GENDER)gen
{
    //There is only one document in this case
    NSString *filePath = [NSBundle pathToFileInDocumentsFolder:@"document.dat"];
    
    //Call parent class designated initialiser
    self = [super initWithFileURL:[NSURL fileURLWithPath:filePath]];
    if (self) {
        age = 18;
        weightInKg = 65.0;
        heightInM = 1.6;
        
        //The string arguments passed are not guaranteed to remain in memory UNLESS this object retains or makes an indepdent copy of them
        personName  = [pName copy];      //THESE OBJECTS NOW HAVE A RETAIN COUNT OF 1        
        gender = gen;
    }
    return self;
}

- (void)dealloc {
    //This time there is something to do - release the objects retained by the init method
    [personName release];
    
    [super dealloc];
}

- (id)contentsForType:(NSString *)typeName error:(NSError **)outError
{
    NSData *data;
    NSDictionary *dictofData = [NSDictionary dictionaryWithObjectsAndKeys:
                                self.personName, @"personName",
                                [NSNumber numberWithInt:self.age], @"age",
                                [NSNumber numberWithFloat:self.weightInKg], @"weightInKg",
                                [NSNumber numberWithFloat:self.heightInM] , @"heightInM",
                                [NSNumber numberWithInt:self.gender]      , @"gender",
                                nil];
    
    data = [NSKeyedArchiver archivedDataWithRootObject:dictofData];
    return data;
}

- (BOOL)loadFromContents:(id)contents ofType:(NSString *)typeName error:(NSError **)outError
{
    NSDictionary *dictOfdata = [NSKeyedUnarchiver unarchiveObjectWithData:contents];
    self.personName = [dictOfdata objectForKey:@"personName"];
    self.age = [[dictOfdata objectForKey:@"age"] intValue];
    self.weightInKg = [[dictOfdata objectForKey:@"weightInKg"] floatValue];
    self.heightInM  = [[dictOfdata objectForKey:@"heightInM"] floatValue];
    self.gender     = [[dictOfdata objectForKey:@"gender"] intValue];
    return YES;
}

//Override description
-(NSString*)description
{
    NSString *desc = [NSMutableString stringWithFormat:@"name: %@, age=%u, weight=%2.2f, height = %2.2f", personName, age, weightInKg, heightInM];
    return desc;
}

//CLASS METHODS

+(float)calculateBodyMassIndexGivenWeight:(float)weight andHeight:(float)height
{
    //Mass / (height * height)
    if (height < 0.1) {
        [NSException raise:@"PersonClassException" format:@"Height must be at least 10cm"];
    }    
    
    float heightSquared = height * height;
    return (weight / heightSquared);
}

//Here we create our own accessors
-(float)bmi {
    float result = [Person calculateBodyMassIndexGivenWeight:weightInKg andHeight:heightInM];
    return result;
}

@end
