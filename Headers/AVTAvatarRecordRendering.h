//
//  AVTAvatarRecordRendering.h
//  AvatarStream
//
//  Created by Spotlight Deveaux on 2021-11-24.
//

#ifndef AVTAvatarRecordRendering_h
#define AVTAvatarRecordRendering_h

#import "AVTAvatar.h"
#import "AVTAvatarRecord.h"

NS_ASSUME_NONNULL_BEGIN

@interface AVTAvatarRecordRendering : NSObject

/**
 * Prepare a record for rendering.
 * @param record The record to set up for rendering
 * @param intent Unknown - TODO
 * @returns A usable record for rendering.
 */
+ (AVTAvatar *)avatarForRecord:(AVTAvatarRecord *)record
                   usageIntent:(int)intent;

@end

NS_ASSUME_NONNULL_END

#endif /* AVTAvatarRecordRendering_h */
