//
//  Meme.m
//  RedditImageViewer
//
//  Created by Sam Ward on 10/02/2013.
//  Copyright (c) 2013 Sam Ward. All rights reserved.
//

#import "Meme.h"
#import "AFJSONRequestOperation.h"

@implementation Meme

- (id)initWithURL:(NSURL *)url Title:(NSString *)title{
    self = [self init];

    self.title = title;
    self.imageURL = url;

    return self;
}

@end
