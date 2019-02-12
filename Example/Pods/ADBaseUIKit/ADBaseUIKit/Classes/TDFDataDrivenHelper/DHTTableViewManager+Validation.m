//
//  DHTTableViewManager+Validation.m
//  Pods
//
//  Created by tripleCC on 2017/5/10.
//
//
#import "TDFBatchOperation.h"
#import <TDFCategories/TDFCategories.h>
#import "TDFBaseEditItem.h"
#import "DHTTableViewManager+Validation.h"

@implementation DHTTableViewManager (Validation)

- (BOOL)tdf_anyItemInvalid {
    for (DHTTableViewSection *section in self.sections) {
        for (DHTTableViewItem *item in section.items) {
            if ([item conformsToProtocol:@protocol(TDFEditCommonPropertyProtocol)] &&
                ![(id <TDFEditCommonPropertyProtocol>)item shouldShow]) {
                continue;
            }
            if ([item conformsToProtocol:@protocol(TDFValidatableProtocol)]) {
                id <TDFValidatableProtocol> fItem = (id <TDFValidatableProtocol>)item;
                NSString *validatedTitle = [[fItem validatedTitle] stringByTrimmingCharactersInSet:[NSCharacterSet symbolCharacterSet]];
                
                if ([fItem valid]) {
                    if ([item conformsToProtocol:@protocol(TDFFormatValidatableProtocol)]) {
                        id <TDFFormatValidatableProtocol> fItem = (id <TDFFormatValidatableProtocol>)item;
                        TDFFormatValidBlock formatValidBlock = [fItem formatValidBlock];
                        if (formatValidBlock) {
                            id validatedObject = [(id <TDFFormatValidatableProtocol>)item validatedObject];
                            if (!formatValidBlock(validatedObject)) {
                                NSString *validateMessage = [validatedTitle tdf_suffix:NSLocalizedString(@"格式不正确!", nil)];
                                if ([fItem respondsToSelector:@selector(validatedMessage)] && [fItem validatedMessage].length > 0) {
                                    validateMessage = [fItem validatedMessage];
                                }
                                
                                [[self tdf_tableView].tdf_viewController showAlert:validateMessage confirm:nil];
                                return YES;
                            }
                        }
                    }
                } else {
                    [[self tdf_tableView].tdf_viewController showAlert:[validatedTitle tdf_suffix:NSLocalizedString(@"为必填项。", nil)] confirm:nil];
                    return YES;
                }
            }
        }
    }
    return NO;
}
- (UITableView *)tdf_tableView {
    return [self valueForKey:@"_tableView"];
}
@end
