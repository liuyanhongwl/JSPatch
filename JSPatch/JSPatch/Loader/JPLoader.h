//
//  JSPatch.h
//  JSPatch
//
//  Created by bang on 15/11/14.
//  Copyright (c) 2015 bang. All rights reserved.
//

#import <Foundation/Foundation.h>
const static NSString *rootUrl = @"http://occll6tdq.bkt.clouddn.com";
//static NSString *publicKey = @"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC+1xcYsEE+ab/Ame1/HHAgfBRh\nD67I9mBYCiOJqC3lJX5RKFvtOTcF5Sf5Bz3NL/2QWPLu40+yt4EvjZ3HOUAHrVgo\n2Fjo4vpaRoEaEtaccOziPH/ASScOfL+uppNGOa0glTCZLKVZI3Go8zoutr8VDw2d\nNT7rDM/4TvPjwMYd3QIDAQAB\n-----END PUBLIC KEY-----";
static NSString *publicKey = @"-----BEGIN PUBLIC KEY-----\n\
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDsZCm60ZSwMSd1/zN6eomrZ3gk\n\
o/WFhBrZg3/zyYin91kxahlqMPD+OL7YGq1zpvp/HxDFInpL8iB9yIBlOE1oLkr4\n\
5TPEe03H96CsVXtns7bl/X7w7tQ7pZooUFvZ7KYUx5m9P/egTcETTKpNDbZA9ew0\n\
zz8DJp6Me+ENO+HQQwIDAQAB\n\
-----END PUBLIC KEY-----";

typedef void (^JPUpdateCallback)(NSError *error);

typedef enum {
    JPUpdateErrorUnzipFailed = -1001,
    JPUpdateErrorVerifyFailed = -1002,
} JPUpdateError;

@interface JPLoader : NSObject
+ (BOOL)run;
+ (void)updateToVersion:(NSInteger)version callback:(JPUpdateCallback)callback;
+ (void)runTestScriptInBundle;
+ (void)setLogger:(void(^)(NSString *log))logger;
+ (NSInteger)currentVersion;
@end