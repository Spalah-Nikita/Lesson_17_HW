//
//  CarListModel.m
//  NSCoding
//
//  Created by Nikita Vintonovich on 10/11/17.
//  Copyright © 2017 Nikita Vintonovich. All rights reserved.
//

#import "CarListModel.h"
#import "Storage.h"
#import "Car.h"

@interface CarListModel ()

@property (nonatomic, strong) NSArray *listOfCars;

@end

@implementation CarListModel

#pragma mark - CarListModelInput

- (NSArray*)carList
{
    return [[Storage shared] carList];
}

- (void)dataNeedsToReload
{
    [self.output dataBeginReloading];
    self.listOfCars = [[Storage shared] carList];
    [self.output dataDidReload];
}

- (void)carWasSelectedWithIndex:(NSInteger)index
{
    [[Storage shared] updateSelectedCarndex:index];
}

@end
