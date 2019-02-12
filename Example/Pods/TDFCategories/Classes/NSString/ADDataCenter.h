//
//  ADDataCenter.h
//  TDFCategories
//
//  Created by hongsang on 2019/2/12.
//

#import <Foundation/Foundation.h>
//国际化变更需求的坑，第一个为货币国际单位，第二个才是货币符号
#define TDFCurrencySymbol [ADDataCenter sharedInstance].defaultCurrency ?: @"元"
#define TDFCurrencyCharacter [ADDataCenter sharedInstance].defaultCurrencySymbol ?: @"¥"

typedef NS_ENUM(NSInteger, TDFIndustryType) {
    TDFIndustryTypeRest = 0,         // 餐饮 0代表餐饮 这个数字不能随便改是后台定义的
    TDFIndustryTypeRetail = 3,            // 零售 3代表零售 这个数字不能随便改是后台定义的
};

typedef NS_ENUM(NSInteger, TDFPlatfromType) {
    TDFPlatfromType2Dfire = 0,   // 火掌柜
    TDFPlatfromTypeKoubei = 1,   // 口碑版
    TDFPlatfromTypeRetail = 3,   // 零售版(来自industry)
};

@interface ADDataCenter : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic,copy) NSString *jsessionId;

@property (nonatomic, copy) NSString *entityId;

@property (nonatomic, copy) NSString *entityType; //0 单店 1 总部 2 门店 3 分公司 4 mall店铺

@property (nonatomic, assign) BOOL isBrand;

@property (nonatomic, assign) BOOL isMall;

@property (nonatomic,copy) NSString *avatarUrl;

@property (nonatomic, copy) NSString *userID;

@property (nonatomic, copy) NSString *userName;

@property (nonatomic, copy) NSString *realName;

@property (nonatomic, strong) NSString *sex;

@property (nonatomic, strong) NSString* phone;

@property (nonatomic, copy) NSString *roleName;

@property (nonatomic, copy) NSString *memberID;

@property (nonatomic, copy) NSString *memberUserID;

@property (nonatomic, copy) NSString *shopCode;

@property (nonatomic, copy) NSString *rerpServerRoot;

@property (nonatomic, copy) NSString *bossToken;

@property (strong, nonatomic) NSString *language;

@property (nonatomic, copy) NSString *shopName;

@property (nonatomic, copy) NSString *shopMode;

@property (nonatomic, copy) NSString *shopId;

@property (nonatomic, assign) BOOL isSuperUser;

@property (nonatomic ,assign) BOOL hideChainShop;

@property (nonatomic ,assign) BOOL hasWorkShop;

@property (nonatomic ,assign) BOOL isAddShop;

@property (nonatomic, copy) NSString *sessionKey;

@property (nonatomic, copy) NSString *brandId;

@property (nonatomic,copy) NSString *rootEntityId;

@property (nonatomic, copy) NSString *branchEntityId;

@property (nonatomic,copy) NSString *plateEntityId;

@property (nonatomic,copy) NSString *plateEntityName;

@property (nonatomic,copy) NSString *plateId;

@property (nonatomic, copy) NSString *countryCode;

@property (nonatomic, copy) NSString *countryId;

// 用于极光推送的shop tag
@property (nonatomic, copy) NSArray<NSString *> *shopTags;

/**
 行业 餐饮：0 零售：3
 */
@property (nonatomic, assign) TDFIndustryType industry;

@property (nonatomic, strong) NSMutableArray *allCodeItemArray;

@property (nonatomic,weak) id weChatShare;

/**
 在连锁员工内切换店铺的code
 */
@property (nonatomic ,copy) NSString *shopCountryCode;

@property (nonatomic,copy) NSString *functionId;
/**
 * 币种
 */
@property (nonatomic, copy) NSString *defaultCurrency;
/**
 * 币种标志
 */
@property (nonatomic, copy) NSString *defaultCurrencySymbol;
/**
 * 账号是否过期
 */
@property (nonatomic ,assign) BOOL isExpire;
/**
 scheme 用于AliPay
 */
@property (nonatomic ,copy) NSString *appScheme;
/**
 用于向header中添加SessionKey
 */
@property (nonatomic ,copy) NSString *memberSessionId;
/**
 * 重定向跳转
 */
@property (nonatomic, copy) NSString *redirectUrl;

@property (nonatomic, assign) BOOL isPreviewState;/* <是否为预览状态*/
///火掌柜版 口碑版
@property (nonatomic, assign) TDFPlatfromType platForm;
///from info.plist
@property (nonatomic, copy) NSString *versionServiceAppCode;

// AssemblyComponent 中路由需要协助传递参数
@property (nonatomic, strong) id asc_routeData;
@property (nonatomic, strong) void(^asc_routeCallBack)();

//供应链提供给云收银的sdk中，因供应链这边接口有version_code来区分接口版本，所以要提供一个设置方法给云收银，原本直接加到platform那个库，但那个库说基本不用了，看了一下网络库只依赖这个库，就加这里了
//主要是供应链这边请求接口时要设置的参数，接口逻辑是：设置了versionCode就读versionCode,没有设置的时候就读app plist里的version（内部转成versionCode）
///供应链versionCode eg:1.2.1的versionCodel为1020100
@property (nonatomic, copy) NSString *versionCode;


//SDK 开放给其他业务线的 控制页面展示的变量设置
///隐藏第三方配送相关的开关项 默认NO
@property (nonatomic,assign) BOOL hiddenThirdDelivery;

@end
