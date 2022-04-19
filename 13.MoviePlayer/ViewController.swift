//
//  ViewController.swift
//  13.MoviePlayer
//
//  Created by 이병현 on 2022/04/19.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        // 내부파일 mp4
        let filePath:String? = Bundle.main.path(forResource: "FastTyping", ofType: "mp4") // 우선 비디오 파일명을 사용하여 비디오가 저장된 앱 내부의 파일 경로를 받아옴
        let url = NSURL(fileURLWithPath: filePath!) // 앱 내부의 파일명을 NSURL 형식으로 변환
        playVideo(url: url)

    }

    @IBAction func btnPlayExternalMovie(_ sender: UIButton) {
        let url = NSURL(string:  "http://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")!
        playVideo(url: url)
        
    }
    
    private func playVideo(url: NSURL) {
        let playerController = AVPlayerViewController()
        
        let player = AVPlayer(url: url as URL)
        playerController.player = player
        
        self.present(playerController, animated: true) {
            player.play()
        }
    }
}
