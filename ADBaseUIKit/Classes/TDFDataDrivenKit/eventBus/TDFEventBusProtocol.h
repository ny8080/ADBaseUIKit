//
//  TDFEventBusProtocol.h
//  Pods
//
//  Created by happyo on 2018/5/7.
//

#ifndef TDFEventBusProtocol_h
#define TDFEventBusProtocol_h

#import "TDFEventBus.h"

@protocol TDFEventBusProtocol <NSObject>

@property (nonatomic, weak) TDFEventBus *eventBus;

@end

#endif /* TDFEventBusProtocol_h */
