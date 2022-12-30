//
//  ChatProgressBar.swift
//  Vivus Explore
//
//  Created by Seifeddine.Bouzid on 26/7/2021.
//  Copyright © 2021 Vivus Hub Ltd. All rights reserved.
//

import Foundation
open class ChatProgressBar : UIView {
    public var color : UIColor = .green {
        didSet { update() }
    }
    public var progress : CGFloat = 0.0 {
        didSet { update() }
    }
    private let progressLayer = CALayer()
    private let backgroundMask = CAShapeLayer()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
       
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayers()
    }
    private func setupLayers() {
        layer.addSublayer(progressLayer)
        
    }
    open override func layoutSubviews() {
        super.layoutSubviews()
        backgroundMask.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.bounds.size.height * 0.25).cgPath
        layer.mask = backgroundMask
    }
    private func update(){
        let progressRect = CGRect(origin: .zero, size: CGSize(width: self.bounds.size.width * progress, height: self.bounds.size.height))
        progressLayer.frame = progressRect
        progressLayer.backgroundColor = color.cgColor
    }
    
}
