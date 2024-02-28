//
//  CardViewTableViewCell.swift
//  AppMusicBF
//
//  Created by Felipe Angeli on 21/02/24.
//

import UIKit

class CardViewTableViewCell: UITableViewCell {

    static let identifier:String = "CardViewTableViewCell"
    
    lazy var cardView: CustomCardView = {
        let view = CustomCardView(mode: .card)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.setupConstraints()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupCell(data: CardViewModel){
        self.cardView.setUpView(data: data)
    }
    
    fileprivate func setupView(){
        self.contentView.addSubview(self.cardView)
        
    }
    
    fileprivate func setupConstraints(){
        self.cardView.pin(to: self) //extension
    }
    
    
}
