//
//  ViewController.swift
//  Buoi3
//
//  Created by Tuấn on 6/8/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var outlineView: UIView!
    @IBOutlet weak var captureView: UIView!

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var captureLabel: UILabel!
    
    var isLeftView: Bool = false {
        didSet {
            updateCaptureView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLeftView()
        setupRightView()
        setupOutlineView()
    }
    
    func setupLeftView() {
        leftView.center.x = view.center.x - 50
        leftView.center.y = view.center.y - 50
        setupView(myView: leftView,
                  borderWidth: 3,
                  borderColor: UIColor.blue,
                  backgroundColor: UIColor.green,
                  myLabel: leftLabel,
                  text: "LEFT VIEW")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onLeftViewTap))
        leftView.addGestureRecognizer(tapGesture)
    }
    
    @objc func onLeftViewTap() {
        isLeftView = true
        scaleView(leftView)
        resetScaleView(rightView)
    }
    
    func setupRightView() {
        rightView.center.x = view.center.x + 50
        rightView.center.y = view.center.y - 50
        setupView(myView: rightView,
                  borderWidth: 3,
                  borderColor: UIColor.green,
                  backgroundColor: UIColor.yellow,
                  myLabel: rightLabel,
                  text: "RIGHT VIEW")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onRightViewTap))
        rightView.addGestureRecognizer(tapGesture)
    }
    
    @objc func onRightViewTap() {
        isLeftView = false
        scaleView(rightView)
        resetScaleView(leftView)
    }
    
    func setupOutlineView() {
        outlineView.layer.borderWidth = 1
    }
    
    func updateCaptureView() {
        captureView.center = CGPoint(x: outlineView.bounds.width / 2, y: outlineView.bounds.height / 2)
        
        if isLeftView {
            setupView(myView: captureView,
                      borderWidth: 3,
                      borderColor: UIColor.blue,
                      backgroundColor: UIColor.green,
                      myLabel: captureLabel,
                      text: "LEFT VIEW")
        } else {
            setupView(myView: captureView,
                      borderWidth: 3,
                      borderColor: UIColor.green,
                      backgroundColor: UIColor.yellow,
                      myLabel: captureLabel,
                      text: "RIGHT VIEW")
        }
    }
    
    func setupView(myView: UIView, borderWidth: Int, borderColor: UIColor, backgroundColor: UIColor, myLabel: UILabel, text: String) {
        
        myView.backgroundColor = backgroundColor
        myView.layer.borderWidth = CGFloat(borderWidth)
        myView.layer.borderColor = borderColor.cgColor
        myView.backgroundColor = backgroundColor
        myLabel.text = text
        myLabel.textAlignment = .center
        myLabel.center = CGPoint(x: myView.bounds.width / 2, y: myView.bounds.height / 2)
    }
    
    func scaleView(_ myView: UIView) {
        UIView.animate(withDuration: 1) {
            myView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
    }
    
    func resetScaleView(_ myView: UIView) {
        UIView.animate(withDuration: 1) {
            myView.transform = CGAffineTransform.identity
        }
    }

}

