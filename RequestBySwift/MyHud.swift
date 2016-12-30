//
//  MyHud.swift
//  RequestBySwift
//
//  Created by 储诚鹏 on 16/12/30.
//  Copyright © 2016年 RUIYI. All rights reserved.
//

import UIKit

class MyHud: UIView {

    var hudView : UIView
    var circleS : ((CGFloat) -> Void)? = nil
    override init(frame: CGRect) {
         hudView = UIView.init(frame: CGRect.init(origin: Mcenter(), size: CGSize.init(width: 80, height: 80)))
        hudView.center = Mcenter()
        super.init(frame: frame)
        backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.3)
        hudView.backgroundColor = UIColor.clear
        self.addSubview(hudView)
        self.circleHUD()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   
    func circleHUD() {
        let path = UIBezierPath.init(arcCenter: CGPoint.init(x: 40, y: 40), radius: 30, startAngle: 0, endAngle: CGFloat(M_PI)*2, clockwise: true)
        let sl = CAShapeLayer()
        sl.path = path.cgPath
        sl.lineWidth = 2.0
        sl.strokeColor = UIColor.init(red: 141 / 255, green: 220 / 255, blue: 250 / 255, alpha: 1.0).cgColor
        sl.fillColor = UIColor.clear.cgColor
        sl.strokeEnd = 0.2
        circleS = {
            sl.strokeEnd = $0
            if $0==1.0 {
                UIView.animate(withDuration: 0.5, animations: {
                    self.alpha = 0.0
                    self.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
                }, completion: { (finished) in
                    self.removeFromSuperview()
                })
            }
        }
        hudView.layer.addSublayer(sl)
    }

}
