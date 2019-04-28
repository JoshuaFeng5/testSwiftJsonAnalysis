//
//  PureCodeCardView.swift
//  testPresentV
//
//  Created by 冯午阳 on 2019/4/26.
//  Copyright © 2019 冯午阳. All rights reserved.
//

import UIKit
import SnapKit

@IBDesignable
class PureCodeCardView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
 
    
    
   
     var jsonStr:String!
    
    //定义返回检索字段
    typealias ReturnJSONStr = ((_ JSONstr: String) ->())
    
    var returnJSONStr: ReturnJSONStr?
    //写个方法方便调用
    func returnJSONStrF(funcc:@escaping ReturnJSONStr)  {
        self.returnJSONStr = funcc
    }
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame);
         self.uiCreat()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder);
        
        self.uiCreat();
        
    }
    
    
    
    
    func uiCreat()  {
        
        
        self.addSubview(leftlb);
        leftlb.snp.makeConstraints { (m) in
            m.left.equalTo(4);
            m.centerY.equalTo(self);
            m.height.equalTo(20);
        }
        
        self.addSubview(rightLb);
        rightLb.snp.makeConstraints { (mak) in
            mak.right.equalTo(-4);
            mak.centerY.equalTo(self);
            mak.height.equalTo(20);
        }
        
   
        self.addSubview(testBt);
        testBt.snp.makeConstraints { (mak) in
            mak.centerX.equalTo(self);
            mak.bottom.equalTo(self);
            mak.width.equalTo(80);
            mak.height.equalTo(44);
        }
        testBt.addTarget(self, action: #selector(textBtAction(bt:)), for: UIControl.Event.touchUpInside);
        
        
    }
    

    // MARK: - actions
    
    
    @objc func textBtAction(bt:UIButton)  {
        
        //获取当前时间, 然后记录 ,等闭包完成h以后, 记录时间
        let startTime = CFAbsoluteTimeGetCurrent();
        
        if let needBlock = self.returnJSONStr {
            needBlock("不传值也可以");
        }
        
        let endTime = CFAbsoluteTimeGetCurrent();
        
        self.rightLb.text = "耗时 \(endTime - startTime)s"
        
    }
    
    
    
    
    
    //@IBInspectable关键字用来声明一个属性，可以在interface builder上修改该属性，就可以实时渲染border的变化
    @IBInspectable var borderColor: UIColor = UIColor.black {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var newBackgroundColor: UIColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1) {
        didSet {
            backgroundColor = newBackgroundColor
        }
    }
    
    
    @IBInspectable var leftText:String = "" {
        didSet{
            leftlb.text = leftText;
        }
    }
    
    
    
    // MARK: - lazyLoads
    
    
    lazy var leftlb: UILabel = {
        let label:UILabel = UILabel()
        label.text = "默认文字"
        return label
    }()
    
    lazy var rightLb: UILabel = {
        let label:UILabel = UILabel()
        label.text = "使用时间"
        label.textAlignment = .right;
        return label
    }()
    
    
    lazy var testBt: UIButton = {
        let bt :UIButton = UIButton.init(type: .system);
        bt.setTitle("开始测试", for: UIControl.State.normal);
        return bt;
    }()
    
    
    
    // MARK: - deinit
    
    deinit {
        print("某了xxxx\(self.hashValue)");
    }
}
