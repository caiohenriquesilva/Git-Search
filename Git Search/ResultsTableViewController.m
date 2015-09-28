//
//  ResultsTableViewController.m
//  Git Search
//
//  Created by Caio Henrique Oliveira Silva on 9/24/15.
//  Copyright (c) 2015 Caio Henrique Oliveira Silva. All rights reserved.
//

#import "ResultsTableViewController.h"
#import "CustomTableViewCell.h"
#import "GithubAPIServices.h"

@interface ResultsTableViewController ()

@end

@implementation ResultsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.dataSource = self;
//    self.tableView.delegate = self;
    
    [self setTitle:[self.controllerData objectForKey:@"title"]];
    
    GithubAPIServices *gitServices = [[GithubAPIServices alloc] init];
    if([[self.controllerData objectForKey:@"type"] isEqualToString:@"repository"]) {
        self.repositories = [gitServices searchRepositories:[self.controllerData objectForKey:@"inputValue"]];
    } else if([[self.controllerData objectForKey:@"type"] isEqualToString:@"user"]) {
        self.users = [gitServices searchUsers:[self.controllerData objectForKey:@"inputValue"]];
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    // Return the height of row
    return 240;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    if([[self.controllerData objectForKey:@"type"] isEqualToString:@"repository"]) {
        return [self.repositories count];
    } else if([[self.controllerData objectForKey:@"type"] isEqualToString:@"user"]) {
        return [self.users count];
    } else {
        return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if(!cell) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if([[self.controllerData objectForKey:@"type"] isEqualToString:@"repository"]) {
        [cell.userPictureImage setHidden:YES];
        
        NSArray *currentRepository = [self.repositories objectAtIndex:0];
        
    } else if([[self.controllerData objectForKey:@"type"] isEqualToString:@"user"]) {
        [cell.userPictureImage setHidden:NO];
        
        NSArray *currentUser = [self.users objectAtIndex:0];

        NSString *imageUrl = @"";
            [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:imageUrl]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                cell.userPictureImage.image = [UIImage imageWithData:data];
            }];
    }
    
    
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
