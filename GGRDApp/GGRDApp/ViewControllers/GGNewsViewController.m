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
    [self.newsTableView registerClass:[GGNewsTableViewCell class] forCellReuseIdentifier:@"NewsCell"];
    //    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    //    spinner.frame = CGRectMake(0, 0, 24, 24);
    //    [self.view addSubview:spinner];
    //    [spinner startAnimating];
    //    [spinner release];
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
    [self setTextForNewsLabelsInCell:cell atIndexPath:indexPath];
    return cell;
}

-(void)setTextForNewsLabelsInCell: (GGNewsTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.titleLabel.text = [self.newsDataSource newsArticleForIndexPath:indexPath].title;
    
    NSString *bodyTextString = [self.newsDataSource newsArticleForIndexPath:indexPath].body.string;
    NSString *abbrevBodyTextString = [bodyTextString substringToIndex:100];
    
    if ([abbrevBodyTextString containsString:@"PHOTO:"]) {
        abbrevBodyTextString = [abbrevBodyTextString substringFromIndex:39];
    } else if ([abbrevBodyTextString containsString:@"Thomas"]){
        abbrevBodyTextString = [abbrevBodyTextString substringFromIndex:18];
    } 
    cell.bodyTextPreviewLabel.text = [NSString stringWithFormat:@"%@ ...", abbrevBodyTextString];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    NSString *formattedDateString = [dateFormatter stringFromDate:[self.newsDataSource newsArticleForIndexPath:indexPath].postDate];
    cell.dateLabel.text = formattedDateString;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.newsDataSource numberOfSections];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.newsDataSource numberOfRowsInSection:section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GGNewsArticleDetailViewController *detailView = [[GGNewsArticleDetailViewController alloc]init];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:detailView animated:YES completion:nil];
    });
}


#pragma mark - Navigation
/*
 
 [self.newsTableView registerNib:[UINib nibWithNibName:@"NewsTableViewCell.xib" bundle:nil] forCellReuseIdentifier:@"Cell"];
 
 [[NSOperationQueue mainQueue] addOperationWithBlock:^{
 (enter action code here)
 }];
 
 In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 GGNewsArticleDetailViewController *detailViewController = segue.destinationViewController;
 //    [segue destinationViewController];
 NSIndexPath *indexPath = self.newsTableView.indexPathForSelectedRow;
 detailViewController.tappedArticle = [self.newsDataSource newsArticleForIndexPath:indexPath];
 }
 
 -(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [self.newsTableView cellForRowAtIndexPath:indexPath];
 [self presentViewController:[[GGNewsArticleDetailViewController alloc]init] animated:NO completion:^{
 }];
 }
 
 if ([abbrevBodyTextString hasPrefix:@"By"] || [abbrevBodyTextString hasPrefix:@" By"]){
 abbrevBodyTextString = [abbrevBodyTextString substringFromIndex:18];
 NSLog(@"starts with thomas");
 NSLog(@"%@", abbrevBodyTextString);
 } else if ([abbrevBodyTextString containsString:@"PHOTO:"]) {
 abbrevBodyTextString = [abbrevBodyTextString substringFromIndex:39];
 NSLog(@"containts photo");
 NSLog(@"%@", abbrevBodyTextString);
 } else {
 NSLog(@"%@", abbrevBodyTextString);
 }
 */


@end
