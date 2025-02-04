//
//  ViewController.swift
//  mobileChallenge
//
//  Created by Henrique on 03/02/25.
//

import UIKit

class HomeController: UIViewController {
    
    private let viewModel: HomeControllerViewModel
    
    init (viewModel: HomeControllerViewModel = HomeControllerViewModel()){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let msgLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Loading Currencies..."
        label.textAlignment = .center
        return label
    }()
    
    let txtField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Insira o valor para converter"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMsgTxt()
        setuptxtField()
        self.view.backgroundColor = .blue
        self.viewModel.onCurrencyUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.msgLabel.isHidden = true
            }
        }
        self.viewModel.onErrorMessage = { [weak self] error in
            DispatchQueue.main.async {
                self?.msgLabel.text = error.localizedDescription
            }
        }
    }
    
    func setuptxtField(){
        view.addSubview(txtField)
        NSLayoutConstraint.activate([
            txtField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            txtField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            txtField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }
    
    func setupMsgTxt(){
        view.addSubview(msgLabel)
        NSLayoutConstraint.activate([
            msgLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            msgLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            msgLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            msgLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}

