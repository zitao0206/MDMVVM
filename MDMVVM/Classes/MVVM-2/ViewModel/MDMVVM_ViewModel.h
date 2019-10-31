//
//  MDMVVMViewModel.h
//  MDMVVM
//
//  Created by lizitao on 2019/10/31.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface MDMVVM_ViewModel : NSObject
//command处理实际事务
@property (nonatomic, strong, readonly) RACCommand *command;

@end

NS_ASSUME_NONNULL_END
