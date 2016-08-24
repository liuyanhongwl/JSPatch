//
//  SecondVideo.m
//  JSPatch
//
//  Created by Hong on 16/8/23.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import "SecondVideo.h"
#import "NSObject+Model.h"

@implementation SecondVideo

+ (instancetype)modelWithJSON:(NSDictionary *)json
{
    SecondVideo *video = [[[self class] alloc] init];
    
    video.title = [json objectForKey:@"title"];
    video.cover = [json objectForKey:@"cover"] ?  [[json objectForKey:@"cover"] objectForKey:@"feed"] : nil;
    video.playUrl = [json objectForKey:@"playUrl"];
    
    return video;
}

@end
