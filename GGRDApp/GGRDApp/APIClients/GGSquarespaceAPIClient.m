//
//  GGSquarespaceAPIClient.m
//  GGRDApp
//
//  Created by Dare Ryan on 4/20/16.
//  Copyright © 2016 edu.self. All rights reserved.
//

#import "GGSquarespaceAPIClient.h"

NSString *const GGSquarespaceAPIClientConstants_dictionaryKey_items = @"items";

NSString *const GGSquarespaceAPIClientConstants_baseUrl = @"http://www.gothamgirlsrollerderby.com";
NSString *const GGSquarespaceAPIClientConstants_urlResourceID_news = @"news";
NSString *const GGSquarespaceAPIClientConstants_urlParameter_format = @"format=json";

@implementation GGSquarespaceAPIClient

+ (void)fetchNewsStoryDictionariesWithCompletion:(void(^)(NSArray *stories))completion {
   
   NSString *urlString = [NSString stringWithFormat:@"%@/%@/?%@", GGSquarespaceAPIClientConstants_baseUrl, GGSquarespaceAPIClientConstants_urlResourceID_news, GGSquarespaceAPIClientConstants_urlParameter_format];
   
   [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
      NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
      NSMutableArray *newStories = [@[] mutableCopy];
      for (NSDictionary *articleDict in jsonResponse[GGSquarespaceAPIClientConstants_dictionaryKey_items]) {
         [newStories addObject: articleDict];
      }
      completion(newStories);
   }] resume];
}

@end


