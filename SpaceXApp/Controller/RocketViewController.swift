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
    
    var apiRocketsResult = [RocketElement]()
    var apiLaunchesResult = [LaunchStruct]()
    
    var rocketManager: RocketManager
    var launchManager: LaunchManager
    
    init(rocketManager: RocketManager = NetworkManagerImpl(),
         launchManager: LaunchManager = NetworkManagerImpl()) {
        self.rocketManager = rocketManager
        self.launchManager = launchManager
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
            self.apiRocketsResult = apiData
            self.infoView.setupText(apiRocketsResult[0].name)
        }
        
        launchManager.fetchingLaunchesApiData { [weak self] apiData in
            guard let self else { return }
            self.apiLaunchesResult = apiData
        }
        
    }
    
}

private extension RocketViewController {
    
    func setupBehavior() {
        
    }
    
}
