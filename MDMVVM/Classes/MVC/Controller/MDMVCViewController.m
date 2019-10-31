//
//  MDMVCViewController.m
//  MDMVVM
//
//  Created by lizitao on 2019/10/31.
//

#import "MDMVCViewController.h"
#import "MDMVCDataModel.h"
#import "MDMVCTableViewCell.h"

@interface MDMVCViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@property(nonatomic,strong) NSArray *dataArr;

@end

@implementation MDMVCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    self.view.backgroundColor = [UIColor whiteColor];
    MDMVCDataModel *model = [MDMVCDataModel new];
    [model requestDataSuccess:^(NSDictionary * _Nonnull info) {
         NSArray *arr = [info objectForKey:@"data"];
         NSLog(@"%@",arr);
         self.dataArr = arr;
         [self.tableView reloadData];
    } AndFailure:^(NSDictionary * _Nonnull info) {
        NSArray *arr = [info objectForKey:@"data"];
        NSLog(@"%@",arr);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (MDMVCTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MDMVCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MDMVCTableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = self.dataArr[indexPath.row];
    cell.backgroundColor = [UIColor greenColor];
    cell.textLabel.textColor =[UIColor grayColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
}


//MARK: tableview Delagete
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"我点击了tableView事件");
}
 

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.frame = self.view.bounds;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[MDMVCTableViewCell class] forCellReuseIdentifier:NSStringFromClass([MDMVCTableViewCell class])];
        _tableView.separatorStyle = NO;
    }
    return _tableView;
}

@end
