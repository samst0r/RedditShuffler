//
//  RedditCommunicator.m
//  RedditImageViewer
//
//  Created by Sam Ward on 20/02/2013.
//  Copyright (c) 2013 Sam Ward. All rights reserved.
//

#import "RedditCommunicator.h"
#import "Meme.h"
#import "UIImageView+WebCache.h"
#import "AFJSONRequestOperation.h"
#import "DejalActivityView.h"
#include <stdlib.h>
#import <QuartzCore/CALayer.h>

@interface RedditCommunicator ()

@property (strong, nonatomic) id cachedJSON;

@end


@implementation RedditCommunicator


- (void)getImageAndTitleFromJSON:(id)json {
    //[DejalBezelActivityView activityViewForView:self.memeContainer withLabel:@"Loading..."];
    
    int randomMemePosition = arc4random_uniform([[[json objectForKey:@"data"] objectForKey:@"children"] count]-1);
    id memeJSON = [([[json objectForKey:@"data"] objectForKey:@"children"][randomMemePosition]) objectForKey:@"data"];
    
    Meme *meme = [[Meme alloc] initWithURL:[memeJSON objectForKey: @"thumbnail"]
                                     Title:[memeJSON objectForKey: @"title"]];
    
    if ([meme.title rangeOfString:@"quickmeme"].location == NSNotFound)
    {
    }
    
//    [self.imageView setImageWithURL: meme.imageURL placeholderImage:nil
//                          completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
//                              
//                              self.titleLabel.text = meme.title;
//                              self.authorLabel.text = [memeJSON objectForKey:@"author"];
//                              
//                              if (error != nil)
//                              {
//                                  NSLog(@"Error with image downloader: %@", error);
//                              } else {
//                                  NSLog(@"Image downloaded successfully");
//                              }
//                              
//                              [DejalBezelActivityView removeViewAnimated:YES];
//                          }];
}

- (void)getJSON {
    
    if (self.cachedJSON == nil)
    {
//        [DejalBezelActivityView activityViewForView:self.view withLabel:@"Getting Feeds..."];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.reddit.com/r/adviceanimals.json"]];
        
        AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                                                            success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                                                                self.cachedJSON = JSON;
                                                                                                [DejalBezelActivityView removeViewAnimated:YES];
                                                                                            } failure:^ (NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                                                                NSLog(@"JSON Failed to download: %@", error);
                                                                                                [DejalBezelActivityView removeViewAnimated:YES];
                                                                                            }];
        
        [operation start];
    }
}


@end
