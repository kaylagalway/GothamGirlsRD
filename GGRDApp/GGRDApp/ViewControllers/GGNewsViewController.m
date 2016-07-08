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
#import "GGNewsArticleDetailViewController.h"
#import "GGNewsTableViewCell.h"

@interface GGNewsViewController () <UITableViewDelegate, UITableViewDataSource, GGNewsTableViewControllerDataSourceDelegate>
@property (strong, nonatomic) IBOutlet UITableView *newsTableView;
@property (strong, nonatomic) GGNewsTableViewControllerDataSource *newsDataSource;
@property (strong, nonatomic) GGNewsTableViewCell *customNewsCell;

@end

@implementation GGNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.newsTableView.dataSource = self;
    self.newsTableView.delegate = self;
    self.newsDataSource = [[GGNewsTableViewControllerDataSource alloc]init];
    self.newsDataSource.delegate = self;
    [self.newsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"NewsCell"];
    
    [self.newsDataSource reloadData];
    // Do any additional setup after loading the view.
}

- (void)dataSourceDidLoad {
    dispatch_async(dispatch_get_main_queue(), ^{
    [self.newsTableView reloadData];
    });
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GGNewsTableViewCell *cell = (GGNewsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"NewsCell"];
    cell.textLabel.text = [self.newsDataSource newsArticleForIndexPath:indexPath].title;
    return cell;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.newsDataSource numberOfSections];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.newsDataSource numberOfRowsInSection:section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}


#pragma mark - Navigation

//    [self.newsTableView registerNib:[UINib nibWithNibName:@"NewsTableViewCell.xib" bundle:nil] forCellReuseIdentifier:@"Cell"];

//[[NSOperationQueue mainQueue] addOperationWithBlock:^{
//(enter action code here)
//}];

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    GGNewsArticleDetailViewController *detailViewController = segue.destinationViewController;
////    [segue destinationViewController];
//    NSIndexPath *indexPath = self.newsTableView.indexPathForSelectedRow;
//     detailViewController.tappedArticle = [self.newsDataSource newsArticleForIndexPath:indexPath];
//}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [self.newsTableView cellForRowAtIndexPath:indexPath];
//    [self presentViewController:[[GGNewsArticleDetailViewController alloc]init] animated:NO completion:^{
//    }];
//}


@end
