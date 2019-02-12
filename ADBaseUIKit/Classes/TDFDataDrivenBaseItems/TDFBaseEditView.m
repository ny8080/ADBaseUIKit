//
//  TDFBaseEditView.m
//  RestApp
//
//  Created by happyo on 16/8/4.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import "TDFBaseEditView.h"
#import "TDFBaseEditItem.h"
#import "NSString+TDF_Empty.h"
#import "Masonry.h"
#import "TDFEditColorHelper.h"
#import "TDFCLLocalizeMacro.h"
#import "NSBundle+Language.h"
#import "UIColor+tdf_standard.h"
#import "UIColor+Hex.h"
#import "TDFComponentsAdapter.h"

#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)
NSString * const kTDFEditViewIsShowTipNotification = @"kTDFEditViewIsShowTipNotification";

static NSInteger kExtensionType = 0;
static NSInteger kCloseType = 1;

@interface TDFBaseEditView ()

@end
@implementation TDFBaseEditView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initView];
    }
    
    return self;
}

- (void)initView
{
    if ([TDFComponentsAdapter sharedInstance].isRestApp) {
        self.backgroundColor = [UIColor whiteColor];
    } else {
        self.backgroundColor = [UIColor clearColor];
    }
    
    [self addSubview:self.alphaView];
    [self addSubview:self.groupView];
    [self addSubview:self.lblTitle];
    [self addSubview:self.lblDetail];
    [self addSubview:self.lblComplement];
    [self addSubview:self.spliteView];
    [self addSubview:self.lblTip];
    
    [self.lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).with.offset(10);
        make.top.equalTo(self).with.offset(14);
        make.height.equalTo(@(15));
        make.width.lessThanOrEqualTo(@(300));
    }];
    
    [self.lblDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lblTitle.mas_bottom).with.offset(13);
        make.leading.equalTo(self).with.offset(10);
        make.trailing.equalTo(self).with.offset(-10);
        make.height.equalTo(@(1));
        //        make.bottom.equalTo(self);
    }];
    
    [self.spliteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).with.offset(10);
        make.trailing.equalTo(self).with.offset(0);
        make.bottom.equalTo(self);
        make.height.equalTo(@(SINGLE_LINE_WIDTH));
    }];
    
    [self.lblTip mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.width.equalTo(@(32));
        make.height.equalTo(@(12));
        make.top.equalTo(self);
        make.leading.equalTo(self).with.offset(11);
    }];
    
    [self.lblComplement mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).with.offset(-15);
        make.leading.equalTo(self).with.offset(10);
        make.trailing.equalTo(self).with.offset(-10);
        make.height.greaterThanOrEqualTo(@(1));
    }];
    
    [self.alphaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.leading.equalTo(self);
        make.trailing.equalTo(self);
        make.bottom.equalTo(self);
    }];
    
    [self.groupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self);
        make.trailing.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(@( (1 / [UIScreen mainScreen].scale)));
    }];
    
}

- (void)configureViewWithModel:(TDFBaseEditItem *)model;
{
    self.lblTitle.text = model.title;
    
    //本来是有这个操作的，但是在英文下不想让其有。否则布局会乱的
    if (![NSBundle isEnglishLanguage]) {
        [self.lblTitle sizeToFit];
        [self.lblTitle mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(self.lblTitle.frame.size.width));
        }];
    }
    
    
    self.alphaView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:model.alpha];
    
    NSMutableAttributedString *attributedDetail = [[NSMutableAttributedString alloc] initWithString:@""];
    if ([model.attributedDetail.string isNotEmpty]) { // 先判断是否有attributed string
        [attributedDetail appendAttributedString:model.attributedDetail];
    } else {
        if ([model.detail isNotEmpty]) { // 没有attributed string ，并且detail不为空，则增加detail
            [attributedDetail appendAttributedString:[[NSAttributedString alloc] initWithString:model.detail attributes:@{NSForegroundColorAttributeName : [TDFEditColorHelper hex666666Color], NSFontAttributeName : [UIFont systemFontOfSize:11]}]];
        }
    }
    
    if ([model.linkString isNotEmpty]) { // 如果有超链接，就增加超链接
        [attributedDetail appendAttributedString:[[NSAttributedString alloc] initWithString:model.linkString attributes:@{NSForegroundColorAttributeName : [UIColor tdf_hex_0088FF], NSFontAttributeName : [UIFont systemFontOfSize:11]}]];
        [attributedDetail yy_setTextHighlightRange:[attributedDetail.string rangeOfString:model.linkString] color:[UIColor tdf_hex_0088FF] backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
            if (model.linkBlock) {
                model.linkBlock();
            }
        }];
    }

    NSInteger length =  attributedDetail?attributedDetail.string.length:0;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:5];
    [attributedDetail addAttribute:NSParagraphStyleAttributeName  value:paragraphStyle range:NSMakeRange(0, length)];


    self.lblDetail.attributedText = attributedDetail;
    
    self.lblComplement.text = model.complement;
    
    CGFloat alphaHeight = 0;
