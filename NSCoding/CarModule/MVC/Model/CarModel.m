//
//  CarModel.m
//  NSCoding
//
//  Created by Nikita Vintonovich on 10/11/17.
//  Copyright © 2017 Nikita Vintonovich. All rights reserved.
//

#import "CarModel.h"
#import "Storage.h"
#import "Car+Parameters.h"

@interface CarModel ()

@property (nonatomic, strong) NSMutableArray *parameters;
@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, assign) BOOL isEditMode;
@property (nonatomic, assign) BOOL wasEditing;

@end

@implementation CarModel

#pragma mark - Laizi init

- (NSArray*)titles
{
    if (!_titles)
    {
        _titles = [Car titles];
    }
    return _titles;
}

#pragma mark - Private Methods

- (void)setup
{
    Car *car = [[Storage shared] selectedCar];
    NSArray *params = car ?  [[car paramteresList] mutableCopy] : [Car emptyParametersList];
    self.parameters = [NSMutableArray arrayWithArray:params];
    self.isEditMode = car != nil;
}

- (void)save
{
    if (!self.wasEditing)
    {
        return;
    }
    
    if (self.isEditMode)
    {
        Car *editedCar = [Car carFromParametersList:self.parameters];
        [[Storage shared] updateSelectedCarByEditedCar:editedCar];
        [self.output carWasChanged];
    }
    else
    {
        Car *newCar = [Car carFromParametersList:self.parameters];
        [[Storage shared] addNewCar:newCar];
        [self.output newCarWasAdded];
    }
}

#pragma mark - CarModelInput

- (NSArray*)parametersList
{
    return self.parameters;
}

- (NSArray*)titlesList
{
    return self.titles;
}

- (void)updateParameter:(NSString*)parameter atIndex:(NSInteger)index
{
    [self.parameters replaceObjectAtIndex:index withObject:parameter.copy];
    
    if (!self.wasEditing)
    {
        self.wasEditing = YES;
    }
}

@end
