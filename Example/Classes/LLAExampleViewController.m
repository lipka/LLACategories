//
//  LLAExampleViewController.m
//  LLACategories
//
//  Created by Lukas Lipka on 22/02/14.
//  Copyright (c) 2014 Lukas Lipka. All rights reserved.
//

#import "LLAExampleViewController.h"
#import "UIImage+LLAAdditions.h"

@interface LLAExampleViewController ()

@property (nonatomic, readonly) UIImageView *maskedImageView;
@property (nonatomic, readonly) UIImageView *symbolImageView;

@end

@implementation LLAExampleViewController

@synthesize maskedImageView = _maskedImageView;
@synthesize symbolImageView = _symbolImageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize size = self.view.bounds.size;

    self.maskedImageView.frame = CGRectMake(0, 0, size.width, size.height / 2);
    self.maskedImageView.image = [UIImage lla_imageNamed:@"Image" maskColor:[UIColor redColor]];
    [self.view addSubview:self.maskedImageView];
    
    UIFont *font = [UIFont fontWithName:@"FontAwesome" size:32];
    
    self.symbolImageView.frame = CGRectMake(0, size.height / 2, size.width, size.height / 2);
    self.symbolImageView.image = [UIImage lla_imageWithFont:font named:@"\uf09a" maskColor:[UIColor blueColor]];
    [self.view addSubview:self.symbolImageView];
}

#pragma mark - Properties

- (UIImageView *)maskedImageView {
    if (!_maskedImageView) {
        _maskedImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _maskedImageView.contentMode = UIViewContentModeCenter;
    }
    return _maskedImageView;
}

- (UIImageView *)symbolImageView {
    if (!_symbolImageView) {
        _symbolImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _symbolImageView.contentMode = UIViewContentModeCenter;
    }
    return _symbolImageView;
}

@end
