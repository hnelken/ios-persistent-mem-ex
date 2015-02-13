//
//  AddMemberViewController.m
//  PedigreeCore
//
//  Created by Harry Nelken on 11/3/14.
//  Copyright (c) 2014 Harry Nelken. All rights reserved.
//

#import "AddMemberViewController.h"
#import "AppDelegate.h"
#import "Individual.h"
#import "Phenotype.h"

@interface AddMemberViewController ()

@end

@implementation AddMemberViewController
@synthesize managedObjectContext;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.famText.delegate = self;
    self.indvText.delegate = self;
    self.patText.delegate = self;
    self.matText.delegate = self;
    self.genderText.delegate = self;
    self.firstText.delegate = self;
    self.lastText.delegate = self;
    self.birthText.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (IBAction)didTapSaveButton:(id)sender {
    AppDelegate *del = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = self.managedObjectContext;
    Individual *newGuy = [NSEntityDescription insertNewObjectForEntityForName:@"Individual" inManagedObjectContext:context];
    self.phenotypes = del.phenotypes;
    // If appropriate, configure the new managed object.
    // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.
    
    newGuy.familyID = self.famText.text;
    newGuy.individualID = self.indvText.text;
    newGuy.fatherID = self.patText.text;
    newGuy.motherID = self.matText.text;
    newGuy.genderID = self.genderText.text;
    newGuy.firstName = self.firstText.text;
    newGuy.lastName = self.lastText.text;
    newGuy.birthDate = self.birthText.text;
    
    if (self.cancerSwitch.on) {
        [newGuy addHasObject:[self.phenotypes objectAtIndex:0]];
    }
    if (self.infectSwitch.on) {
        [newGuy addHasObject:[self.phenotypes objectAtIndex:1]];
    }
    if (self.heartSwitch.on) {
        [newGuy addHasObject:[self.phenotypes objectAtIndex:2]];
    }
    if (self.liverSwitch.on) {
        [newGuy addHasObject:[self.phenotypes objectAtIndex:3]];
    }
    if (self.mentalSwitch.on) {
        [newGuy addHasObject:[self.phenotypes objectAtIndex:4]];
    }
    
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

@end
