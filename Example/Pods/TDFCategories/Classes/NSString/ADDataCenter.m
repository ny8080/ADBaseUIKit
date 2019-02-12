//
//  ADDataCenter.m
//  TDFCategories
//
//  Created by hongsang on 2019/2/12.
//

#import "ADDataCenter.h"

@implementation ADDataCenter

static ADDataCenter *_sharedInstance = nil;

+ (instancetype)sharedInstance {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        //because has rewrited allocWithZone  use NULL avoid endless loop .
        _sharedInstance = [[super allocWithZone:NULL] init];
    });
    
    return _sharedInstance;
}
#pragma mark - rewrite
+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [ADDataCenter sharedInstance];
}

+ (instancetype)alloc
{
    return [ADDataCenter sharedInstance];
}

- (id)copy
{
    return self;
}

- (id)mutableCopy
{
    return self;
}

- (id)copyWithZone:(struct _NSZone *)zone
{
    return self;
}

- (TDFPlatfromType)platForm {
    NSDictionary *dic = [[NSBundle mainBundle] infoDictionary];
    if(dic[@"AppTarget"] && [dic[@"AppTarget"] isEqualToString:@"KOUBEI"]) {
        return TDFPlatfromTypeKoubei;
    }
    if (_industry == TDFIndustryTypeRetail) {
        return TDFPlatfromTypeRetail;
    }
    return TDFPlatfromType2Dfire;
}

- (NSString *)versionServiceAppCode {
    NSDictionary *dic = [[NSBundle mainBundle] infoDictionary];
    return dic[@"VersionServiceAppCode"]?:@"APP_CATERERS";
}

@end
