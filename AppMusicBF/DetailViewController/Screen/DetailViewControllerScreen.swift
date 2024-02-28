//
//  DetailViewControllerScreen.swift
//  AppMusicBF
//
//  Created by Felipe Angeli on 27/02/24.
//

import UIKit

protocol DetailViewControllerScreenDelegate: AnyObject {
    func tappedCloseButton()
}

class DetailViewControllerScreen: UIView {
    
    var cardModel: CardViewModel?
    var navbarTopAnchor: NSLayoutConstraint?
    
    private weak var delegate:DetailViewControllerScreenDelegate?
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.autoresizingMask = .flexibleHeight //o que pode ou nao crescer
        view.bounces = false
        view.clipsToBounds = true
        return view
    }()
    
    lazy var cardView: CustomCardView = {
        let card = CustomCardView(mode: .full)
        card.translatesAutoresizingMaskIntoConstraints = false
        card.cardContainerView.layer.cornerRadius = 0.0
        card.setUpView(data: self.cardModel ?? CardViewModel())
        return card
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.tableFooterView = UIView()
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.isScrollEnabled = false
        table.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return table
    }()
    
    lazy var closeBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 15
        btn.setBackgroundImage(UIImage(named: "back")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(self.closePressed), for: .touchUpInside)
        return btn
    }()
    
    @objc func closePressed(){
        self.delegate?.tappedCloseButton()
    }

     init(dataView:CardViewModel?) {
        super.init(frame: CGRect())
         self.cardModel = dataView
         
         DispatchQueue.main.async {
          self.setupViews()
          self.setupConstraints()
         }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.cardView)
        self.scrollView.addSubview(self.tableView)
        self.addSubview(self.closeBtn)
    }
    
    private func setupConstraints() {
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene })
            .first?.windows.filter({$0.isKeyWindow}).first
        
        let topPadding = window?.safeAreaInsets.top
        print(topPadding as Any)
        
        self.scrollView.pin(to: self)
        
        NSLayoutConstraint.activate([
            
            self.cardView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: -(topPadding ?? 0)),
            self.cardView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.cardView.heightAnchor.constraint(equalToConstant: 500),
            self.cardView.widthAnchor.constraint(equalToConstant: self.frame.size.width),
            
            self.tableView.topAnchor.constraint(equalTo: self.cardView.bottomAnchor),
            self.tableView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.tableView.heightAnchor.constraint(equalToConstant: CGFloat(80 * (cardModel?.cardList?.count ?? 0)) + 20),
            self.tableView.widthAnchor.constraint(equalToConstant: self.frame.size.width),
            self.tableView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            
            self.closeBtn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.closeBtn.widthAnchor.constraint(equalToConstant: 30),
            self.closeBtn.heightAnchor.constraint(equalToConstant: 30),
            self.closeBtn.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
        ])
    }
    
    public func configAllDelegates(tableViewDelegate: UITableViewDelegate, tableViewDataSource:UITableViewDataSource, scrollViewDelegate:UIScrollViewDelegate, detailViewScreenDelegate:DetailViewControllerScreenDelegate) {
        
        self.tableView.delegate = tableViewDelegate
        self.tableView.dataSource = tableViewDataSource
        self.scrollView.delegate = scrollViewDelegate
        self.delegate = detailViewScreenDelegate
    }
}
