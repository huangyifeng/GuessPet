//
//  PageViewController.swift
//  GuessPet
//
//  Created by HuangYiFeng on 11/2/16.
//  Copyright © 2016 cybozu. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController,UIPageViewControllerDataSource {

    let petCards = PetCardStore.defaultPets()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.setViewControllers([self.initialViewController], direction: .forward, animated: false, completion: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        let viewController = viewController as? CardViewController
        if 0 < (viewController?.pageIndex!)!
        {
            return self.viewControllerAtIndex((viewController?.pageIndex)! - 1)
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        let viewController = viewController as? CardViewController
        if (viewController?.pageIndex)! < self.petCards.count - 1
        {
            return self.viewControllerAtIndex((viewController?.pageIndex)! + 1)
        }
        
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return petCards.count;
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    var initialViewController : UIViewController {
        return self.viewControllerAtIndex(0)!
    }
    
    
    func viewControllerAtIndex(_ index: Int) -> UIViewController? {
        
        if let cardViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CardViewController") as? CardViewController
        {
            let card: PetCard = self.petCards[index]
            cardViewController.petCard = card
            cardViewController.pageIndex = index
            
            return cardViewController
        }
        return nil
    }
}
