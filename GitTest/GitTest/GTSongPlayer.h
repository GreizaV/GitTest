//
//  GTSongPlayer.h
//  GitTest
//
//  Created by geyuze@bytedance.com on 2017/10/25.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

typedef NS_ENUM(NSUInteger, SongPlayOption) {
    SongPlayOptionLocal,
    SongPlayOptionRemote
};

@interface GTSongPlayer : NSObject

//play song
- (void)playWithURL:(NSURL *)url option:(SongPlayOption)option;

//pause
- (void)pause;

//stop
- (void)stop;
@end
