//
//  TDFEvent.h
//  Pods
//
//  Created by happyo on 2018/5/4.
//

#import <Foundation/Foundation.h>

@interface TDFEvent : NSObject

@property (nonatomic, copy) NSString *eventType;

@property (nonatomic, copy) NSDictionary *params;

@end
