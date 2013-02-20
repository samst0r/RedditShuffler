//
//  RedditManagerTests.m
//  RedditImageViewer
//
//  Created by Sam Ward on 20/02/2013.
//  Copyright (c) 2013 Sam Ward. All rights reserved.
//

#import "RedditManagerTests.h"
#import "RedditManager.h"
#import "MockRedditManagerDelegate.h"
#import "RedditManagerDelegate.h"

@interface RedditManagerTests ()
{
    RedditManager *redditManager;
}

@end
@implementation RedditManagerTests

- (void)setUp {
    redditManager = [[RedditManager alloc] init];
}

-(void)tearDown {
    redditManager = nil;
}

- (void)testNonConformingObjectCannotBeDelegate {
    STAssertThrows(redditManager.delegate =
                   (id <RedditManagerDelegate>)[NSNull null],
                   @"NSNull should not be used as the delegate as doesn't"
                   @" conform to the delegate protocol");
}

- (void)testConformingObjectCanBeDelegate {
    id <RedditManagerDelegate> delegate = [[MockRedditManagerDelegate alloc] init];
    STAssertNoThrow(redditManager.delegate = delegate,
                    @"Object conforming to the delegate protocol should be used"
                    @" as the delegate");
}


@end
