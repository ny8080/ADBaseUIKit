//
//  NSString+DisplayFormate.h
//  TDFShopInfoModule
//
//  Created by chaiweiwei on 2018/3/13.
//

#import <Foundation/Foundation.h>

@interface NSString (DisplayFormate)

- (NSString *)tdf_takeSecretStringWithStartLocation:(NSInteger)start endLocation:(NSInteger)end;

- (NSString *)tdf_makeBankFormateNum;

- (NSString *)filterEmptyString;

@end
