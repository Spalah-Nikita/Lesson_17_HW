//
//  Car.h
//  NSCoding
//
//  Created by Nikita Vintonovich on 10/11/17.
//  Copyright © 2017 Nikita Vintonovich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (nonatomic, strong) NSString *brend;
@property (nonatomic, strong) NSString *model;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *fuel;

@property (nonatomic, strong) NSNumber *maxSpeed;
@property (nonatomic, strong) NSNumber *hp;

@end
