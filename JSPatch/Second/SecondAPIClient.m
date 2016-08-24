//
//  SecondAPIClient.m
//  JSPatch
//
//  Created by Hong on 16/8/19.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import "SecondAPIClient.h"

@implementation SecondAPIClient

+(instancetype)sharedClient
{
    static SecondAPIClient *sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedClient = [[self class] manager];
    });
    return sharedClient;
}

@end
