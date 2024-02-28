//
//  HomeViewControllerScreen.swift
//  AppMusicBF
//
//  Created by Felipe Angeli on 21/02/24.
//

import UIKit

class HomeViewControllerScreen: UIView {
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none
        tv.tableFooterView = UIView()
        tv.showsVerticalScrollIndicator = false
        tv.register(CardViewTableViewCell.self, forCellReuseIdentifier: CardViewTableViewCell.identifier)
        return tv
    }()
    
    //passa a responsabilidade pra outra camada
    public func configTableViewProtocols(delegate:UITableViewDelegate, dataShource:UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataShource
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.tableView)
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        self.tableView.pin(to: self) //extensions
    }
    
}
