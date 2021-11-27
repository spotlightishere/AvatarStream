//
//  AVTPAvatarRecordDataSource.h
//  AvatarStream
//
//  Created by Spotlight Deveaux on 2021-11-19.
//

#ifndef AVTPAvatarRecordDataSource_h
#define AVTPAvatarRecordDataSource_h

@import Foundation;
#import "AVTAvatarRecord.h"

NS_ASSUME_NONNULL_BEGIN

@interface AVTPAvatarRecordDataSource : NSObject
/**
 * Requests all Memoji with the specified application identifier.
 *
 * @returns A data source with all Memoji
 */
+ (AVTPAvatarRecordDataSource *)defaultUIDataSourceWithDomainIdentifier:
    (NSString *)domainIdentifier;

- (AVTAvatarRecord *)recordAtIndex:(int)index;
- (int)numberOfRecords;
@end

NS_ASSUME_NONNULL_END

#endif /* AVTPAvatarRecordDataSource_h */
