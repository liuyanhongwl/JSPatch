//
//  SelectRequest.h
//  JSPatch
//
//  Created by Hong on 16/8/19.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SelectRequest : NSObject

- (void)getItemsCompletion:(void (^)(NSArray * items, NSError *error))completion;

@end
