//
//  KayaButton.swift
//  KayaButton
//
//  Created by namik kaya on 9.01.2020.
//  Copyright © 2020 namik kaya. All rights reserved.
//

import UIKit

@IBDesignable
class KayaButton: UIButton {
    enum touchEventStatus {
        case down
        case up
        case normal
    }
    
    
    // MARK: - Variable
    var gradientLayer:CAGradientLayer?
    
    /**
     Usage: Arka plan rengi
     - Parameter : Tek renk atar.
     */
    @IBInspectable
    var bgColor:UIColor? = UIColor.blue {
        didSet{
            self.backgroundColor = bgColor
        }
    }
    
    private var bgColorGradient: UIColor?
    
    private var gradientColorArray:[CGColor] = []
    
    // MARK: - Gradient Start
    @IBInspectable
    var setStartGradient:UIColor = UIColor.black {
        didSet{
            gradientLayer?.colors = [setStartGradient.cgColor, setEndGradient.cgColor]
            gradientColorArray = [setStartGradient.cgColor, setEndGradient.cgColor]
        }
    }
    
    @IBInspectable
    var startPoint:CGPoint = CGPoint(x: 0, y: 0) {
        didSet {
            gradientLayer?.startPoint = startPoint
        }
    }
    
    // MARK: - Gradient End
    @IBInspectable
    var setEndGradient:UIColor = UIColor.black {
        didSet{
            gradientLayer?.colors = [setStartGradient.cgColor, setEndGradient.cgColor]
            gradientColorArray = [setStartGradient.cgColor, setEndGradient.cgColor]
        }
    }
    
    
    @IBInspectable
    var endPoint:CGPoint = CGPoint(x: 0, y: 0) {
        didSet {
            gradientLayer?.endPoint = endPoint
        }
    }
    
    
    @IBInspectable
    var cornerRadius:CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.needsLayout()
        }
    }
    
    private var animationHolder:KayaButtonAnimationStatus = KayaButtonAnimationStatus.touchCircle
    
    
    enum KayaButtonAnimationStatus:Int {
        case touchCircle
    }
    
    @IBInspectable
    var setAnimation:Int{
        set {
            animationHolder = KayaButtonAnimationStatus(rawValue: newValue) ?? .touchCircle
        }get {
            return self.animationHolder.rawValue
        }
    }
    
    
    private var statusHolder:touchEventStatus? = .normal
    /**
     Usage: statu bu değişkene set edildiği anda animasyon oynatımı başlatılır.
     */
    var setStatus:touchEventStatus? {
        set {
            statusHolder = newValue
            animationManager(e: statusHolder)
        }get{
            return statusHolder
        }
    }
    
    override open class var layerClass: AnyClass {
       return CAGradientLayer.classForCoder()
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initButton()
    }
    
    private func initButton() {
        self.addTarget(self,
                       action: #selector(touchUpInsideEvent),
                       for: UIControl.Event.touchUpInside)
        self.addTarget(self,
                       action: #selector(touchDownEvent),
                       for: UIControl.Event.touchDown)
        
        if let layer = layer as? CAGradientLayer {
            gradientLayer = layer
            gradientLayer?.startPoint = startPoint
            gradientLayer?.endPoint = endPoint
            gradientLayer?.colors = gradientColorArray
        }
    }
    /**
     Usage: Buttonun ne iş yaptırılmak isteniyorsa buradan tetiklenir.
     */
    @objc private func touchUpInsideEvent() {
        setStatus = .up
    }
    
    /**
     Usage: Buttonun ne iş yaptırılmak isteniyorsa buradan tetiklenir.
     */
    @objc private func touchDownEvent() {
        setStatus = .down
    }
    
    private func animationManager(e:touchEventStatus?) {
        guard let e = e else { return }
        switch e {
        case .down:
            downAnimation()
            break
        case .up:
            upAnimation()
            break
        case .normal:
            normalAnimation()
            break
        }
    }
    
    private func downAnimation() {
        
    }
    
    private func upAnimation() {
        
    }
    
    private func normalAnimation() {
        
    }
    
}
