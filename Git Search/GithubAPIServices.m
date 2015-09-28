//
//  GithubAPIServices.m
//  Git Search
//
//  Created by Caio Henrique Oliveira Silva on 9/24/15.
//  Copyright (c) 2015 Caio Henrique Oliveira Silva. All rights reserved.
//

#import "GithubAPIServices.h"

@interface GithubAPIServices ()

@property (nonatomic, retain) NSDictionary *_users;
@property (nonatomic, retain) NSArray *_repositories;

@end

@implementation GithubAPIServices

@synthesize _users;
@synthesize _repositories;


- (id)init {
    if (self = [super init]) {
        //
    }
    return self;
}


- (NSArray *)searchRepositories:(NSString *)searchText {
    NSString *stringURL = [NSString stringWithFormat:@"https://api.github.com/search/repositories?q=%@", searchText];
    NSURL *url = [NSURL URLWithString:stringURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:request
                                          returningResponse:&response
                                                      error:&error];
    
    if (data.length > 0 && error == nil) {
         NSDictionary *repositories = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:NULL];
        self._repositories = [repositories objectForKey:@"items"];
    }
    
    return self._repositories;
}

- (NSArray *)searchUsers:(NSString *)searchText {
    NSString *stringURL = [NSString stringWithFormat:@"https://api.github.com/search/users?q=%@", searchText];
    NSURL *url = [NSURL URLWithString:stringURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:request
                                          returningResponse:&response
                                                      error:&error];
    
    if (data.length > 0 && error == nil) {
        NSDictionary *repositories = [NSJSONSerialization JSONObjectWithData:data
                                                                     options:0
                                                                       error:NULL];
        self._repositories = [repositories objectForKey:@"items"];
    }
    
    return self._repositories;
}


@end
