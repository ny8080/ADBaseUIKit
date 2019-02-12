//
//  ADViewController.m
//  ADBaseUIKit
//
//  Created by ny8080 on 02/12/2019.
//  Copyright (c) 2019 ny8080. All rights reserved.
//

#import "ADViewController.h"
#import "ADHostTest.h"
@interface ADViewController ()

@end

@implementation ADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    ADHostTest *tesrt = [ADHostTest new];
    [tesrt test1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
