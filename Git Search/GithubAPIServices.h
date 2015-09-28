//
//  GithubAPIServices.h
//  Git Search
//
//  Created by Caio Henrique Oliveira Silva on 9/24/15.
//  Copyright (c) 2015 Caio Henrique Oliveira Silva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GithubAPIServices : NSObject

- (NSArray *)searchRepositories:(NSString *)searchText;
- (NSArray *)searchUsers:(NSString *)searchText;

@end
