//
//  ViewController.m
//  RedditImageViewer
//
//  Created by Sam Ward on 10/02/2013.
//  Copyright (c) 2013 Sam Ward. All rights reserved.
//

#import "ViewController.h"
#import "Meme.h"
#import "UIImageView+WebCache.h"
#import "AFJSONRequestOperation.h"
#import "DejalActivityView.h"
#include <stdlib.h>
#import <QuartzCore/CALayer.h>
#import "RedditCommunicator.h"

@interface ViewController ()

- (void)populateImageView;

- (IBAction)pressedRefresh:(id)sender;

@property (strong, nonatomic) id cachedJSON;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.layer.cornerRadius = 12;
    self.imageView.layer.masksToBounds = YES;
    self.memeContainer.layer.cornerRadius = 12;
    self.memeContainer.layer.masksToBounds = YES;
    self.authorLabel.text = @"";
    self.titleLabel.text = @"";
    
    RedditCommunicator *redditCommunicator = [[RedditCommunicator alloc] init];
    //[redditCommunicator getJSON];
    //[redditCommunicator populateImageView];
}

- (void) populateImageView {
    //[self getImageAndTitleFromJSON:self.cachedJSON];
}

-(IBAction)pressedRefresh:(id)sender {
    //[self populateImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
