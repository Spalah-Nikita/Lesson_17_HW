//
//  CarListView.h
//  NSCoding
//
//  Created by Nikita Vintonovich on 10/11/17.
//  Copyright © 2017 Nikita Vintonovich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarListModuleProtocol.h"

@interface CarListView : UIView <CarListUserInterfaceOutput>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) id <CarListUserInterfaceInput> input;

@end
