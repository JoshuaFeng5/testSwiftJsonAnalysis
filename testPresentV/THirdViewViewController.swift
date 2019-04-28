//
//  THirdViewViewController.swift
//  testPresentV
//
//  Created by 冯午阳 on 2019/4/25.
//  Copyright © 2019 冯午阳. All rights reserved.
//

import UIKit
import MJExtension
import SwiftyJSON

class THirdViewViewController: UIViewController {
    
    
    public var jsnStr:String!
    
    var maxCount:Int = 10000;
    
    @IBOutlet weak var objectMapperView: PureCodeCardView!
    
    @IBOutlet weak var handyJSONView: PureCodeCardView!
    
    @IBOutlet weak var MjExtensionView: PureCodeCardView!
    
    @IBOutlet weak var ExportStrucctView: PureCodeCardView!
    
    @IBOutlet weak var CodebleStructView: PureCodeCardView!
    
    
    @IBOutlet weak var ExportClassView: PureCodeCardView!
    
    
    @IBOutlet weak var SwiftJSONView: PureCodeCardView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        functions()
        
        
    }
    
    
    
    
    
    
    func functions()  {
        
        
        self.objectMapperView.returnJSONStrF { [weak self] (str) in
            self?.objectMapperAction()
        }
        
        
        self.handyJSONView.returnJSONStrF {[weak self] (str) in
            self?.handyJSONAction()
        }
        
        
        self.MjExtensionView.returnJSONStrF {[weak self] (str) in
            self?.mjExtensionAction();
        }
        
        self.ExportStrucctView.returnJSONStrF {[weak self] (str) in
            self?.exportStructAction();
        }
        
        
        self.ExportClassView.returnJSONStrF {[weak self] (sss) in
            self?.exportClassAction();
        }
        
        
        self.CodebleStructView.returnJSONStrF {[weak self] (xx) in
            self?.exportStrutCodableAction();
        }
        
        
        self.SwiftJSONView.returnJSONStrF {[weak self] (xx) in
            self?.exportSwiftJSONAction()
        }
        
    }
    
    
    
    ///objectMapper
    func objectMapperAction()  {
        
        var model:ObjectMapperModel?
        
        for _ in 0...maxCount {
            
            model = ObjectMapperModel.init(JSONString: self.jsnStr);
            
        }
        
        if let printMd = model {
            print("objectMapperAction\(String(describing: printMd.toJSONString(prettyPrint: true)))");
            for innsideModel in printMd.threeDayForecast! {
                print("打印所有model--->\(innsideModel)")
            }
        }
        
        
    }
    
    func handyJSONAction()  {
        var model:HandyJsonModel?
        
        for _ in 0...maxCount {
            
            model = HandyJsonModel.deserialize(from: self.jsnStr);
            
        }
        
        if let printMd = model {
            print("handyJSONAction\(printMd.toJSONString(prettyPrint: true) ?? "x")");
            for innsideModel in printMd.three_day_forecast! {
                print("打印所有model--->\(innsideModel)")
            }
        }
        
    }
    
    func mjExtensionAction()  {
        var model:MjExtensionModel?
        var newStr:String?
        for _ in 0...maxCount {
            newStr =  self.jsnStr
            MjExtensionModel.mj_setupObjectClass { () -> [AnyHashable : Any]? in
                
                return ["three_day_forecast":"Mjthree_day_forecastModel"]
            }
            model = MjExtensionModel.mj_object(withKeyValues: newStr);
            
        }
        
        if let printMd = model {
            print("仅仅是为了用深拷贝\(String(describing: newStr)) ")
            print("mjExtensionAction\(String(describing: printMd.mj_keyValues()))");
            
            for innsideModel in printMd.three_day_forecast! {
                print("打印所有model--->\(innsideModel)")
            }
        }
    }
    
    
    func exportStructAction()  {
        var model:ExportStructModel?
        
        
        //        let dic = JSON.init(parseJSON: self.jsnStr).dictionaryObject!;
        //        let dic = self.stringValueDic(self.jsnStr)!
        for _ in 0...maxCount {
            let dic = self.stringValueDic(self.jsnStr)!
            model = ExportStructModel.init(fromDictionary: dic);
            
        }
        
        if let printMd = model {
            print("mjExtensionAction\(String(describing: printMd.toDictionary()))");
            for innsideModel in printMd.threeDayForecast! {
                print("打印所有model--->\(innsideModel)")
            }
        }
    }
    
    
    
    func exportStrutCodableAction()  {
        var model:ExportStructCodableModel?
        
        
        //        let dic = JSON.init(parseJSON: self.jsnStr).dictionaryObject!;
        
        let decoder = JSONDecoder()
        
        for _ in 0...maxCount {
            let data = self.jsnStr.data(using: String.Encoding.utf8)!;
            model = try! decoder.decode(ExportStructCodableModel.self, from: data) ;
            
        }
        
        if let printMd = model {
            print("exportStrutCodableAction\(printMd))");
            for innsideModel in printMd.threeDayForecast! {
                print("打印所有model--->\(innsideModel)")
            }
        }
    }
    
    func exportClassAction()  {
        var model:ExportClassModel?
        
        //          let dic = self.stringValueDic(self.jsnStr)!
        
        for _ in 0...maxCount {
            let dic = self.stringValueDic(self.jsnStr)!
            model = ExportClassModel.init(fromDictionary: dic);
            
        }
        if let printMd = model {
            print("mjExtensionAction\(String(describing: printMd.toDictionary()))");
            for innsideModel in printMd.threeDayForecast! {
                print("打印所有model--->\(innsideModel)")
            }
        }
    }
    
    
    func exportSwiftJSONAction()  {
        var model:SwiftJsonModel?
        for _ in 0...maxCount {
            model = SwiftJsonModel.init(fromJson: JSON.init(parseJSON: self.jsnStr));
        }
        
        if let printMd = model {
            print("mjExtensionAction\(String(describing: printMd.toDictionary()))");
            for innsideModel in printMd.threeDayForecast! {
                print("打印所有model--->\(innsideModel)")
            }
        }
    }
    
    
    
    
    
    // MARK: - subFunction
    
    // MARK: 字典转字符串
    func dicValueString(_ dic:[String : Any]) -> String?{
        let data = try? JSONSerialization.data(withJSONObject: dic, options: [])
        let str = String(data: data!, encoding: String.Encoding.utf8)
        return str
    }
    
    // MARK: 字符串转字典
    func stringValueDic(_ str: String) -> [String : Any]?{
        let data = str.data(using: String.Encoding.utf8)
        if let dict = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : Any] {
            return dict
        }
        return nil
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
