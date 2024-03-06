//
//  RocketViewController.swift
//  SpaceXApp
//
//  Created by Захар Литвинчук on 01.03.2024.
//

import UIKit

final class RocketViewController: UIViewController {
    
    let imageView = UIImageView()
    let infoView = InfoView()
    
    var rocketManager: RocketManager
    var RocketsManagerResult = [RocketElement]()
    
    
    init(rocketManager: RocketManager = NetworkManagerImpl()) {
        self.rocketManager = rocketManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        embedViews()
        setupLayout()
        setupAppearance()
        setupData()
        setupBehavior()
    }
    
}

private extension RocketViewController {
    
    func embedViews() {
        [imageView, infoView].forEach({ view.addSubview($0) })
    }
    
}

private extension RocketViewController {
    
    func setupLayout() {
        
        //MARK: Image View
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            infoView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
            infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        
    }
    
}

private extension RocketViewController {
    
    func setupAppearance() {
        view.backgroundColor = .black
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        infoView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}

private extension RocketViewController {
    
    func setupData() {
        
        imageView.image = UIImage(named: "falcon")
        
        rocketManager.fetchingRocketApiData { [weak self] apiData in
            guard let self else { return }
            self.RocketsManagerResult = apiData
            self.infoView.setupText(RocketsManagerResult[0].name)
        }
        
    }
    
}

private extension RocketViewController {
    
    func setupBehavior() {
        
    }
    
}
