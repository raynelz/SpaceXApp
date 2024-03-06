//
//  SettingsViewController.swift
//  SpaceXApp
//
//  Created by Захар Литвинчук on 01.03.2024.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    let heightLabel = UILabel()
    let diametrLabel = UILabel()
    let weightLabel = UILabel()
    let payloadLabel = UILabel()
    
    let heightSegmentControl = UISegmentedControl()
    let diametrSegmentControl = UISegmentedControl()
    let weightSegmentControl = UISegmentedControl()
    let payloadSegmentControl = UISegmentedControl()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        embedViews()
        setupLayout()
        setupAppearance()
        setupData()
        setupBehavior()
    }

}

private extension SettingsViewController {
    
    func embedViews() {
        
        [heightLabel, diametrLabel, weightLabel, payloadLabel,
         heightSegmentControl, diametrSegmentControl,
         weightSegmentControl,payloadSegmentControl
        ].forEach({ view.addSubview($0) })
        
    }
    
}

private extension SettingsViewController {
    
    func setupLayout() {
        
        /// Height Label
        NSLayoutConstraint.activate([
            heightLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        /// Diametr Label
        NSLayoutConstraint.activate([
            diametrLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 30),
            diametrLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
        
        /// Weight Label
        NSLayoutConstraint.activate([
            weightLabel.topAnchor.constraint(equalTo: diametrLabel.bottomAnchor, constant: 30),
            weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            payloadLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 30),
            payloadLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        
        
    }
    
}

private extension SettingsViewController {
    
    func setupAppearance() {
        view.backgroundColor = .black
        
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.textColor = .white
        
        diametrLabel.translatesAutoresizingMaskIntoConstraints = false
        diametrLabel.textColor = .white
        
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.textColor = .white
        
        payloadLabel.translatesAutoresizingMaskIntoConstraints = false
        payloadLabel.textColor = .white
        
    }
    
}

private extension SettingsViewController {
    
    func setupData() {
        //let heightUnits = ["m", "ft"]
        let diametrUnits = ["m", "ft"]
        let weightUnits = ["kg", "lb"]
        let payloadUnits = ["kg", "lb"]
        
        enum heightUnits {
            case m
            case ft
        }
        
        
        heightLabel.text = "Высота"
        diametrLabel.text = "Диаметр"
        weightLabel.text = "Масса"
        payloadLabel.text = "Полезная нагрузка"
        
    }
    
}

private extension SettingsViewController {
    
    func setupBehavior() {

        
    }
    
}

#Preview(traits: .portrait, body: {
    SettingsViewController()
})
