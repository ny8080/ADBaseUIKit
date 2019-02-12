//
//  TDFEventBus.h
//  Pods
//
//  Created by happyo on 2018/5/4.
//

#import <Foundation/Foundation.h>
#import "TDFEvent.h"

@interface TDFEventBus : NSObject

+ (instancetype)sharedInstance;

- (void)subscribeWith:(id)subscriber method:(SEL)subscriberMethod eventType:(NSString *)eventType;

- (void)postEvent:(TDFEvent *)event;

@end

