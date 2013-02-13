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


@interface ViewController ()
- (void)populateImageView;
-(IBAction)pressedRefresh:(id)sender;
@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imageView.layer.cornerRadius = 12;
    self.imageView.layer.masksToBounds = YES;
    
    
    [self populateImageView];
    
}

- (void)populateImageView
{
    [DejalBezelActivityView activityViewForView:self.imageView withLabel:@"Loading"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.reddit.com/r/adviceanimals.json"]];
	// Do any additional setup after loading the view, typically from a nib.
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
        success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
            int randomMemePosition = arc4random_uniform([[[JSON objectForKey:@"data"] objectForKey:@"children"] count]-1);
            
            id memeJSON = [([[JSON objectForKey:@"data"] objectForKey:@"children"][randomMemePosition]) objectForKey:@"data"];

            
            
            Meme *meme = [[Meme alloc] initWithURL:[memeJSON objectForKey: @"thumbnail"]
                                             Title:[memeJSON objectForKey: @"title"]];
            
            if ([meme.title rangeOfString:@"quickmeme"].location == NSNotFound)
            {
            }
            
            [self.imageView setImageWithURL: meme.imageURL placeholderImage:nil
                                  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                                      self.titleLabel.text = meme.title;
                                      
                                      self.authorLabel.text = [memeJSON objectForKey:@"author"];
                                      NSLog(@"Image downloaded successfully");
                                  }];
            [DejalBezelActivityView removeViewAnimated:YES];
            
        } failure:^ (NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
            [DejalBezelActivityView removeViewAnimated:YES];
        }];
    
    [operation start];
}

-(IBAction)pressedRefresh:(id)sender
{
    [self populateImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
