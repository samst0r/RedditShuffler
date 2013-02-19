//
//  Meme.h
//  RedditImageViewer
//
//  Created by Sam Ward on 10/02/2013.
//  Copyright (c) 2013 Sam Ward. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Meme : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSURL *imageURL;

- (id) initWithURL:(NSURL *)url Title:(NSString *)title;

@end
