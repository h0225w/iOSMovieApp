//
//  ViewController.swift
//  iOSMovieApp
//
//  Created by 박현우 on 2022/06/13.
//

import UIKit
import KakaoSDKUser

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func kakaoLoginTest(_ sender: Any) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("loginWithKakaoTalk() success.")

                        //do something
                        _ = oauthToken
                    }
            }
        }
    }
    
}

