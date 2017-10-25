//
//  GTSongPlayer.m
//  GitTest
//
//  Created by geyuze@bytedance.com on 2017/10/25.
//  Copyright © 2017年 geyuze@bytedance.com. All rights reserved.
//

#import "GTSongPlayer.h"

@interface GTSongPlayer()
@property (nonatomic, strong) id             player;
@property (nonatomic, strong) AVPlayer      *netPlayer;
@property (nonatomic, strong) AVAudioPlayer *localPlayer;
@end

@implementation GTSongPlayer

- (void)playWithURL:(NSURL *)url option:(SongPlayOption)option {
    if (SongPlayOptionRemote == option) {
        [self playRemoteWithURL:url];
    } else if (SongPlayOptionLocal == option) {
        [self playLoaclWithURL:url];
    }
}

- (void)playLoaclWithURL:(NSURL *)url {
    self.localPlayer = [AVAudioPlayer alloc] init;
}

- (void)playRemoteWithURL:(NSURL *)url {
    
}
@end
