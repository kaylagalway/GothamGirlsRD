//
//  GGNewsArticle.h
//  GGRDApp
//
//  Created by Dare Ryan on 4/20/16.
//  Copyright © 2016 edu.self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GGNewsArticle : NSObject
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (strong, nonatomic, readonly) NSString *title;
@property (strong, nonatomic, readonly) NSAttributedString *body;
@property (strong, nonatomic, readonly) NSDate *postDate;
@property (strong, nonatomic, readonly) NSString *poster;
@end
