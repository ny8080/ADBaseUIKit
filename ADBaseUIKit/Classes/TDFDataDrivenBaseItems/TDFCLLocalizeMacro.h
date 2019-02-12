//
//  TDFOSLocalizeMacro.h
//  Pods
//
//  Created by doubanjiang on 2018/5/9.
//

#ifndef TDFCLLocalizeMacro_h
#define TDFCLLocalizeMacro_h

#define TDFCLLocalizedString(key, comment) \
NSLocalizedStringFromTableInBundle(key, @"TDFCLLocalizable", [NSBundle bundleForClass:[self class]], comment)

#define TDFCLLocalImageNamed(key) \
[UIImage imageNamed:key inBundle:[NSBundle bundleWithPath:[[NSBundle bundleForClass:[self class]].resourcePath stringByAppendingPathComponent:@"TDFComponentsLogin.bundle"]] compatibleWithTraitCollection:nil]



#endif /* TDFCLLocalizeMacro_h */
