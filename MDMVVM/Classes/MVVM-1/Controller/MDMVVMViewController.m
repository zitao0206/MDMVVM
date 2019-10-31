//
//  MDMVVMViewController.m
//  MDMVVM
//
//  Created by lizitao on 2019/10/31.
//

#import "MDMVVMViewController.h"
#import "MDMVVMViewModel.h"
#import "MDMVVMTableViewCell.h"

@interface MDMVVMViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArr;

@property (nonatomic, strong) MDMVVMViewModel *viewModel;

@end

@implementation MDMVVMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self bindViewModel];
}

- (void)bindViewModel
{
    self.viewModel = [MDMVVMViewModel new];
    //信号塔先建好
    @weakify(self);
    [self.viewModel.successSignal subscribeNext:^(id x) {
        @strongify(self);
        NSArray *arr = x;
        self.dataArr = arr;
        [self.tableView reloadData];

    }];
    //发信号
    [self.viewModel requestData];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (MDMVVMTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MDMVVMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MDMVVMTableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = self.dataArr[indexPath.row];
    cell.backgroundColor = [UIColor greenColor];
    cell.textLabel.textColor = [UIColor grayColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
}


//MARK: tableview Delagete
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了tableView事件");
}
 

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.frame = self.view.bounds;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[MDMVVMTableViewCell class] forCellReuseIdentifier:NSStringFromClass([MDMVVMTableViewCell class])];
        _tableView.separatorStyle = NO;
    }
    return _tableView;
}

@end
