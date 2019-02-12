//
//  TDFSubscription.h
//  Pods
//
//  Created by happyo on 2018/5/4.
//

#import <Foundation/Foundation.h>

// 订阅的封装，包含订阅对象和对应的方法

@interface TDFSubscription : NSObject

@property (nonatomic, weak) id subscriber;

@property (nonatomic, assign) SEL subscriberMethod;

@end
