//
//  Individual.h
//  PedigreeCore
//
//  Created by Harry Nelken on 11/2/14.
//  Copyright (c) 2014 Harry Nelken. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Phenotype.h"

@interface Individual : NSManagedObject

@property (nonatomic, retain) NSString * familyID;
@property (nonatomic, retain) NSString * individualID;
@property (nonatomic, retain) NSString * fatherID;
@property (nonatomic, retain) NSString * motherID;
@property (nonatomic, retain) NSString * genderID;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * birthDate;
@property (nonatomic, retain) NSSet *has;

@end

@interface Individual (CoreDataGeneratedAccessors)

- (void)addHasObject:(Phenotype *)value;
- (void)removeHasObject:(Phenotype *)value;
- (void)addHas:(NSSet *)values;
- (void)removeHas:(NSSet *)values;

@end
