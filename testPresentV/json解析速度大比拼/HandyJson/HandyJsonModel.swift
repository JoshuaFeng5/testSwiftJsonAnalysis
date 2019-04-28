//
//  HandyJsonModel.swift
//  testPresentV
//
//  Created by 冯午阳 on 2019/4/28.
//  Copyright © 2019 冯午阳. All rights reserved.
//

import HandyJSON

struct HandyJsonModel: HandyJSON {
    
    
    var username:String?
    var age = 0;
    var weight = 0.0;
    var sex = false;
    var location:String?
    var three_day_forecast:[HDJthree_day_forecast]?
    
    
    
}


struct HDJthree_day_forecast:HandyJSON {
    var conditions:String?
    var day:String?
    var temperature = 0.0
}


