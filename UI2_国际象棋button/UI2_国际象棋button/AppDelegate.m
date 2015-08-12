//
//  AppDelegate.m
//  UI2_国际象棋button
//
//  Created by qianfeng on 15/6/30.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
{
    UIButton *_lastBtn; //记录上次点击的btn;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self showButtonChess];
    
    
    self.window.rootViewController=nil;

    return YES;
}
-(void)showButtonChess
{
    
    NSArray *titles=@[@"车",@"🐴",@"🐘",@"王",@"🐵",@"🐘",@"🐴",@"车"];
    
    
    CGFloat size=self.window.frame.size.width/8;
    for (int i=0; i<8; i++) {
        for (int j=0; j<8; j++) {
            UIView *view=[[UIView alloc]initWithFrame:CGRectMake
                          (j*size, 100+i*size, size, size) ];
            if ((i+j)%2) {
                view.backgroundColor=[UIColor yellowColor];
            }
            else
            {
                view.backgroundColor=[UIColor cyanColor];
            }
            [self.window addSubview:view];
            
        }
        
    }
    for (int i=0; i<8; i++) {
        for (int j=0; j<8; j++) {
            UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
            btn.frame=CGRectMake(j*size, 100+i*size, size, size) ;
            
            if(i==0||i==7)
            {
                [btn setTitle:titles[j] forState:UIControlStateNormal];
            }
            if(i==1||i==6)
            {
                [btn setTitle:@"兵" forState:UIControlStateNormal];
            }
            if (i==0||i==1) {
                [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                //设置字体格式
                btn.titleLabel.font=[UIFont systemFontOfSize:30];
            }
            if (i==6||i==7) {
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                btn.titleLabel.font=[UIFont systemFontOfSize:30];
                
            }
            
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            
            
            
            
            [self.window addSubview:btn];
            
        }
        
    }
    
    
    
    
    
    
    
    
}

-(void)btnClick:(UIButton *)btn
{
    if (_lastBtn && ![btn.currentTitle length]) {
        //交换两个button的frame
        CGRect frame=_lastBtn.frame;
        _lastBtn.frame=btn.frame;
        btn.frame=frame;
        _lastBtn=nil;
    }
    else if(!_lastBtn && btn.currentTitle.length) {
        _lastBtn=btn;
    }
    
    
    //把Button移动到最顶层
    [self.window bringSubviewToFront:btn];
    
    
    
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
