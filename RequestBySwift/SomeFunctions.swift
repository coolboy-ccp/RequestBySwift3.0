//
//  SomeFunctions.swift
//  RequestBySwift
//
//  Created by 储诚鹏 on 16/12/29.
//  Copyright © 2016年 RUIYI. All rights reserved.
//

import UIKit

@discardableResult

//屏幕bounds
func Mbounds() -> CGRect {
    return UIScreen.main.bounds
}

//屏幕size
func Msize() -> CGSize {
    return Mbounds().size
}

//屏幕宽
func Mwidth() -> CGFloat {
    return Msize().width
}

//屏幕高
func Mheight() -> CGFloat {
    return Msize().height
}

//屏幕中心
func Mcenter() -> CGPoint {
    return CGPoint.init(x: Mwidth() / 2, y: Mheight() / 2)
}

