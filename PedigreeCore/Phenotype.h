//
//  Phenotype.h
//  PedigreeCore
//
//  Created by Harry Nelken on 11/2/14.
//  Copyright (c) 2014 Harry Nelken. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Individual;

@interface Phenotype : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * details;
@property (nonatomic, retain) NSSet *carriedBy;
@end

@interface Phenotype (CoreDataGeneratedAccessors)

- (void)addCarriedByObject:(Individual *)value;
- (void)removeCarriedByObject:(Individual *)value;
- (void)addCarriedBy:(NSSet *)values;
- (void)removeCarriedBy:(NSSet *)values;

@end
