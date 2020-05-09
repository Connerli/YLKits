//
//  NSFileManager+YLKit.m
//  YLKits
//
//  Created by Conner on 2019/9/3.
//  Copyright © 2019 Conner. All rights reserved.
//

#import "NSFileManager+YLKit.h"
#define YLAPP_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

@implementation NSFileManager (YLKit)

+ (NSString * _Nullable)yl_readTextFile:(NSString * _Nonnull)file ofType:(NSString * _Nonnull)type {
    return [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:file ofType:type] encoding:NSUTF8StringEncoding error:nil];
}

+ (BOOL)yl_saveArrayToPath:(DirectoryType)path withFilename:(NSString * _Nonnull)fileName array:(NSArray * _Nonnull)array {
    NSString *_path;
    
    switch (path) {
        case DirectoryTypeMainBundle:
            _path = [self yl_getBundlePathForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeLibrary:
            _path = [self yl_getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeDocuments:
            _path = [self yl_getDocumentsDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeCache:
            _path = [self yl_getCacheDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
    }
    
    return [NSKeyedArchiver archiveRootObject:array toFile:_path];
}

+ (NSArray * _Nullable)yl_loadArrayFromPath:(DirectoryType)path withFilename:(NSString * _Nonnull)fileName {
    NSString *_path;
    
    switch (path) {
        case DirectoryTypeMainBundle:
            _path = [self yl_getBundlePathForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeLibrary:
            _path = [self yl_getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeDocuments:
            _path = [self yl_getDocumentsDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeCache:
            _path = [self yl_getCacheDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
    }
    
    return [NSKeyedUnarchiver unarchiveObjectWithFile:_path];
}
+ (BOOL)yl_saveDicToPath:(DirectoryType)path withFilename:(NSString *)fileName dic:(NSDictionary *)dic {
    NSString *_path;
    switch (path) {
        case DirectoryTypeMainBundle:
            _path = [self yl_getBundlePathForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeLibrary:
            _path = [self yl_getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeDocuments:
            _path = [self yl_getDocumentsDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeCache:
            _path = [self yl_getCacheDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
    }
    
    return [NSKeyedArchiver archiveRootObject:dic toFile:_path];
}

+ (NSDictionary *)yl_loadDicFromPath:(DirectoryType)path withFilename:(NSString *)fileName {
    NSString *_path;
    switch (path) {
        case DirectoryTypeMainBundle:
            _path = [self yl_getBundlePathForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeLibrary:
            _path = [self yl_getLibraryDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeDocuments:
            _path = [self yl_getDocumentsDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
        case DirectoryTypeCache:
            _path = [self yl_getCacheDirectoryForFile:[NSString stringWithFormat:@"%@.plist", fileName]];
            break;
    }
    return [NSKeyedUnarchiver unarchiveObjectWithFile:_path];
}


+ (NSString * _Nonnull)yl_getBundlePathForFile:(NSString * _Nonnull)fileName {
    NSString *fileExtension = [fileName pathExtension];
    return [[NSBundle mainBundle] pathForResource:[fileName stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@".%@", fileExtension] withString:@""] ofType:fileExtension];
}

+ (NSString * _Nonnull)yl_getDocumentsDirectoryForFile:(NSString * _Nonnull)fileName {
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/", fileName]];
}

+ (NSString * _Nonnull)yl_getLibraryDirectoryForFile:(NSString * _Nonnull)fileName {
    NSString *libraryDirectory = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [libraryDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/", fileName]];
}

+ (NSString * _Nonnull)yl_getCacheDirectoryForFile:(NSString * _Nonnull)fileName {
    NSString *cacheDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [cacheDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/", fileName]];
}

+ (NSNumber * _Nullable)yl_fileSize:(NSString * _Nonnull)fileName fromDirectory:(DirectoryType)directory {
    if (fileName.length > 0) {
        NSString *path;
        
        switch (directory) {
            case DirectoryTypeMainBundle:
                path = [self yl_getBundlePathForFile:fileName];
                break;
            case DirectoryTypeLibrary:
                path = [self yl_getLibraryDirectoryForFile:fileName];
                break;
            case DirectoryTypeDocuments:
                path = [self yl_getDocumentsDirectoryForFile:fileName];
                break;
            case DirectoryTypeCache:
                path = [self yl_getCacheDirectoryForFile:fileName];
                break;
        }
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:fileName]) {
            NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:fileName error:nil];
            if (fileAttributes) {
                return [fileAttributes objectForKey:NSFileSize];
            }
        }
    }
    
    return nil;
}

+ (BOOL)yl_deleteFile:(NSString * _Nonnull)fileName fromDirectory:(DirectoryType)directory {
    if (fileName.length > 0) {
        NSString *path;
        
        switch (directory) {
            case DirectoryTypeMainBundle:
                path = [self yl_getBundlePathForFile:fileName];
                break;
            case DirectoryTypeLibrary:
                path = [self yl_getLibraryDirectoryForFile:fileName];
                break;
            case DirectoryTypeDocuments:
                path = [self yl_getDocumentsDirectoryForFile:fileName];
                break;
            case DirectoryTypeCache:
                path = [self yl_getCacheDirectoryForFile:fileName];
                break;
        }
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
            return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
        }
    }
    
    return NO;
}

+ (BOOL)yl_moveLocalFile:(NSString * _Nonnull)fileName fromDirectory:(DirectoryType)origin toDirectory:(DirectoryType)destination {
    return [self yl_moveLocalFile:fileName fromDirectory:origin toDirectory:destination withFolderName:nil];
}

+ (BOOL)yl_moveLocalFile:(NSString * _Nonnull)fileName fromDirectory:(DirectoryType)origin toDirectory:(DirectoryType)destination withFolderName:(NSString * _Nullable)folderName {
    NSString *originPath;
    
    switch (origin) {
        case DirectoryTypeMainBundle:
            originPath = [self yl_getBundlePathForFile:fileName];
            break;
        case DirectoryTypeLibrary:
            originPath = [self yl_getDocumentsDirectoryForFile:fileName];
            break;
        case DirectoryTypeDocuments:
            originPath = [self yl_getLibraryDirectoryForFile:fileName];
            break;
        case DirectoryTypeCache:
            originPath = [self yl_getCacheDirectoryForFile:fileName];
            break;
    }
    
    NSString *destinationPath;
    if (folderName) {
        destinationPath = [NSString stringWithFormat:@"%@/%@", folderName, fileName];
    } else {
        destinationPath = fileName;
    }
    
    switch (destination) {
        case DirectoryTypeMainBundle:
            destinationPath = [self yl_getBundlePathForFile:destinationPath];
            break;
        case DirectoryTypeLibrary:
            destinationPath = [self yl_getLibraryDirectoryForFile:destinationPath];
            break;
        case DirectoryTypeDocuments:
            destinationPath = [self yl_getDocumentsDirectoryForFile:destinationPath];
            break;
        case DirectoryTypeCache:
            destinationPath = [self yl_getCacheDirectoryForFile:destinationPath];
            break;
    }
    
    if (folderName) {
        NSString *folderPath = [NSString stringWithFormat:@"%@/%@", destinationPath, folderName];
        if (![[NSFileManager defaultManager] fileExistsAtPath:folderPath]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:NO attributes:nil error:nil];
        }
    }
    
    BOOL copied = NO, deleted = NO;
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:originPath]) {
        if ([[NSFileManager defaultManager] copyItemAtPath:originPath toPath:destinationPath error:nil]) {
            copied = YES;
        }
    }
    
    if (destination != DirectoryTypeMainBundle) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:originPath])
            if ([[NSFileManager defaultManager] removeItemAtPath:originPath error:nil]) {
                deleted = YES;
            }
    }
    
    if (copied && deleted) {
        return YES;
    }
    return NO;
}

+ (BOOL)yl_duplicateFileAtPath:(NSString * _Nonnull)origin toNewPath:(NSString * _Nonnull)destination {
    if ([[NSFileManager defaultManager] fileExistsAtPath:origin]) {
        return [[NSFileManager defaultManager] copyItemAtPath:origin toPath:destination error:nil];
    }
    return NO;
}

+ (BOOL)yl_renameFileFromDirectory:(DirectoryType)origin atPath:(NSString * _Nonnull)path withOldName:(NSString * _Nonnull)oldName andNewName:(NSString * _Nonnull)newName {
    NSString *originPath;
    
    switch (origin) {
        case DirectoryTypeMainBundle:
            originPath = [self yl_getBundlePathForFile:path];
            break;
        case DirectoryTypeLibrary:
            originPath = [self yl_getDocumentsDirectoryForFile:path];
            break;
        case DirectoryTypeDocuments:
            originPath = [self yl_getLibraryDirectoryForFile:path];
            break;
        case DirectoryTypeCache:
            originPath = [self yl_getCacheDirectoryForFile:path];
            break;
    }
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:originPath]) {
        NSString *newNamePath = [originPath stringByReplacingOccurrencesOfString:oldName withString:newName];
        if ([[NSFileManager defaultManager] copyItemAtPath:originPath toPath:newNamePath error:nil]) {
            if ([[NSFileManager defaultManager] removeItemAtPath:originPath error:nil]) {
                return YES;
            }
        }
    }
    return NO;
}

+ (id _Nullable)yl_getSettings:(NSString * _Nonnull)settings objectForKey:(NSString * _Nonnull)objKey {
    NSString *path = [self yl_getLibraryDirectoryForFile:@""];
    path = [path stringByAppendingString:@"/Preferences/"];
    path = [path stringByAppendingString:[NSString stringWithFormat:@"%@-Settings.plist", settings]];
    
    NSMutableDictionary *loadedPlist;
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        loadedPlist = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    } else {
        return nil;
    }
    
    return loadedPlist[objKey];
}

+ (BOOL)yl_setSettings:(NSString * _Nonnull)settings object:(id _Nonnull)value forKey:(NSString * _Nonnull)objKey {
    NSString *path = [self yl_getLibraryDirectoryForFile:@""];
    path = [path stringByAppendingString:@"/Preferences/"];
    path = [path stringByAppendingString:[NSString stringWithFormat:@"%@-Settings.plist", settings]];
    
    NSMutableDictionary *loadedPlist;
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        loadedPlist = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    } else {
        loadedPlist = [[NSMutableDictionary alloc] init];
    }
    
    [loadedPlist setObject:value forKey:objKey];
    
    return [loadedPlist writeToFile:path atomically:YES];
}

+ (id _Nullable)yl_getAppSettingsForObjectWithKey:(NSString * _Nonnull)objKey {
    return [self yl_getSettings:YLAPP_NAME objectForKey:objKey];
}

+ (BOOL)yl_setAppSettingsForObject:(id _Nonnull)value forKey:(NSString * _Nonnull)objKey {
    return [self yl_setSettings:YLAPP_NAME object:value forKey:objKey];
}

@end
