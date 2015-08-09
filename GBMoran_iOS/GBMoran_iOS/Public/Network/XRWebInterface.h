//
//  XRWebInterface.h
//  私人专科医生
//
//  Created by brave on 15-8-9.
//  Copyright (c) 2014年 Appcoda. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "AFNetworking.h"

/**
 * @brief 所有网络接口都写在这个类中，请按照说明调用获取数据
 * 在主类中不做接口调用的说明，均按照category分类，详细信息请见下文各个category的注释
 * 计划在主类中做基本的网络和接口数据的设置与处理，只写+方法
 */
@interface XRWebInterface : NSObject{
    AFHTTPRequestOperation *theOperation;
    AFHTTPRequestOperationManager *theManager;
}

/**
 *  如果需要自定义状态，将此属性设置为YES
 */
@property (nonatomic, assign) BOOL notShowLoading;

/*!
 *
 *  @brief  成功回调Block
 *
 *  @param AFHTTPRequestOperation 请求序列
 *  @param NSDictionary           接口返回值
 */
typedef void (^successBlock)(AFHTTPRequestOperation *operation, id response);


/*!
 *
 *  @brief  失败回调Block
 *
 *  @param AFHTTPRequestOperation 请求序列
 *  @param NSError                错误信息
 */
typedef void (^failureBlock)(AFHTTPRequestOperation *operation, NSError *error);

typedef void (^appendDataAction)(id<AFMultipartFormData> formData);

/**
 * @brief 快速实例化对象
 */
+ (instancetype)webInterface;

- (void)stop;

#pragma mark - REQUEST 统一入口

#pragma mark GET
/*!
 *
 *  @brief  GET入口
 *
 */


-(void)GETByUrlString:(NSString *)urlString
           parameters:(NSDictionary *)parameters
          withSuccess:(successBlock)success
              failure:(failureBlock)failure;
#pragma mark POST(url-form-data)



/*!
 *
 *  @brief  POST(url-form-data)入口
 *
 */
-(void)POSTByUrlString:(NSString *)urlString
            parameters:(NSDictionary *)parameters
           withSuccess:(successBlock)success
               failure:(failureBlock)failure;

#pragma mark POST(form-data)
/*!
 *
 *  @brief  POST(form-data) 入口
 *
 *  @param urlString    接口地址
 *  @param parameters   参数
 *  @param appendAction 要添加的formdata在此block中添加
 */
-(void)POSTByUrlString:(NSString *)urlString
            parameters:(NSDictionary *)parameters
            appendData:(appendDataAction )appendAction
           withSuccess:(successBlock)success
               failure:(failureBlock)failure;
#pragma mark DELETE
-(void)DELETEByUrlString:(NSString *)urlString
              parameters:(NSDictionary *)parameters
             withSuccess:(successBlock)success
                 failure:(failureBlock)failure;




@end