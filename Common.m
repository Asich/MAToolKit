//
//  Common.m
//  Kurs
//
//  Created by Mustafin Askar on 17.06.13.
//  Copyright (c) 2013 askar. All rights reserved.
//

#import "Common.h"

@implementation Common

+ (NSString *)getPathOfCopiedFile:(NSString *)file withType:(NSString *)type
{
    NSArray *dirPaths  = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [dirPaths objectAtIndex:0];
    NSString *storePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent: [NSString stringWithFormat:@"%@.%@", file, type]]];
    
    NSError *error;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:storePath])
    {
        NSString *defaultStorePath = [[NSBundle mainBundle] pathForResource:file ofType:type];
        if (defaultStorePath)
        {
            if ([fileManager fileExistsAtPath:defaultStorePath])
            {
                [fileManager copyItemAtPath:defaultStorePath toPath:storePath error:&error];
            }
        }
    }
    return storePath;
}

@end
