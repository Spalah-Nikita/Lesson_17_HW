//
//  CarDetailTableViewCell.m
//  NSCoding
//
//  Created by Nikita Vintonovich on 10/11/17.
//  Copyright © 2017 Nikita Vintonovich. All rights reserved.
//

#import "CarDetailTableViewCell.h"

@implementation CarDetailTableViewCell

- (IBAction)editButtonWasTapped:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(editButtonWasTappedOnCell:)])
    {
        self.textField.userInteractionEnabled = YES;
        [self.delegate editButtonWasTappedOnCell:self];
    }
}

- (void)updateTagsByIndexPath:(NSIndexPath*)indexPath
{
    self.editButton.tag = indexPath.row;
    self.textField.tag = indexPath.row;
}

- (void)updateDelegateIfNeed:(id)delegate
{
    if (!self.textField.delegate)
    {
        self.textField.delegate = delegate;
    }
    
    if (!self.delegate)
    {
        self.delegate = delegate;
    }
}

@end
