//
//  ViewController.swift
//  SpaceXApp
//
//  Created by Захар Литвинчук on 01.03.2024.
//

import UIKit

final class PageViewController: UIPageViewController {
    
    let pageControl = UIPageControl()
    
    var pages = [UIViewController]()
    let initialPage = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        embedViews()
        setupLayout()
        setupAppearance()
        setupData()
        setupBehavior()
    }

}


//MARK: - Embed Views
private extension PageViewController {
    
    func embedViews() {
        
        view.addSubview(pageControl)
        
    }
    
}


//MARK: - Setup Layout
private extension PageViewController {
    
    func setupLayout() {
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
        
    }
    
}


//MARK: - Setup Appearance
private extension PageViewController {
    
    func setupAppearance() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPage = initialPage
    }
    
}


//MARK: - Setup Data
private extension PageViewController {
    
    func setupData() {
        
        let rocketPage = RocketViewController()
        let launchesPage = LaunchesViewController()
        let settingsPage = SettingsViewController()
        
        [rocketPage,launchesPage, settingsPage].forEach({pages.append($0)})
        
        pageControl.numberOfPages = pages.count
        setViewControllers([pages[initialPage]], direction: .forward, animated: true)
    }
    
}

//MARK: - Setup Behavior
private extension PageViewController {
    
    func setupBehavior() {
        dataSource = self
        delegate = self
        
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
        
    }
    
    @objc
    func pageControlTapped(_ sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true)
    }
    
}

extension PageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
        pageControl.currentPage = currentIndex
    }
    
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        } else {
            return pages.first
        }
        
    }
    
    
}

