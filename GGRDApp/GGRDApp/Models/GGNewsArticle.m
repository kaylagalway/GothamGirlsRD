//
//  GGNewsArticle.m
//  GGRDApp
//
//  Created by Dare Ryan on 4/20/16.
//  Copyright © 2016 edu.self. All rights reserved.
//

#import "GGNewsArticle.h"
#import <UIKit/UIKit.h>

@interface GGNewsArticle ()
@property (strong, nonatomic, readwrite) NSString *title;
@property (strong, nonatomic, readwrite) NSAttributedString *body;
@property (strong, nonatomic, readwrite) NSDate *postDate;
@property (strong, nonatomic, readwrite) NSString *poster;
@end

@implementation GGNewsArticle

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
   self = [super init];
   if (self) {
      _body = [GGNewsArticle attributedStringFromHTML: dictionary[@"body"]];
      _title = [GGNewsArticle attributedStringFromHTML: dictionary[@"title"]].string;
      _postDate =  [NSDate dateWithTimeIntervalSince1970: ([dictionary[@"addedOn"] doubleValue] / 1000)];
      _poster = dictionary[@"author"][@"displayName"];
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
