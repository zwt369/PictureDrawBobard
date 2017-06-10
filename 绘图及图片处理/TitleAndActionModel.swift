//
//  TitleAndActionModel.swift
//  绘图及图片处理
//
//  Created by Tony Zhang on 17/5/15.
//  Copyright © 2017年 Tony Zhang. All rights reserved.
//

import UIKit



class TitleAndActionModel: NSObject {

    var title = ""
    var action:Selector!

    class func modelWith(title:String,action:Selector) -> TitleAndActionModel{
        let model = TitleAndActionModel()
        model.title = title
        model.action = action
        return model
    }
    
}
