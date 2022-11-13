//
//  ContentView.swift
//  BookshelfBarCodeReader
//
//  Created by Shinji Minamino on 2022/11/12.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
    
        NavigationView {
            VStack {
                
                NavigationLink(destination: CameraView()) {
                    Text("バーコードリーダー")
                }.padding()
                
                NavigationLink(destination: CameraView()) {
                    Text("設定")
                }.padding()
                
            }
            
            .padding()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
