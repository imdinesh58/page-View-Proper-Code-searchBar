//
//  pageViewController.swift
//  CoreDataSampleApp
//
//  Created by Apple-1 on 19/12/17.
//  Copyright © 2017 Apple-1. All rights reserved.
//

import UIKit

class pageViewController: UIPageViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {

    var pages = [UIViewController]()
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        let page1: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "1")
        let page2: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "2")
        let page3: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "3")
        let page4: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "4")
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        pages.append(page4)
        setViewControllers([page1], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        configurePageControl()
    }
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = pages.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.index(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return pages.last
        }
        guard pages.count > previousIndex else {
            return nil
        }
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.index(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        let viewControllersCount = pages.count
        guard viewControllersCount != nextIndex else {
            return pages.first
        }
        guard viewControllersCount > nextIndex else {
            return nil
        }
        return pages[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let viewTag = pageViewController.viewControllers!.first!.view.tag
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = pages.index(of: pageContentViewController)!
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}
