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
    
//        お菓子の検索キーワードをURLエンコードする
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            else {
                return
            }
        
//        リクエストURLの組み立て
        guard let req_url = URL(string:
            "https://sysbird.jp/toriko/api/?apikey=guest&format=json&keyword=\(keyword_encode)&max=10&order=r") else {
            return
        }
        print(req_url)
    }
}
