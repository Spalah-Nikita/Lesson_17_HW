//
//  CarView.h
//  NSCoding
//
//  Created by Nikita Vintonovich on 10/11/17.
//  Copyright © 2017 Nikita Vintonovich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarModuleProtocol.h"

@interface CarView : UIView <CarUserInterfaceOutout>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) id <CarUserInterfaceInput> input;

@end
