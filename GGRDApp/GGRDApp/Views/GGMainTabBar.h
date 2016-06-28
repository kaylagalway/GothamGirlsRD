//
//  GGMainTabBar.h
//  GGRDApp
//
//  Created by Kayla Galway on 6/21/16.
//  Copyright © 2016 edu.self. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGMainTabBar : UITabBar
@property (strong, nonatomic) IBOutlet UIView *mainTabBar;
@property (weak, nonatomic) IBOutlet UITabBarItem *homeTab;
@property (weak, nonatomic) IBOutlet UITabBarItem *teamsTab;
@property (weak, nonatomic) IBOutlet UITabBarItem *rulesTab;
@property (weak, nonatomic) IBOutlet UITabBarItem *ticketsTab;
@end
