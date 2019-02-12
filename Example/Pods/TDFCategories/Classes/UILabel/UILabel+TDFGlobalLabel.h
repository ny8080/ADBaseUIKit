//
//  UILabel+TDFGlobalLabel.h
//  RestApp
//
//  Created by suckerl on 2017/4/7.
//  Copyright © 2017年 杭州迪火科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef NS_ENUM(NSUInteger, LabelFontMode) {
//    LabelFontSmall,// 小字体
//    LabelFontSmaller,// 更小
//};

@interface UILabel (TDFGlobalLabel)
//@property (assign, nonatomic) LabelFontMode labelFontMode;

+ (UILabel*)labelWithSmallSting:(NSString*)string;
+ (UILabel*)labelWithSmallerSting:(NSString*)string;


@end
