//
//  MDMVVMViewModel.m
//  MDMVVM
//
//  Created by lizitao on 2019/10/31.
//

#import "MDMVVMViewModel.h"

@interface MDMVVMViewModel ()
@property(nonatomic,strong) NSArray *bindArr;
@end

@implementation MDMVVMViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initViewModel];
    }
    return self;
}

- (void)initViewModel
{
    self.successSignal = [RACSubject subject];
    self.failureSignal = [RACSubject subject];
    self.dataModel = [MDMVVMDataModel new];
}


- (void)requestData
{
    @weakify(self);
    [self.dataModel requestDataSuccess:^(NSDictionary *info) {
        @strongify(self);
        NSArray *arr = [info valueForKey:@"data"];
        [self.successSignal sendNext:arr];
        
    } AndFailure:^(NSDictionary *info) {
       @strongify(self);
       NSString *str = [info valueForKey:@"data"];
       if (str.length > 0) {
           [self.failureSignal sendNext:str];
       }
    }];
}


@end
