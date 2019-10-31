//
//  MDMVVMDataModel.h
//  MDMVVM
//
//  Created by lizitao on 2019/10/31.
//

#import <Foundation/Foundation.h>
#import "MDMVCDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MDMVVMDataModel : NSObject

- (void)requestDataSuccess:(MDSuccess)success AndFailure:(MDFailure)failure;

@end

NS_ASSUME_NONNULL_END
