//
//  TDFBaseEditItem.m
//  RestApp
//
//  Created by happyo on 16/8/10.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFBaseEditItem.h"

@implementation TDFBaseEditItem

@synthesize shouldShow;

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.shouldShow = YES;
        self.requestKey = @"";
        self.detail = @"";
        self.complement = @"";
        self.isRequired = YES;
        self.alpha = 0;
        self.titleLabelWidth    =   375 - 150;
        self.requiredType = TDFRequiredTypeFill;
    }
    
    return self;
}

@end
