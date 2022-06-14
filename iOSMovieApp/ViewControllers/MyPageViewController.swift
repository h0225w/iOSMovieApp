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
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var logoutBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }

    @IBAction func kakaoLogin(_ sender: Any) {
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

    @IBAction func logout(_ sender: Any) {
        print(#function)
    }
}

// MARK: extension
private extension MyPageViewController {
    func setupLayout() {
        nickNameLabel.isHidden = true
        logoutBtn.isHidden = true
    }
}
