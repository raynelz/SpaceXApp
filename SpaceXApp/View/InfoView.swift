//
//  InfoView.swift
//  SpaceXApp
//
//  Created by Захар Литвинчук on 03.03.2024.
//

import UIKit

class InfoView: UIView {
    
    let view = UIView()
    let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        embedViews()
        setupLayout()
        setupAppearance()
        setupBehavior()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension InfoView {
    
    func embedViews() {
        
        [view].forEach({ addSubview($0) })
        [nameLabel].forEach({ view.addSubview($0) })
    }
    
}

private extension InfoView {
    
    func setupLayout() {
        
        //MARK: - View
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: centerYAnchor, constant: -150),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        //MARK: - Name Label
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            
        ])
        
    }
    
}

private extension InfoView {
    
    func setupAppearance() {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.backgroundColor = .black
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .white
        nameLabel.numberOfLines = 0
        nameLabel.font = .systemFont(ofSize: 30, weight: .medium)
    }
    
}

extension InfoView {
    
    func setupText(_ text: String) {
    
        DispatchQueue.main.async {
            self.nameLabel.text = text
        }
        
    }
    
}

private extension InfoView {
    
    func setupBehavior() {
        
        
        
    }
    
}
