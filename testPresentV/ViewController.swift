//
//  ViewController.swift
//  testPresentV
//
//  Created by 冯午阳 on 2019/4/16.
//  Copyright © 2019 冯午阳. All rights reserved.
//

import UIKit
import HandyJSON
import PromiseKit
import CoreLocation

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let bt = UIButton.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100));
        self.view.addSubview(bt);
        bt.setTitle( "present", for: UIControl.State.normal)
        bt.backgroundColor = UIColor.red;
        bt.addTarget(self, action: #selector(presentVC), for: UIControl.Event.touchUpInside);
        
        self.creatBt2();creatBt3();
        
        view.backgroundColor = UIColor.white;
        
        Solution.setNewOrientation(fullScreen: false);
    }
    
    
    func creatBt2()  {
        let bt = UIButton.init(frame: CGRect.init(x: 100, y: 200, width: 100, height: 100));
        self.view.addSubview(bt);
         bt.setTitle( "pushVC", for: UIControl.State.normal)
        bt.backgroundColor = UIColor.cyan;
        bt.addTarget(self, action: #selector(pushVC), for: UIControl.Event.touchUpInside);
    }
    
    func creatBt3()  {
        let bt = UIButton.init(frame: CGRect.init(x: 100, y: 300, width: 200, height: 100));
        self.view.addSubview(bt);
        bt.setTitle( "testJSonSpeed", for: UIControl.State.normal)
        bt.backgroundColor = UIColor.cyan;
        bt.addTarget(self, action: #selector(testSpeed), for: UIControl.Event.touchUpInside);
    }
    
    @objc func presentVC()  {
        self.present(PresentViewController(), animated: true, completion: nil);
    }
    
    @objc func pushVC()  {
        let vc = ViewController();
        vc.hidesBottomBarWhenPushed = true;
        self.navigationController?.pushViewController(vc ,animated: true)
    }
    
    @objc  func testSpeed()  {
        
        
        
        
        
        
        
        
        let jsonStr  = """
       {
       "username": "yuhanle",
       "age": 18,
       "weight": 65.4,
       "sex": 1,
       "location": "Toronto, Canada",
       "three_day_forecast": [
        {
            "conditions": "Partly cloudy",
            "day": "Monday",
            "temperature": 20
        },
        {
            "conditions": "Showers",
            "day": "Tuesday",
            "temperature": 22
        },
        {
            "conditions": "Sunny",
            "day": "Wednesday",
            "temperature": 28
        }
       ]
       }
       """
        let vc:THirdViewViewController =    THirdViewViewController();
        vc.jsnStr = jsonStr;
        vc.title = "测试json解析速度"
        vc.hidesBottomBarWhenPushed = true;
        self.navigationController?.pushViewController(vc ,animated: true)
        
    }
    
    
    // MARK: - 测试信号量
    let urlStr:String = "http://fhero.cn/index.php?m=home&c=index&a=checkSuxiniotIosIsUpdate"
    // MARK: - promidTest
    func textOthers()  {
//        UIApplication.shared.isNetworkActivityIndicatorVisible = true
//       
//        let fetchImage = URLSession.shared.dataTask(.promise, with: urlStr).compactMap{ UIImage(data: $0.data) }
//        let fetchLocation = CLLocationManager.requestLocation().lastValue
//        
//        firstly {
//            when(fulfilled: fetchImage, fetchLocation)
//            }.done { image, location in
//                self.imageView.image = image
//                self.label.text = "\(location)"
//            }.ensure {
//                UIApplication.shared.isNetworkActivityIndicatorVisible = false
//            }.catch { error in
//                self.show(UIAlertController(for: error), sender: self)
//        }
        
    }
    
    
    func promise3() -> Promise<Int> {
        return after(.seconds(1)).map{ 3 }
    }
    


}





class Solution {
    
    
  
    
    
    
   class  func setNewOrientation(fullScreen:Bool)  {
    

    
      let appDelegate = UIApplication.shared.delegate as! AppDelegate;
       appDelegate.allowRotation = fullScreen;
        if fullScreen {
            let resetOrientationTarget = NSNumber.init(value: UIInterfaceOrientation.unknown.rawValue);
            UIDevice.current.setValue(resetOrientationTarget, forKey: "orientation");
            let orientationTarget = NSNumber.init(value: UIInterfaceOrientation.landscapeLeft.rawValue);
            UIDevice.current.setValue(orientationTarget, forKey: "orientation");
        }else{
            let resetOrientationTarget = NSNumber.init(value: UIInterfaceOrientation.unknown.rawValue);
            UIDevice.current.setValue(resetOrientationTarget, forKey: "orientation");
            let orientationTarget = NSNumber.init(value: UIInterfaceOrientation.portrait.rawValue);
            UIDevice.current.setValue(orientationTarget, forKey: "orientation");
        }
        
    }
    
    
    
    
    func doMOdel<T:HandyJSON>(model:T)  {
        print("\(model.toJSONString() ?? "xx")")
    }
    
    
}

struct testModle:HandyJSON {
    var name:NSString?
    
}




