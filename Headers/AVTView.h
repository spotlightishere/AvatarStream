//
//  AVTView.h
//  AvatarStream
//
//  Created by Spotlight Deveaux on 2021-11-19.
//

#ifndef AVTView_h
#define AVTView_h

@import SceneKit;
#import "AVTAnimoji.h"

NS_ASSUME_NONNULL_BEGIN

@interface AVTView : SCNView
@property AVTAvatar *avatar;
- (void)setAvatar:(AVTAvatar *)avatar;
- (void)setEnableFaceTracking:(BOOL)enable;
@end

NS_ASSUME_NONNULL_END

#endif /* AVTView_h */
