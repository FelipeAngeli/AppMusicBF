//
//  CustomPlayerView.swift
//  AppMusicBF
//
//  Created by Felipe Angeli on 29/02/24.
//

import UIKit
import MarqueeLabel

class CustomPlayerView: UIView {
    
    //timer progressbar
    var videoTimer: Timer?
    var time:CGFloat = 0.0
    
    lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "list4")
        return img
    }()
    
    lazy var marqueeLabel: MarqueeLabel = {
        let marque = MarqueeLabel()
        marque.translatesAutoresizingMaskIntoConstraints = false
        marque.text = "Aqui será o nome da música onde tera o scroll"
        marque.font = UIFont(name: "Avenir-Heavy", size: 18)
        marque.textColor = .white.withAlphaComponent(0.8)
        marque.type = .continuous
        marque.animationCurve = .linear
        marque.fadeLength = 10.0
        marque.leadingBuffer = 30.0
        marque.trailingBuffer = 30.0
        return marque
    }()
    
    lazy var pausePlaybtn: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "pause")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = .white.withAlphaComponent(0.8)
        return img
    }()
    
    lazy var trackBar: UIProgressView = {
        let progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.progressTintColor = .yellow.withAlphaComponent(0.8)
        progress.progress = 0.0
        return progress
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        self.setupView()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.addSubview(self.imageView)
        self.addSubview(self.marqueeLabel)
        self.addSubview(self.pausePlaybtn)
        self.addSubview(self.trackBar)
        
        //timer progressbar
        self.videoTimer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(self.changeTrackBar), userInfo: nil, repeats: true)
    }
    
    @objc func changeTrackBar(){
        self.time += 0.001
        self.trackBar.progress = Float(self.time / 120)
        if self.time >= 120 {
            self.videoTimer?.invalidate()
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.imageView.widthAnchor.constraint(equalToConstant: 90),
            
            self.marqueeLabel.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 10),
            self.marqueeLabel.trailingAnchor.constraint(equalTo: self.pausePlaybtn.leadingAnchor, constant: -5),
            self.marqueeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 32),
            
            self.pausePlaybtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.pausePlaybtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 25),
            self.pausePlaybtn.heightAnchor.constraint(equalToConstant: 40),
            self.pausePlaybtn.widthAnchor.constraint(equalToConstant: 40),
            
            self.trackBar.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor),
            self.trackBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.trackBar.topAnchor.constraint(equalTo: self.topAnchor),
        ])
    }
}
