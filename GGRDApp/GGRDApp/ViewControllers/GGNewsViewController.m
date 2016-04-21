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

@interface GGNewsViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *newsTableView;

@end

@implementation GGNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
   
   [GGSquarespaceAPIClient fetchNewsStoryDictionariesWithCompletion:^(NSArray *stories) {
      NSMutableArray *articles = [@[] mutableCopy];
      for (NSDictionary *newsDict in stories) {
        [articles addObject: [[GGNewsArticle alloc]initWithDictionary: newsDict]];
      }
   }];
    // Do any additional setup after loading the view.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
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
