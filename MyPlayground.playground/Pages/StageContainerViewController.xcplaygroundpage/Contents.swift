@@ -0,0 +1,132 @@
//
//  StagesViewController.swift
//  StagedCooking
//
//  Created by Logan Melton on 11/21/21.
//

import UIKit

class StageContainerViewController: UIViewController {
  
  let pageViewController: UIPageViewController
  var pages = [UIViewController]()
  var currentVC: UIViewController
  
  let ingredients = [String]()
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    //
    let page1 = StageViewController(stepTitle: "words", imageName: "rottenSteak")
    let page2 = StageViewController(stepTitle: "poop", imageName: "rottenSteak")
    let page3 = StageViewController(stepTitle: "rawr", imageName: "rottenSteak")
    //    let page1 = ViewController1()
    //    let page2 = ViewController2()
    //    let page3 = ViewController3()
    
    pages.append(page1)
    pages.append(page2)
    pages.append(page3)
    
    currentVC = pages.first!
    
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    style()
    layout()
  }
}

extension StageContainerViewController {
  private func style() {
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .systemPurple
    
    pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
    pageViewController.dataSource = self
    pageViewController.view.backgroundColor = .cyan
    pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
    currentVC = pages.first!
  }
  
  private func layout() {
    
    // Life Cycle, adding child VCs, all lines required
    addChild(pageViewController)
    view.addSubview(pageViewController.view)
    pageViewController.didMove(toParent: self)
    
    
    NSLayoutConstraint.activate([
      view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
      view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
      view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
      view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
    ])
  }
}


// MARK: - UIPageViewControllerDataSource
extension StageContainerViewController: UIPageViewControllerDataSource {
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    return getPreviousViewController(from: viewController)
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    return getNextViewController(from: viewController)
  }
  
  
  private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
    guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
    currentVC = pages[index - 1]
    return pages[index - 1]
  }
  
  private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
    guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
    currentVC = pages[index + 1]
    return pages[index + 1]
  }
  
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return pages.count
  }
  
  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    return pages.firstIndex(of: self.currentVC) ?? 0
  }
}

// MARK: - ViewControllers
class ViewController1: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemRed
  }
}

class ViewController2: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemGreen
  }
}

class ViewController3: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBlue
  }
}
