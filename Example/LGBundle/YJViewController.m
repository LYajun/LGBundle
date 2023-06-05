//
//  YJViewController.m
//  LGBundle
//
//  Created by lyj on 07/09/2020.
//  Copyright (c) 2020 lyj. All rights reserved.
//

#import "YJViewController.h"
#import <LGBundle/LGBundleManager.h>

@interface YJViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIImageView *navbarImgView;

@end

@implementation YJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

//    self.navbarImgView.image = [UIImage imageWithContentsOfFile:[LGBundleManager.defaultManager pathInBarBundleWithName:@"navbar_bg/bg_1"]];
//    self.imgView.image = [UIImage imageWithContentsOfFile:[LGBundleManager.defaultManager pathInBundleWithName:@"search_empty/search_empty_1"]];
}



@end