//    if (model.shouldShow && model.seperationStyle != TDFSeperationStyleCombined) {
//        alphaHeight = -1;
//    }

    [self.alphaView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).with.offset(alphaHeight);
    }];
    self.groupView.hidden = !(model.seperationStyle == TDFSeperationStyleGroup);
    
    self.spliteView.hidden = (model.seperationStyle == TDFSeperationStyleCombined);
    
    if (model.editStyle == TDFEditStyleUnEditable) {
        self.lblTip.hidden = YES;
    }
    
    CGFloat detailHeight = [TDFBaseEditView detailLabelHeightWithModel:model];
    if (detailHeight >= 15) {
        detailHeight -= 15;
    }
    [self.lblDetail mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(detailHeight));
    }];
}

- (void)dealloc
{
    [_lblTip removeObserver:self forKeyPath:@"hidden"];
}

- (NSString *)getPlaceholderWithModel:(TDFBaseEditItem *)model
{
    if (model.placeholder) {
        return model.placeholder;
    } else {
        
        NSString *requiredText = nil;
        NSString *notRequiredText = nil;
        switch (model.requiredType) {
            case TDFRequiredTypeFill:
                requiredText = TDFCLLocalizedString(@"必填", nil);
                notRequiredText = TDFCLLocalizedString(@"可不填", nil);
                break;
            case TDFRequiredTypeSelect:
                requiredText =  TDFCLLocalizedString(@"必选", nil);
                notRequiredText = TDFCLLocalizedString(@"请选择", nil);
                break;
        }
        
        return model.isRequired ? requiredText :  notRequiredText;
    }
}

- (UIColor *)getPlaceholderColorWithModel:(TDFBaseEditItem *)model
{
    if (model.placeHolderColor) {
        
        return model.placeHolderColor;
    }else {
        
        return model.isRequired ? [UIColor colorWithRed:204/255.0 green:0/255.0 blue:0/255.0 alpha:1] : [TDFEditColorHelper placeHolderColor];
    }
}

+ (CGFloat)detailLabelHeightWithModel:(TDFBaseEditItem *)model
{
    CGFloat height = 0;
    if ([model.detail isNotEmpty] || [model.attributedDetail.string isNotEmpty] || [model.linkString isNotEmpty]) {
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        UILabel *lblHeight = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, screenWidth - 20, 0)];
        lblHeight.font = [UIFont systemFontOfSize:11];
        lblHeight.numberOfLines = 0;
        
        NSMutableAttributedString *attributedDetail = [[NSMutableAttributedString alloc] initWithString:@""];
        if ([model.attributedDetail.string isNotEmpty]) { // 先判断是否有attributed string
            [attributedDetail appendAttributedString:model.attributedDetail];
        } else {
            if ([model.detail isNotEmpty]) { // 没有attributed string ，并且detail不为空，则增加detail
                [attributedDetail appendAttributedString:[[NSAttributedString alloc] initWithString:model.detail attributes:@{NSForegroundColorAttributeName : [TDFEditColorHelper hex666666Color], NSFontAttributeName : [UIFont systemFontOfSize:11]}]];
            }
        }
        
        if ([model.linkString isNotEmpty]) { // 如果有超链接，就增加超链接
            [attributedDetail appendAttributedString:[[NSAttributedString alloc] initWithString:model.linkString attributes:@{NSForegroundColorAttributeName : [UIColor tdf_hex_0088FF], NSFontAttributeName : [UIFont systemFontOfSize:11]}]];
            [attributedDetail yy_setTextHighlightRange:[attributedDetail.string rangeOfString:model.linkString] color:[UIColor tdf_hex_0088FF] backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
                if (model.linkBlock) {
                    model.linkBlock();
                }
            }];
        }

        NSInteger length =  attributedDetail?attributedDetail.string.length:0;
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        [paragraphStyle setLineSpacing:5];
        [attributedDetail addAttribute:NSParagraphStyleAttributeName  value:paragraphStyle range:NSMakeRange(0, length)];
        lblHeight.attributedText = attributedDetail;
