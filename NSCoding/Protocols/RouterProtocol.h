//
//  RouterProtocol.h
//  NSCoding
//
//  Created by Nikita Vintonovich on 10/11/17.
//  Copyright © 2017 Nikita Vintonovich. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CarModelEditProtocol <NSObject>

@optional

- (void)newCarWasCreated;
- (void)carWasChanged;

@end
