//
//  ViewController.m
//  Git Search
//
//  Created by Caio Henrique Oliveira Silva on 9/24/15.
//  Copyright (c) 2015 Caio Henrique Oliveira Silva. All rights reserved.
//

#import "SearchViewController.h"
#import "ResultsTableViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)search:(id)sender {
    [self performSegueWithIdentifier:@"showResults" sender:sender];
}

#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showResults"]){
        ResultsTableViewController *resultsTVC = (ResultsTableViewController *)segue.destinationViewController;
        NSArray *objects;
        NSArray *keys;
        
        if (sender == self.searchRepositoryButton) {
            objects = @[@"Busca de repositórios", self.searchText.text, @"repository"];
            keys = @[@"title", @"inputValue", @"type"];
            
            resultsTVC.controllerData = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        } else if(sender == self.searchUserButton) {
            objects = @[@"Busca de usuários", self.searchText.text, @"user"];
            keys = @[@"title", @"inputValue", @"type"];
            
            resultsTVC.controllerData = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        }
    }
}


@end