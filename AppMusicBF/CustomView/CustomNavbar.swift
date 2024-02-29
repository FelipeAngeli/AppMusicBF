//
//  CustomNavbar.swift
//  AppMusicBF
//
//  Created by Felipe Angeli on 29/02/24.
//

import UIKit

class CustomNavbar: UIView {

    lazy var categoryTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    lazy var cardTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var feturelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    lazy var cardImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    lazy var overlayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.7)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.addSubview(self.cardImage)
        self.addSubview(self.overlayView)
        self.addSubview(self.categoryTitle)
        self.addSubview(self.cardTitle)
        self.addSubview(self.feturelabel)
    }
    
    private func setupConstraints() {
        self.cardImage.pin(to: self)
        self.overlayView.pin(to: self)
        
        NSLayoutConstraint.activate([
            self.categoryTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            self.categoryTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.categoryTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.cardTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.cardTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.cardTitle.topAnchor.constraint(equalTo: self.categoryTitle.bottomAnchor, constant: 5),
            
            self.feturelabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.feturelabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.feturelabel.topAnchor.constraint(equalTo: self.cardTitle.bottomAnchor, constant: 5),

        ])
    }
    
    public func setupView(data: CardViewModel) {
        self.cardTitle.text = data.cardTitle
        self.categoryTitle.text = data.categoryName
        self.cardImage.image = UIImage(named: data.cardImage ?? "")
        self.feturelabel.attributedText = .featureText(data.likeCount ?? "", data.duration ?? "")
    }
    
}
