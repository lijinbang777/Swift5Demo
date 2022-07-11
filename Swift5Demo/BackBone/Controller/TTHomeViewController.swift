//
//  TTHomeViewController.swift
//  Swift5Demo
//
//  Created by jinbang.li on 2022/7/4.
//  Copyright © 2022 com.test.www. All rights reserved.
//

import UIKit
import SnapKit
class TTHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        view.backgroundColor = UIColor.yellow
//        let btn = UIButton(type: .custom)
//        btn.backgroundColor = UIColor.red
//        btn.addTarget(self, action: #selector(click), for: UIControl.Event.touchUpInside)
//        view.addSubview(btn)
//        //        btn.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
//        //        btn.center = self.view.center
//        //测试自动布局代码块
//        btn.snp_makeConstraints { make in
//            make.width.height.equalTo(120)
//            make.center.equalToSuperview().offset(0)
//        }
        
        let customView = LLCustomView()
        customView.backgroundColor = UIColor.red
        self.view.addSubview(customView)
        customView .snp_makeConstraints { make in
            make.width.height.equalTo(200)
           make.center.equalToSuperview().offset(0)
        }
        customView.llclick = { string in
            print(string)
        }
        
    }
    @objc func click(){
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: false)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class LLCustomView: UIView{
    typealias LLClick = (_ str: String) -> Void
    var llclick: LLClick?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addAction(){
        let btn = UIButton(type: .custom)
        btn.titleLabel?.text = "测试"
        btn.backgroundColor = UIColor.purple
//        btn.addTarget(self, action: #selector(actionTest(sender:)), for: UIControl.Event.touchUpInside)
        btn.addTarget(self, action:#selector(actionTest), for: UIControl.Event.touchUpInside)
        self.addSubview(btn)
        btn.snp_makeConstraints { make in
            make.width.height.equalTo(40)
            make.center.equalToSuperview().offset(0);
        }
    }
//    @objc func actionTest(sender: UIButton){
//        if self.llclick != nil  {
//            print("有参")
//        }
//    }
    @objc func actionTest(){
        if self.llclick != nil {
            self.llclick!("无参")
        }
    }
}
