//
//  CarDetailTableViewCell.h
//  NSCoding
//
//  Created by Nikita Vintonovich on 10/11/17.
//  Copyright © 2017 Nikita Vintonovich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarModuleProtocol.h"

@interface CarDetailTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, weak) IBOutlet UIButton *editButton;

@property (nonatomic, weak) id <CarDateilTableViewCellProtocol> delegate;

- (void)updateTagsByIndexPath:(NSIndexPath*)indexPath;
- (void)updateDelegateIfNeed:(id)delegate;

@end
