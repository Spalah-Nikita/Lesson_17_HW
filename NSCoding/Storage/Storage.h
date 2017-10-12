//
//  Storage.h
//  NSCoding
//
//  Created by Nikita Vintonovich on 10/12/17.
//  Copyright © 2017 Nikita Vintonovich. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Car;

@interface Storage : NSObject

+ (id)shared;
+ (void)setup;

- (NSArray*)carList;
- (Car*)selectedCar;

- (void)addNewCar:(Car*)car;
- (void)updateSelectedCarndex:(NSInteger)index;
- (void)updateSelectedCarByEditedCar:(Car*)editiedCar;

@end
