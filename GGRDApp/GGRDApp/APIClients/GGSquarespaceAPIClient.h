//
//  GGSquarespaceAPIClient.h
//  GGRDApp
//
//  Created by Dare Ryan on 4/20/16.
//  Copyright © 2016 edu.self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GGSquarespaceAPIClient : NSObject

+ (void)fetchNewsStoryDictionariesWithCompletion: (void(^)(NSArray *stories))completion;

@end
