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
    UILabel *helloLabel = [UILabel new];
    helloLabel.text = @"Hello";
    [self.view addSubview:helloLabel];
    helloLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [helloLabel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active= YES;
    [helloLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    NSLog(@"in new viewcontroller");
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view layoutSubviews];
    // Do any additional setup after loading the view.
}

//- (void)addTitle {
//    UITextView *titleText = [[UITextView alloc]init];
//    titleText.text = self.tappedArticle.title;
//    [self.view addSubview:titleText];
//    [titleText setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [titleText.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active=YES;
//    [titleText.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active=YES;
//    
//    NSLog(@"Launching detail VC");
//}

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
