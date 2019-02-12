//
//  UITableView+HeaderView.m
//  Pods
//
//  Created by Arlen on 2017/3/21.
//
//

#import "UITableView+HeaderView.h"
//#import "UIView+Sizes.h"
#import "Masonry.h"
#import <objc/runtime.h>

static  char * const DETAILEHEADER  =   "DetaileHeader";            //表头的key
static  char * const CONTENTLABEL   =   "ContentLabel";             //内容的key
static  char * const INSPECTLABEL   =   "inspectLabel";             //查看详情标签key
static  char * const INSPECTBUTTON  =   "inspectButton";            //查看想起的按钮key
static  char * const DETAILICON     =   "detailIcon";               //详情的icon
static  char * const HiddenInspect  =   "HiddenInspect";            //隐藏查看按钮

@implementation UITableView (HeaderView)

@dynamic  detailHeaderView,contentLabell,inspectLabel,inspectButton,detailIcon,img1,img2;

- (void)headerViewtDetaileContent:(NSString *)content Icon:(NSString *)icon target:(id)target selector:(SEL)selector
{
    //表头视图
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 230)];
    tableHeaderView.clipsToBounds   =   YES;
    tableHeaderView.backgroundColor =[UIColor clearColor];
    
    /* ****  背景视图 **** */
    UIView *view =[[UIView alloc] initWithFrame:CGRectMake(0, 0, tableHeaderView.frame.size.width, tableHeaderView.frame.size.height-10)];
    view.backgroundColor =[UIColor whiteColor];
    view.alpha =0.7;
    
    /* ****  icon图片 **** */
    UIImageView *imageView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
    imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    imageView.layer.borderWidth =   1;
    imageView.layer.masksToBounds =YES;
    imageView.layer.cornerRadius = 30;
    
    /* ****  详情内容 **** */
    UILabel *conTentLbl         =   [[UILabel alloc] init];
    conTentLbl.backgroundColor  =   [UIColor clearColor];
    conTentLbl.textAlignment    =   NSTextAlignmentLeft;
    conTentLbl.numberOfLines    =   0;
    conTentLbl.textColor        =   [UIColor colorWithRed:123/255 green:124/255 blue:126/255 alpha:1];
    conTentLbl.font             =   [UIFont systemFontOfSize:14];
    conTentLbl.text             =   content;
    NSMutableAttributedString * str  =[[NSMutableAttributedString alloc] initWithString:conTentLbl.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    [str addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, conTentLbl.text.length)];
    conTentLbl.attributedText =str;
    
    /* ****  查看详情 **** */
    UILabel *inspectLabel =[[UILabel alloc] init];
    inspectLabel.text =NSLocalizedString(@"查看详情", nil);
    inspectLabel.textColor =[UIColor colorWithRed:0/255.0 green:136/255.0 blue:204/255.0 alpha:1];
    inspectLabel.font =[UIFont systemFontOfSize:13];
    inspectLabel.backgroundColor =[UIColor clearColor];
    
    /* ****  两个向右图片 **** */
    UIImageView *picImg =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_next_blue"]];
    UIImageView *picImgSe =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_next_blue"]];
    
    /* ****  查看详情的按钮 **** */
    UIButton *detailBtn =[[UIButton  alloc] init];
    detailBtn.backgroundColor =[UIColor clearColor];
    [detailBtn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 266)];
    [headView addSubview:tableHeaderView];
    self.tableHeaderView    =   headView;        //表头视图
    [tableHeaderView addSubview:view];                  //背景视图
    [tableHeaderView addSubview:imageView];             //icon
    [tableHeaderView addSubview:conTentLbl];            //内容
    [tableHeaderView addSubview:inspectLabel];          //详情
    [tableHeaderView addSubview:picImgSe];              //向右箭头1
    [tableHeaderView addSubview:picImg];                //向右箭头2
    [tableHeaderView addSubview:detailBtn];             //按钮
    
    
    objc_setAssociatedObject(self, DETAILEHEADER,   tableHeaderView,    OBJC_ASSOCIATION_RETAIN_NONATOMIC);     //表头视图
    objc_setAssociatedObject(self, DETAILICON,      imageView,          OBJC_ASSOCIATION_RETAIN_NONATOMIC);     //icon图片
    objc_setAssociatedObject(self, CONTENTLABEL,    conTentLbl,         OBJC_ASSOCIATION_RETAIN_NONATOMIC);     //内容标签
    objc_setAssociatedObject(self, INSPECTLABEL,    inspectLabel,        OBJC_ASSOCIATION_RETAIN_NONATOMIC);     //查看详情标签
    objc_setAssociatedObject(self, INSPECTBUTTON,   detailBtn,          OBJC_ASSOCIATION_RETAIN_NONATOMIC);     //查看详情的按钮
    objc_setAssociatedObject(self, "img1",   picImg,            OBJC_ASSOCIATION_RETAIN_NONATOMIC);     //向右按钮1
    objc_setAssociatedObject(self, "img2",   picImgSe,          OBJC_ASSOCIATION_RETAIN_NONATOMIC);     //向右按钮2
    
    
    /* ****  icon图片 **** */
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(tableHeaderView.mas_centerX);
        make.top.equalTo(tableHeaderView.mas_top).offset(20);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
    
    /* ****  内容 **** */
    [conTentLbl  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tableHeaderView.mas_left).offset(10);
        make.right.equalTo(tableHeaderView.mas_right).offset(-10);
        make.top.equalTo(imageView.mas_bottom);
        make.height.lessThanOrEqualTo(@120);
    }];
    
    /* ****  向右箭头1 **** */
    [picImgSe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(tableHeaderView.mas_right).offset(-10);
        make.bottom.equalTo(tableHeaderView.mas_bottom).offset(-10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    /* ****  向右箭头2 **** */
    [picImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.width.height.equalTo(picImgSe);
        make.right.equalTo(tableHeaderView.mas_right).offset(-5);
    }];
    
    /* ****  查看详情 **** */
    [inspectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(picImg.mas_left).offset(0);
        make.centerY.equalTo(picImg.mas_centerY);
        make.height.equalTo(@30);
    }];
    
    /* ****  查看详情按钮 **** */
    [detailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(inspectLabel);
        make.right.equalTo(picImgSe.mas_right);
    }];
    
    /* ****  表头背景视图 **** */
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(tableHeaderView);
    }];
    
    [tableHeaderView layoutIfNeeded];
    
}

