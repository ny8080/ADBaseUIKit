//
//  TDFComponentsAdapter.h
//  用于适配底层掌柜和供应链样式不同
//
//  Created by happyo on 2018/7/2.
//

#import <Foundation/Foundation.h>

@interface TDFComponentsAdapter : NSObject

+ (instancetype)sharedInstance;

- (BOOL)isRestApp;

@end
