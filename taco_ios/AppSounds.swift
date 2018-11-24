//
//  AppSounds.swift
//  taco_ios
//
//  Created by Przemyslaw Biskup on 24/11/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//

import AVFoundation

final class AppSounds {
    
    static var didAppear: AVAudioPlayer = {
        return createAP(name: "teleport", type: .wav)
    }()
    
    static var touchUpInside: AVAudioPlayer = {
        return createAP(name: "pyk", type: .wav)
    }()
    
    static var hide: AVAudioPlayer = {
        return createAP(name: "swipe", type: .wav)
    }()
    
    static var show: AVAudioPlayer = {
        return createAP(name: "swipe3", type: .wav)
    }()
    
    static func systemSound() {
        let systemSoundID: SystemSoundID = 1016
        AudioServicesPlaySystemSound(systemSoundID)
    }
    
    
    private enum SoundType: String {
        case wav
        case mp3
    }
    
    private static func createAP(name: String, type: SoundType) -> AVAudioPlayer {
        var player: AVAudioPlayer!
        let soundFile = Bundle.main.path(forResource: name, ofType: type.rawValue)
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile!))
        } catch {
            print("error - something is wrong with \(name).\(type.rawValue)")
        }
        return player
    }
}
