//
//  SecondViewController.m
//  JSPatch
//
//  Created by Hong on 16/8/22.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondCell.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "SecondVideo.h"
#import "SelectRequest.h"

@interface SecondViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSArray *data;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _data = @[];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    SelectRequest *request = [[SelectRequest alloc] init];
    __weak typeof(self) weakSelf  = self;
    [request getItemsCompletion:^(NSArray *items, NSError *error) {
        if (items) {
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.data = items;
                [weakSelf.tableView reloadData];
            });
        }else{
            NSLog(@"error : %@", error);
        }
    }];
}

#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[SecondCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.video = self.data[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CGRectGetWidth(tableView.frame) * 3.0 / 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondVideo *video = self.data[indexPath.row];
    AVPlayer *player = [AVPlayer playerWithURL:[NSURL URLWithString:video.playUrl]];
    AVPlayerViewController *vc = [[AVPlayerViewController alloc] init];
    vc.player = player;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
