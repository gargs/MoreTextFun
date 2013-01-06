//
//  CTFViewController.m
//  MoreTextFun
//
//  Created by Saurabh Garg on 1/6/13.
//  Copyright (c) 2013 Saurabh Garg. All rights reserved.
//

#import "CTFViewController.h"
#import <DTCoreText.h>

@interface CTFViewController ()

@property (nonatomic) IBOutlet UITextView *textView;
@property (nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation CTFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _textView.attributedText = [[NSAttributedString alloc] initWithString:_textView.text];
    _doneButton.enabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissKeyboard:(id)sender
{
    [_textView resignFirstResponder];
    
//    NSString *htmlString = @"<html><b>HELLO</b>WORLD</html>";
//    
//    NSData *htmlData = [htmlString dataUsingEncoding:NSUTF8StringEncoding];
//    
//    NSMutableDictionary *options = [NSMutableDictionary dictionary];
//    [options setObject:[NSNumber numberWithBool:YES] forKey:@"DTUseiOS6Attributes"];
//    
//    NSAttributedString *string = [[NSAttributedString alloc] initWithHTMLData:htmlData options:options documentAttributes:NULL];
//    
//    self.textView.attributedText = string;
}

#pragma mark - UITextViewDelegate Methods

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    _doneButton.enabled = YES;
    
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    _doneButton.enabled = NO;
    
    return YES;
}

@end
