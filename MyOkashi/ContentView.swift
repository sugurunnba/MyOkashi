//
//  ContentView.swift
//  MyOkashi
//
//  Created by 高木克 on 2022/04/24.
//

import SwiftUI

struct ContentView: View {
//    OkashiDataを参照する状態変数,インスタンスを作成後、インスタンス変数に格納
    @StateObject var okashiDataList = OkashiData()
    
//    入力された文字列を保持する状態変数, @State:状態変数として設定(データを書き換えられる)
    @State var inputText = ""
    
    var body: some View {
        VStack {
//            $Stateで宣言した状態変数に$をつけることで、状態変数の値を参照渡しする
            TextField("キーワード", text: $inputText, prompt: Text("キーワードを入力してください"))
                .onSubmit {
//                    Taskは非同期で処理を実行できる
                    Task {
//                        入力完了直後に検索をする, await:同期実行する(お菓子のデータの検索・取得を同期実行する)
                        await okashiDataList.searchOkashi(keyword: inputText)
                    }
                 }
//              キーワードの「改行」を「検索」に変更する
                .submitLabel(.search)
//              上下左右に余白
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
