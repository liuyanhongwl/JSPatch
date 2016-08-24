//
//  SecondCell.m
//  JSPatch
//
//  Created by Hong on 16/8/22.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import "SecondCell.h"
#import "Masonry.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "SecondVideo.h"

@interface SecondCell ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation SecondCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _imgView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imgView];
        
        _titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        self.titleLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.titleLabel];
        
        __weak typeof(self) weakSelf = self;
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(weakSelf.contentView);
            make.trailing.mas_equalTo(weakSelf.contentView);
            make.top.mas_equalTo(weakSelf.contentView);
            make.bottom.mas_equalTo(weakSelf.contentView);
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(weakSelf.contentView);
        }];
    }
    return self;
}

- (void)setVideo:(SecondVideo *)video
{
    _video = video;
    
    self.imgView.image = nil;
    [self.imgView setImageWithURL:[NSURL URLWithString:self.video.cover]];
    self.titleLabel.text = self.video.title;
}

@end
