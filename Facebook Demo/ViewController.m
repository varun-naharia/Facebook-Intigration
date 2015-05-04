//
//  ViewController.m
//  Facebook Demo
//
//  Created by Prince Hunter on 01/05/15.
//  Copyright (c) 2015 techwizard. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

static const CGFloat leftMargin = 10;
static const CGFloat topMargin = 5;
static const CGFloat rightMargin = 30;
static const CGFloat pictureWidth = 50;
static const CGFloat pictureHeight = 50;

@interface ViewController ()
@property FBSDKAccessToken *token;
@property FBSDKProfile *profile;
@property FBSDKProfilePictureView *pic;
@property FBSDKLoginManagerLoginResult *result;
@property (weak, nonatomic) FBSDKProfilePictureView *profilePic;

@end

@implementation ViewController
@synthesize  token,profile;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    
//    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
//    loginButton.center = self.view.center;
//    [self.view addSubview:loginButton];
    
    [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
    if ([FBSDKAccessToken currentAccessToken])
    {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"fetched user:%@", result);
             }
         }];
        FBSDKProfilePictureView *profilePic = [[FBSDKProfilePictureView alloc]
                                               initWithFrame:CGRectMake(
                                                                        leftMargin,
                                                                        topMargin,
                                                                        pictureWidth,
                                                                        pictureHeight)];
        [self.view addSubview:profilePic];
        self.profilePic = profilePic;
        
        //self.clipsToBounds = YES;
        //self.autoresizesSubviews = YES;
        
//        // User is logged in, do work such as go to next view controller.
//        token = [FBSDKAccessToken currentAccessToken];
//        profile = [FBSDKProfile currentProfile];
//        NSLog(@"userid = %@ \n First Name = %@ \n Middle Name = %@ \n Last Name = %@ \n Link= %@",profile.userID,profile.name,profile.middleName,profile.lastName,profile.linkURL);
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [FBSDKLoginButton class];
    
    return YES;
}

@end
