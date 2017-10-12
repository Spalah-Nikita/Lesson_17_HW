//
//  CarModel.h
//  NSCoding
//
//  Created by Nikita Vintonovich on 10/11/17.
//  Copyright © 2017 Nikita Vintonovich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarModuleProtocol.h"

@interface CarModel : NSObject <CarModelInput>

@property (nonatomic, weak) id <CarModelOutput> output;

@end
