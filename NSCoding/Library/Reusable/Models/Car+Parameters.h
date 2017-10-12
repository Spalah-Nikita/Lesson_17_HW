//
//  Car+Parameters.h
//  NSCoding
//
//  Created by Nikita Vintonovich on 10/12/17.
//  Copyright © 2017 Nikita Vintonovich. All rights reserved.
//

#import "Car.h"

@interface Car (Parameters)

- (NSArray*)paramteresList;

+ (Car*)carFromParametersList:(NSArray*)parametersList;
+ (NSArray*)emptyParametersList;
+ (NSArray*)titles;

@end
