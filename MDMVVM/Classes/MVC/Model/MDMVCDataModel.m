//
//  MDMVCDataModel.m
//  MDMVVM
//
//  Created by lizitao on 2019/10/31.
//

#import "MDMVCDataModel.h"

@implementation MDMVCDataModel

- (void)requestDataSuccess:(MDSuccess)success AndFailure:(MDFailure)failure
{
    //请求下来的数组字典
    NSArray *result = @[@"北京",@"上海",@"杭州"];
    
    if (result.count > 0) {
        //注意小写
        success(@{@"data":result});
        
    } else {
        
        failure(@{@"error":@"no data"});
        
    }
    
}
@end
