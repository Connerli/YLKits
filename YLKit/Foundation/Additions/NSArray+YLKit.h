//
//  NSArray+YLKit.h
//  YLProject
//
//  Created by Conner on 2019/4/22.
//  Copyright © 2019年 Conner. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (YLKit)
- (id _Nullable)safeObjectAtIndex:(NSUInteger)index;
@end

NS_ASSUME_NONNULL_END
