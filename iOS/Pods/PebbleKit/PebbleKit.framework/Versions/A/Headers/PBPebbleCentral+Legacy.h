//
//  PBPebbleCentral+Legacy.h
//  PebbleKit
//
//  Created by Marcel Jackwerth on 09/09/15.
//  Copyright (c) 2015 Pebble Technology. All rights reserved.
//

#import <PebbleKit/PBPebbleCentral.h>

@interface PBPebbleCentral (Legacy)

/**
 *  Verifies the currently set application UUID.
 *  @return YES if the currently set UUID is valid, NO if it is not.
 *  @see -setAppUuid:
 */
- (BOOL)hasValidAppUUID __deprecated_msg("Method deprecated. Use `appUUID != nil`");

@end
