//
//  AppDelegate.h
//  PedigreeCore
//
//  Created by Harry Nelken on 11/2/14.
//  Copyright (c) 2014 Harry Nelken. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Individual.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, strong) Individual *individual;
@property (nonatomic, strong) NSArray *phenotypes;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

