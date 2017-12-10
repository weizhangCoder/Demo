//
//  ZWCommonAPI.h
//  TakeYouFly
//
//  Created by Zhangwei on 2017/7/1.
//  Copyright © 2017年 zw. All rights reserved.
//

#ifndef ZWCommonAPI_h
#define ZWCommonAPI_h


//分享
static NSString *const ZWShareIconApi = @"http://39.108.169.255:41000/Static/appImg/Icon-64.png";
static NSString *const ZWShareWebApi = @"http://39.108.169.255:41000/interfaceAPI/index.html";
//上传文件
static NSString *const ZWImageUploadApi = @"http://39.108.169.255:41000/interfaceAPI/file/upload";

//我的

//帮助列表 post
static NSString *const ZWMineHelpApi = @"http://39.108.169.255:41000/interfaceAPI/help/qryHelpList";
//意见反馈
static NSString *const ZWMinesuggestionApi = @"http://39.108.169.255:41000/interfaceAPI/suggestion/submit";
//优惠券
static NSString *const ZWMineCouponsApi = @"http://39.108.169.255:41000/interfaceAPI/user/qryCoupons";
//获取订单数量
static NSString *const ZWMineUnIndexApi = @"http://39.108.169.255:41000/interfaceAPI/user/unIndex";
//更新个人资料
static NSString *const ZWMineUpdateUserInfoApi = @"http://39.108.169.255:41000/interfaceAPI/user/updateUserInfo";

//关于我们
static NSString *const ZWMineUAboutMeApi = @"http://39.108.169.255:41000/interfaceAPI/wap/aboutUs";


//订单

//提交订单
static NSString *const ZWOrderCommitApi = @"http://39.108.169.255:41000/interfaceAPI/order/commit";
//支付调接口
static NSString *const ZWOrderunifiedorderApi = @"http://39.108.169.255:41000/interfaceAPI/wxPay/unifiedorder";
//订单查询
static NSString *const ZWOrderListApi = @"http://39.108.169.255:41000/interfaceAPI/order/qryOrderList";
//查询订单明细
static NSString *const ZWOrderDeailApi = @"http://39.108.169.255:41000/interfaceAPI/order/getOrderDetail";
//更新订单状态
static NSString *const ZWOrderupdateStatusApi = @"http://39.108.169.255:41000/interfaceAPI/order/updateStatus";


//大厅
//王者荣耀预约代练页面数据初始化
static NSString *const ZWHallwxIndexApi = @"http://39.108.169.255:41000/interfaceAPI/game/wxIndex";
//英雄联盟预约代练页面数据初始化
static NSString *const ZWHallyxIndexApi = @"http://39.108.169.255:41000/interfaceAPI/game/yxIndex";
//广告、客服QQ内容
static NSString *const ZWHallIndexApi = @"http://39.108.169.255:41000/interfaceAPI/index/index";

//消息
//查询消息列表
static NSString *const ZWMessagexUserApi = @"http://39.108.169.255:41000/interfaceAPI/message/qryUserMessageByType";
//更新消息列表
static NSString *const ZWMessageUpdateApi = @"http://39.108.169.255:41000/interfaceAPI/message/update";
//删除消息列表
static NSString *const ZWMessagedeleteApi = @"http://39.108.169.255:41000/interfaceAPI/message/delete";

//登录
//第三方登录
static NSString *const ZWLoginApi = @"http://39.108.169.255:41000/interfaceAPI/user/login3rd";
//发送验证码
static NSString *const ZWSendSmsApi = @"http://39.108.169.255:41000/interfaceAPI/user/sendSms";
//手机登录
static NSString *const ZWloginPhoneApi = @"http://39.108.169.255:41000/interfaceAPI/user/loginPhone";


#endif /* ZWCommonAPI_h */
