//
//  DHTTableViewEditSection.m
//  Pods
//
//  Created by doubanjiang on 2017/9/18.
//
//

#import "DHTTableViewEditSection.h"
#import "TDFEditColorHelper.h"
#import "Masonry.h"

@interface DHTTableViewEditSection ()

@property (nonatomic ,copy) void (^callBack)(void);

@property (nonatomic ,strong) UIButton *rightBtn;


@end

@implementation DHTTableViewEditSection

+(instancetype)sectionWithTitleHeader:(NSString *)title
                          andBtnTitle:(NSString *)btnTitle
                          andCallBack:(void(^)(void))callBack {
    
    DHTTableViewEditSection *sec = [DHTTableViewEditSection new];
    
    sec.callBack = callBack;
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 66)];
    sectionView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
    
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 36, screenWidth-20, 20)];
    lblTitle.font = [UIFont boldSystemFontOfSize:15];
    lblTitle.text = title;
    lblTitle.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    
    [sec.rightBtn setTitle:btnTitle forState:UIControlStateNormal];
    [sectionView addSubview:lblTitle];
    [sectionView addSubview:sec.rightBtn];
    
    sec.rightBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [sec.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-10);
        make.centerY.equalTo(lblTitle.mas_centerY);
        make.height.equalTo(@26);
        make.width.equalTo(@120);
    }];
    
    sec.headerView = sectionView;
    sec.headerHeight = 66;
    sec.footerHeight = CGFLOAT_MIN;
    return sec;
}

- (void)rightBtnDidClick {

    if (self.callBack) {
        
        self.callBack();
    }
}

- (void)configSectionWithType:(TDFTableSectionStyle )style {

    self.rightBtn.hidden = false;
    
    switch (style) {
        case TDFTableSectionStyleNone:
        {
            self.rightBtn.hidden = true;
        }
            break;
        case TDFTableSectionStyleUnbind:
        {
            [self.rightBtn setTitle:NSLocalizedString(@"解除绑定",nil) forState:UIControlStateNormal];
        }
            break;
        case TDFTableSectionStyleTransfer:
        {
            [self.rightBtn setTitle:NSLocalizedString(@"移交权限",nil) forState:UIControlStateNormal];
        }
            break;
        case TDFTableSectionStyleCallAdmin:
        {
            [self.rightBtn setTitle:NSLocalizedString(@"联系掌柜绑定",nil) forState:UIControlStateNormal];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark Getter & Setter

- (UIButton *)rightBtn {
    
    if (!_rightBtn) {
        
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth - 120, 36, 120, 26)];
        rightBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [rightBtn setTitleColor:[TDFEditColorHelper hexBlueColor] forState:UIControlStateNormal];
        [rightBtn addTarget:self action:@selector(rightBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
        _rightBtn = rightBtn;
    }
    return _rightBtn;
}

- (void)setSectionType:(TDFTableSectionStyle)sectionType {

    _sectionType = sectionType;
    
    [self configSectionWithType:sectionType];
}

@end