//        [lblHeight sizeToFit];
        CGSize size = [attributedDetail boundingRectWithSize:CGSizeMake(lblHeight.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
        height += size.height + 15 + 3; // 多加3的高度，防止yylabel高度显示和UILabel不匹配
    }
    
    return height;
}

#pragma mark -- Public Methods --

+ (CGFloat)getHeightWithModel:(TDFBaseEditItem *)model;
{
    CGFloat height = 44;
    
    height += [TDFBaseEditView detailLabelHeightWithModel:model];
    
    if ([model.complement isNotEmpty]) {
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        UILabel *lblHeight = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, screenWidth - 20, 0)];
        lblHeight.font = [UIFont systemFontOfSize:13];
        lblHeight.textColor = [UIColor colorWithRed:53/255.0 green:53/255.0 blue:53/255.0 alpha:1];
        lblHeight.numberOfLines = 0;
        lblHeight.text = model.complement;
        
        [lblHeight sizeToFit];
        height += lblHeight.frame.size.height + 15;
    }
    
    return height;
}

#pragma mark -- KVO --

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"hidden"] && object == self.lblTip) {
        NSNumber *hidden = change[@"new"];
        [[NSNotificationCenter defaultCenter] postNotificationName:kTDFEditViewIsShowTipNotification object:hidden];
    }
}

#pragma mark -- Setter && Getters --

- (UILabel *)lblTitle
{
    if (!_lblTitle) {
        _lblTitle = [[UILabel alloc] initWithFrame:CGRectZero];
        _lblTitle.font = [UIFont systemFontOfSize:15];
        _lblTitle.textColor = [TDFEditColorHelper hex333333Color];
        _lblTitle.backgroundColor = [UIColor clearColor];
    }
    
    return _lblTitle;
}

- (YYLabel *)lblDetail
{
    if (!_lblDetail) {
        _lblDetail = [[YYLabel alloc] initWithFrame:CGRectZero];
        _lblDetail.font = [UIFont systemFontOfSize:11];
        _lblDetail.textColor = [TDFEditColorHelper hex666666Color];
        _lblDetail.backgroundColor = [UIColor clearColor];
        _lblDetail.numberOfLines = 0;
    }
    
    return _lblDetail;
}

- (UILabel *)lblComplement
{
    if (!_lblComplement) {
        _lblComplement = [[UILabel alloc] initWithFrame:CGRectZero];
        _lblComplement.font = [UIFont systemFontOfSize:11];
        _lblComplement.textColor = [TDFEditColorHelper hex666666Color];
        _lblComplement.backgroundColor = [UIColor clearColor];
        _lblComplement.numberOfLines = 0;
    }
    
    return _lblComplement;
}

- (UIView *)spliteView
{
    if (!_spliteView) {
        _spliteView = [[UIView alloc] initWithFrame:CGRectZero];
        _spliteView.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
    }
    
    return _spliteView;
}

- (UILabel *)lblTip
{
    if (!_lblTip) {
        _lblTip = [[UILabel alloc] initWithFrame:CGRectZero];
        _lblTip.layer.backgroundColor = [UIColor colorWithRed:204/255.0 green:0/255.0 blue:0/255.0 alpha:1].CGColor;
        _lblTip.textColor = [UIColor whiteColor];
        _lblTip.font = [UIFont systemFontOfSize:10];
        _lblTip.text =  NSLocalizedString(@"未保存", nil);
        _lblTip.layer.cornerRadius = 2;
        _lblTip.hidden = YES;
        [_lblTip addObserver:self forKeyPath:@"hidden" options:NSKeyValueObservingOptionNew context:NULL];
    }
    
    return _lblTip;
}

- (UIView *)alphaView
{
    if (!_alphaView) {
        _alphaView = [[UIView alloc] initWithFrame:CGRectZero];
        _alphaView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
    }
    
    return _alphaView;
}

- (UIView *)groupView
{
    if (!_groupView) {
        _groupView = [[UIView alloc] initWithFrame:CGRectZero];
        _groupView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    }
    
    return _groupView;
}

@end

