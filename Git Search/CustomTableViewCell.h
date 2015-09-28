//
//  CustomTableViewCell.h
//  Git Search
//
//  Created by Caio Henrique Oliveira Silva on 9/24/15.
//  Copyright (c) 2015 Caio Henrique Oliveira Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userPictureImage;

@property (weak, nonatomic) IBOutlet UILabel *repositoryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UITextView *repositoryDescriptionText;

@end
