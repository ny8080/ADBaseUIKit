//
//  DatePickerClient.h
//  CardApp
//
//  Created by SHAOJIANQING-MAC on 13-6-26.
//  Copyright (c) 2013年 ZMSOFT. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DatePickerClient <NSObject>

- (BOOL)pickDate:(NSDate *)date event:(NSInteger)event;

@optional
//新增清空日期(供应链新增)
- (void)clearDate:(NSInteger)eventType;
@end
