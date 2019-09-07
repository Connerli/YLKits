//
//  YLKitMacros.h
//  YLProject
//
//  Created by Conner on 2019/9/3.
//  Copyright © 2019 Conner. All rights reserved.
//

#ifndef YLKitMacros_h
#define YLKitMacros_h

/**
 *  Get App name
 */
#define APP_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

/**
 *  Get App build
 */
#define APP_BUILD [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

/**
 *  Get App version
 */
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]


#endif /* YLKitMacros_h */
