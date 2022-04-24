//
//  Okashi.swift
//  MyOkashi
//
//  Created by 高木克 on 2022/04/24.
//

import Foundation

//お菓子データ検索用クラス
class OkashiData: ObservableObject {
    
//    Web API検索用メソッド 第一引数: keyword 検索したいワード, async:非同期設定
    func searchOkashi(keyword: String) async {
//        デバッグエリアに出力
        print(keyword)
    }
}
