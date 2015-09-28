//
//  ViewController.h
//  Git Search
//
//  Created by Caio Henrique Oliveira Silva on 9/24/15.
//  Copyright (c) 2015 Caio Henrique Oliveira Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *searchText;
@property (weak, nonatomic) IBOutlet UIButton *searchRepositoryButton;
@property (weak, nonatomic) IBOutlet UIButton *searchUserButton;

@end

