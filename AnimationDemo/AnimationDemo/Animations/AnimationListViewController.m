//
//  AnimationListViewController.m
//  AnimationDemo
//
//  Created by 超级腕电商 on 2017/9/28.
//  Copyright © 2017年 超级腕电商. All rights reserved.
//

#import "AnimationListViewController.h"
#import "ExclamationViewController.h"
#import "WaterWaveViewController.h"

@interface AnimationListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation AnimationListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"AnimationList";
    [self createDataSource];
    [self initViews];
}
-(void)initViews{
    self.tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64);
    [self.view addSubview:self.tableView];
}
-(void)createDataSource{
    self.dataArray = @[@"Exclamation",@"WaterWave"];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"UITableViewCell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    NSString * title = self.dataArray[indexPath.row];
    if ([title isEqualToString:@"Exclamation"]) {
        ExclamationViewController * viewController =[[ExclamationViewController alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
    }
    if ([title isEqualToString:@"WaterWave"]) {
        WaterWaveViewController * viewController =[[WaterWaveViewController alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(UITableView*)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:(CGRectZero) style:(UITableViewStyleGrouped)];
        _tableView.backgroundColor = [UIColor clearColor];
        //_tableView.frame = CGRectMake(0, mTabBar.bottom, viewWidth, viewHeight);
        //_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsHorizontalScrollIndicator = false;
        _tableView.showsVerticalScrollIndicator = true;
        _tableView.delaysContentTouches = false;
        _tableView.scrollsToTop = true;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        //        _tableView.noticeImage = @"";
        //        _tableView.noticeText = @"";
        _tableView.sectionHeaderHeight = 0.0;
        _tableView.sectionFooterHeight = 0.0;
    }
    return _tableView;
}

@end
