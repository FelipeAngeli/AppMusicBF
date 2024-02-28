//
//  CustomCardView.swift
//  AppMusicBF
//
//  Created by Felipe Angeli on 21/02/24.
//

import UIKit

enum ViewMode{
    case full
    case card
}

class CustomCardView: UIView {
    
    //MARK: - PROPRIEDADES
    

    var containerLeadingConstraints:NSLayoutConstraint?
    var containerTopConstraints:NSLayoutConstraint?
    var containerTrailingConstraints:NSLayoutConstraint?
    var containerBottomConstraints:NSLayoutConstraint?
    var dataModel:CardViewModel?
    
    //MARK: - ELEMENTOS
    
    
    //view do card
    lazy var cardContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 38
        view.clipsToBounds = true
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: -2)
        view.layer.shadowRadius = 20
        return view
    }()
    
    //imagem sobre o card como um todo
    lazy var cardImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .black
        return img
    }()
    
    //view que escurece a imagem do card
    lazy var overlayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        return view
    }()
    
    //bordas que fica sobre a imagem de perfil
    lazy var profileBordeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 25
        return view
    }()
    
    
    lazy var cardProfilePicture: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .black
        img.clipsToBounds = true
        img.layer.cornerRadius = 20
        return img
    }()
    
    
    //botao de add img do usuario(botao plus)
    lazy var addProfileImageButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    //categoria da musica
    lazy var cardCategoryTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    //data categoria
    lazy var cardCategoryDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    //titulo
    lazy var cardTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 31, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    //gostei e tempo
    lazy var likeAndTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //descriçao do titulo
    lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0 //se auto ajusta com setado em 0
        return label
    }()
    
    lazy var actionsView: CardActionView = {
        let view = CardActionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    init(mode: ViewMode){
        let frame = CGRect.zero
        super.init(frame: frame)
        self.addSubview()
        self.setUpConstraints()
        self.updateLayout(for: mode )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addSubview() {
        self.addSubview(self.cardContainerView)
        self.cardContainerView.addSubview(self.cardImage)
        self.cardContainerView.addSubview(self.overlayView)
        self.cardContainerView.addSubview(self.profileBordeView)
        self.cardContainerView.addSubview(self.cardProfilePicture)
        self.cardContainerView.addSubview(self.addProfileImageButton)
        self.cardContainerView.addSubview(self.cardCategoryTitleLabel)
        self.cardContainerView.addSubview(self.cardCategoryDateLabel)
        self.cardContainerView.addSubview(self.cardTitle)
        self.cardContainerView.addSubview(self.likeAndTimeLabel)
        self.cardContainerView.addSubview(self.descriptionTitleLabel)
        self.cardContainerView.addSubview(self.actionsView)
        
    }
    
    private func setUpConstraints(){
        self.containerLeadingConstraints = cardContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30)
        self.containerLeadingConstraints?.isActive = true
        
        self.containerTopConstraints = cardContainerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15)
        self.containerTopConstraints?.isActive = true
        
        self.containerBottomConstraints = cardContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        self.containerBottomConstraints?.isActive = true
        
        self.containerTrailingConstraints = cardContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        self.containerTrailingConstraints?.isActive = true
         
        self.overlayView.pin(to: self.cardContainerView) //pin extensions constraints
        self.cardImage.pin(to: self.cardContainerView)
        
        
        NSLayoutConstraint.activate([
            self.profileBordeView.topAnchor.constraint(equalTo: self.cardContainerView.topAnchor, constant: 60),
            self.profileBordeView.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            self.profileBordeView.widthAnchor.constraint(equalToConstant: 50),
            self.profileBordeView.heightAnchor.constraint(equalToConstant: 50),
            
            self.addProfileImageButton.trailingAnchor.constraint(equalTo: self.profileBordeView.trailingAnchor, constant: 4),
            self.addProfileImageButton.bottomAnchor.constraint(equalTo: self.profileBordeView.bottomAnchor, constant: 4),
            self.addProfileImageButton.widthAnchor.constraint(equalToConstant: 20),
            self.addProfileImageButton.heightAnchor.constraint(equalToConstant: 20),
            
            self.cardProfilePicture.centerXAnchor.constraint(equalTo: self.profileBordeView.centerXAnchor),
            self.cardProfilePicture.centerYAnchor.constraint(equalTo: self.profileBordeView.centerYAnchor),
            self.cardProfilePicture.widthAnchor.constraint(equalToConstant: 40),
            self.cardProfilePicture.heightAnchor.constraint(equalToConstant: 40),
            
            self.cardCategoryTitleLabel.topAnchor.constraint(equalTo: self.profileBordeView.bottomAnchor, constant: 10),
            self.cardCategoryTitleLabel.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor),
            
            self.cardCategoryDateLabel.topAnchor.constraint(equalTo: self.cardCategoryTitleLabel.bottomAnchor, constant: 2),
            self.cardCategoryDateLabel.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor),
            
            self.cardTitle.topAnchor.constraint(equalTo: self.cardCategoryDateLabel.bottomAnchor, constant: 20),
            self.cardTitle.leadingAnchor.constraint(equalTo: self.cardContainerView.leadingAnchor, constant: 20),
            self.cardTitle.trailingAnchor.constraint(equalTo: self.cardContainerView.trailingAnchor, constant: -20),
            
            self.likeAndTimeLabel.topAnchor.constraint(equalTo: self.cardTitle.bottomAnchor, constant: 10),
            self.likeAndTimeLabel.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor),
            
            self.descriptionTitleLabel.topAnchor.constraint(equalTo: self.likeAndTimeLabel.bottomAnchor, constant: 30),
            self.descriptionTitleLabel.leadingAnchor.constraint(equalTo: self.cardContainerView.leadingAnchor, constant: 40),
            self.descriptionTitleLabel.trailingAnchor.constraint(equalTo: self.cardContainerView.trailingAnchor, constant: -40),
            
            self.actionsView.bottomAnchor.constraint(equalTo: self.cardContainerView.bottomAnchor, constant: -20),
            self.actionsView.leadingAnchor.constraint(equalTo: self.cardContainerView.leadingAnchor, constant: 20),
            self.actionsView.trailingAnchor.constraint(equalTo: self.cardContainerView.trailingAnchor, constant: -20),
            self.actionsView.heightAnchor.constraint(equalToConstant: 80),
            
        ])
        
    }
    
    private func updateLayout(for mode: ViewMode) {
        if mode == .full {
            self.containerLeadingConstraints?.constant = 0
            self.containerTopConstraints?.constant = 0
            self.containerBottomConstraints?.constant = 0
            self.containerTrailingConstraints?.constant = 0
            self.descriptionTitleLabel.isHidden = false
        } else {
            self.containerLeadingConstraints?.constant = 30
            self.containerTopConstraints?.constant = 15
            self.containerBottomConstraints?.constant = -15
            self.containerTrailingConstraints?.constant = -30
            self.descriptionTitleLabel.isHidden = true
        }
        self.actionsView.updateLayout(for: mode)
    }
    
    
    public func setUpView(data: CardViewModel){
        self.cardCategoryTitleLabel.text = data.categoryName
        self.cardCategoryDateLabel.text = data.categoryDate
        self.cardTitle.text = data.cardTitle
        self.likeAndTimeLabel.attributedText = NSAttributedString.featureText(data.likeCount ?? "", data.duration ?? "")
        self.descriptionTitleLabel.text = data.cardDescription
        self.cardImage.image = UIImage(named: data.cardImage ?? "")
        self.cardProfilePicture.image = UIImage(named: data.categoryImage ?? "")
    }
    
}


