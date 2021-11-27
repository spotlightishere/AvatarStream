#import <TargetConditionals.h>

#if TARGET_OS_OSX
@import AppKit;
#define CommonImage NSImage
#else
@import UIKit;
#define CommonImage UIImage
#endif

#import "AVTAnimoji.h"
#import "AVTAvatar.h"
#import "AVTAvatarRecordRendering.h"
#import "AVTMemoji.h"
#import "AVTPAvatarRecordDataSource.h"
#import "AVTStickerConfiguration.h"
#import "AVTStickerGenerator.h"
#import "AVTStickerGeneratorOptions.h"
#import "AVTView.h"
