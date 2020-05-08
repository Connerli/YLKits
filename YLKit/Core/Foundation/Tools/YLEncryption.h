//
//  YLEncryption.h
//  YLKits
//
//  Created by Conner on 2019/11/28.
//  Copyright © 2019 Conner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YLEncryption : NSObject

/**
 *  Create a MD5 string
 *
 *  @param string The string to be converted
 *
 *  @return Returns the MD5 NSString
 */
+ (NSString * _Nullable)MD5:(NSString * _Nonnull)string;

/**
 *  Create a SHA1 string
 *
 *  @param string The string to be converted
 *
 *  @return Returns the SHA1 NSString
 */
+ (NSString * _Nullable)SHA1:(NSString * _Nonnull)string;

/**
 *  Create a SHA256 string
 *
 *  @param string The string to be converted
 *
 *  @return Returns the SHA256 NSString
 */
+ (NSString * _Nullable)SHA256:(NSString * _Nonnull)string;

/**
 *  Create a SHA512 string
 *
 *  @param string The string to be converted
 *
 *  @return Returns the SHA512 NSString
 */
+ (NSString * _Nullable)SHA512:(NSString * _Nonnull)string;

/**
 *  Encrypt NSData in AES128
 *
 *  @param data NSData to be encrypted
 *  @param key  Key to encrypt data
 *
 *  @return Returns the encrypted NSData
 */
+ (NSData * _Nullable)AES128EncryptData:(NSData * _Nonnull)data
                                withKey:(NSString * _Nonnull)key;

/// AES128 CBC 加密
/// @param data 加密数据
/// @param key key
/// @param iv 偏移量
+ (NSData * _Nullable)AES128EncryptData:(NSData * _Nonnull)data withKey:(NSString * _Nonnull)key iv:(NSString *_Nullable)iv;


/// AES128 CBC 加密
/// @param string 加密字符串
/// @param key key
/// @param iv 偏移值
+ (NSString * _Nullable)AES128EncryptString:(NSString * _Nonnull)string withKey:(NSString * _Nonnull)key iv:(NSString *_Nullable)iv;

/**
 *  Decrypt NSData in AES128
 *
 *  @param data NSData to be decrypted
 *  @param key  Key to decrypt data
 *
 *  @return Returns the decrypted NSData
 */
+ (NSData * _Nullable)AES128DecryptData:(NSData * _Nonnull)data
                                withKey:(NSString * _Nonnull)key;

/// AES128 CBC 解密
/// @param data 解密数据
/// @param key key
/// @param iv 偏移
+ (NSData * _Nullable)AES128DecryptData:(NSData * _Nonnull)data withKey:(NSString * _Nonnull)key iv:(NSString *_Nullable)iv;


/// AES128 CBC 解密
/// @param string 解密数据
/// @param key key
/// @param iv 偏移
+ (NSString * _Nullable)AES128DecryptString:(NSString * _Nonnull)string withKey:(NSString * _Nonnull)key iv:(NSString *_Nullable)iv;

/**
 *  Encrypt NSData in AES256
 *
 *  @param data NSData to be encrypted
 *  @param key  Key to encrypt data
 *
 *  @return Returns the encrypted NSData
 */
+ (NSData * _Nullable)AES256EncryptData:(NSData * _Nonnull)data
                                withKey:(NSString * _Nonnull)key;

/**
 *  Decrypt NSData in AES256
 *
 *  @param data NSData to be decrypted
 *  @param key  Key to decrypt data
 *
 *  @return Returns the decrypted NSData
 */
+ (NSData * _Nullable)AES256DecryptData:(NSData * _Nonnull)data
                                withKey:(NSString * _Nonnull)key;

/**
 *  Encrypt NSString in AES128
 *
 *  @param string NSString to be encrypted
 *  @param key  Key to encrypt data
 *
 *  @return Returns the encrypted NSString
 */
+ (NSString * _Nullable)AES128EncryptString:(NSString * _Nonnull)string
                                  withKey:(NSString * _Nonnull)key;

/**
 *  Decrypt NSString in AES128
 *
 *  @param string NSString to be decrypted
 *  @param key  Key to decrypt data
 *
 *  @return Returns the decrypted NSString
 */
+ (NSString * _Nullable)AES128DecryptString:(NSString * _Nonnull)string
                                  withKey:(NSString * _Nonnull)key;

/**
 *  Encrypt NSString in AES256
 *
 *  @param string NSString to be encrypted
 *  @param key  Key to encrypt data
 *
 *  @return Returns the encrypted NSData
 */
+ (NSData * _Nullable)AES256EncryptString:(NSString * _Nonnull)string
                                  withKey:(NSString * _Nonnull)key;

/**
 *  Decrypt NSString in AES256
 *
 *  @param string NSString to be decrypted
 *  @param key  Key to decrypt data
 *
 *  @return Returns the decrypted NSData
 */
+ (NSData * _Nullable)AES256DecryptString:(NSString * _Nonnull)string
                                  withKey:(NSString * _Nonnull)key;
@end


