
//  KCFWebInterface.m
//  私人专科医生
//
//  Created by brave on 15-8-9.
//  Copyright (c) 2014年 Appcoda. All rights reserved.
//

#import "XRWebInterface.h"
#import "UIProgressView+AFNetworking.h"
#import <SVProgressHUD.h>

#define networErrorString @"网络异常，请稍后重试"

@interface XRWebInterface (){
   
}

@end

@implementation XRWebInterface

+(instancetype)webInterface{
    
    
    return [[self alloc] init];

    
}


-(void) stop{
    [theOperation cancel];
    [theManager.operationQueue cancelAllOperations];
}


#pragma mark - 统一入口

-(void)GETByUrlString:(NSString *)urlString
           parameters:(NSDictionary *)parameters
          withSuccess:(successBlock)success
              failure:(failureBlock)failure{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    

    [manager GET:urlString parameters:parameters
         success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        success(operation,responseObject);
//        if (![responseObject[@"success"] boolValue]) {
//            [SVProgressHUD showErrorWithStatus:responseObject[@"msg"]];
//        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, error);
        [SVProgressHUD showErrorWithStatus:networErrorString];
    }];
}



-(void)POSTByUrlString:(NSString *)urlString
            parameters:(NSDictionary *)parameters
           withSuccess:(successBlock)success
               failure:(failureBlock)failure{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    //manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:urlString parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        success(operation,responseObject);
//        if (![responseObject[@"success"] boolValue]) {
//            [SVProgressHUD showErrorWithStatus:responseObject[@"msg"]];
//        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, error);
        [SVProgressHUD showErrorWithStatus:networErrorString];

    }];
}

-(void)POSTByUrlString:(NSString *)urlString
            parameters:(NSDictionary *)parameters
            appendData:(appendDataAction)appendAction
           withSuccess:(successBlock)success
               failure:(failureBlock)failure{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:urlString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        appendAction(formData);
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        success(operation,responseObject);
//        if (![responseObject[@"success"] boolValue]) {
//            [SVProgressHUD showErrorWithStatus:responseObject[@"msg"]];
//        }
       
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation,error);
        [SVProgressHUD showErrorWithStatus:networErrorString];
    }];
}

-(void)DELETEByUrlString:(NSString *)urlString
              parameters:(NSDictionary *)parameters
             withSuccess:(successBlock)success
                 failure:(failureBlock)failure{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager DELETE:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation,responseObject);
//        if (![responseObject[@"success"] boolValue]) {
//            [SVProgressHUD showErrorWithStatus:responseObject[@"msg"]];
//        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(operation, error);
        [SVProgressHUD showErrorWithStatus:networErrorString];
    }];
}


@end


