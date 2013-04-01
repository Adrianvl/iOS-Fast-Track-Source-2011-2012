//
//  MainViewController.h
//  EmbeddedWebBrowser
//
//  Created by Nicholas Outram on 22/06/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainViewController : UIViewController<UIWebViewDelegate,UITextFieldDelegate> {

    UIWebView *webView;
    
    UITextField *urlTextField;
    UIActivityIndicatorView *activityInd;
    UIToolbar *toolBarInNib;

    UIBarButtonItem *cancelButton;
    UIBarButtonItem *backButton;
}
@property (nonatomic, retain) IBOutlet UIBarButtonItem *backButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *cancelButton;
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (readwrite, nonatomic, copy) NSString *currentAddress;
@property (nonatomic, retain) IBOutlet UITextField *urlTextField;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityInd;
@property (nonatomic, retain) IBOutlet UIToolbar *toolBarInNib;
- (IBAction)cancelButtonTouched:(id)sender;
- (IBAction)backButtonTouched:(id)sender;
- (IBAction)refreshButtonPTouched:(id)sender;


@end
