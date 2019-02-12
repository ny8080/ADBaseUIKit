//
//  TDFEventQueue.h
//  Pods
//
//  Created by happyo on 2018/5/4.
//

#import <Foundation/Foundation.h>
@class TDFEvent;

@interface TDFEventQueue : NSObject

- (void)pushEvent:(TDFEvent *)event;

- (TDFEvent *)popEvent;

@end
