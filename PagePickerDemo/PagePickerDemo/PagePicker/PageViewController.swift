//
//  PageViewController.swift
//  PageTitle
//
//  Created by 胡亚莉 on 17/2/12.
//  Copyright © 2017年 胡亚莉. All rights reserved.
//

import UIKit

/// 标题高度
private let titleHeight:CGFloat = 50

class PageViewController: UIViewController {
    
    /// 标题
    fileprivate lazy var titleScrollView: UIScrollView = {
        return self.setupScrollView()
    }()
    
    /// 内容
    fileprivate lazy var contentScrollView: UIScrollView = {
        let scrollview = self.setupScrollView()
        scrollview.isPagingEnabled = true
        scrollview.delegate = self
        return scrollview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChildVC()
        
        setupui()
        
        setupTitle()
        
        scrollViewDidEndScrollingAnimation(contentScrollView)
    }
    
    /// 设置当前控制器仅支持竖屏
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}

// MARK: - UIScrollViewDelegate
extension PageViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let scale = scrollView.contentOffset.x / scrollView.frame.width
        
        if scale < 0 || scale > CGFloat(titleScrollView.subviews.count - 1) { return }
        
        let leftIdx = Int(scale)
        
        let rightIdx = leftIdx + 1
        // 左边label
        let leftLabele = titleScrollView.subviews[leftIdx] as! TitleLabel
        // 右边label
        let rightLable = (rightIdx >= titleScrollView.subviews.count) ? nil : (titleScrollView.subviews[rightIdx] as? TitleLabel)
        
        // 右边颜色比例
        let rightScale = scale - CGFloat(leftIdx)
        // 左边颜色比例
        let leftScale = 1 - rightScale
        
        leftLabele.scale = leftScale
        rightLable?.scale = rightScale
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        // 当前位置控制器索引
        let index = Int(scrollView.contentOffset.x / scrollView.frame.width)
        
        // 即将显示的控制器
        let willShowVC = childViewControllers[index]
        
        // 即将显示的控制器对应的标题
        let title = titleScrollView.subviews[index]
        
        for label in titleScrollView.subviews as! [TitleLabel] {
            if label != title { label.scale = 0 }
        }
        
        // 标题居中显示
        var titleOffsetX = title.center.x - titleScrollView.frame.width * 0.5
        
        // 标题超出边界处理
        if titleOffsetX < 0 { titleOffsetX = 0 }
        let maxOffsetX = titleScrollView.contentSize.width - titleScrollView.frame.width
        if titleOffsetX > maxOffsetX { titleOffsetX = maxOffsetX }
        
        titleScrollView.setContentOffset(CGPoint(x: titleOffsetX, y: 0), animated: true)
        
        // 如果该控制器已经显示，直接返回
        if willShowVC.isViewLoaded { return }
        
        // 显示控制器
        willShowVC.view.frame = CGRect(x: scrollView.contentOffset.x, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
        
        scrollView.addSubview(willShowVC.view)
    }
}

// MARK: - 初始化子控制器
extension PageViewController {
    /// 添加子控制器，给子类重写
    func setupChildVC() {
        
    }
}

// MARK: - 设置ui
private extension PageViewController {
    
    /// 初始化scrollview
    func setupScrollView() -> UIScrollView {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.showsVerticalScrollIndicator = false
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.backgroundColor = UIColor.radomColor()
        
        return scrollview
    }
    
    /// 设置两个scrollview自动布局
    func setupui() {
        
        edgesForExtendedLayout = UIRectEdge()
        
        view.addSubview(titleScrollView)
        view.addSubview(contentScrollView)
        
        let viewDict = ["titleScrollView" : titleScrollView, "contentScrollView" : contentScrollView]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[titleScrollView]-0-|", options: [], metrics: nil, views: viewDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[titleScrollView(\(titleHeight))]", options: [], metrics: nil, views: viewDict))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[contentScrollView]-0-|", options: [], metrics: nil, views: viewDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[titleScrollView]-0-[contentScrollView]-0-|", options: [], metrics: nil, views: viewDict))
        
        view.layoutIfNeeded()
    }
    
    /// 设置标题scrollview的标题
    func setupTitle() {
        
        let w: CGFloat = 120
        
        let childVcCount = childViewControllers.count
        
        for i in 0..<childVcCount {
            
            let x = CGFloat(i) * w
            
            let label = TitleLabel(frame: CGRect(x: x, y: 0, width: w, height: titleHeight))
            label.tag = i
            label.text = childViewControllers[i].title
            label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(titleClick)))
            titleScrollView.addSubview(label)
            
            if i == 0 { label.scale = 1 }
        }
        titleScrollView.contentSize = CGSize(width: CGFloat(childVcCount) * w, height: 0)
        contentScrollView.contentSize = CGSize(width: CGFloat(childVcCount) * contentScrollView.frame.width, height: 0)
    }
    
    /// 监听标题点击
    @objc func titleClick(tap: UITapGestureRecognizer) {
        
        guard let index = tap.view?.tag else { return }
        
        contentScrollView.setContentOffset(CGPoint(x: contentScrollView.bounds.width * CGFloat(index), y: 0), animated: true)
    }
}
