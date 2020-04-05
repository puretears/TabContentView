//
//  ContentView.swift
//  TabContentViewTest
//
//  Created by Mars on 2020/4/3.
//  Copyright © 2020 Mars. All rights reserved.
//

import SwiftUI
import TabContentView

struct ContentView: View {
  let content: [TabContentData]
  
  init() {
    self.content = [
      TabContentData(id: 0, label: "编程语言", view: buildScreen("编程语言", .red)),
      TabContentData(id: 1, label: "开发工具", view: buildScreen("开发工具", .yellow)),
      TabContentData(id: 2, label: "常用框架", view: buildScreen("常用框架", .blue)),
      TabContentData(id: 3, label: "我们的开源项目", view: buildScreen("我们的开源项目", .pink))
    ]
  }
  
  var body: some View {
    BxTabContentView(content: content)
  }
}

func buildScreen(_ title: String, _ color: Color) -> AnyView {
  AnyView(
    HStack {
      Spacer()
      VStack {
        Spacer()
        Text(title)
        Spacer()
      }
      Spacer()
    }
    .background(color)
  )
}
