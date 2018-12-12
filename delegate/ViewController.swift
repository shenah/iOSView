//
//  ViewController.swift
//  delegate
//
//  Created by 503-03 on 2018. 11. 5..
//  Copyright © 2018년 shenah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var text: UITextField!
    
    //nil을 저장할 수 있도록 생성
    //!를 추가해서 생성했으므로 사용을 할 때는 !를 붙일 필요가 없습니다.
     var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //텍스트 필드에서 이벤트가 발생하면 메소드가 실행됩니다.
        text.delegate = self
        //이미지 뷰에 출력할 Image 생성
        let image = UIImage(named: "m.jpg")
        //이미지를 이용해서 ImageView 생성
        imgView = UIImageView(image: image!)
        //이미지 뷰 크기를 가져오기
        let imageSize = imgView.frame.size
        //스크롤 뷰 전테 크기로 생성
        let scrollView = UIScrollView(frame: UIScreen.main.bounds)
        //이미지 뷰가 스크롤이 가능하도록 설정 (터치 사용 가능 여부 설정)
        scrollView.isScrollEnabled = true
        //스크롤 뷰의 화면 크기 설정
        scrollView.contentSize = imageSize
        //스크롤 뷰 위에 이미지 뷰 추가
        scrollView.addSubview(imgView)
        //스크롤 뷰를 영역 밖으로 스크롤 할 수 없도록 하는 속성 설정
        //줌 설정
        scrollView.bounces = false
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 2.0
        scrollView.delegate = self
        //현재 뷰 컨트롤러의 뷰에 추가
        self.view.addSubview(scrollView)
    }
}

extension ViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        print("리턴키를 눌렀습니다.")
        return true
    }
}

//줌이 실행될 뷰를 지정하는 메소드
//리턴하는 뷰에서 줌이 구현합니다.
extension ViewController : UIScrollViewDelegate{
    func viewForZooming(in scrollView: UIScrollView) -> UIView?{
        return imgView
    }
}

