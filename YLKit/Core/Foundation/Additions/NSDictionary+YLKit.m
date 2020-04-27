//
//  NSDictionary+YLKit.m
//  YLProject
//
//  Created by Conner on 2019/9/3.
//  Copyright © 2019 Conner. All rights reserved.
//

#import "NSDictionary+YLKit.h"

@implementation NSDictionary (YLKit)

- (NSString * _Nonnull)dictionaryToJSON {
    return [NSDictionary dictionaryToJSON:self];
}


+ (NSString * _Nonnull)dictionaryToJSON:(NSDictionary * _Nonnull)dictionary {
    NSString *json = nil;
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&error];
    
    if (!jsonData) {
        return @"{}";
    } else if (!error) {
        json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return json;
    } else {
        return error.localizedDescription;
    }
}

- (id _Nullable)safeObjectForKey:(NSString * _Nonnull )key {
    NSArray *keysArray = [self allKeys];
    if ([keysArray containsObject:key]) {
        return [self objectForKey:key];
    } else {
        return nil;
    }
}

@end