/* ****  设置是否隐藏查看详情按钮 **** */
- (void)setInspectButtonHidden:(BOOL)inspectButtonHidden
{
    NSNumber *number = [NSNumber numberWithBool:inspectButtonHidden];
    objc_setAssociatedObject(self, HiddenInspect, number , OBJC_ASSOCIATION_ASSIGN);
    
    self.inspectLabel.hidden    =   inspectButtonHidden;
    self.inspectButton.hidden   =   inspectButtonHidden;
    self.img1.hidden            =   inspectButtonHidden;
    self.img2.hidden            =   inspectButtonHidden;
    float height                =   inspectButtonHidden == YES ? 10 : 40;
    self.detailHeaderView.frame =   CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, CGRectGetMaxY(self.contentLabell.frame) + height);
    self.tableHeaderView    =   self.detailHeaderView;
}






#pragma mark ------ get方法
/* ****  表头视图 **** */
- (UIView *)detailHeaderView
{
    return objc_getAssociatedObject(self, DETAILEHEADER);
}

/* ****  icon图片 **** */
- (UIImageView *)detailIcon
{
    return objc_getAssociatedObject(self, DETAILICON);
}

- (UILabel *)contentLabell
{
    return objc_getAssociatedObject(self, CONTENTLABEL);
}

/* ****  查看详情标签 **** */
- (UILabel *)inspectLabel
{
    return objc_getAssociatedObject(self, INSPECTLABEL);
}

/* ****  查看详情按钮 **** */
- (UIButton *)inspectButton
{
    return objc_getAssociatedObject(self, INSPECTBUTTON);
}

/* ****  向右按钮1 **** */
- (UIImageView *)img1
{
    return objc_getAssociatedObject(self, "img1");
}

/* ****  向右按钮2 **** */
- (UIImageView *)img2
{
    return objc_getAssociatedObject(self, "img2");
}

/* ****  隐藏的get方法 **** */
- (BOOL)inspectButtonHidden
{
    return [objc_getAssociatedObject(self, HiddenInspect) boolValue];
}

@end








