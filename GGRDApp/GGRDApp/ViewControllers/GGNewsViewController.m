//
//  NewsViewController.m
//  GGRDApp
//
//  Created by Kayla Galway on 4/20/16.
//  Copyright © 2016 edu.self. All rights reserved.
//

#import "GGNewsViewController.h"
#import "GGSquarespaceAPIClient.h"
#import "GGNewsArticle.h"
#import "GGNewsTableViewControllerDataSource.h"

@interface GGNewsViewController () <UITableViewDelegate, UITableViewDataSource, GGNewsTableViewControllerDataSourceDelegate>
@property (weak, nonatomic) IBOutlet UITableView *newsTableView;
@property (strong, nonatomic) GGNewsTableViewControllerDataSource *newsDataSource;

@end

@implementation GGNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.newsTableView.dataSource = self;
    self.newsTableView.delegate = self;
    self.newsDataSource = [[GGNewsTableViewControllerDataSource alloc]init];
    self.newsDataSource.delegate = self;
    [self.newsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    [self.newsDataSource reloadData];
    // Do any additional setup after loading the view.
}

- (void)dataSourceDidLoad {
    dispatch_async(dispatch_get_main_queue(), ^{
    [self.newsTableView reloadData];
    });
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [self.newsDataSource newsArticleForIndexPath:indexPath].title;
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.newsDataSource numberOfSections];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.newsDataSource numberOfRowsInSection:section];
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
