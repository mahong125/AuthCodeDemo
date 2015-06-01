//
//  ViewController.m
//  contentOffsetDemo
//
//  Created by mahong on 15/6/1.
//  Copyright (c) 2015年 mahong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UITableView *mainTable;
    UIView *topView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    mainTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    mainTable.delegate = self;
    mainTable.dataSource = self;
    mainTable.tableFooterView = [[UIView alloc] init];
    
//    mainTable.contentOffset = CGPointMake(0, 150);
    mainTable.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
//    mainTable.contentOffset = CGPointMake(0, -150);
    
    [self.view addSubview:mainTable];
    
    //添加监听，动态观察tableview的contentOffset的改变
    [mainTable addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
    
    topView = [[UIView alloc] initWithFrame:CGRectMake(64, 0, self.view.frame.size.width, 150)];
    topView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:topView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint contentOffset = scrollView.contentOffset;
    NSLog(@"%@",NSStringFromCGPoint(contentOffset));
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = [NSString stringWithFormat:@"%ld%ld",(long)indexPath.section,(long)indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = cellId;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark KVC 回调
//本例设置headerView的最大高度为200，最小为64
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"])
    {
        CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
        if (offset.y <= 0 && -offset.y >= 64) {
            
            CGRect newFrame = CGRectMake(0, 0, self.view.frame.size.width, -offset.y);
            topView.frame = newFrame;
            if (-offset.y <=200)
            {
                mainTable.contentInset = UIEdgeInsetsMake(-offset.y, 0, 0, 0);
            }
        } else {
            CGRect newFrame = CGRectMake(0, 0, self.view.frame.size.width, 64);
            topView.frame = newFrame;
            mainTable.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
