//
//  SelectRequest.m
//  JSPatch
//
//  Created by Hong on 16/8/19.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import "SelectRequest.h"
#import "SecondAPIClient.h"
#import "SecondVideo.h"
#import "NSObject+Model.h"

@interface SelectRequest()

@end

@implementation SelectRequest

- (void)getItemsCompletion:(void (^)(NSArray * items, NSError *error))completion
{
    NSDictionary *params = @{
                             @"_s":@"4f9b3345d32ebc6eb84e0c8b06f6a922",
                             @"f":@"iphone",
                             @"net":@"wifi",
                             @"u":@"df7e3f78c0ca206776252f02465ef4b05ccc8391",
                             @"v":@"2.4.0",
                             @"vc":@"1014"
                             };
    
     [[SecondAPIClient sharedClient] GET:@"http://baobab.wandoujia.com/api/v3/tabs/selected" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
         
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         
//         NSLog(@"%@ : %@", task.originalRequest, responseObject);
         NSArray *list = [responseObject objectForKey:@"sectionList"];
         NSArray *itemList = nil;
         if (list.firstObject) {
             itemList = [list.firstObject objectForKey:@"itemList"];
         }
         
         NSMutableArray *result = [NSMutableArray array];
         for (NSDictionary *item in itemList) {
             SecondVideo *v = [SecondVideo modelWithJSON:[item objectForKey:@"data"]];
             if (v) {
                 [result addObject:v];
             }
         }
         
         if (completion) {
             completion(result, nil);
         }
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         
         if (completion) {
             completion(nil, error);
         }
         
     }];
}

@end
