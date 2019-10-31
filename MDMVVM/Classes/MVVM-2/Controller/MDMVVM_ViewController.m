//
//  MDMVVM_ViewController.m
//  MDMVVM
//
//  Created by lizitao on 2019/10/31.
//

#import "MDMVVM_ViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "MDMVVM_ViewModel.h"
#import "MDMVVM_TableViewCell.h"

@interface MDMVVM_ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSString *titleString;
@property (nonatomic, strong) NSArray *dataArr;

@property (nonatomic, strong) MDMVVM_ViewModel *viewModel;

@end

@implementation MDMVVM_ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.tableView];
    self.view.backgroundColor = [UIColor whiteColor];
    [self bindViewModel];
}

- (void)bindViewModel
{
    @weakify(self);
    //将命令执行后的数据交给controller
    [self.viewModel.command.executionSignals.switchToLatest subscribeNext:^(id x) {
        @strongify(self);
        if ([x isKindOfClass:[NSArray class]]) {
            [SVProgressHUD showSuccessWithStatus:@"加载成功"];
            NSArray *originalDataArr = x;
            NSInteger kCount = originalDataArr.count;
            self.dataArr = [originalDataArr subarrayWithRange:NSMakeRange(1, kCount - 1)];
            self.titleString = originalDataArr.firstObject;
            [self.tableView reloadData];
            [SVProgressHUD dismissWithDelay:1.5];
        } else {
             self.titleString = x;
             [SVProgressHUD showSuccessWithStatus:@"加载失败"];
        }

    }];
    
    RAC(self.titleLabel, text) = RACObserve(self, titleString);
    
    //执行command
    [self.viewModel.command execute:nil];
    [SVProgressHUD showWithStatus:@"加载中..."];

}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (MDMVVM_TableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MDMVVM_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MDMVVM_TableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = self.dataArr[indexPath.row];
    cell.backgroundColor = [UIColor greenColor];
    cell.textLabel.textColor =[UIColor grayColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
}


//MARK: tableview Delagete
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了tableView事件");
}
 

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"标题";
        _titleLabel.font = [UIFont systemFontOfSize:20.0];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor clearColor];
        [_titleLabel sizeToFit];
        _titleLabel.frame = CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width, 30);
    }
    return _titleLabel;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.frame = CGRectMake(0, 120, [UIScreen mainScreen].bounds.size.width, 300);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[MDMVVM_TableViewCell class] forCellReuseIdentifier:NSStringFromClass([MDMVVM_TableViewCell class])];
        _tableView.separatorStyle = NO;
    }
    return _tableView;
}

- (MDMVVM_ViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [MDMVVM_ViewModel new];
    }
    return _viewModel;
}



@end
