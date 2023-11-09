//
//  OnboardingViewController.swift
//  Ozinshe App Snapkit
//
//  Created by Мерей Булатова on 07.11.2023.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        return scrollView
    }()
    
    let pageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = 3
        pc.tintColor = .black
        pc.currentPage = 0
        pc.currentPageIndicatorTintColor = UIColor(red: 0.7, green: 0.46, blue: 0.97, alpha: 1)
        pc.contentVerticalAlignment = .center
        pc.contentHorizontalAlignment = .center
        
        return pc
    }()
    
    private var slides = [OnboardingView]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationItem.title = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        slides = createSlides()
        setupSlidesScrollView(slides: slides)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        scrollView.delegate = self
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        
        scrollView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(654)
            make.centerX.equalToSuperview()
        }
    }
    
    func createSlides() -> [OnboardingView] {
        let firstOnboardingView = OnboardingView()
        firstOnboardingView.setPageElements(image: UIImage(named: "firstSlide")!,
                                            text: "ÖZINŞE-ге қош келдің!", subtitleText: "Фильмдер, телехикаялар, ситкомдар, анимациялық жобалар, телебағдарламалар мен реалити-шоулар, аниме және тағы басқалары",
                                            nextButtonB: true,
                                            skipButtonB: false)
        
        let secondOnboardingView = OnboardingView()
        secondOnboardingView.setPageElements(image: UIImage(named: "secondSlide")!,
                                             text: "ÖZINŞE-ге қош келдің!",
                                             subtitleText: "Кез келген құрылғыдан қара. Сүйікті фильміңді  қосымша төлемсіз телефоннан, планшеттен, ноутбуктан қара",
                                             nextButtonB: true,
                                             skipButtonB: false)
        
        let thirdOnboardingView = OnboardingView()
        thirdOnboardingView.setPageElements(image: UIImage(named: "thirdSlide")!,
                                            text: "ÖZINŞE-ге қош келдің!",
                                            subtitleText: "Тіркелу оңай. Қазір тіркел де қалаған фильміңе қол жеткіз",
                                            nextButtonB: false,
                                            skipButtonB: true)
        
        return [firstOnboardingView, secondOnboardingView, thirdOnboardingView]
    }
    
    func setupSlidesScrollView(slides: [OnboardingView]) {
        
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count),
                                        height: view.frame.height)
        for i in 0..<slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i),
                                     y: 0,
                                     width: view.frame.width,
                                     height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
}
extension OnboardingViewController: UIScrollViewDelegate {
    
      func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        let maxHorizontalOffset = scrollView.contentSize.width - view.frame.width
        let percentHorizontalOffset = scrollView.contentOffset.x / maxHorizontalOffset
        
//        print(percentHorizontalOffset )
//        
//        if percentHorizontalOffset <= 0.5 {
//            let firstTransform = CGAffineTransform(scaleX: (0.5 - percentHorizontalOffset) / 0.5,
//                                                   y: (0.5 - percentHorizontalOffset) / 0.5)
//            let secondTransform = CGAffineTransform(scaleX: percentHorizontalOffset / 0.5,
//                                                    y: percentHorizontalOffset / 0.5)
//            slides[0].setPageElementsTransform(transform: firstTransform)
//            slides[1].setPageElementsTransform(transform: secondTransform)
//        } else {
//            let secondTransform = CGAffineTransform(scaleX: (1 - percentHorizontalOffset) / 0.5,
//                                                    y: (1 - percentHorizontalOffset) / 0.5)
//            let thirdTransform = CGAffineTransform(scaleX: percentHorizontalOffset,
//                                                   y: percentHorizontalOffset)
//            slides[1].setPageElementsTransform(transform: secondTransform)
//            slides[2].setPageElementsTransform(transform: thirdTransform)
//        }
    }
}
