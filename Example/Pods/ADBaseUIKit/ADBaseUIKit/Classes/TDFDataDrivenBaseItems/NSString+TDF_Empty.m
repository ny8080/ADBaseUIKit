//
//  NSString+TDF_Empty.m
//  RestApp
//
//  Created by happyo on 16/10/25.
//  Copyright © 2016年 Êù≠Â∑ûËø™ÁÅ´ÁßëÊäÄÊúâÈôêÂÖ¨Âè∏. All rights reserved.
//

#import "NSString+TDF_Empty.h"

@implementation NSString (TDF_Empty)

- (BOOL)isNotEmpty
{
    if (self && ![self isEqualToString:@""]) {
        return YES;
    } else {
        return NO;
    }
}

@end
