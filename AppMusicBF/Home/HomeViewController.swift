//
//  ViewController.swift
//  AppMusicBF
//
//  Created by Felipe Angeli on 21/02/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen:HomeViewControllerScreen?
    
    override func loadView() {
        self.screen = HomeViewControllerScreen()
        self.screen?.configTableViewProtocols(delegate: self, dataShource: self)
        self.view = self.screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension HomeViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CardData.count
        //Aqui retorna a quantidade de celulas
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardViewTableViewCell.identifier, for: indexPath)
        as? CardViewTableViewCell
        cell?.setupCell(data: CardData[indexPath.row])
        return cell ?? UITableViewCell()
        //aqui retorna nossa celula, que criamos separado
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = DetailViewController()
        VC.cardModel = CardData[indexPath.row]
        VC.modalPresentationStyle = .fullScreen
        present(VC, animated: true, completion: nil)
        //aqui fizemos o direcionamento / rota
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
        //aqui setamos a altura da celula
    }
    
}

