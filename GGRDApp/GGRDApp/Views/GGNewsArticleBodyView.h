//
//  GGNewsArticleBodyView.h
//  GGRDApp
//
//  Created by Kayla Galway on 7/9/16.
//  Copyright © 2016 edu.self. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GGNewsArticle.h"

@interface GGNewsArticleBodyView : UIView

@property (strong, nonatomic) UILabel *currentTitleLabel;
@property (strong, nonatomic) UIButton *returnButton;
@property (strong, nonatomic) UITextView *articleBodyTextView;

-(instancetype)initWithArticle:(GGNewsArticle *)currentArticle;

@end
