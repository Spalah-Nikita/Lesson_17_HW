//
//  CarListView.m
//  NSCoding
//
//  Created by Nikita Vintonovich on 10/11/17.
//  Copyright © 2017 Nikita Vintonovich. All rights reserved.
//

#import "CarListView.h"

@interface CarListView ()

@property (nonatomic, weak) IBOutlet UIButton *addButton;
@property (nonatomic, weak) IBOutlet UIView *maskView;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation CarListView

#pragma mark - Actions

- (IBAction)addButtonAction:(UIButton *)button
{
    if ([self.input respondsToSelector:@selector(addButtonWasTapped)])
    {
        [self.input addButtonWasTapped];
    }
}

#pragma mark - Private Methods

- (void)displayLoader
{
    self.maskView.hidden = NO;
    [self.activityIndicator startAnimating];
}

- (void)hideLodaer
{
    [self.activityIndicator stopAnimating];
    self.maskView.hidden = YES;
}

#pragma mark - CarListUserInterfaceOutput

- (void)showActivityIndicator
{
    [self displayLoader];
}

- (void)hideActivityIndicator
{
    [self performSelector:@selector(hideLodaer) withObject:nil afterDelay:2.0f];
}

@end
