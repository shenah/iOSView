//
//  ViewController.swift
//  View
//
//  Created by 503-03 on 2018. 11. 5..
//  Copyright © 2018년 shenah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //이미지 뷰에 출력할 UIImage 배열 : 인스턴스를 생성해서 대입
    var imgArray = [UIImage]()
    
    //현재 출력 중인 이미지의 인데스를 저장할 변수
    var i : Int?
    
    //애니메이션 속도
    var speed : Float?
    

    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var imgpage: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func changeSpeed(_ sender: Any) {
        //변화된 슬라이더의 값을 speed에 저장
        speed = slider.value
        //애니메이션 중 일 때는 애니메이션을 멈추고 값을 적용한 다음에 다시 시작
        if imgview.isAnimating{
            imgview.stopAnimating()
            imgview.animationDuration = TimeInterval(speed!)
            imgview.startAnimating()
        }
    }
    @IBAction func play(_ sender: Any) {
        if imgview.isAnimating == true{
            imgview.stopAnimating()
            (sender as! UIButton).setTitle("시작", for:.normal)
        }else{
            //애니메이션 시간 설정
            imgview.animationDuration = TimeInterval(speed!)
            //애니메이션 시작
            imgview.startAnimating()
            //이벤트가 발생한 인스턴스의 타이틀 변경
            (sender as! UIButton).setTitle("중지", for: .normal)
        }
    }
    @IBAction func prev(_ sender: Any) {
        i = i! - 1
        if i!<0{
            i = imgArray.count - 1
        }
        imgview.image = imgArray[i!]
        imgpage.text = "\(i!+1)/\(imgArray.count)"
    }
    
    @IBAction func next(_ sender: Any) {
        i = i! + 1
        if i!>=imgArray.count{
            i = 0
        }
        imgview.image = imgArray[i!]
        imgpage.text = "\(i!+1)/\(imgArray.count)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for x in 1...3{
            //nil를 리턴할 가능성이 있는 메소드를 호출한 경우
            //그 결과를 저장할 Optional로 만들어 주어야 해서 변수의 자료형 뒤에 !를 붙줘야 합니다.
            let img : UIImage! = UIImage(named:"image\(x).png")
            imgArray.append(img)
        }
        
        //
        imgview.animationImages = imgArray
        i = 0
        speed = 0.5
        //초기 설정
        imgview.image = imgArray[0]
        
    }
}

