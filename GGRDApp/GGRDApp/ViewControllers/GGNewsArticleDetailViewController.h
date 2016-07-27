//
//  GGNewsArticleDetailViewController.h
//  GGRDApp
//
//  Created by Kayla Galway on 6/22/16.
//  Copyright © 2016 edu.self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GGNewsArticle.h"
#import "GGMainTabBar.h"
#import "GGNewsArticleBodyView.h"

@interface GGNewsArticleDetailViewController : UIViewController

@property (strong, nonatomic) GGNewsArticle *tappedArticle;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UITextView *bodyText;
@property (strong, nonatomic) UIImageView *bannerImageView;
@property (strong, nonatomic) GGMainTabBar *tabBar;
@property (strong, nonatomic) UIButton *backButton;
@property (strong, nonatomic) GGNewsArticleBodyView *articleBodyView;

@end
