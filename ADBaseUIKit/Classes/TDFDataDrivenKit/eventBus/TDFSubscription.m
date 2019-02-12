//
//  TDFSubscription.m
//  Pods
//
//  Created by happyo on 2018/5/4.
//

#import "TDFSubscription.h"

@implementation TDFSubscription

- (BOOL)isEqual:(id)object
{
    if ([object isKindOfClass:[TDFSubscription class]]) {
        TDFSubscription *temp = (TDFSubscription *)object;
        
        if (temp.subscriber == self.subscriber && temp.subscriberMethod == self.subscriberMethod) {
            return YES;
        }
    }
    
    return NO;
}

@end
