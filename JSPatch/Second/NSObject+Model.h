//
//  NSObject+Model.h
//  JSPatch
//
//  Created by Hong on 16/8/22.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Model)

+ (instancetype)modelWithJSON:(NSDictionary *)json;

@end
