//
//  RedditCommunicator.h
//  RedditImageViewer
//
//  Created by Sam Ward on 20/02/2013.
//  Copyright (c) 2013 Sam Ward. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RedditCommunicator : NSObject

- (void)getImageAndTitleFromJSON:(id)json;
- (void)getJSON;

@end
