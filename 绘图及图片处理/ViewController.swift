//
//  ViewController.swift
//  绘图及图片处理
//
//  Created by Tony Zhang on 17/5/15.
//  Copyright © 2017年 Tony Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView!
    
    /** 背景 */
    var backView : UIView = UIView(frame: UIScreen.main.bounds)
    
    /** 画板 */
    var drawBoard : DrawBoardView = DrawBoardView(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height/2-200, width: UIScreen.main.bounds.size.width, height: 400))
    
    let dataArray = [[TitleAndActionModel.modelWith(title: "直线绘制", action: #selector(pictureDrawLine)),TitleAndActionModel.modelWith(title: "圆弧绘制", action: #selector(pictureDrawArc)),TitleAndActionModel.modelWith(title: "矩形绘制", action: #selector(pictureDrawSquare)),TitleAndActionModel.modelWith(title: "扇形绘制", action: #selector(pictureDrawSector)),TitleAndActionModel.modelWith(title: "椭圆绘制", action: #selector(pictureDrawOval))],[TitleAndActionModel.modelWith(title: "图片处理", action: #selector(pictureProcess))]]

        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = UIColor.white
            title = "绘图及图片处理"
            tableView = UITableView(frame: self.view.frame, style: .grouped)
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//            tableView.separatorStyle = .none
            tableView.delegate = self
            tableView.dataSource = self
            self.view.addSubview(tableView)

            backView.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     // MARK: - tableView代理方法
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let model = dataArray[indexPath.section][indexPath.row]
        cell.textLabel?.text = model.title
        cell.selectionStyle = .none
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let backView = UIView()
        backView.backgroundColor = UIColor.lightGray
        return backView
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataArray[indexPath.section][indexPath.row]
        self.perform(model.action)
    }
    
     // MARK: - 画线
    func pictureDrawLine()  {
        UIApplication.shared.keyWindow?.addSubview(backView)
        UIApplication.shared.keyWindow?.addSubview(drawBoard)
        drawBoard.drawType = .line
        //setNeedsDisplay它会调用drawRect,它并不是立马,只是设了一个标志,当下一次屏幕刷新的调用.屏幕刷新为每秒60次
        drawBoard.setNeedsDisplay()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2){
            self.drawBoard.removeFromSuperview()
            self.backView.removeFromSuperview()
        }
    }
    
    // MARK: - 画弧
    func pictureDrawArc() {
        UIApplication.shared.keyWindow?.addSubview(backView)
        UIApplication.shared.keyWindow?.addSubview(drawBoard)
        drawBoard.drawType = .arc
        //setNeedsDisplay它会调用drawRect,它并不是立马,只是设了一个标志,当下一次屏幕刷新的调用.屏幕刷新为每秒60次
        drawBoard.setNeedsDisplay()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2){
            self.drawBoard.removeFromSuperview()
            self.backView.removeFromSuperview()
        }
    }
    
    // MARK: - 画矩形
    func pictureDrawSquare()  {
        UIApplication.shared.keyWindow?.addSubview(backView)
        UIApplication.shared.keyWindow?.addSubview(drawBoard)
        drawBoard.drawType = .square
        //setNeedsDisplay它会调用drawRect,它并不是立马,只是设了一个标志,当下一次屏幕刷新的调用.屏幕刷新为每秒60次
        drawBoard.setNeedsDisplay()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2){
            self.drawBoard.removeFromSuperview()
            self.backView.removeFromSuperview()
        }
    }
    
    // MARK: - 画扇形
    func pictureDrawSector()  {
        UIApplication.shared.keyWindow?.addSubview(backView)
        UIApplication.shared.keyWindow?.addSubview(drawBoard)
        drawBoard.drawType = .sector
        //setNeedsDisplay它会调用drawRect,它并不是立马,只是设了一个标志,当下一次屏幕刷新的调用.屏幕刷新为每秒60次
        drawBoard.setNeedsDisplay()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2){
            self.drawBoard.removeFromSuperview()
            self.backView.removeFromSuperview()
        }
    }
    
    // MARK: - 画椭圆
    func pictureDrawOval()  {
        UIApplication.shared.keyWindow?.addSubview(backView)
        UIApplication.shared.keyWindow?.addSubview(drawBoard)
        drawBoard.drawType = .oval
        //setNeedsDisplay它会调用drawRect,它并不是立马,只是设了一个标志,当下一次屏幕刷新的调用.屏幕刷新为每秒60次
        drawBoard.setNeedsDisplay()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2){
            self.drawBoard.removeFromSuperview()
            self.backView.removeFromSuperview()
        }
    }
    
    
    
    func pictureProcess()  {
        print("图片处理")
    }
    
    

}

