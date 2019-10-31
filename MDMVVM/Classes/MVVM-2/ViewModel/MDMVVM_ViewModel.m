//
//  MDMVVMViewModel.m
//  MDMVVM
//
//  Created by lizitao on 2019/10/31.
//

#import "MDMVVM_ViewModel.h"
#import "MDMVVM_DataModel.h"
#import "MDMVCDataModel.h"

@interface MDMVVM_ViewModel ()
@property (nonatomic,strong)RACCommand *command;
@end

@implementation MDMVVM_ViewModel

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
    @weakify(self);
    self.command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            @strongify(self);
            [self requestDataSuccess:^(NSDictionary * info) {
                NSArray <MDMVVM_DataModel *> *arr = [info valueForKey:@"data"];
                [subscriber sendNext:arr];
                [subscriber sendCompleted];
            } AndFailure:^(NSDictionary *info) {
                NSString *str = [info valueForKey:@"data"];
                if (str.length > 0) {
                    [subscriber sendNext:str];
                }
                [subscriber sendCompleted];
            }];
            return nil;
        }];
    }];

}

- (void)requestDataSuccess:(MDSuccess)success AndFailure:(MDFailure)failure
{
    //请求下来的数组字典
    NSArray *result = @[@"城市列表：",@"北京",@"上海",@"杭州"];
    
    if (result.count > 0) {
        //注意小写
        success(@{@"data":result});
        
    } else {
        
        failure(@{@"data":@"No data"});
        
    }
    
}


@end
