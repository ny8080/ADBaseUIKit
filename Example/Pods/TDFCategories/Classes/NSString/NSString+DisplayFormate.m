//
//  NSString+DisplayFormate.m
//  TDFShopInfoModule
//
//  Created by chaiweiwei on 2018/3/13.
//

#import "NSString+DisplayFormate.h"
#import "NSString+BaseOperation.h"

@implementation NSString (DisplayFormate)

- (NSString *)tdf_takeSecretStringWithStartLocation:(NSInteger)start endLocation:(NSInteger)end {
    
    if(self.length < (start + end)) {
        return self;
    }else {
        if(self.length == 1) {
            return self;
        }else if(self.length == 2) {
            return [[self substringToIndex:start] stringByAppendingString:@"*"];
        }else {
            NSRange range = NSMakeRange(start, self.length-end-start);
            NSString *replaceString = @"";
            for (int i = 0; i < range.length; i++) {
                replaceString = [replaceString stringByAppendingString:@"*"];
            }
            return [self stringByReplacingCharactersInRange:range withString:replaceString];
        }
    }
}

- (NSString *)tdf_makeBankFormateNum{
    if(!self.tdf_notEmpty) return nil;
    
    NSString *formate = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSInteger row = formate.length / 4;
    NSMutableArray *characterList = [NSMutableArray array];
    for (int i = 0; i<row; i++) {
        [characterList addObject:[self substringWithRange:NSMakeRange(i*4, 4)]];
    }
    [characterList addObject:[self substringWithRange:NSMakeRange(row*4,formate.length % 4)]];
    return [characterList componentsJoinedByString:@" "];
}

- (NSString *)filterEmptyString {
    return self.length >0 ? self : @"";
}
@end
