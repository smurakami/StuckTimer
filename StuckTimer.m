//
//  StuckTimer.m
//  SkyCompass
//
//  Created by 村上 晋太郎 on 2014/01/21.
//  Copyright (c) 2014年 村上 晋太郎. All rights reserved.
//

#import "StuckTimer.h"

NSMutableArray * gStuck = NULL;// クラス変数として使うスタック

@implementation StuckTimer
+(void)push
{
    [StuckTimer push:@""];
}

+(void)push:(NSString *)title
{
    if(!gStuck){
        gStuck = [[NSMutableArray alloc] init];
    }
    [gStuck addObject:@{@"title": title, @"start": [NSDate date]}];
}

+(void)pop
{
    if(!gStuck) return;
    NSString * title = [gStuck lastObject][@"title"];
    NSDate * start = [gStuck lastObject][@"start"];
    NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:start];
    NSLog(@"StuckTimer: %@ finished in %lf", title, interval);
    [gStuck removeLastObject];
    
}

+(void)pop:(NSString *)confirm
{
    NSString * title = [gStuck lastObject][@"title"];
    if(![confirm isEqualToString:title]){
        NSLog(@"title not match!");
    }
    [StuckTimer pop];
}

+(void)rap{
    NSString * title = [gStuck lastObject][@"title"];
    NSDate * start = [gStuck lastObject][@"start"];
    NSTimeInterval interval = [[NSDate date] timeIntervalSinceDate:start];
    NSLog(@"StuckTimer: rap of %@ at %lf", title, interval);
    
}

@end
