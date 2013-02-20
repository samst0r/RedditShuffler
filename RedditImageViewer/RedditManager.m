//
//  RedditManager.m
//  RedditImageViewer
//
//  Created by Sam Ward on 20/02/2013.
//  Copyright (c) 2013 Sam Ward. All rights reserved.
//

#import "RedditManager.h"
#import "RedditManagerDelegate.h"

@interface RedditManager ()


@end

@implementation RedditManager

@synthesize delegate;

- (void)setDelegate:(id<RedditManagerDelegate>)newDelegate {
    
    if (![newDelegate conformsToProtocol:@protocol(RedditManagerDelegate)]) {
    [[NSException exceptionWithName: NSInvalidArgumentException reason:
      @"Delegate object does not conform to the delegate protocol" userInfo: nil] raise];
    }
    delegate = newDelegate;

}

@end
