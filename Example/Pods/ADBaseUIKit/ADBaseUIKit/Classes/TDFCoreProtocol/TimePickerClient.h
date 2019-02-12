//
//  TimePickerClient.h
//  RestApp
//
//  Created by zxh on 14-4-15.
//  Copyright (c) 2014年 杭州迪火科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TimePickerClient <NSObject>

- (BOOL)pickTime:(NSDate *)date event:(NSInteger)event;

@end
