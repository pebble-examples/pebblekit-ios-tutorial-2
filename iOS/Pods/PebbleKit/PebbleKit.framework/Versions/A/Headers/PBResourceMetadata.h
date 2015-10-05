//
//  PBResourceMetadata.h
//  PebbleKit
//
//  Created by Marcel Jackwerth on 20/08/15.
//  Copyright (c) 2015 Pebble Technology. All rights reserved.
//

#import <PebbleKit/PBDefines.h>
#import <Foundation/Foundation.h>

/**
 *  Instances of PBResourceMetadata describe (system) resources.
 *  @see PBVersionInfo
 */
PB_EXTERN_CLASS @interface PBResourceMetadata : NSObject

/**
 *  The version of the resources as the Epoch timestamp of the Git commit.
 */
@property (nonatomic, readonly) UInt32 timestamp;

/**
 *  The checksum of the resources.
 */
@property (nonatomic, readonly) UInt32 crc;

@end
