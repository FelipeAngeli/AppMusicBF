//
//  CardActionView.swift
//  AppMusicBF
//
//  Created by Felipe Angeli on 26/02/24.
//

import UIKit

class CardActionView: UIView {
    
    lazy var stackViews: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    lazy var downloadView:UIView = {
        let down = UIView()
        down.translatesAutoresizingMaskIntoConstraints = false
        return down
    }()
    
    lazy var notInterestedView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var playView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var likeView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var moreView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius = 22.5
        button.setBackgroundImage(UIImage(named: "download")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.clipsToBounds = true
        return button
    }()
    
    lazy var notInterestedBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius = 22.5
        button.setBackgroundImage(UIImage(named: "restrict")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.clipsToBounds = true
        return button
    }()
    
    lazy var playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 35
        button.setBackgroundImage(UIImage(named: "playBtn")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .black
        button.clipsToBounds = true
        return button
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius = 22.5
        button.setBackgroundImage(UIImage(named: "like")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.clipsToBounds = true
        return button
    }()
    
    lazy var moreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius = 22.5
        button.setBackgroundImage(UIImage(named: "more")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.clipsToBounds = true
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        self.setUpConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.addSubview(self.stackViews)
        self.stackViews.addArrangedSubview(self.notInterestedView)
        self.stackViews.addArrangedSubview(self.playView)
        self.stackViews.addArrangedSubview(self.likeView)
        
        self.downloadView.addSubview(self.downloadButton)
        self.notInterestedView.addSubview(self.notInterestedBtn)
        self.playView.addSubview(self.playButton)
        self.likeView.addSubview(self.likeButton)
        self.moreView.addSubview(self.moreButton)
    }
    
    private func setUpConstaints(){
        
        self.stackViews.pin(to: self)
        
        NSLayoutConstraint.activate([
            self.downloadButton.centerXAnchor.constraint(equalTo: self.downloadView.centerXAnchor),
            self.downloadButton.centerYAnchor.constraint(equalTo: self.downloadView.centerYAnchor),
            self.downloadButton.widthAnchor.constraint(equalToConstant: 45),
            self.downloadButton.heightAnchor.constraint(equalToConstant: 45),
            
            self.notInterestedBtn.centerXAnchor.constraint(equalTo: self.notInterestedView.centerXAnchor),
            self.notInterestedBtn.centerYAnchor.constraint(equalTo: self.notInterestedView.centerYAnchor),
            self.notInterestedBtn.widthAnchor.constraint(equalToConstant: 45),
            self.notInterestedBtn.heightAnchor.constraint(equalToConstant: 45),
            
            self.playButton.centerXAnchor.constraint(equalTo: self.playView.centerXAnchor),
            self.playButton.centerYAnchor.constraint(equalTo: self.playView.centerYAnchor),
            self.playButton.widthAnchor.constraint(equalToConstant: 70),
            self.playButton.heightAnchor.constraint(equalToConstant: 70),
            
            
            self.likeButton.centerXAnchor.constraint(equalTo: self.likeView.centerXAnchor),
            self.likeButton.centerYAnchor.constraint(equalTo: self.likeView.centerYAnchor),
            self.likeButton.widthAnchor.constraint(equalToConstant: 45),
            self.likeButton.heightAnchor.constraint(equalToConstant: 45),

            self.moreButton.centerXAnchor.constraint(equalTo: self.moreView.centerXAnchor),
            self.moreButton.centerYAnchor.constraint(equalTo: self.moreView.centerYAnchor),
            self.moreButton.widthAnchor.constraint(equalToConstant: 45),
            self.moreButton.heightAnchor.constraint(equalToConstant: 45),
            
        ])
    }
    
    public func updateLayout(for mode: ViewMode) {
        if mode == .full {
            self.downloadView.isHidden = false
            self.moreView.isHidden = false
            self.stackViews.addArrangedSubview(self.downloadView)
            self.stackViews.addArrangedSubview(self.notInterestedView)
            self.stackViews.addArrangedSubview(self.playView)
            self.stackViews.addArrangedSubview(self.likeView)
            self.stackViews.addArrangedSubview(self.moreView)
        } else {
            self.downloadView.isHidden = true
            self.moreView.isHidden = true
            self.stackViews.removeArrangedSubview(self.downloadView)
            self.stackViews.removeArrangedSubview(self.moreView)
        }
    }
}
