//
//  ViewController.swift
//  scrollview
//
//  Created by 503-03 on 2018. 11. 5..
//  Copyright © 2018년 shenah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //스크롤 뷰를 생성
        let scrollView = UIScrollView.init(frame: CGRect.init(x:200, y:200, width:200, height:300))
        
        //스크롤 뷰에 배치될 ContentView
        //가로로 8배
        let contentView = UIView.init(frame:CGRect.init(x:0, y:0, width:1600, height:300))
        
        //내용이 되는 뷰에 이미지 뷰들을 추가
        var total = 0
        for i in 0...7{
            //x 좌표를 200씩 옮기면서 ImageView를 생성
            let imageView = UIImageView(frame: CGRect(x:total, y:0, width:200, height:300))
            total = total + 200
            imageView.image = UIImage(named:"\(i).jpg")
            contentView.addSubview(imageView)
        }
        
        //contentView를 scrollView 위에 배치
        scrollView.addSubview(contentView)
        //스크롤 뷰의 화면 사이즈 설정
        scrollView.contentSize = contentView.frame.size
        scrollView.isScrollEnabled = true
        
        //scrollView를 현재 화면 위에 배치
        //스와이프 할 때 페이지 단위로 이동하도록 설정
        scrollView.isPagingEnabled = true
        
        self.view.addSubview(scrollView)
    }


}

