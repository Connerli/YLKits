//
//  NSFileManager+YLKit.h
//  YLKits
//
//  Created by Conner on 2019/9/3.
//  Copyright © 2019 Conner. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  Directory type enum
 */
typedef NS_ENUM(NSInteger, DirectoryType) {
    /**
     *  Main bundle directory
     */
    DirectoryTypeMainBundle = 0,
    /**
     *  Library directory
     */
    DirectoryTypeLibrary,
    /**
     *  Documents directory
     */
    DirectoryTypeDocuments,
    /**
     *  Cache directory
     */
    DirectoryTypeCache
};


@interface NSFileManager (YLKit)
/**
 *  Read a file an returns the content as NSString
 *
 *  @param file File name
 *  @param type File type
 *
 *  @return Returns the content of the file a NSString
 */
+ (NSString * _Nullable)yl_readTextFile:(NSString * _Nonnull)file
                              ofType:(NSString * _Nonnull)type;

/**
 *  Save a given array into a PLIST with the given filename
 *
 *  @param path     Path of the PLIST
 *  @param fileName PLIST filename
 *  @param array    Array to save into PLIST
 *
 *  @return Returns YES if the operation was successful, otherwise NO
 */
+ (BOOL)yl_saveArrayToPath:(DirectoryType)path
           withFilename:(NSString * _Nonnull)fileName
                  array:(NSArray * _Nonnull)array;

/**
 *  Load array from a PLIST with the given filename
 *
 *  @param path     Path of the PLIST
 *  @param fileName PLIST filename
 *
 *  @return Returns the loaded array
 */
+ (NSArray * _Nullable)yl_loadArrayFromPath:(DirectoryType)path
                            withFilename:(NSString * _Nonnull)fileName;

/**
 *  Save a given array into a PLIST with the given filename
 *
 *  @param path     Path of the PLIST
 *  @param fileName PLIST filename
 *  @param dic    dic to save into PLIST
 *
 *  @return Returns YES if the operation was successful, otherwise NO
 */
+ (BOOL)yl_saveDicToPath:(DirectoryType)path
           withFilename:(NSString * _Nonnull)fileName
                  dic:(NSDictionary * _Nonnull)dic;

/**
 *  Load array from a PLIST with the given filename
 *
 *  @param path     Path of the PLIST
 *  @param fileName PLIST filename
 *
 *  @return Returns the loaded dic
 */
+ (NSDictionary * _Nullable)yl_loadDicFromPath:(DirectoryType)path
                            withFilename:(NSString * _Nonnull)fileName;
/**
 *  Get the Bundle path for a filename
 *
 *  @param fileName Filename
 *
 *  @return Returns the path as a NSString
 */
+ (NSString * _Nonnull)yl_getBundlePathForFile:(NSString * _Nonnull)fileName;

/**
 *  Get the Documents directory for a filename
 *
 *  @param fileName Filename
 *
 *  @return Returns the directory as a NSString
 */
+ (NSString * _Nonnull)yl_getDocumentsDirectoryForFile:(NSString * _Nonnull)fileName;

/**
 *  Get the Library directory for a filename
 *
 *  @param fileName Filename
 *
 *  @return Returns the directory as a NSString
 */
+ (NSString * _Nonnull)yl_getLibraryDirectoryForFile:(NSString * _Nonnull)fileName;

/**
 *  Get the Cache directory for a filename
 *
 *  @param fileName Filename
 *
 *  @return Returns the directory as a NSString
 */
+ (NSString * _Nonnull)yl_getCacheDirectoryForFile:(NSString * _Nonnull)fileName;

/**
 *  Returns the size of the file
 *
 *  @param fileName  Filename
 *  @param directory Directory of the file
 *
 *  @return Returns the file size
 */
+ (NSNumber * _Nullable)yl_fileSize:(NSString * _Nonnull)fileName
                   fromDirectory:(DirectoryType)directory;

/**
 *  Delete a file with the given filename
 *
 *  @param fileName Filename to delete
 *  @param directory Directory of the file
 *
 *  @return Returns YES if the operation was successful, otherwise NO
 */
+ (BOOL)yl_deleteFile:(NSString * _Nonnull)fileName
     fromDirectory:(DirectoryType)directory;

/**
 *  Move a file from a directory to another
 *
 *  @param fileName    Filename to move
 *  @param origin      Origin directory of the file
 *  @param destination Destination directory of the file
 *
 *  @return Returns YES if the operation was successful, otherwise NO
 */
+ (BOOL)yl_moveLocalFile:(NSString * _Nonnull)fileName
        fromDirectory:(DirectoryType)origin
          toDirectory:(DirectoryType)destination;

/**
 *  Move a file from a directory to another
 *
 *  @param fileName    Filename to move
 *  @param origin      Origin directory of the file
 *  @param destination Destination directory of the file
 *  @param folderName  Folder name where to move the file. If folder not exist it will be created automatically
 *
 *  @return Returns YES if the operation was successful, otherwise NO
 */
+ (BOOL)yl_moveLocalFile:(NSString * _Nonnull)fileName
        fromDirectory:(DirectoryType)origin
          toDirectory:(DirectoryType)destination
       withFolderName:(NSString * _Nullable)folderName;

/**
 *  Duplicate a file into another directory
 *
 *  @param origin      Origin path
 *  @param destination Destination path
 *
 *  @return Returns YES if the operation was successful, otherwise NO
 */
+ (BOOL)yl_duplicateFileAtPath:(NSString * _Nonnull)origin
                  toNewPath:(NSString * _Nonnull)destination;

/**
 *  Rename a file with another filename
 *
 *  @param origin  Origin path
 *  @param path    Subdirectory path
 *  @param oldName Old filename
 *  @param newName New filename
 *
 *  @return Returns YES if the operation was successful, otherwise NO
 */
+ (BOOL)yl_renameFileFromDirectory:(DirectoryType)origin
                         atPath:(NSString * _Nonnull)path
                    withOldName:(NSString * _Nonnull)oldName
                     andNewName:(NSString * _Nonnull)newName;

/**
 *  Get the App settings for a given key
 *
 *  @param objKey Key to get the object
 *
 *  @return Returns the object for the given key
 */
+ (id _Nullable)yl_getAppSettingsForObjectWithKey:(NSString * _Nonnull)objKey;

/**
 *  Set the App settings for a given object and key. The file will be saved in the Library directory
 *
 *  @param value  Object to set
 *  @param objKey Key to set the object
 *
 *  @return Returns YES if the operation was successful, otherwise NO
 */
+ (BOOL)yl_setAppSettingsForObject:(id _Nonnull)value
                         forKey:(NSString * _Nonnull)objKey;

/**
 *  Get the given settings for a given key
 *
 *  @param settings Settings filename
 *  @param objKey   Key to set the object
 *
 *  @return Returns the object for the given key
 */
+ (id _Nullable)yl_getSettings:(NSString * _Nonnull)settings
               objectForKey:(NSString * _Nonnull)objKey;

/**
 *  Set the given settings for a given object and key. The file will be saved in the Library directory
 *
 *  @param settings Settings filename
 *  @param value    Object to set
 *  @param objKey   Key to set the object
 *
 *  @return Returns YES if the operation was successful, otherwise NO
 */
+ (BOOL)yl_setSettings:(NSString * _Nonnull)settings
             object:(id _Nonnull)value
             forKey:(NSString * _Nonnull)objKey;
@end

NS_ASSUME_NONNULL_END
