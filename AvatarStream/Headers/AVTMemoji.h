//
//  AVTMemoji.h
//  AvatarStream
//
//  Created by Spotlight Deveaux on 2021-11-20.
//

#ifndef AVTMemoji_h
#define AVTMemoji_h

NS_ASSUME_NONNULL_BEGIN

@interface AVTMemoji : AVTAvatar
/**
 * Returns a neutral Memoji.
 *
 * @returns A data source with all Memoji
 */
+ (AVTMemoji *)neutralMemoji;
@end

NS_ASSUME_NONNULL_END

#endif /* AVTMemoji_h */
