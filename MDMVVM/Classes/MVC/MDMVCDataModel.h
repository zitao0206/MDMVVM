//
//  MDMVCDataModel.h
//  MDMVVM
//
//  Created by lizitao on 2019/10/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^MDSuccess)(NSDictionary *info);
typedef void(^MDFailure)(NSDictionary *info);

@interface MDMVCDataModel : NSObject
- (void)requestDataSuccess:(MDSuccess)success AndFailure:(MDFailure)failure;
@end

NS_ASSUME_NONNULL_END
