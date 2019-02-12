//
//  KabawModuleEvent.h
//  RestApp
//
//  Created by zxh on 14-5-12.
//  Copyright (c) 2014年 杭州迪火科技有限公司. All rights reserved.
//

#ifndef RestApp_KabawModuleEvent_h
#define RestApp_KabawModuleEvent_h

//积分兑换.
#define GIFT_TYPE 1 //选择兑换类型.
#define GIFT_QUANTITY 2 //兑换扣除积分(分)
#define GIFT_CARDFEE 3 //卡余额.


//卡设置
#define KINDCARD_MODE 1  //优惠方式
#define KINDCARD_PLAN 2  //打折方案
#define KINDCARD_RATIO 3  //默认折扣率
#define KINDCARD_ISFORCE 4 //不打折商品也打折
#define KINDCARD_ISNEXT 5 //此卡是否可升级
#define KINDCARD_NEXT 6 //下一级卡类型选择
#define KINDCARD_UPDEGREE 7 //升级所需积分(分)
#define KINDCARD_PLEDGE 8 //办卡押金(元)
#define KINDCARD_IS_PREFEEDEGREE 9 //使用卡内充值金额消费可积分
#define KINDCARD_EXCHANGEDEGREE 10  //充值金额消费几元得1个积分(元)
#define KINDCARD_IS_RATIOFEEDEGREE 11 //刷卡打折消费可积分
#define KINDCARD_RATIOEXCHANGEDEGREE 12 //打折消费几元得1个积分(元)
#define KINDCARD_FONTCOLOR 13  //卡片字体颜色
#define KINDCARD_COVER 14 //卡片背景图片
#define KINDCARD_ISAPPLY 15 //申领卡
#define KINDCARD_PAY 19 //允许自助充值
#define KINDCARD_BALANCEINTRODUCE 16 //消费余额短信通知会员
#define KINDCARD_PREDEDUCT 20  //消费时赠送金额与本金一定比例扣款
#define KINDCARD_DEDUCTPERCENT 21 //扣款比例
//预订设置
#define RS_IS_RESERVE 1 //是否开通卡包预订功能
#define RS_RESERVEDAY 2 //接受几天之内的预定(天)
#define RS_ADVANCEDAY 3 //需要提前几天预订(天)
#define RS_FEEMODE 4 //预订点菜定金收取方式
#define RS_FEE 5 //定金
#define RS_IS_AUDIT 6 //客户订单提交到店家后需要审核
#define RS_MLS_TIME 7  //可预定时段
#define RS_MLS_SEAT 8 //可预定桌位
#define RS_MLS_SPCIAL 9 //优惠方案
#define RS_MLS_BAND 10 //不接受预定日期.

//可预订桌位设置
#define RSSEAT_TIME 1 //预订时段
#define RSSEAT_LOWER 2 //最少容纳人数
#define RSSEAT_MAX 3 //最多容纳人数
#define RSSEAT_NUM 4 //可接受预订桌位数量
#define RSSEAT_MONEY 5 //定金(元)

//不接受预订日期
#define RSBAND_STARTDATE 1 //开始日期
#define RSBAND_ENDDATE 2 //结束日期

//优惠方案
#define SPECIAL_IS_DATE 1
#define SPECIAL_STARTDATE 2
#define SPECIAL_ENDDATE 3
#define SPECIAL_IS_TIME 4
#define SPECIAL_STARTTIME 5
#define SPECIAL_ENDTIME 6
#define SPECIAL_IS_WEEK 7
#define SPECIAL_WEEKS 8
#define SPECIAL_MODE 9
#define SPECIAL_RATIO 10
#define SPECIAL_PLAN 11

//外卖设置
#define TO_IS_SALE 1 //开通外卖
#define TO_OUTFEE_MODE 2 //外送费收费模式
#define TO_TAKEOUT_WAY 7 //外卖下单方式
#define TO_OUTFEE 3 //外送费(元)
#define TO_OUTFEE_MINUTE 4 //提前多长时间自动下单(分)
#define TO_OUTFEE_TIME 5 //可送外卖时段
#define TO_OUTFEE_SENDER 6 //送货人.
#define TO_OUTFEE_AREA 7 //外送范围
#define TO_OUTFEE_CUSTOMER_AUOTO  8 //是否支持客户到店自取
#define TO_OUTSTART_FEE     9  //起送金额

//外卖时段
#define TO_TIME_START 1 //开始时间
#define TO_TIME_END 2 //结束时间
#define TO_TIME_NUM 3 //外卖订单上限.

//店家信息
#define SHOP_PERSPEND 1 //人均消费
#define SHOP_PIC 2 //选择店家图片
#define SHOP_MAINBUSINESS 3 //主营业务
#define SHOP_FOODSTYLE 4 //餐饮菜系
#define SHOP_FEATURESERVICE 5 //特色服务
#define SHOP_COUNTRY 7 //国家或地域
#define SHOP_PROVINCE 8 //省
#define SHOP_CITY 9 //城市
#define SHOP_TOWN 10 //区县
#define SHOP_PUBLICCODE 11 // 微信公众号


//卡包商品
#define KABAWMENU_MEMBERPRICE 31 //会员价
#define KABAWMENU_LEASTNUM 32 //起点份数
#define KABAWMENU_PIC 3 //商品图片
#define KABAWMENU_ACRIDLEVEL 4 //加辣指数.
#define KABAWMENU_APPROVELEVEL 5 //推荐指数.
#define KABAWMENU_CHARACTER 6 //商品特色.
#define KABAWMENU_ISRESERVE 7 //预订开启.
#define KABAWMENU_ISTAKEOUT 8 //外卖开启.
#define KABAWMENU_ISSETTING 9 //置顶大图显示

#define KABAWMENU_PACKINGNUM 19 //打包盒
#define KABAWMENU_PACKINGPRICE 21//打包盒单价


#define MENU_RESERVE 4 //预订可用
#define MENU_TAKEOUT 5 //外卖可用

#define MENU_IMG_TYPE_MAINDIR 1 //商品图片(形象图片-从相册上传)
#define MENU_IMG_TYPE_MAINCAMERA 2 //商品图片(形象图片-从摄像头上传)
#define MENU_IMG_TYPE_DETAILDIR 3 //商品图片(商品介绍图片-从相册上传)
#define MENU_IMG_TYPE_DETAILCAMERA 4 //商品图片(商品介绍图片-从摄像头上传)

#define KIND_MAIN_IMAGE 1 //主图
#define KIND_DETAIL_IMAGE 2 //介绍图
#define KIND_VEDIO 3 //视频
#define KIND_CONTENT 4 //文字

//充值优惠
#define MONEYRULE_MONEY 1   //充值金额
#define MONEYRULE_GIFT 2   //赠送金额
//排队类型
#define QUEUE_KIND_NUM 1 //排队桌位类型

//图片
#define IMAGE_MENU 1
#define IMAGE_KAWBAW 2
#define IMAGE_SUIT 3


#endif
