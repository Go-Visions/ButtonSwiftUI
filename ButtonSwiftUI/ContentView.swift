//
//  ContentView.swift
//  ButtonSwiftUI
//
//  Created by nishi kosei on 2020/03/28.
//  Copyright © 2020 nishi kosei. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var array = [hogeData]()
    @State var popupFlag = false
    var body: some View {
        VStack{
            List{
                ForEach(0..<array.count, id:\.self) { item in
                    Button(action: {
                        self.popupFlag = true
                        //cellTapAction(name: self.array[item].name)
                    },label: {
                        Text(self.array[item].name)
                    }).alert(isPresented: self.$popupFlag, content: {
                        Alert(title: Text("タップしたitem名"),
                              message: Text(self.array[item].name),
                              dismissButton: .default(Text("閉じる")) {
                                self.popupFlag = false
                            }
                        )
                    })
                }
            }
            Button("createData"){
                self.array += createArray()
                print(self.array)
            }
        }
    }
}

struct hogeData: Identifiable {
    var id = UUID()
    var name: String
}

func createArray() -> [hogeData] {
    let array = [hogeData(name: "item1"),
                 hogeData(name: "item2"),
                 hogeData(name: "item3"),
                 hogeData(name: "item4")]
    return array
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
