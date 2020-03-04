//
//  SymbolIcon.swift
//  MACUT
//
//  Created by 佘志伟 on 2020/3/5.
//  Copyright © 2020 动息科技. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    
    func setSFIcon( name:String ){
        
        self.image = UIImage.SFIcon(name: name)
    }
}


extension UIImage{
    
    static func SFIcon( name:String ) -> UIImage?{
        
        var icon:UIImage?
        if #available(iOS 13.0, *) {
            icon = UIImage( systemName: name )
        } else {
            icon = UIImage( named: name )?.withRenderingMode(.alwaysTemplate)
        }
        return icon
    }
}

extension UIButton{
    
    /**
    Set a SF Symbol on a button with auto layout
    设置按钮中的图片图标 (只考虑图标在文字左侧)
    1 拿到button大小
     Get size of the button
    2 拿到label大小
     Get size of the text label or zero
    3 拿到期望图标大小 / 计算最佳大小 ( 图标大小不能超过按钮 2/3高度, 只考虑正方形图标容器 )
     Get size or auto compute ( limited to 2/3 of button height )
    4 计算间隙 ( 图标默认离文字要有 1/5 的距离 )
     caculate inset ( icon should have 1/5 right margin )
     */
    func setSFIcon( name:String, size:CGFloat? = nil ){

        var icon:UIImage?
                    
        if #available(iOS 13.0, *) {
            icon = UIImage.SFIcon(name: name)
            self.setImage(icon, for: .normal)
        }else{
            icon = UIImage.SFIcon(name: name)
            let buttonSize = self.size
            let labelSize  = self.titleLabel?.size ?? CGSize(width: 0, height: 0)
            var bestSize:CGFloat

            if size != nil{
                bestSize   = size! > (buttonSize.height * 2) / 3 ? (buttonSize.height * 2) / 3 : size!
            }else{
                bestSize   = 1.2 * labelSize.height
            }
            
            let left   = (buttonSize.width - 1.2 * bestSize - labelSize.width) / 2
            let right  = (buttonSize.width - left - (bestSize * 1.2 ) )
            let hInset = (buttonSize.height - bestSize) / 2

            self.imageEdgeInsets = UIEdgeInsets(top: hInset, left: left, bottom: hInset, right: right)
            self.imageView?.contentMode = .scaleAspectFit
            
            self.setImage( icon, for: .normal)
        }

    }
}
