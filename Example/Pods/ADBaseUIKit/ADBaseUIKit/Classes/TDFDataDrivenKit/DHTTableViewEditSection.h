//
//  DHTTableViewEditSection.h
//  Pods
//
//  Created by doubanjiang on 2017/9/18.
//
//

#import "DHTTableViewEditSection.h"
#import "DHTTableViewSection.h"

typedef NS_ENUM(NSUInteger, TDFTableSectionStyle) {
    TDFTableSectionStyleNone,
    TDFTableSectionStyleUnbind,
    TDFTableSectionStyleCallAdmin,
    TDFTableSectionStyleTransfer,
};

@interface DHTTableViewEditSection : DHTTableViewSection

@property (nonatomic ,assign) TDFTableSectionStyle sectionType;

+(instancetype)sectionWithTitleHeader:(NSString *)title
                          andBtnTitle:(NSString *)btnTitle
                          andCallBack:(void(^)(void))callBack;

@end
