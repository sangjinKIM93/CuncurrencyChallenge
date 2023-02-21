//
//  AppDelegate.swift
//  CuncurrencyChallenge
//
//  Created by 광리자 on 2023/02/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }


}

// 사전 과제 설명 링크: https://yagomacademy.notion.site/iOS-2-3f670cc9788f4384b000bfe940447d59

// ** 요구사항
// 웹의 이미지를 다운로드 받는다.
// 다 다운된 이미지는 화면에 띄운다.
// progress로 다운로드 형황을 보여준다.
// 전체 다 다운 받는 버튼도 있다.

// ** 구현 아이디어
// tableView 구조로 만들기
// 이미지 다운 어땋게 하지? -> URLSession
// 이미지 프로그래스 어떻게 하지? -> URLSesison Delegate에 뭔가 있다. https://medium.com/swlh/tracking-download-progress-with-urlsessiondownloaddelegate-5174147009f

// ** 구현 순서
// 1. tableView
// 2. 이미지 다운
// 3. 이미지 프로그레스
// 4. 이미지 전체 다운
