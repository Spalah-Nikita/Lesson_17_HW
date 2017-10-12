//
//  CarVC.h
//  NSCoding
//
//  Created by Nikita Vintonovich on 10/11/17.
//  Copyright © 2017 Nikita Vintonovich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RouterProtocol.h"

@interface CarVC : UIViewController

@property (nonatomic, weak) id <CarModelEditProtocol> router;

@end
