//
//  NSString+YLKit.h
//  YLKits
//
//  Created by Conner on 2019/4/18.
//  Copyright © 2019年 Conner. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;


@interface NSString (YLKit)

/** 检测是否是空字符串(去除空字符后) */
+ (BOOL)yl_isEmpty:(NSString *_Nullable)string;
/**
 *  Search in a given string a substring from the start char to the end char (excluded form final string).
 *  Example: "This is a test" with start char 'h' and end char 't' will return "is is a "
 *
 *  @param string The string to search in
 *  @param start  The start char
 *  @param end    The end char
 *
 *  @return Returns the substring
 */
+ (NSString * _Nonnull)yl_searchInString:(NSString *_Nonnull)string
                            charStart:(char)start
                              charEnd:(char)end;

/**
 *  Search in a given string a substring from the start char to the end char (excluded form final string).
 *  Example: "This is a test" with start char 'h' and end char 't' will return "is is a "
 *
 *  @param start  The start char
 *  @param end    The end char
 *
 *  @return Returns the substring
 */
- (NSString * _Nonnull)yl_searchCharStart:(char)start
                               charEnd:(char)end;

/**
 *  Returns the index of the given character
 *
 *  @param character The character to search
 *
 *  @return Returns the index of the given character, -1 if not found
 */
- (NSInteger)yl_indexOfCharacter:(char)character;

/**
 *  Creates a substring from the given character
 *
 *  @param character The character
 *
 *  @return Returns the substring from character
 */
- (NSString * _Nonnull)yl_substringFromCharacter:(char)character;

/**
 *  Creates a substring to the given character
 *
 *  @param character The character
 *
 *  @return Returns the substring to character
 */
- (NSString * _Nonnull)yl_substringToCharacter:(char)character;

/**
 *  Check if self has the given substring in case-sensitive
 *
 *  @param substring The substring to be searched
 *
 *  @return Returns YES if founded, NO if not
 */
- (BOOL)yl_hasString:(NSString * _Nonnull)substring;

/**
 *  Check if self has the given substring specifying if is case-sensitive or not
 *
 *  @param substring     The substring to be searched
 *  @param caseSensitive If the search has to be case-sensitive or not
 *
 *  @return Returns YES if founded, NO if not
 */
- (BOOL)yl_hasString:(NSString * _Nonnull)substring
    caseSensitive:(BOOL)caseSensitive;

/**
 *  Check if self is an email
 *
 *  @return Returns YES if it's an email, NO if not
 */
- (BOOL)yl_isEmail;

/**
 *  Check if the given string is an email
 *
 *  @param email The string to be checked
 *
 *  @return Returns YES if it's an email, NO if not
 */
+ (BOOL)yl_isEmail:(NSString * _Nonnull)email;

/**
 *  Convert a string to UTF8
 *
 *  @param string String to be converted
 *
 *  @return Returns the converted string
 */
+ (NSString * _Nonnull)yl_convertToUTF8Entities:(NSString * _Nonnull)string;

/**
 *  Encode the given string to Base64
 *
 *  @param string String to encode
 *
 *  @return Returns the encoded string
 */
+ (NSString * _Nonnull)yl_encodeToBase64:(NSString * _Nonnull)string;

/**
 *  Encode the given string to Base64
 *
 *  @return Returns the encoded string
 */
- (NSString * _Nonnull)yl_encodeToBase64;

/**
 *  Decode the given Base64 to string
 *
 *  @param string String to decode
 *
 *  @return Returns the decoded string
 */
+ (NSString * _Nonnull)yl_decodeBase64:(NSString * _Nonnull)string;

/**
 *  Decode the given Base64 to string
 *
 *  @return Returns the decoded string
 */
- (NSString * _Nonnull)yl_decodeBase64;

/**
 *  Convert the given NSString to NSData
 *
 *  @param string The NSString to be converted
 *
 *  @return Returns the converted NSString as NSData
 */
+ (NSData * _Nonnull)yl_convertToNSData:(NSString * _Nonnull)string;

/**
 *  Convert self to a NSData
 *
 *  @return Returns self as NSData
 */
- (NSData * _Nonnull)yl_convertToNSData;

/**
 *  Conver self to a capitalized string.
 *  Example: "This is a Test" will return "This is a test" and "this is a test" will return "This is a test"
 *
 *  @return Returns the capitalized sentence string
 */
- (NSString * _Nonnull)yl_sentenceCapitalizedString;

/**
 *  Returns a human legible string from a timestamp
 *
 *  @return Returns a human legible string from a timestamp
 */
- (NSString * _Nonnull)yl_dateFromTimestamp;

/**
 *  Encode self to an encoded url string
 *
 *  @return Returns the encoded NSString
 */
- (NSString * _Nonnull)yl_URLEncode;

/**
 *  Remove double or more duplicated spaces
 *
 *  @return String without additional spaces
 */
- (NSString * _Nonnull)yl_removeExtraSpaces;

/**
 *  Returns a new string containing matching regular expressions replaced with the template string
 *
 *  @param regexString The regex string
 *  @param replacement The replacement string
 *
 *  @return Returns a new string containing matching regular expressions replaced with the template string
 */
- (NSString * _Nonnull)yl_stringByReplacingWithRegex:(NSString * _Nonnull)regexString
                                       withString:(NSString * _Nonnull)replacement;

/**
 *  Convert HEX string (separated by space) to "usual" characters string.
 *    Example: "68 65 6c 6c 6f" -> "hello"
 *
 *  @return Readable string
 */
- (NSString * _Nonnull)yl_HEXToString;

/**
 *  Convert string to HEX string.
 *    Example: "hello" -> "68656c6c6f"
 *
 *  @return HEX string
 */
- (NSString * _Nonnull)yl_stringToHEX;

/**
 *  Used to create an UUID as NSString
 *
 *  @return Returns the created UUID string
 */
+ (NSString * _Nonnull)yl_generateUUID;

/**
 *  Returns if self is a valid UUID or not
 *
 *  @return Returns if self is a valid UUID or not
 */
- (BOOL)yl_isUUID;

/**
 *  Returns if self is a valid UUID for APNS (Apple Push Notification System) or not
 *
 *  @return Returns if self is a valid UUID for APNS (Apple Push Notification System) or not
 */
- (BOOL)yl_isUUIDForAPNS;

/**
 *  Converts self to an UUID APNS valid (No "<>" or "-" or spaces)
 *
 *  @return Converts self to an UUID APNS valid (No "<>" or "-" or spaces)
 */
- (NSString * _Nonnull)yl_convertToAPNSUUID;


/**
 *  Used to calculate text height for max width and font
 *
 *  @param width Max width to fit text
 *  @param font  Font used in text
 *
 *  @return Returns the calculated height of string within width using given font
 */
- (CGFloat)yl_heightForWidth:(float)width
                  andFont:(UIFont * _Nonnull)font;
@end

