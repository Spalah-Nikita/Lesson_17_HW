//
//  CarListModel.h
//  NSCoding
//
//  Created by Nikita Vintonovich on 10/11/17.
//  Copyright © 2017 Nikita Vintonovich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarListModuleProtocol.h"

@interface CarListModel : NSObject <CarListModelInput>

@property (nonatomic, weak) id <CarListModelOutput> output;

@end
