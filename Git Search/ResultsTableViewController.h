//
//  ResultsTableViewController.h
//  Git Search
//
//  Created by Caio Henrique Oliveira Silva on 9/24/15.
//  Copyright (c) 2015 Caio Henrique Oliveira Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationControllerTitle;
@property (nonatomic, strong) NSDictionary *controllerData;

@property (nonatomic, strong) NSArray *repositories;
@property (nonatomic, strong) NSArray *users;

@end
