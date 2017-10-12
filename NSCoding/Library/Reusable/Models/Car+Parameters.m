//
//  Car+Parameters.m
//  NSCoding
//
//  Created by Nikita Vintonovich on 10/12/17.
//  Copyright © 2017 Nikita Vintonovich. All rights reserved.
//

#import "Car+Parameters.h"

@implementation Car (Parameters)

- (NSArray*)paramteresList
{
    return @[[self.brend copy],
             [self.model copy],
             [self.type copy],
             [self.fuel copy],
             [self.maxSpeed.stringValue copy],
             [self.hp.stringValue copy]];
}

+ (Car*)carFromParametersList:(NSArray*)parametersList
{
    NSString *brend = parametersList[0];
    NSString *model = parametersList[1];
    NSString *type = parametersList[2];
    NSString *fuel = parametersList[3];
    NSString *maxSpeed = parametersList[4];
    NSString *hp = parametersList[5];
    
    Car *car = [Car new];
    
    car.brend = brend ? brend : @"-";
    car.model = model ? model : @"-";
    car.type = type ? type : @"-";
    car.fuel = fuel ? fuel : @"-";
    car.maxSpeed = maxSpeed ? @(maxSpeed.integerValue) : @(0);
    car.hp = hp ? @(hp.integerValue) : @(0);
    
    return car;
}

+ (NSArray*)emptyParametersList
{
    NSMutableArray *emptyParams = [NSMutableArray new];
    NSArray *titles = [self titles];
    
    for (NSInteger i = 0; i < titles.count; i++)
    {
        [emptyParams addObject:@""];
    }
    return emptyParams;
}

+ (NSArray*)titles
{
    return @[@"Brend:", @"Model:", @"Type:", @"Fuel:", @"Speed:", @"HP:"];
}

@end
