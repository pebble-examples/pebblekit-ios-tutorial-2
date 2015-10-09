//
//  PBLogConfig.h
//  PebbleKit
//
//  Created by Marcel Jackwerth on 15/09/15.
//  Copyright (c) 2015 Pebble Technology. All rights reserved.
//

#import <PebbleKit/PBDefines.h>

PB_EXTERN int PBLogLevel;

PB_EXTERN int const PBKitContext;
PB_EXTERN int const PBWSContext;

PB_EXTERN void PBLog(BOOL synchronous, int level, int flag, int context, const char *file, const char *function, int line, id tag, NSString *format, ...) __attribute__ ((format (__NSString__, 9, 10)));
