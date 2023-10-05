//
//  RadioPlayState.swift
//  some-radios
//
//  Created by Taipa Xu on 2023/10/4.
//

import Foundation
import AVKit

class RadioPlayState: ObservableObject {
    var audioPlayer: AVPlayer = AVPlayer();
    @Published var showPlayControl = false
    @Published var isPlaying = false;

    func play(radio: Radio) {
        print("play")
        showPlayControl = true
        isPlaying = true
        guard let url = URL(string: radio.url) else { return }
        let playerItem = AVPlayerItem(url: url)
        audioPlayer.replaceCurrentItem(with: playerItem)
        audioPlayer.play()
    }

    func pause() {
        print("pause")
        isPlaying = false
        audioPlayer.pause()
    }

    func resume() {
        print("resume")
        isPlaying = true
        audioPlayer.play()
    }

    func stop() {
        print("stop")
        isPlaying = false
        showPlayControl = false
        audioPlayer.pause()
    }
}
