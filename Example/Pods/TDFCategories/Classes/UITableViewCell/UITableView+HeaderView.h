//
//  UITableView+HeaderView.h
//  Pods
//
//  Created by Arlen on 2017/3/21.
//
//

#import <UIKit/UIKit.h>

@interface UITableView (HeaderView)


/**
 设置headerView

 @param content headerView的内容
 @param icon headerView的标题
 @param selector headerView点击详情的时候调用的方法
 */
- (void)headerViewtDetaileContent:(NSString *)content Icon:(NSString *)icon target:(id)target selector:(SEL)selector;


@property (nonatomic, strong, readonly) UIView        *detailHeaderView;  //表头视图
@property (nonatomic, strong, readonly) UILabel       *inspectLabel;      //查看详情标签
@property (nonatomic, strong, readonly) UILabel       *contentLabell;     //详情内容标签
@property (nonatomic, strong, readonly) UIButton      *inspectButton;     //查看详情的按钮
@property (nonatomic, strong, readonly) UIImageView   *detailIcon;       //表头视图的icon。
@property (nonatomic, strong, readonly) UIImageView *img1;               //向右图片1
@property (nonatomic, strong, readonly) UIImageView *img2;               //向右图片2
@property (nonatomic, assign)   BOOL inspectButtonHidden;                //隐藏查看按钮。 默认NO


@end
