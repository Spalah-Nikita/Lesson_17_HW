//
//  CarVC.m
//  NSCoding
//
//  Created by Nikita Vintonovich on 10/11/17.
//  Copyright © 2017 Nikita Vintonovich. All rights reserved.
//

#import "CarVC.h"
#import "CarModuleProtocol.h"
#import "CarModel.h"
#import "CarView.h"
#import "CarDetailTableViewCell.h"


@interface CarVC () <CarModelOutput, CarUserInterfaceInput, CarDateilTableViewCellProtocol, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet CarView *contentView;
@property (nonatomic, strong) CarModel *carModel;

@property (nonatomic, strong) NSIndexPath *activeCellIndexPath;

@end

@implementation CarVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self hideKeyboardIfNeed];
    [self.carModel save];
}

#pragma mark - Private

- (void)setup
{
    self.carModel.output = self;
    self.contentView.input = self;
    [self.carModel setup];
}

#pragma mark - Laizy Init

- (CarModel*)carModel
{
    if (!_carModel)
    {
        _carModel = [CarModel new];
    }
    return _carModel;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.carModel.titlesList.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CarDetailTableViewCell *cell = (CarDetailTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"CarDetailCell"];
    
    cell.titleLabel.text = self.carModel.titlesList[indexPath.row];
    cell.textField.text = self.carModel.parametersList[indexPath.row];
    
    BOOL isNumberKeyboard = (indexPath.row == self.carModel.titlesList.count - 1 || indexPath.row == self.carModel.titlesList.count - 2);
    cell.textField.keyboardType = isNumberKeyboard ? UIKeyboardTypeNumberPad : UIKeyboardTypeDefault;
    
    [cell updateTagsByIndexPath:indexPath];
    [cell updateDelegateIfNeed:self];
    
    return cell;
}

#pragma mark - Text Field Delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    UITableViewCell *cell = [self.contentView.tableView cellForRowAtIndexPath:self.activeCellIndexPath];
    [self.contentView.tableView scrollRectToVisible:cell.frame animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.carModel updateParameter:textField.text atIndex:textField.tag];
    textField.userInteractionEnabled = NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.text.length == 0)
    {
        return NO;
    }
    textField.userInteractionEnabled = NO;
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Car Detail Cell Protocol

- (void)editButtonWasTappedOnCell:(CarDetailTableViewCell *)cell
{
    self.activeCellIndexPath = [self.contentView.tableView indexPathForCell:cell];
    [cell.textField becomeFirstResponder];
}

#pragma mark - CarModelOutput

- (void)newCarWasAdded
{
    if ([self.router respondsToSelector:@selector(newCarWasCreated)])
    {
        [self.router newCarWasCreated];
    }
}

- (void)carWasChanged
{
    if ([self.router respondsToSelector:@selector(carWasChanged)])
    {
        [self.router carWasChanged];
    }
}

#pragma mark - Hellp Methods

- (void)hideKeyboardIfNeed
{
    CarDetailTableViewCell *cell = [self.contentView.tableView cellForRowAtIndexPath:self.activeCellIndexPath];
    [cell.textField resignFirstResponder];
}

@end
