//
//  NewsTableViewControllerDataSource.h
//  GGRDApp
//
//  Created by Kayla Galway on 4/20/16.
//  Copyright © 2016 edu.self. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GGSquarespaceAPIClient.h"
#import "GGNewsArticle.h"



@protocol GGNewsTableViewControllerDataSourceDelegate;

@interface GGNewsTableViewControllerDataSource : NSObject

@property (nonatomic, weak) id<GGNewsTableViewControllerDataSourceDelegate> delegate;

- (void)reloadData;
- (NSUInteger)numberOfSections;
- (NSUInteger)numberOfRowsInSection:(NSUInteger)section;
- (GGNewsArticle *)newsArticleForIndexPath:(NSIndexPath *)index;

@end

@protocol GGNewsTableViewControllerDataSourceDelegate <NSObject>

@optional

- (void)dataSourceDidLoad;

@end




//here we will need to create a property for GGNewsArticle object
//which has following properties:
//title
//body
//postdate
//poster

//turn array of dictionaries into array of news story objects