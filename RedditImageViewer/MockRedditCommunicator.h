//
//  MockRedditCommunicator.h
//  RedditImageViewer
//
//  Created by Sam Ward on 20/02/2013.
//  Copyright (c) 2013 Sam Ward. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "RedditCommunicator.h"

@interface MockRedditCommunicator : RedditCommunicator
- (BOOL)wasAskedToFetchJSON;
@end
