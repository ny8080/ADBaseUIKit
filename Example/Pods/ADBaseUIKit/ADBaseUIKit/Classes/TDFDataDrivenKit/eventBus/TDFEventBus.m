//
//  TDFEventBus.m
//  Pods
//
//  Created by happyo on 2018/5/4.
//

#import "TDFEventBus.h"
#import "TDFSubscription.h"
#import "TDFEventQueue.h"

@interface TDFEventBus ()

@property (nonatomic, strong) TDFEventQueue *queue;

@property (nonatomic, strong) NSMutableDictionary<NSString *, NSArray<TDFSubscription *> *> *subscriptionsByEventType;

@end
@implementation TDFEventBus

+ (instancetype)sharedInstance
{
    static TDFEventBus *bus;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bus = [[TDFEventBus alloc] init];
    });
    return bus;
}

- (void)subscribeWith:(id)subscriber method:(SEL)subscriberMethod eventType:(NSString *)eventType
{
    TDFSubscription *subscription = [[TDFSubscription alloc] init];
    subscription.subscriber = subscriber;
    subscription.subscriberMethod = subscriberMethod;
    
    NSMutableArray<TDFSubscription *> *subscriptions = [NSMutableArray arrayWithArray:self.subscriptionsByEventType[eventType]];
    
    if (subscriptions == nil) {
        subscriptions = [[NSMutableArray<TDFSubscription *> alloc] init];
    }
    
    if ([subscriptions containsObject:subscription]) {
        return ;
    } else {
        [subscriptions addObject:subscription];
    }
    
    self.subscriptionsByEventType[eventType] = subscriptions;
}

- (void)postEvent:(TDFEvent *)event
{
    [self.queue pushEvent:event];

    __weak typeof(self) wself = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong typeof(wself) sself = wself;
        TDFEvent *event = [sself.queue popEvent];
        while (event) {
            [sself dispatchEvent:event];
            event = [sself.queue popEvent];
        }
    });
}

#pragma mark -- Private Methods --

- (void)dispatchEvent:(TDFEvent *)event
{
    NSMutableArray<TDFSubscription *> *subscriptions = [NSMutableArray arrayWithArray:self.subscriptionsByEventType[event.eventType]];

    for (TDFSubscription *subscription in subscriptions) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [subscription.subscriber performSelector:subscription.subscriberMethod withObject:event];
#pragma clang diagnostic pop
    }
}

#pragma mark -- Getters && Setters --

- (NSMutableDictionary<NSString *, NSArray<TDFSubscription *> *> *)subscriptionsByEventType
{
    if (!_subscriptionsByEventType) {
        _subscriptionsByEventType = [[NSMutableDictionary<NSString *, NSArray<TDFSubscription *> *> alloc] init];
    }
    
    return _subscriptionsByEventType;
}

- (TDFEventQueue *)queue
{
    if (!_queue) {
        _queue = [[TDFEventQueue alloc] init];
    }
    
    return _queue;
}

@end
