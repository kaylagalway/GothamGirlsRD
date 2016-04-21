//
//  GGSquarespaceAPIClient.m
//  GGRDApp
//
//  Created by Dare Ryan on 4/20/16.
//  Copyright © 2016 edu.self. All rights reserved.
//

#import "GGSquarespaceAPIClient.h"
#import <UIKit/UIKit.h>

NSString *const GGSquarespaceAPIClientConstants_baseUrl = @"http://www.gothamgirlsrollerderby.com";
NSString *const GGSquarespaceAPIClientConstants_urlResourceID_news = @"news";
NSString *const GGSquarespaceAPIClientConstants_urlParameter_format = @"format=json";

@implementation GGSquarespaceAPIClient

+ (void)fetchNewsStoryDictionariesWithCompletion: (void(^)(NSArray *stories))completion {
   
   NSString *urlString = [NSString stringWithFormat:@"%@/%@/?%@", GGSquarespaceAPIClientConstants_baseUrl, GGSquarespaceAPIClientConstants_urlResourceID_news, GGSquarespaceAPIClientConstants_urlParameter_format];
   
   [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
      NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
      NSMutableArray *newStories = [@[] mutableCopy];
      for (NSDictionary *articleDict in jsonResponse[@"items"]) {
         [newStories addObject: articleDict];
      }
      completion(newStories);
   }] resume];
}

@end

//
//NSString *htmlString = articleDict[@"body"];
//NSAttributedString *formattedString = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUTF8StringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: [NSNumber numberWithInt:NSUTF8StringEncoding]} documentAttributes:nil error:nil];
//[newStories addObject:formattedString];