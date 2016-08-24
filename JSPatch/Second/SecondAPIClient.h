//
//  SecondAPIClient.h
//  JSPatch
//
//  Created by Hong on 16/8/19.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface SecondAPIClient : AFHTTPSessionManager

+(instancetype)sharedClient;

@end
