//
//  TableViewCell.h
//  PedigreeCore
//
//  Created by Harry Nelken on 11/3/14.
//  Copyright (c) 2014 Harry Nelken. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Individual.h"

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) Individual *individual;
@end
