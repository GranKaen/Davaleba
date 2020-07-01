//
//  ViewController.swift
//  Davakeba52
//
//  Created by konstantine gudushauri on 7/1/20.
//  Copyright © 2020 konstantine gudushauri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

 
    var circlePath = UIBezierPath()
      var smallCircleLayer = CAShapeLayer()
      var midViewX = CGFloat()
      var midViewY = CGFloat()
      var valueLabel = UILabel()
      
      var progressView: UIView!{
          let v = UIView()
          v.frame.size = CGSize(width: 200, height: 200)
          v.isMultipleTouchEnabled = true
          v.isUserInteractionEnabled = true
          v.center = view.center
          v.layer.cornerRadius = 100
          v.backgroundColor = .clear
          let dragCircle = UIPanGestureRecognizer(target: self, action:#selector(drag))
          v.addGestureRecognizer(dragCircle)
          return v
      }
      override func viewDidLoad() {
          super.viewDidLoad()
          setUpView()
    }
      func setUpView(){
          valueLabel.frame.size = CGSize(width: 100, height: 40)
          valueLabel.textAlignment = .center
          valueLabel.center = progressView.center
          valueLabel.textColor = #colorLiteral(red: 0.3301276967, green: 0.3269407161, blue: 0, alpha: 1)
          valueLabel.font = UIFont.boldSystemFont(ofSize: 40)
          valueLabel.text = "0"
          midViewX = progressView.frame.midX
          midViewY = progressView.frame.midY
          
          let circlePath2 = UIBezierPath(arcCenter: CGPoint(x: midViewX,y: midViewY), radius: CGFloat(100), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
          let orbitLayer = CAShapeLayer()
          orbitLayer.path = circlePath2.cgPath
          orbitLayer.fillColor = .none
          orbitLayer.strokeColor = #colorLiteral(red: 0.06962125671, green: 0.7295351997, blue: 1, alpha: 1)
          orbitLayer.shadowColor = #colorLiteral(red: 0.06962125671, green: 0.7295351997, blue: 1, alpha: 1)
          orbitLayer.shadowRadius = 5
          orbitLayer.shadowOpacity = 1
          orbitLayer.lineWidth = 40.0
          view.layer.addSublayer(orbitLayer)
          
          let angleEarth: Double = -90
          let angleEarthAfterCalculate: CGFloat = CGFloat(angleEarth*Double.pi/180) - CGFloat(Double.pi/2)
          let earthX = midViewX + cos(angleEarthAfterCalculate)*100
          let earthY = midViewY + sin(angleEarthAfterCalculate)*100
          circlePath = UIBezierPath(arcCenter: CGPoint(x: earthX,y: earthY), radius: CGFloat(19), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
          
          smallCircleLayer.path = circlePath.cgPath
          smallCircleLayer.fillColor = #colorLiteral(red: 1, green: 0.9541043799, blue: 0.01410310863, alpha: 1)
          smallCircleLayer.strokeColor = .none
          smallCircleLayer.lineWidth = 4
          view.layer.addSublayer(smallCircleLayer)
          
          view.addSubview(valueLabel)
          self.view.addSubview(progressView)
      }
      
      
      @objc func drag(recognizer: UIPanGestureRecognizer) {
          let point = recognizer.location(in: nil)
          
          let angleX = (Double(point.x) - Double(midViewX))
          let angleY = (Double(point.y) - Double(midViewY))
          let angle = atan2(angleY, angleX)
          let earthX2 = Double(midViewX) + cos(angle)*100
          let earthY2 = Double(midViewY) + sin(angle)*100
          circlePath = UIBezierPath(arcCenter: CGPoint(x: earthX2,y: earthY2), radius: CGFloat(19), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
          smallCircleLayer.path = circlePath.cgPath
          let value = Int((point.angle(to: self.progressView.center).rounded()) / 3.6)
          
          valueLabel.text = "\(value)"
          changeColors(with: value)
          
      }
      
      func changeColors(with value: Int) {
          if value > 90 {
              smallCircleLayer.fillColor = #colorLiteral(red: 1, green: 0.9903462188, blue: 0, alpha: 1)
              valueLabel.textColor = #colorLiteral(red: 1, green: 0.9903462188, blue: 0, alpha: 1)
              
          }
              
          else if value > 70 {
              smallCircleLayer.fillColor = #colorLiteral(red: 0.8478941942, green: 0.8397088091, blue: 0, alpha: 1)
              valueLabel.textColor = #colorLiteral(red: 0.8478941942, green: 0.8397088091, blue: 0, alpha: 1)
          }
          else if value > 50 {
              smallCircleLayer.fillColor = #colorLiteral(red: 0.649924651, green: 0.6436504206, blue: 0, alpha: 1)
              valueLabel.textColor = #colorLiteral(red: 0.649924651, green: 0.6436504206, blue: 0, alpha: 1)
          }
          else {
              smallCircleLayer.fillColor = #colorLiteral(red: 0.441961453, green: 0.4376948539, blue: 0, alpha: 1)
              valueLabel.textColor = #colorLiteral(red: 0.441961453, green: 0.4376948539, blue: 0, alpha: 1)
          }
          
      }
  }
    
extension CGPoint {
    func angle(to comparisonPoint: CGPoint) -> CGFloat {
        let originX = comparisonPoint.x - self.x
        let originY = comparisonPoint.y - self.y
        let bearingRadians = atan2(Float(originY), Float(originX))
        var bearingDegrees = CGFloat(bearingRadians).degrees
        while bearingDegrees < 0 {
            bearingDegrees += 360
        }
        return bearingDegrees
    }
}

extension CGFloat {
    var degrees: CGFloat {
        return self * CGFloat(180.0 / Double.pi)
    }
}

