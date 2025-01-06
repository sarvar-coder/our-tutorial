//
//  PagesViewController.swift
//  KoranPage
//
//  Created by Sarvar Boltaboyev on 31/10/24.
//

import UIKit

class PagesViewController: UIPageViewController, UIPageViewControllerDelegate {
    
    var startPage = 0
    var endPage = 0
    var currentIndex = 0
    
    var currentVC: UIViewController
    
    init() {
        for i in 1...19 {
            let page = PageVC(pageNumber: "\(i)")
            pages.append(page)
        }
        currentVC = pages.last!
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var pages = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        setup()
       
    }
    private func setup() {
        setupViewController()
    }
}
extension PagesViewController {
    private func setupViewController() {
        
        setViewControllers([pages.last!], direction: .forward, animated: false, completion: nil)
        currentVC = pages.last!
    }
}


extension PagesViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        getPreviousVC(viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        getNextVC(viewController)
    }
    func getPreviousVC(_ viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }
    func getNextVC(_ viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
        currentVC = pages[index + 1]
        return pages[index + 1]
    }

}


