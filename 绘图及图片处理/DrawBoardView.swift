//
//  DrawBoardView.swift
//  绘图及图片处理
//
//  Created by Tony Zhang on 17/5/18.
//  Copyright © 2017年 Tony Zhang. All rights reserved.
//

import UIKit

 enum DrawType:Int {
    /**画线*/
    case line
    /**画弧*/
    case arc
    /**画矩形*/
    case square
    /**画扇形*/
    case sector
    /**画椭圆*/
    case oval
}


class DrawBoardView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /** 显示类型 */
    var drawType : DrawType = .line
    //作用:专门用绘图
    //什么时候调用:在View显示的时候调用
    //rect:当前View的bounds
    override func draw(_ rect: CGRect) {
        switch drawType {
        case .line:
           drawLine()
        case .arc:
            drawArc()
        case .square:
            drawSquare()
        case .sector:
            drawSector()
        default:
            drawOval()
        }
    }
    
    
    func drawLine() {
        
        //1.取得一个跟View相关联的上下文.
        let ctx = UIGraphicsGetCurrentContext()
        //2.描述路径
        let path = UIBezierPath()
        //2.1.设置起点
        path.move(to: CGPoint(x: 10, y: 100))
        //2.1.添加一根线到某个点
        path.addLine(to: CGPoint(x: 200, y: 20))
        //把上一条线的终点当作是下一条线的起点.
        path.addLine(to: CGPoint(x: 150, y: 200))
        //设置上下文的状态
        //设置线的宽度
        ctx?.setLineWidth(10)
        //设置线的连接样式
        ctx?.setLineJoin(.bevel)
        //设置顶角的样式
        ctx?.setLineCap(.round)
        //设置线的颜色
        UIColor.green.setStroke()
        //3.把路径添加到上下文
        ctx?.addPath(path.cgPath)
        //4.把上下文的内容显示View fill stroke
        ctx?.strokePath()
    }
    
    func drawArc() {
        //1.获取跟View相关联的上下文
        let ctx = UIGraphicsGetCurrentContext()
        //2.描述路径
        let path = UIBezierPath()
        //2.1设置起点
        path.move(to: CGPoint(x: 20, y: 200))
        //2.2添加一条曲线到某个点.
        path.addQuadCurve(to: CGPoint(x: 200, y: 200), controlPoint: CGPoint(x: 100, y: 10))
        ctx?.setLineWidth(10)
        //3.把路径添加到上下文
        ctx?.addPath(path.cgPath)
        //4.把上下文的内容显示出来.
        ctx?.strokePath()
    }
    
    func drawSquare() {
        //画矩形.
        //1.获取上下文
        let ctx = UIGraphicsGetCurrentContext();
        //2.描述路径
        let path = UIBezierPath(rect: CGRect(x: 50, y: 50, width: 100, height: 100))
        //3.把路径添加到上下文
        ctx?.addPath(path.cgPath)
        UIColor.yellow.set()
        //4.把上下文的内容显示
        ctx?.fillPath()
    }
    
    func drawSector() {
        let center = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        //ArcCenter:圆心
        //radius:圆的半径
        //startAngle:开始角度//起始点圆的最右侧.
        //endAngle:截至角度
        //clockwise:顺时针还是逆时针 YES:顺时针 NO:逆时针
        let path = UIBezierPath(arcCenter:center, radius: self.frame.size.height/2-10, startAngle: 0, endAngle: -(CGFloat)(M_PI_2), clockwise: false)
        path.addLine(to: center)
        path.close()
        UIColor.blue.set()
        //fill,会自动把路径给关闭
        path.fill()
    }

    
    func drawOval() {
         // MARK: - 宽高相同为圆形
       let path = UIBezierPath(ovalIn: CGRect(x: 10, y: 10, width: 200, height: 150))
            path.close()
        UIColor.blue.set()
         //fill,会自动把路径给关闭
        path.fill()
    }
    
    
}
