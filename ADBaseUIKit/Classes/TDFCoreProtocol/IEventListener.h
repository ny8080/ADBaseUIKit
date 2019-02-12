//
//  IEvent.h
//  CardApp
//
//  Created by SHAOJIANQING-MAC on 13-6-26.
//  Copyright (c) 2013年 ZMSOFT. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IEventListener <NSObject>

@required
- (void)onEvent:(NSString *)eventType;

@optional
- (void)onEvent:(NSString *)eventType object:(id)object;

@end
