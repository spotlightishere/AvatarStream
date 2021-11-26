//
//  AVTAnimoji.h
//  AvatarExport
//
//  Created by Spotlight Deveaux on 2021-11-19.
//

#ifndef AVTAnimoji_h
#define AVTAnimoji_h

@import Foundation;
@import UIKit;
#import "AVTAvatar.h"

NS_ASSUME_NONNULL_BEGIN

@interface AVTAnimoji : AVTAvatar
/**
 * Retrieves the Animoji with the specified name.
 *
 * @returns An Animoji
 */
+ (AVTAnimoji *)animojiNamed:(NSString *)name;
/**
 * Retrieves the name of all available Animoji for usage.
 *
 * @returns A list of Animoji registered with the system.
 */
+ (NSArray<NSString *> *)animojiNames;
+ (UIImage *)thumbnailForAnimojiNamed:(NSString *)name
                              options:(NSArray *_Nullable)options;
@end

NS_ASSUME_NONNULL_END

#endif /* AVTAnimoji_h */
