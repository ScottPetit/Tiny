//
//  NTAViewController.m
//  Tiny
//
//  Created by Scott Petit on 5/10/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

#import "NTAViewController.h"
#import "Tiny.h"
#import "GooglURLShortenerService.h"

@interface NTAViewController ()

@end

@implementation NTAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GooglURLShortenerService *service = [GooglURLShortenerService service];
    
    [Tiny shortenURL:[NSURL URLWithString:@"http://google.com"] withService:service completion:^(NSURL *shortURL, NSError *error) {
        
    }];
}

@end
