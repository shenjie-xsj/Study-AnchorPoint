//
//  ViewController.swift
//  MyTimer
//
//  Created by EU_ShenJie on 2018/7/30.
//  Copyright © 2018年 EU_ShenJie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeBack: UIView!
    @IBOutlet weak var hourView: UIView!
    @IBOutlet weak var minuteView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var backWidth: NSLayoutConstraint!
    
    //定时器
    var timer:Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        tick()
        self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(1.0), target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }

    private func setView() {
        let width = UIScreen.main.bounds.width > UIScreen.main.bounds.height ? UIScreen.main.bounds.height : UIScreen.main.bounds.width
        backWidth.constant = width
        
        let image = UIImage(named: "timer")?.cgImage
        timeBack.layer.contents = image
        timeBack.layer.contentsGravity = kCAGravityResizeAspect
        timeBack.layer.contentsRect = CGRect(x: 0, y: 0, width: 0.715, height: 1)
        
        hourView.layer.contents = image
        hourView.layer.contentsGravity = kCAGravityResizeAspect
        hourView.layer.contentsRect = CGRect(x: 0.745, y: 0.2333722287, width: 0.0541666666666, height: 0.315)
        
        minuteView.layer.contents = image
        minuteView.layer.contentsGravity = kCAGravityResizeAspect
        minuteView.layer.contentsRect = CGRect(x: 0.8125, y: 0.11, width: 0.0483433333334, height: 0.4317386231)
        
        secondView.layer.contents = image
        secondView.layer.contentsGravity = kCAGravityResizeAspect
        secondView.layer.contentsRect = CGRect(x: 0.87916666666667, y: 0.14702450408, width: 0.04333333333, height: 0.38856476079)
        
        //更改锚点以解决旋转中心点问题
        hourView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.67073684211)
        minuteView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.7666666667)
        secondView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.75988130564)
    }
    
    @objc func tick() {
        let calendar = Calendar.current
        let dateComponets = calendar.dateComponents(in: TimeZone.current, from: Date())
        
        let hourAngle = (CGFloat(dateComponets.hour!)/12.0) * CGFloat.pi * 2.0
        let minuteAngle = (CGFloat(dateComponets.minute!)/60.0) * CGFloat.pi * 2.0
        let secondAngle = (CGFloat(dateComponets.second!)/60.0) * CGFloat.pi * 2.0
        
        hourView.transform = CGAffineTransform(rotationAngle: hourAngle)
        minuteView.transform = CGAffineTransform(rotationAngle: minuteAngle)
        secondView.transform = CGAffineTransform(rotationAngle: secondAngle)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

