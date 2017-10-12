//
//  CarListModuleProtocol.h
//  NSCoding
//
//  Created by Nikita Vintonovich on 10/11/17.
//  Copyright © 2017 Nikita Vintonovich. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Car;

@protocol CarListModelOutput <NSObject>

- (void)dataBeginReloading;
- (void)dataDidReload;

@end

@protocol CarListModelInput <NSObject>

- (NSArray*)carList;

- (void)dataNeedsToReload;
- (void)carWasSelectedWithIndex:(NSInteger)index;

@end

@protocol CarListUserInterfaceInput <NSObject>

- (void)addButtonWasTapped;

@end

@protocol CarListUserInterfaceOutput <NSObject>

- (void)showActivityIndicator;
- (void)hideActivityIndicator;

@end
