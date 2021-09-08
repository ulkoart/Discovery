//
//  RestaurantCarouselView.swift
//  Discovery
//
//  Created by user on 08.09.2021.
//

import SwiftUI
import KingfisherSwiftUI

struct RestaurantCarouselContainer: UIViewControllerRepresentable {
    
    let imageUrlStrings: [String]
    let selectedIndex: Int
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    
    func makeUIViewController(context: Context) -> UIViewController {
        // let redVC = UIHostingController(rootView: Text("First View Controller"))
        // let redVC = UIViewController()
        // redVC.view.backgroundColor = .red
        // return redVC
        
        let pvc = CarouselPageViewController(imageNames: imageUrlStrings, selectedIndex: selectedIndex)
        return pvc
    }
    
    typealias UIViewControllerType = UIViewController
}

final class CarouselPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return allControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return self.selectedIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = allControllers.firstIndex(of: viewController) else {
            return nil
        }
        if index == 0 { return nil }
        return allControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = allControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        if index == allControllers.count - 1 { return nil }
        return allControllers[index + 1]
    }
    
    var allControllers: [UIViewController] = []
    var selectedIndex: Int
    
    init(imageNames: [String], selectedIndex:Int) {
        self.selectedIndex = selectedIndex
        
        UIPageControl.appearance().pageIndicatorTintColor = .systemGray5
        UIPageControl.appearance().currentPageIndicatorTintColor = .blue
        
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        allControllers = imageNames.map({ imageName in
            let hostingController = UIHostingController(rootView:
                                                            
                                                            ZStack {
                                                                Color.black
                                                                KFImage(URL(string: imageName))
                                                                .resizable()
                                                                .scaledToFit()
                                                            }
                                                            
                                                            
                                                            
            )
            hostingController.view.clipsToBounds = true
            return hostingController
        })
        
        if selectedIndex < allControllers.count {
            setViewControllers([allControllers[selectedIndex]], direction: .forward, animated: true, completion: nil)
        }
        
//        if let first = allControllers.first {
//            setViewControllers([first], direction: .forward, animated: true, completion: nil)
//        }
        
        self.dataSource = self
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
