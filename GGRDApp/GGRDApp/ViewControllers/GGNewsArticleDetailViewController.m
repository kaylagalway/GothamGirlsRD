//
//  GGNewsArticleDetailViewController.m
//  GGRDApp
//
//  Created by Kayla Galway on 6/22/16.
//  Copyright © 2016 edu.self. All rights reserved.
//

#import "GGNewsArticleDetailViewController.h"

@interface GGNewsArticleDetailViewController ()

@end

@implementation GGNewsArticleDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addTabBar];
//    [self addGothamBannerImage];
//    [self addArticleView];
    [self.view layoutSubviews];
    NSLog(@"%@", self.tappedArticle.title);
    // Do any additional setup after loading the view.
}

-(void)addArticleView {
    self.articleBodyView = [[GGNewsArticleBodyView alloc]initWithArticle:self.tappedArticle];
    [self.view addSubview:self.articleBodyView];
    self.articleBodyView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.articleBodyView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:0.6];
    [self.articleBodyView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active=YES;
    [self.articleBodyView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active=YES;
}

-(void)addGothamBannerImage {
    self.bannerImageView = [UIImageView new];
    UIImage *bannerImage = [UIImage imageNamed:@"gotham"];
    [self.bannerImageView setImage:bannerImage];
    [self.view addSubview:self.bannerImageView];
    self.bannerImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.bannerImageView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.bannerImageView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.bannerImageView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.bannerImageView.bottomAnchor constraintEqualToAnchor:self.articleBodyView.topAnchor].active=YES;
    self.bannerImageView.contentMode = UIViewContentModeScaleAspectFill;
}

-(void)addTabBar {
    self.tabBar = [GGMainTabBar new];
    [self.view addSubview:self.tabBar];
//    [self.tabBar.topAnchor constraintEqualToAnchor:self.view.topAnchor].active=YES;
//    [self.tabBar.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active=YES;
//    [self.tabBar.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active=YES;
}

- (void)addTitle {
    self.titleLabel = [UILabel new];
    self.titleLabel.text = self.tappedArticle.title;
    [self.view addSubview:self.titleLabel];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.titleLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active=YES;
    [self.titleLabel.topAnchor constraintEqualToAnchor:self.tabBar.bottomAnchor constant:15].active = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
 
 UILabel *helloLabel = [UILabel new];
 helloLabel.text = @"Hello";
 [self.view addSubview:helloLabel];
 helloLabel.translatesAutoresizingMaskIntoConstraints = NO;
 [helloLabel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active= YES;
 [helloLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
 NSLog(@"in new viewcontroller");
 
 
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
