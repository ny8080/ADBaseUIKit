//
//  TDFComponentsAdapter.m
//  Pods
//
//  Created by happyo on 2018/7/2.
//

#import "TDFComponentsAdapter.h"
#import "TDFAppConfigurationMacro.h"

@implementation TDFComponentsAdapter

+ (instancetype)sharedInstance
{
    static TDFComponentsAdapter *adapter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        adapter = [[TDFComponentsAdapter alloc] init];
//        [adapter configure];
    });
    return adapter;
}

- (BOOL)isRestApp
{
    return TDFAPPIdentifier == kTDFRestAppIdentifier;
}

@end
