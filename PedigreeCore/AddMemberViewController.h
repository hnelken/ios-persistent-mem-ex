//
//  AddMemberViewController.h
//  PedigreeCore
//
//  Created by Harry Nelken on 11/3/14.
//  Copyright (c) 2014 Harry Nelken. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddMemberViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSArray *phenotypes;
@property (weak, nonatomic) IBOutlet UISwitch *cancerSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *infectSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *heartSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *liverSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *mentalSwitch;

@property (weak, nonatomic) IBOutlet UITextField *famText;
@property (weak, nonatomic) IBOutlet UITextField *indvText;
@property (weak, nonatomic) IBOutlet UITextField *patText;
@property (weak, nonatomic) IBOutlet UITextField *matText;
@property (weak, nonatomic) IBOutlet UITextField *genderText;
@property (weak, nonatomic) IBOutlet UITextField *firstText;
@property (weak, nonatomic) IBOutlet UITextField *lastText;
@property (weak, nonatomic) IBOutlet UITextField *birthText;

- (IBAction)didTapSaveButton:(id)sender;

@end
