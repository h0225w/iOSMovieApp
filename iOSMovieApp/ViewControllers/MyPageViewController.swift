//
//  MyPageViewController.swift
//  iOSMovieApp
//
//  Created by 박현우 on 2022/06/14.
//

import UIKit
import KakaoSDKUser

class MyPageViewController: UIViewController {
    @IBOutlet weak var kakaoLoginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
