//
//  TDFItemValueInterfaceProtocol.h
//  Pods
//
//  Created by tripleCC on 2017/5/17.
//
//

#ifndef TDFItemValueInterfaceProtocol_h
#define TDFItemValueInterfaceProtocol_h

#import <Foundation/Foundation.h>

@protocol TDFItemValueInterfaceProtocol <NSObject>
- (id)tdf_newValue;
- (void)setTdf_newValue:(id)newValue;
- (void)setTdf_originValue:(id)originValue;
@end


#endif /* TDFItemValueInterfaceProtocol_h */
