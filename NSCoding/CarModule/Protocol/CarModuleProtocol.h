//
//  CarModuleProtocol.h
//  NSCoding
//
//  Created by Nikita Vintonovich on 10/11/17.
//  Copyright © 2017 Nikita Vintonovich. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CarDetailTableViewCell;

@protocol CarModelInput <NSObject>

- (NSArray*)parametersList;
- (NSArray*)titlesList;

- (void)setup;
- (void)save;

- (void)updateParameter:(NSString*)parameter atIndex:(NSInteger)index;

@end

@protocol CarModelOutput <NSObject>

- (void)newCarWasAdded;
- (void)carWasChanged;

@end

@protocol CarUserInterfaceInput <NSObject>

@end

@protocol CarUserInterfaceOutout <NSObject>

@end

@protocol CarDateilTableViewCellProtocol <NSObject>

- (void)editButtonWasTappedOnCell:(CarDetailTableViewCell*)cell;

@end
