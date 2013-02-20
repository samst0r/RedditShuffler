//
//  MemeTests.m
//  RedditImageViewer
//
//  Created by Sam Ward on 19/02/2013.
//  Copyright (c) 2013 Sam Ward. All rights reserved.
//

#import "MemeTests.h"
#import "Meme.h"

@implementation MemeTests

- (void)testThatMemeExists {
    Meme *meme = [[Meme alloc] init];
    STAssertNotNil(meme, @"Should be able to create Meme instance");
}

- (void)testThatURLIsValid {
    Meme *meme = [[Meme alloc] initWithURL: [NSURL URLWithString:@"www.google.com"] Title:@"Title"];
    
    STAssertNotNil([meme imageURL], @"Should be a valid URL");
}

- (void)testThatTitleIsValid {
    Meme *meme = [[Meme alloc] initWithURL: [NSURL URLWithString:@"www.google.com"] Title:@"Title"];
    
    STAssertNotNil([meme title], @"Should be a valid title");
}

@end
