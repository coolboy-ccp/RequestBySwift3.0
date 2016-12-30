//
//  LoginVC.swift
//  RequestBySwift
//
//  Created by 储诚鹏 on 16/12/28.
//  Copyright © 2016年 RUIYI. All rights reserved.
//

import UIKit
import Alamofire


class LoginVC: UIViewController {

    var descriptionLabel : UILabel?
    var strL : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubviews()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    func initSubviews() {
        view.backgroundColor = UIColor.init(red: 50 / 255, green: 50 / 255, blue: 30 / 255, alpha: 0.8)
        descriptionLabel = UILabel.init(frame: CGRect.init(x: 20, y: 50, width: 200, height: 21))
        descriptionLabel?.textColor = UIColor.white
        descriptionLabel?.numberOfLines = 0
        descriptionLabel?.lineBreakMode = .byCharWrapping
        view.addSubview(descriptionLabel!)
        animationForLabel()
        let loginBtn = UIButton.init(type: .custom)
        loginBtn.center = CGPoint.init(x: Mcenter().x, y: Mcenter().y + 150)
        loginBtn.bounds = CGRect.init(x: 0, y: 0, width: 300, height: 40)
        loginBtn.setTitle("login in", for: .normal)
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.backgroundColor = UIColor.clear
        loginBtn.layer.borderWidth = 1.0
        loginBtn.layer.borderColor = UIColor.white.cgColor
        loginBtn.layer.cornerRadius = 20
        loginBtn.addTarget(self, action: #selector(self.loginAction), for: .touchUpInside)
        view.addSubview(loginBtn)
        let manV = DrawAMan.init(frame: Mbounds())
        view.addSubview(manV)
    }

    
    func loginAction() {
        let hud = MyHud.init(frame: Mbounds())
        view.addSubview(hud)
        basePost("http://jfb.yuemanyp.com/api/pri/member/old_age_pension/loginPension?mobile=13761605199&token=a38d41ee-f788-4d28-8e76-29e00fc95069", sBlock: { (response) in
             hud.circleS!(1.0)
            debugPrint(response)
        }) { (error) in
            debugPrint(error)
        }
    }

    func animationForLabel() {
        let str = "衣带渐宽终不悔"
        let sindex = str.startIndex
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (timer) in
            if self.strL <= str.characters.count  {
                let index = str.index(sindex, offsetBy: self.strL)
                self.descriptionLabel?.text = str.substring(to: index)
                self.strL += 1
            }
            else {
                timer.invalidate()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
