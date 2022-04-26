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
    
//    SafariViewの表示有無を管理する変数
    @State var showSafari = false
    
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
            
    //            リスト表示する
                List(okashiDataList.okashiList) { okashi in
    //                1つ1つの要素が取り出させれる
                    
    //                ボタンを用意する
                    Button(action: {
    //                  Safariviewを表示する
                        showSafari.toggle()
                    }) {
    //                    Listの表示内容を生成する
    //                水平にレイアウト(横方向にレイアウト)
                      HStack {
    //                    画像読み込み、表示する
                      AsyncImage(url: okashi.image) { image in
    //                        画像を表示する
                          image
    //                        リサイズする
                              .resizable()
                              .aspectRatio(contentMode: .fit)
    //                        高さ40
                              .frame(height: 40)
                      } placeholder: {
    //                        読み込み中はインジケーターを表示する
                          ProgressView()
                      }
    //                    テキストを表示する
                    Text(okashi.name)
                  }  //HStack ここまで
                } // Button ここまで
                .sheet(isPresented: self.$showSafari, content: {
//                        SafariViewを表示する
                    SafariView(url: okashi.link)
//                        画面下部がセーフエリア外までいっぱいになるように指定
                        .edgesIgnoringSafeArea(.bottom)
                }) // sheetここまで
            } // List ここまで
        } // VStack ここまで
    } // body ここまで
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
