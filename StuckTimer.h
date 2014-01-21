//
//  StuckTimer.h
//  SkyCompass
//
//  Created by 村上 晋太郎 on 2014/01/21.
//  Copyright (c) 2014年 村上 晋太郎. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StuckTimer : NSObject
+(void)push;
+(void)push:(NSString *)title;
+(void)pop;
+(void)pop:(NSString *)confirm;
+(void)rap;
@end
