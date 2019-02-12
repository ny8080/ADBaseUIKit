//
//  TDFBaseEditView.h
//  RestApp
//
//  Created by happyo on 16/8/4.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYText.h"
@class TDFBaseEditItem;

extern NSString * const kTDFEditViewIsShowTipNotification;

@protocol TDFBaseEditViewProtocol <NSObject>

- (void)initView;

- (void)configureViewWithModel:(TDFBaseEditItem *)model;

@end

@interface TDFBaseEditView : UIView <TDFBaseEditViewProtocol>

@property (nonatomic, strong) UILabel *lblTitle;

@property (nonatomic, strong) YYLabel *lblDetail;

@property (nonatomic, strong) UIView *spliteView;

@property (nonatomic, strong) UIView *groupView;

@property (nonatomic, strong) UILabel *lblTip;

@property (nonatomic, strong) UILabel *lblComplement;

@property (nonatomic, strong) UIView *alphaView;

- (void)configureViewWithModel:(TDFBaseEditItem *)model;

+ (CGFloat)getHeightWithModel:(TDFBaseEditItem *)model;

- (NSString *)getPlaceholderWithModel:(TDFBaseEditItem *)model;

- (UIColor *)getPlaceholderColorWithModel:(TDFBaseEditItem *)model;

@end
