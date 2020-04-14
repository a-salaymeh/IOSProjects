//
//  AudioPlayer.swift
//  huyn5930_a5
//
//  Created by Daniel H on 2020-03-24.
//  Copyright © 2020 Daniel H. All rights reserved.
//

import Foundation

import AVFoundation

var AudioInstance = AudioPlayer()

open class AudioPlayer{
    
    var backgroundMusicPlayer: AVAudioPlayer?

    public class func sharedInstance() -> AudioPlayer {
      return AudioInstance
    }
        
    public func playMusic(_ filename: String) {
      let url = Bundle.main.url(forResource: filename, withExtension: nil)

      do {
        backgroundMusicPlayer = try AVAudioPlayer(contentsOf: url!)
      }
        catch {
        print("Could not create audio player")
        }
    

        backgroundMusicPlayer!.numberOfLoops = -1
        backgroundMusicPlayer!.prepareToPlay()
 
    }
    public func startSong(){
        backgroundMusicPlayer?.play()
        
    }
    
    
    public func stopMusic() {
        if backgroundMusicPlayer != nil && backgroundMusicPlayer!.isPlaying {
            backgroundMusicPlayer?.currentTime = 0
            backgroundMusicPlayer?.stop()
        }
    }

}
