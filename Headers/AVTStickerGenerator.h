//
//  AVTStickerGenerator.h
//  AvatarStream
//
//  Created by Spotlight Deveaux on 2021-11-24.
//

#ifndef AVTStickerGenerator_h
#define AVTStickerGenerator_h

@import SceneKit;
#import "AVTAvatar.h"
#import "AVTStickerConfiguration.h"
#import "AVTStickerGeneratorOptions.h"

NS_ASSUME_NONNULL_BEGIN

// renderer is technically a SCNRenderer,
// but for all intents and purposes it's a direct image to us
typedef void (^SuccessBlock)(CommonImage *rendered, AVTAvatar *avatar);

@interface AVTStickerGenerator : NSObject
- (AVTStickerGenerator *)initWithAvatar:(AVTAvatar *)record;
- (AVTStickerConfiguration *)
    stickerImageWithConfiguration:(AVTStickerConfiguration *)configuration
                          options:(AVTStickerGeneratorOptions *)options
                completionHandler:(SuccessBlock)handler;
- (void)setAsync:(BOOL)async;
@end

NS_ASSUME_NONNULL_END

#endif /* AVTStickerGenerator_h */
