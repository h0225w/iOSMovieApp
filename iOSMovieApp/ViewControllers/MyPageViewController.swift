//
//  MyPageViewController.swift
//  iOSMovieApp
//
//  Created by 박현우 on 2022/06/14.
//

import UIKit
import KakaoSDKUser
import KakaoSDKAuth
import KakaoSDKCommon

class MyPageViewController: UIViewController {
    @IBOutlet weak var kakaoLoginBtn: UIButton!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var logoutBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        kakaoLoginCheck()
    }
    
    // MARK: 카카오 로그인 > 카카오톡으로 로그인
    @IBAction func kakaoLogin(_ sender: Any) {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")

                    //do something
                    _ = oauthToken
                    
                    self.getKakaoUserInfo()
                }
            }
    }

    // MARK: 카카오 로그인 > 로그아웃
    @IBAction func logout(_ sender: Any) {
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
                self.updateView(false)
            }
        }
    }
}

// MARK: - extension
private extension MyPageViewController {
    // MARK: View 설정
    func setupView() {
        nickNameLabel.isHidden = true
        logoutBtn.isHidden = true
    }
    
    func updateView(_ logined: Bool) {
        self.nickNameLabel.isHidden = !logined ? true : false
        self.logoutBtn.isHidden = !logined ? true : false
        self.kakaoLoginBtn.isHidden = logined ? true : false
    }
    
    // MARK: 카카오 로그인 > 로그인 체크
    func kakaoLoginCheck() {
        if (AuthApi.hasToken()) {
            UserApi.shared.accessTokenInfo { (_, error) in
                if let error = error {
                    if let sdkError = error as? SdkError, sdkError.isInvalidTokenError() == true  {
                        //로그인 필요
                        print(sdkError)
                    } else {
                        //기타 에러
                        print(error)
                    }
                    self.updateView(false)
                } else {
                    //토큰 유효성 체크 성공(필요 시 토큰 갱신됨)
                    self.updateView(true)
                }
            }
        } else {
            //로그인 필요
            self.updateView(false)
        }
    }
    
    // MARK: 카카오 로그인 > 사용자 정보
    func getKakaoUserInfo() {
        UserApi.shared.me { (user, error) in
            if let error = error {
                print(error)
            } else {
                print("me() success.")
                
                let nickname = user?.kakaoAccount?.profile?.nickname ?? ""
                
                self.nickNameLabel.text = "\(nickname)님"
                self.updateView(true)
            }
        }
    }
}
