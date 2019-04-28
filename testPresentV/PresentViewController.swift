//
//  PresentViewController.swift
//  testPresentV
//
//  Created by 冯午阳 on 2019/4/16.
//  Copyright © 2019 冯午阳. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white;
    
        Solution.setNewOrientation(fullScreen: true);
        
        
        let bt = UIButton.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100));
        self.view.addSubview(bt);
        bt.setTitle("dismidd", for: UIControl.State.normal);
        bt.backgroundColor = UIColor.purple;
        bt.addTarget(self, action: #selector(dismidd), for: UIControl.Event.touchUpInside);
        
        self.view.addSubview(bt)
    }
    
    
    
    
    
    @objc func dismidd()  {
        
        let or = UIApplication.shared.statusBarOrientation;
        print(" UIApplication.shared.statusBarOrientation --> \(or)")
        
         Solution.setNewOrientation(fullScreen: false);
        self.dismiss(animated: true) {
            let or = UIApplication.shared.statusBarOrientation;
            print(" UIApplication.shared.statusBarOrientationxxx --> \(or)")
        }
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
