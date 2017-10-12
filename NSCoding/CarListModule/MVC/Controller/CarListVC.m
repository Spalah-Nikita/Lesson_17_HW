//
//  ViewController.m
//  NSCoding
//
//  Created by Nikita Vintonovich on 10/11/17.
//  Copyright © 2017 Nikita Vintonovich. All rights reserved.
//

#import "CarListVC.h"
#import "CarVC.h"
#import "CarListModel.h"
#import "CarListView.h"
#import "RouterProtocol.h"
#import "CarListModuleProtocol.h"
#import "Car.h"


@interface CarListVC () <CarListModelOutput, CarListUserInterfaceInput, CarModelEditProtocol, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet CarListView *contentView;
@property (nonatomic, strong) CarListModel *carListModel;

@end

@implementation CarListVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
}

- (void)setup
{
    self.carListModel.output = self;
    self.contentView.input = self;
    [self.carListModel dataNeedsToReload];
}

#pragma mark - Laizy Inst

- (CarListModel*)carListModel
{
    if (!_carListModel)
    {
        _carListModel = [CarListModel new];
    }
    return _carListModel;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.carListModel.carList.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CarCell"];
    Car *car = self.carListModel.carList[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", car.brend, car.model];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.carListModel carWasSelectedWithIndex:indexPath.row];
}

#pragma mark - CarListModelOutput

- (void)dataBeginReloading
{
    [self.contentView showActivityIndicator];
}

- (void)dataDidReload
{
    [self.contentView.tableView reloadData];
    [self.contentView hideActivityIndicator];
}

#pragma mark - CarListUserInterfaceInput

- (void)addButtonWasTapped
{
    [self.carListModel carWasSelectedWithIndex:-1];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CarVC *carVC = [storyBoard instantiateViewControllerWithIdentifier:NSStringFromClass(CarVC.class)];
    carVC.router = self;
    
    [self.navigationController pushViewController:carVC animated:YES];
}

#pragma mark - Router - CarModelEditProtocol

- (void)newCarWasCreated
{
    [self.carListModel dataNeedsToReload];
}

- (void)carWasChanged
{
    [self.carListModel dataNeedsToReload];
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"CarDetail"])
    {
        CarVC *carVC = [segue destinationViewController];
        carVC.router = self;
    }
}

@end
