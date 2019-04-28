//
//  OneMOdelSpeadCardView.swift
//  testPresentV
//
//  Created by 冯午阳 on 2019/4/26.
//  Copyright © 2019 冯午阳. All rights reserved.
//

import UIKit



class OneMOdelSpeadCardView: UIView {


    
    @IBOutlet weak var modelName: UILabel!
    
    @IBOutlet weak var timeCount: UILabel!
    
    
    @IBOutlet weak var timeStartButton: UIButton!
    
    
    fileprivate var backV:UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib();
        print("执行你了吗awakeFromNib")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.uiCreat();
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
   
        print("执行你了吗init?(coder aDecoder");
   
        self.uiCreat()
    }
    
    
    func uiCreat()  {
        let coverV = OneMOdelSpeadCardView.ViewNew();
        self.backV = coverV;
        coverV.frame = CGRect.init(origin: CGPoint.zero, size: frame.size);
        self.addSubview(coverV)
    }
    
    class func ViewNew() -> UIView {
        
        let reallSelfClass = type(of: self);
        let classStrArr = "\(reallSelfClass)".components(separatedBy: ".");
        print("\(classStrArr)");
        return Bundle.main.loadNibNamed("OtherXib", owner: nil, options: nil)!.last as! UIView
        
    }
    
}
