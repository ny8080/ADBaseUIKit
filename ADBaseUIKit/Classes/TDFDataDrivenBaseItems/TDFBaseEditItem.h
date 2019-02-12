//
//  TDFBaseEditItem.h
//  RestApp
//
//  Created by happyo on 16/8/10.
//  Copyright © 2016年 杭州迪火科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TDFDataDrivenKit/TDFDataDrivenKit.h>

typedef NS_ENUM(NSInteger,TDFEditStyle) {
    TDFEditStyleEditable,
    TDFEditStyleUnEditable
};

typedef NS_ENUM(NSInteger,TDFSeperationStyle) {
    TDFSeperationStyleNone,
    TDFSeperationStyleGroup,
    TDFSeperationStyleCombined
};

typedef NS_ENUM(NSInteger,TDFRequiredType) {
    TDFRequiredTypeFill = 0,
    TDFRequiredTypeSelect,
};


@protocol TDFEditCommonPropertyProtocol <NSObject>

@required

/**
 是否显示cell
 */
@property (nonatomic, assign) BOOL shouldShow;

@end

@interface TDFBaseEditItem : DHTTableViewItem <TDFEditCommonPropertyProtocol>


/**
 用于自定义的方式设置标题的长度。
 因为之前的布局方式：先设置标题的masonry、然后设置右侧的masonry。而右侧的masonry是根据左侧的masonry来设置的。之前的布局方式中文状态没有问题，因为中文状态下标题不会过长，也不会自动换行。但是英文状态下，标题总是会过长，导致右侧的显示textvalue不能显示出来，所以重新修改了布局。用此属性来限制标题的长度。然后，右侧可以根据左侧自动布局
 */
@property (nonatomic, assign) NSInteger titleLabelWidth;
@property (nonatomic, assign) BOOL needRelayout;


/**
 左边的标题
 */
@property (nonatomic, strong) NSString *title;

/**
 下方的描述
 */
@property (nonatomic, strong) NSString *detail;

/**
 描述下方的补充，用于显示展示值的补充
 */
@property (nonatomic, strong) NSString *complement;

/**
 描述后面的超链接，用于显示超链接内容
 */
@property (nonatomic, strong) NSString *linkString;
/**
 描述后面的超链接的点击事件
 */
@property (nonatomic, strong) void (^linkBlock)(void);

/**
 可编辑状态下textValue的字体颜色
 */
@property (nonatomic, strong) UIColor *textColor;
/**
 自定义右侧placeholder字体颜色
 */
@property (nonatomic, strong) UIColor *placeHolderColor;
/**
 下方描述的富文本
 */
@property (nonatomic, strong) NSAttributedString *attributedDetail;

/**
 上传给服务端值对应的key，使用TDFEidtViewHelper生成json时用到
 */
@property (nonatomic, strong) NSString *requestKey;

/**
 cell对应的值，一般和textValue相等，但是对于picker类型的，则对应其选中的值
 */
@property (nonatomic, strong) id requestValue;

/**
 有时候cell选中的值不是要上传的格式，可以通过这个转换成服务端需要的格式，TDFEidtViewHelper中用到
 */
@property (nonatomic, strong) id (^mapRequestBlock)(id requestValue);

/**
 cell初始化的值，用于对比cell的值是否进行了改变
 */
@property (nonatomic, strong) id preValue;

/**
 是否显示了 ’未保存‘ 提示，对外面来说是只读的
 */
@property (nonatomic, assign) BOOL isShowTip;

/**
 是否是必填选项，用于显示右侧的placeholder的颜色，yes表示红色，no表示灰色，以及在TDFEditViewHelper中返回提示语
 */
@property (nonatomic, assign) BOOL isRequired;
@property (nonatomic, assign) TDFRequiredType requiredType;

/**
 右侧的placeholder，默认为  必填和可不填
 */
@property (nonatomic, strong) NSString *placeholder;

/**
 cell背景的alpha值
 */
@property (nonatomic, assign) CGFloat alpha;

//// YES 表示点击了展开，NO 表示点击了收起，如果这个Block没有则不显示该按钮
//@property (nonatomic, strong) void (^extensionBlock)(BOOL isExtension);

/**
 cell的编辑状态，目前是有 可编辑 和 不可编辑两种
 */
@property (nonatomic, assign) TDFEditStyle editStyle;

/**
 当cell的有透明度的时候，分割线默认是黑色的，设为Group后，分割线显示为灰色。在tableview背景是透明的时候，要两个cell连在一起时用到
 */
@property (nonatomic, assign) TDFSeperationStyle seperationStyle;

@end
