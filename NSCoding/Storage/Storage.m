//
//  Storage.m
//  NSCoding
//
//  Created by Nikita Vintonovich on 10/12/17.
//  Copyright © 2017 Nikita Vintonovich. All rights reserved.
//

#import "Storage.h"
#import "Car.h"

static NSString *const kCarListKey = @"CarListKey";

@interface Storage ()

@property (nonatomic, strong) NSMutableArray *cars;
@property (nonatomic, assign) NSInteger selectedCarIndex;

@end

@implementation Storage

+ (id)shared
{
    static Storage *storage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        storage = [[self alloc] init];
    });
    return storage;
}

+ (void)setup
{
    [Storage shared];
}

- (instancetype)init
{
    if (self = [super init])
    {
        [self reloadData];
        self.selectedCarIndex = -1;
    }
    return self;
}

- (NSMutableArray*)cars
{
    if (!_cars)
    {
        _cars = [NSMutableArray array];
    }
    return _cars;
}

- (NSArray*)carList
{
    return self.cars;
}

- (Car*)selectedCar
{
    if (self.selectedCarIndex != -1)
    {
        return self.cars[self.selectedCarIndex];
    }
    return nil;
}

- (void)addNewCar:(Car*)car
{
    [self.cars addObject:car];
}

- (void)updateSelectedCarndex:(NSInteger)index
{
    self.selectedCarIndex = index;
}

- (void)updateSelectedCarByEditedCar:(Car *)editiedCar
{
    Car *car = self.cars[self.selectedCarIndex];
    
    car.brend = editiedCar.brend;
    car.model = editiedCar.model;
    car.type = editiedCar.type;
    car.fuel = editiedCar.fuel;
    car.maxSpeed = editiedCar.maxSpeed;
    car.hp = editiedCar.hp;
    
    [self save];
}

- (void)save
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:[self.cars mutableCopy]];
    
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:kCarListKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self reloadData];
}

- (void)reloadData
{
    NSData *carsData = [[NSUserDefaults standardUserDefaults] objectForKey:kCarListKey];
    self.cars = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:carsData]];
}

@end
