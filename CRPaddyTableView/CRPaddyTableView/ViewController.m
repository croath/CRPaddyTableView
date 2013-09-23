//
//  ViewController.m
//  CRPaddyTableView
//
//  Created by croath on 13-9-22.
//  Copyright (c) 2013年 Croath. All rights reserved.
//

#import "ViewController.h"
#import "CRPaddyTableView.h"

@interface ViewController (){
    NSArray *_array;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _array = @[@"test1", @"test2", @"test3", @"test4", @"test5", @"test6", @"test7", @"test8",
               @"test1", @"test2", @"test3", @"test4", @"test5", @"test6", @"test7", @"test8",
               @"test1", @"test2", @"test3", @"test4", @"test5", @"test6", @"test7", @"test8",
               @"test1", @"test2", @"test3", @"test4", @"test5", @"test6", @"test7", @"test8",
               @"test1", @"test2", @"test3", @"test4", @"test5", @"test6", @"test7", @"test8",
               @"test1", @"test2", @"test3", @"test4", @"test5", @"test6", @"test7", @"test8"];
	// Do any additional setup after loading the view, typically from a nib.
    CRPaddyTableView *tableView = [[CRPaddyTableView alloc] initWithFrame:self.view.bounds];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    [self.view addSubview:tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_array count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        UIView *v = [[UIView alloc] initWithFrame:CGRectMake(2, 2, 100, 40)];
        [v setBackgroundColor:[UIColor lightGrayColor]];
        [cell.contentView addSubview:v];
        [cell.contentView sendSubviewToBack:v];
    }
    
    [cell.textLabel setText:[_array objectAtIndex:indexPath.row]];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    [(CRPaddyTableView*)scrollView configurePoint];
}

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath{
    [(CRPaddyTableView*)tableView addBehaviorsToCell:cell];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
