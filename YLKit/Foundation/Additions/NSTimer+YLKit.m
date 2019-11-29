//
//  NSTimer+YLKit.m
//  YLKitsDemo
//
//  Created by Conner on 2019/11/29.
//  Copyright © 2019 Conner. All rights reserved.
//

#import "NSTimer+YLKit.h"

@implementation NSTimer (YLKit)

- (void)setPause:(BOOL)pause{
    if (![self.fireDate isEqualToDate:[self pauseDate]] && pause) {
        [self setFireDate:[self pauseDate]];
    }
    
    if ([self.fireDate isEqualToDate:[self pauseDate]] && !pause) {
        [self setFireDate:[NSDate date]];
    }
}

- (BOOL)isPause{
    return [self.fireDate isEqualToDate:[self pauseDate]];
}

- (NSDate *)pauseDate{
   // 2070 年
    return [NSDate dateWithTimeIntervalSince1970:31536000.0f * 100.0f];
}

@end
