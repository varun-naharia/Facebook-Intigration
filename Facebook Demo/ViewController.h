//
//  ViewController.h
//  Facebook Demo
//
//  Created by Prince Hunter on 01/05/15.
//  Copyright (c) 2015 techwizard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginButton.h>

@interface ViewController : UIViewController 
@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;

@end

