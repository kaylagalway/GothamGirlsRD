//
//  NewsTableViewControllerDataSource.m
//  GGRDApp
//
//  Created by Kayla Galway on 4/20/16.
//  Copyright © 2016 edu.self. All rights reserved.
//

#import "GGNewsTableViewControllerDataSource.h"
#import <UIKit/UIKit.h>

@interface GGNewsTableViewControllerDataSource()

@property (strong, nonatomic) NSArray *newsStoriesArray;

@end

@implementation GGNewsTableViewControllerDataSource

//going to have an array of news stories

//in API Client:
//fetchnewsstorydictionariesWithCompletion
//will get an array of dictionaries

//in the datasource, will convert all of those into news story items, then feed table view

//blocks are passed by reference, passing by default a memory pointer
//problem with that is that when that happens and memory pointer is in block, strong reference is created


-(void)reloadData
{
    __weak typeof(self) weakSelf = self;
    [GGSquarespaceAPIClient fetchNewsStoryDictionariesWithCompletion:^(NSArray *stories) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSMutableArray *articles = [@[] mutableCopy];
        for (NSDictionary *newsDict in stories) {
            [articles addObject: [[GGNewsArticle alloc]initWithDictionary: newsDict]];
        }
        strongSelf.newsStoriesArray = articles;
        if (strongSelf.delegate && [strongSelf.delegate respondsToSelector:@selector(dataSourceDidLoad)]) {
            [strongSelf.delegate dataSourceDidLoad];
        }
    }];
}

- (NSUInteger)numberOfSections {
    return [self.newsStoriesArray count];
}

- (NSUInteger)numberOfRowsInSection:(NSUInteger)section {
    return 1;
}

- (GGNewsArticle *)newsArticleForIndexPath:(NSIndexPath *)index {
    return self.newsStoriesArray[index.section];
}


@end
