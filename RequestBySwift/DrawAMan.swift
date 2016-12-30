//
//  DrawAMan.swift
//  RequestBySwift
//
//  Created by 储诚鹏 on 16/12/30.
//  Copyright © 2016年 RUIYI. All rights reserved.
//

import UIKit

extension UIBezierPath {
    func strokeColor() {
        UIColor.white.set()
        self.stroke()
        UIColor.clear.set()
        self.fill()
    }
}



class DrawAMan: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.init(red: 229 / 255, green: 38 / 255, blue: 42 / 255, alpha: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let path1 = UIBezierPath.init(arcCenter: CGPoint.init(x: Mcenter().x, y: 80), radius: 60, startAngle: 0, endAngle:CGFloat(M_PI) * 2, clockwise: true)
        let offsetX = CGFloat(60 * sin(M_PI_4))
        let offsetY = CGFloat(60 * cos(M_PI_4))
        let p2X = Mcenter().x - offsetX
        let p2Y = 80 + offsetY
        let path2 = UIBezierPath()
        path2.move(to: CGPoint.init(x: p2X, y: p2Y))
        path2.addQuadCurve(to: CGPoint.init(x: p2X, y: p2Y + 130), controlPoint: CGPoint.init(x: p2X - 100, y: p2Y + 100))
        let path3 = UIBezierPath()
        let p3X = Mcenter().x + offsetX
        let p3Y = 80 + offsetY
        path3.move(to:CGPoint.init(x: p3X, y: p3Y))
        path3.addQuadCurve(to: CGPoint.init(x: p3X, y: p3Y + 130), controlPoint: CGPoint.init(x: p3X + 100, y: p3Y + 100))
        let path4 = UIBezierPath.init(arcCenter: CGPoint.init(x: Mcenter().x, y: 90), radius: 30, startAngle: CGFloat(M_PI_4 / 2), endAngle: CGFloat(M_PI - M_PI_4 / 2), clockwise: true)
        let p5 = CGPoint.init(x: Mcenter().x - 30, y: 60)
        let path5 = UIBezierPath.init(arcCenter: p5, radius: 5, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        let path6 = UIBezierPath.init(arcCenter: CGPoint.init(x: Mcenter().x + 30, y: 60), radius: 5, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        UIColor.white.set()
        path5.fill()
        path6.fill()
        let paths : Array<UIBezierPath> = [path1,path2,path3,path4]
        paths.map {
            $0.strokeColor()
        }
        
    }
    
    
 

}
