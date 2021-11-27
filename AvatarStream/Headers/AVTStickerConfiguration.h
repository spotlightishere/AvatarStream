//
//  AVTStickerConfiguration.h
//  AvatarStream
//
//  Created by Spotlight Deveaux on 2021-11-24.
//

#ifndef AVTStickerConfiguration_h
#define AVTStickerConfiguration_h

NS_ASSUME_NONNULL_BEGIN

@import Foundation;

extern NSString *kAVTStickerPackPoses;

@interface AVTStickerConfiguration : NSObject
+ (NSMutableArray<AVTStickerConfiguration *> *)
    stickerConfigurationsForMemojiInStickerPack:(NSString *)pack;
+ (NSMutableArray<AVTStickerConfiguration *> *)stickerConfigurationsForMemoji;

@property NSString *name;
@end

NS_ASSUME_NONNULL_END

#endif /* AVTStickerConfiguration_h */
