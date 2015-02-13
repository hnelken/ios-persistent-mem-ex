//
//  EditMemberViewController.m
//  PedigreeCore
//
//  Created by Harry Nelken on 11/3/14.
//  Copyright (c) 2014 Harry Nelken. All rights reserved.
//

#import "EditMemberViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface EditMemberViewController ()

@end

@implementation EditMemberViewController
@synthesize managedObjectContext;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AppDelegate *del = [[UIApplication sharedApplication] delegate];
    self.individual = del.individual;
    self.famText.text = del.individual.familyID;
    self.indvText.text = del.individual.individualID;
    self.patText.text = del.individual.fatherID;
    self.matText.text = del.individual.motherID;
    self.genderText.text = del.individual.genderID;
    self.firstText.text = del.individual.firstName;
    self.lastText.text = del.individual.lastName;
    self.birthText.text = del.individual.birthDate;
    self.famText.delegate = self;
    self.indvText.delegate = self;
    self.patText.delegate = self;
    self.matText.delegate = self;
    self.genderText.delegate = self;
    self.firstText.delegate = self;
    self.lastText.delegate = self;
    self.birthText.delegate = self;
    
    for (Phenotype *type in self.individual.has) {
        if ([type.name isEqualToString:@"Cancer"] == YES) {
            self.cancerSwitch.on = YES;
            self.hadCancer = YES;
        } else if ([type.name isEqualToString:@"Infectious Disease"] == YES) {
            self.infectSwitch.on = YES;
            self.hadInfect = YES;
        } else if ([type.name isEqualToString:@"Heart Disease"] == YES) {
            self.heartSwitch.on = YES;
            self.hadHeart = YES;
        } else if ([type.name isEqualToString:@"Liver Disease"] == YES) {
            self.liverSwitch.on = YES;
            self.hadLiver = YES;
        } else if ([type.name isEqualToString:@"Mental Disorder"] == YES) {
            self.mentalSwitch.on = YES;
            self.hadMental = YES;
        }
    }
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

- (IBAction)didSaveChanges:(id)sender {
    // Retrieve the context
    if (managedObjectContext == nil) {
        managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    }
    
    // Retrieve the entity from the local store -- much like a table in a database
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Individual" inManagedObjectContext:managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    // Set the predicate -- much like a WHERE statement in a SQL database
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self == %@", self.individual];
    [request setPredicate:predicate];
    
    // Set the sorting -- mandatory, even if you're fetching a single record/object
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptors];
    
    // Request the data -- NOTE, this assumes only one match, that
    // yourIdentifyingQualifier is unique. It just grabs the first object in the array.
    NSError *error;
    Individual *edited = [[managedObjectContext executeFetchRequest:request error:&error] objectAtIndex:0];
    AppDelegate *del = [[UIApplication sharedApplication] delegate];
    self.phenotypes = del.phenotypes;
    edited.familyID = self.famText.text;
    edited.individualID = self.indvText.text;
    edited.fatherID = self.patText.text;
    edited.motherID = self.matText.text;
    edited.genderID = self.genderText.text;
    edited.firstName = self.firstText.text;
    edited.lastName = self.lastText.text;
    edited.birthDate = self.birthText.text;
    
    if (self.cancerSwitch.on && !self.hadCancer) {
        [edited addHasObject:[self.phenotypes objectAtIndex:0]];
    } else if (!self.cancerSwitch.on && self.hadCancer) {
        [edited removeHasObject:[self.phenotypes objectAtIndex:0]];
    }
    if (self.infectSwitch.on && !self.hadInfect) {
        [edited addHasObject:[self.phenotypes objectAtIndex:1]];
    } else if (!self.infectSwitch.on && self.hadInfect) {
        [edited removeHasObject:[self.phenotypes objectAtIndex:1]];
    }
    if (self.heartSwitch.on && !self.hadHeart) {
        [edited addHasObject:[self.phenotypes objectAtIndex:2]];
    } else if (!self.heartSwitch.on && self.hadHeart) {
        [edited removeHasObject:[self.phenotypes objectAtIndex:2]];
    }
    if (self.liverSwitch.on && !self.hadLiver) {
        [edited addHasObject:[self.phenotypes objectAtIndex:3]];
    } else if (!self.liverSwitch.on && self.hadLiver) {
        [edited removeHasObject:[self.phenotypes objectAtIndex:3]];
    }
    if (self.mentalSwitch.on && !self.hadMental) {
        [edited addHasObject:[self.phenotypes objectAtIndex:4]];
    } else if (!self.mentalSwitch.on && self.hadMental) {
        [edited removeHasObject:[self.phenotypes objectAtIndex:4]];
    }
    
    NSError *error2;
    [self.managedObjectContext save:&error2];
}

@end
