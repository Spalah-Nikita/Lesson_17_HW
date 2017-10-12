//
//  Car.m
//  NSCoding
//
//  Created by Nikita Vintonovich on 10/11/17.
//  Copyright © 2017 Nikita Vintonovich. All rights reserved.
//

#import "Car.h"


static NSString *const kCarListKey = @"CarListKey";

static NSString *const kBrendKey = @"brend";
static NSString *const kModelKey = @"model";
static NSString *const kTypeKey = @"type";
static NSString *const kFuelKey = @"fuel";
static NSString *const kMaxSpeedKey = @"maxSpeed";
static NSString *const kHpKey = @"hp";


@interface Car () <NSCoding>

@end

@implementation Car

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (self)
    {
        self.brend = [aDecoder decodeObjectForKey:kBrendKey];
        self.model = [aDecoder decodeObjectForKey:kModelKey];
        self.type = [aDecoder decodeObjectForKey:kTypeKey];
        self.fuel = [aDecoder decodeObjectForKey:kFuelKey];
        self.maxSpeed = [aDecoder decodeObjectForKey:kMaxSpeedKey];
        self.hp = [aDecoder decodeObjectForKey:kHpKey];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.brend forKey:kBrendKey];
    [aCoder encodeObject:self.model forKey:kModelKey];
    [aCoder encodeObject:self.type forKey:kTypeKey];
    [aCoder encodeObject:self.fuel forKey:kFuelKey];
    [aCoder encodeObject:self.maxSpeed forKey:kMaxSpeedKey];
    [aCoder encodeObject:self.hp forKey:kHpKey];
}

@end
