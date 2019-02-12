//
//  TDFEventQueue.m
//  Pods
//
//  Created by happyo on 2018/5/4.
//

#import "TDFEventQueue.h"

@interface TDFEventQueue ()

@property (nonatomic, strong) NSMutableArray<TDFEvent *> *queue;

@end
@implementation TDFEventQueue

- (void)pushEvent:(TDFEvent *)event
{
    [self.queue addObject:event];
}

- (TDFEvent *)popEvent
{
    if (self.queue.count == 0) {
        return nil;
    } else {
        TDFEvent *event = self.queue.firstObject;
        
        [self.queue removeObjectAtIndex:0];
        
        return event;
    }
}

#pragma mark -- Getters && Setters --

- (NSMutableArray *)queue
{
    if (!_queue) {
        _queue = [NSMutableArray array];
    }
    
    return _queue;
}

@end
