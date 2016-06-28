//
//  GGNewsArticle.m
//  GGRDApp
//
//  Created by Dare Ryan on 4/20/16.
//  Copyright © 2016 edu.self. All rights reserved.
//

#import "GGNewsArticle.h"
#import <UIKit/UIKit.h>

NSString *const GGNewsArticleConstants_dictionaryKey_title = @"title";
NSString *const GGNewsArticleConstants_dictionaryKey_body = @"body";
NSString *const GGNewsArticleConstants_dictionaryKey_date = @"addedOn";
NSString *const GGNewsArticleConstants_dictionaryKey_author = @"author";
NSString *const GGNewsArticleConstants_dictionaryKey_displayName = @"displayName";

@interface GGNewsArticle ()
@property (strong, nonatomic, readwrite) NSString *title;
@property (strong, nonatomic, readwrite) NSAttributedString *body;
@property (strong, nonatomic, readwrite) NSDate *postDate;
@property (strong, nonatomic, readwrite) NSString *poster; @end

@implementation GGNewsArticle

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
   self = [super init];
   if (self) {
      _title = [GGNewsArticle attributedStringFromHTML: dictionary[GGNewsArticleConstants_dictionaryKey_title]].string;
      _body = [GGNewsArticle attributedStringFromHTML: dictionary[GGNewsArticleConstants_dictionaryKey_body]];
      _postDate =  [NSDate dateWithTimeIntervalSince1970: ([dictionary[GGNewsArticleConstants_dictionaryKey_date] doubleValue] / 1000)];
      _poster = dictionary[GGNewsArticleConstants_dictionaryKey_author][GGNewsArticleConstants_dictionaryKey_displayName];
   }
   return self;
}

+ (NSAttributedString *)attributedStringFromHTML:(NSString *)HTMLString {
   NSAttributedString *formattedString = [[NSAttributedString alloc] initWithData: [HTMLString dataUsingEncoding:NSUTF8StringEncoding]
                                                                          options: @{
                                                                                     NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                                                                     NSCharacterEncodingDocumentAttribute: [NSNumber numberWithInt:NSUTF8StringEncoding]
                                                                                     }
                                                               documentAttributes: nil
                                                                            error: nil];
   return formattedString;
}

@end
