//
//  WangUIViewController.swift
//  WangSwift
//
//  Created by swift on 2017/9/11.
//  Copyright © 2017年 王家伟. All rights reserved.
//

import UIKit

//代理模式: 1.@objc 2.:class
protocol WangProtocol: class {
    func wangProtocolChangeName(name: String)
}

//闭包名称：{ (parameters) -> returnType in statement }
typealias WangButtonClosures = (String, String) -> ()

/// 简单的UI控件
class WangUIViewController: UIViewController {
    
    weak var delegate: WangProtocol?
    
    //var newClosure: ((String) -> ())?
    
    var myButtonClosures: WangButtonClosures?
    /* 或者使用实例方法调用（方法名字不固定，但参数是必须的） 不推荐
    func setMyButtonClosures(tempClose: @escaping WangButtonClosures)  {
        self.myButtonClosures = tempClose
    }
     */
    
    var myScroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "UI代码详细"
        self.view.backgroundColor = .white
        
        make_scrollview()
        make_label()
        make_imageview()
        make_button()
        make_textfield()
        make_textView()
        make_actionSheet()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - 滚动视图
    func make_scrollview() {
        myScroll = UIScrollView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        myScroll.contentSize = CGSize(width: self.view.frame.size.width, height: 1000.0)
        myScroll.backgroundColor = .groupTableViewBackground
        self.view.addSubview(myScroll)
    }
    
    // MARK: - 文本
    func make_label() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        label.text = "这年头傻逼真多"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        self.myScroll.addSubview(label)
    }
    
    // MARK: - 图片
    func make_imageview() {
        let imageView = UIImageView.init(frame: CGRect(x: 0, y: 50, width: 100, height: 100))
        imageView.image = UIImage(named: "test")
        self.myScroll.addSubview(imageView)
    }
    
    // MARK: - 按钮
    func make_button() {
        let btn = UIButton(frame: CGRect(x: 0, y: 150, width: 100, height: 50))
        btn.backgroundColor = .yellow
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("按钮", for: .normal)
        btn.setTitle("点击", for: .highlighted)
        btn.addTarget(self, action: #selector(btnTap(_:)), for: .touchUpInside)
        self.myScroll.addSubview(btn)
    }
    
    //@objc
    @objc func btnTap(_ mybtn: UIButton) {
        print(mybtn.titleLabel?.text ?? "无值")
        print("点击了按钮")
        self.myButtonClosures!("修改了UI图形标题", "多参数")
        make_alert()
    }
    
    
    // MARK: - 输入框
    func make_textfield() {
        let textField = UITextField(frame: CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: 50))
        textField.placeholder = "请输入一些内容"
        self.myScroll.addSubview(textField)
    }
    
    // MARK: - 文本框
    func make_textView() {
        let textView = UITextView(frame: CGRect(x: 0, y: 250, width: self.view.frame.size.width, height: 50))
        textView.text = "sakhfjkhadsjfhjasdhfjhadsjklfhuhc vkjhuahdsfuhakdshfluasdhfjklhasdjklfhjalskdfhsakdljfhalskdjhfusadhfkhasdjkfhjkalsdhflkajsdhfjklasdhfljaksdhflkjasdhfajksdhffuiwhqeiucbqwuiebvquywegrwbcuqwe"
        self.myScroll.addSubview(textView)
    }
    
    // MARK: - 弹出框
    func make_alert() {
        let alert = UIAlertController(title: "提示", message: "提示框界面", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "确定", style: .default, handler: { (_: UIAlertAction) in
            print("点击确定按钮")
            self.delegate?.wangProtocolChangeName(name: "我想要改变的_王家伟")
        }))
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { (_: UIAlertAction) in
            print("点击取消按钮")
        }))
        self.present(alert, animated: true) {
            
        }
    }
    
    // MARK: - 弹出选择框
    func make_actionSheet() {
        let actionSheet = UIAlertController(title: "标题", message: "显示的信息", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "底部默认", style: .default, handler: { (_: UIAlertAction) in
            print("sheet底部弹窗")
        }))
        actionSheet.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { (_: UIAlertAction) in
            print("取消")
        }))
        self.present(actionSheet, animated: true) {
            
        }
    }
    
    
    //用来做UnitTest的方法
    func wangUnitTest() -> Int {
        var total = 0
        for i in 0...100 {
            total += i
        }
        return total
    }
}
