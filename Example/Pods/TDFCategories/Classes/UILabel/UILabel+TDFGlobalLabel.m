//
//  UILabel+TDFGlobalLabel.m
//  RestApp
//
//  Created by suckerl on 2017/4/7.
//  Copyright © 2017年 杭州迪火科技有限公司. All rights reserved.
//

#import "UILabel+TDFGlobalLabel.h"
//#import "UIView+Frame.h"

@implementation UILabel (TDFGlobalLabel)


+ (UILabel *)labelWithSmallSting:(NSString *)string {
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text  = NSLocalizedString(string, nil);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.frame = CGRectMake(0, 0, 165, 17);
    titleLabel.numberOfLines = 0;
    titleLabel.clipsToBounds = YES;
    return titleLabel;
}

+(UILabel *)labelWithSmallerSting:(NSString *)string {
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text  = NSLocalizedString(string, nil);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.frame = CGRectMake(0, 0, 165, 14.5);
    titleLabel.numberOfLines = 0;
    titleLabel.clipsToBounds = YES;
    return titleLabel;
}

@end
