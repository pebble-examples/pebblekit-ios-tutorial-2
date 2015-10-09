//
//  PBDefines.h
//  PebbleKit
//
//  Created by Marcel Jackwerth on 14/09/15.
//  Copyright (c) 2015 Pebble Technology. All rights reserved.
//

#ifndef PB_EXTERN
#ifdef __cplusplus
#define PB_EXTERN extern "C" __attribute__((visibility ("default")))
#else
#define PB_EXTERN extern __attribute__((visibility ("default")))
#endif
#endif

#define PB_EXTERN_CLASS __attribute__((visibility("default")))
