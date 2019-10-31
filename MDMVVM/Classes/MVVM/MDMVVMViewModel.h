//
//  MDMVVMViewModel.h
//  MDMVVM
//
//  Created by lizitao on 2019/10/31.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "MDMVVMDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MDMVVMViewModel : NSObject
@property(nonatomic, strong) RACSubject *successSignal;
@property(nonatomic, strong) RACSubject *failureSignal;
@property(nonatomic, strong) MDMVVMDataModel *dataModel;

- (void)requestData;

@end

NS_ASSUME_NONNULL_END
