//
//  DHTTableViewSection+Factory.m
//  Pods
//
//  Created by tripleCC on 12/14/16.
//
//
#import "TDFBaseEditItem.h"
#import "DHTTableViewSection+Generator.h"
#import "UIColor+Hex.h"

@implementation DHTTableViewSection (Generator)
+ (instancetype)minSection {
    DHTTableViewSection *section = [self section];
    // http://stackoverflow.com/questions/17699831/how-to-change-height-of-grouped-uitableview-header
    section.footerHeight = CGFLOAT_MIN;
    section.headerHeight = CGFLOAT_MIN;
    return section;
}

+ (instancetype)minFooterSection {
    DHTTableViewSection *section = [self section];
    section.footerHeight = CGFLOAT_MIN;
    return section;
}

+ (instancetype)minHeaderSection {
    DHTTableViewSection *section = [self section];
    section.headerHeight = CGFLOAT_MIN;
    return section;
}

+ (instancetype)sectionWithHeader:(UIView *)header {
    DHTTableViewSection *section = [self section];
    section.headerView = header;
    section.headerHeight = 48;
    return section;
}

+ (instancetype)topMarginSeparatorSection {
    DHTTableViewSection *section = [self section];
    UIView *headerContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 36)];
    headerContainerView.backgroundColor = [UIColor clearColor];
    UIView *headerLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 35.5, [UIScreen mainScreen].bounds.size.width, 0.5)];
    headerLineView.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
    [headerContainerView addSubview:headerLineView];
    section.headerView = headerContainerView;
    section.headerHeight = 36;
    
    UIView *footerLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.5)];
    footerLineView.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
    section.footerView = footerLineView;
    section.footerHeight = 0.5;

    return section;
}

- (void)showSeparator:(BOOL)show {
    self.headerView.hidden = !show;
    self.footerView.hidden = !show;
}

+ (instancetype)separatorSection {
    DHTTableViewSection *section = [self section];
    UIView *headerLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.5)];
    headerLineView.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
    section.headerView = headerLineView;
    section.headerHeight = 0.5;
    
    UIView *footerLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.5)];
    footerLineView.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
    section.footerView = footerLineView;
    section.footerHeight = 0.5;
    
    return section;
}
@end
