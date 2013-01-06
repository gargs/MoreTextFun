//
//  CTFTextView.m
//  MoreTextFun
//
//  Created by Saurabh Garg on 1/6/13.
//  Copyright (c) 2013 Saurabh Garg. All rights reserved.
//

#import "CTFTextView.h"
#import <CoreText/CoreText.h>

@implementation CTFTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

#pragma mark - UIResponder methods

- (void)toggleBoldface:(id)sender
{
    // Find current selection
    NSRange selectedRange = self.selectedRange;
    
    // Apply bold to it
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    [string addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Helvetica-Bold" size:14.0] range:selectedRange];
    self.attributedText = string;
    
    self.selectedTextRange = nil;
}

- (void)toggleItalics:(id)sender
{
    // Find current selection
    NSRange selectedRange = self.selectedRange;
    
    // Apply bold to it
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    CTFontRef myFont = CTFontCreateWithName(CFSTR("Helvetica"), 14, NULL);
    CTFontRef italicFont = CTFontCreateCopyWithSymbolicTraits(myFont, 14, NULL, kCTFontItalicTrait, kCTFontItalicTrait);
    
    NSString *fontName = (NSString *)CFBridgingRelease(CTFontCopyName(italicFont, kCTFontPostScriptNameKey));
    CGFloat fontSize = CTFontGetSize(italicFont);
    
    [string addAttribute:NSFontAttributeName value:[UIFont fontWithName:fontName size:fontSize] range:selectedRange];
    self.attributedText = string;
    
    self.selectedTextRange = nil;
}

- (void)toggleUnderline:(id)sender
{
    // Find current selection
    NSRange selectedRange = self.selectedRange;
    
    // Apply bold to it
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    [string addAttribute:NSUnderlineStyleAttributeName value:@1 range:selectedRange];
    self.attributedText = string;
    
    self.selectedTextRange = nil;
}

@end
