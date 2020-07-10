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

@end

@implementation YJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.imgView.image = [UIImage imageWithContentsOfFile:[LGBundleManager.defaultManager pathInBundleWithName:@"Empty/empty_1"]];
}



@end
