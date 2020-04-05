//
//  TabContentView.swift
//  TabContentView
//
//  Created by Mars on 2020/4/4.
//  Copyright © 2020 Mars. All rights reserved.
//

import SwiftUI

public struct BxTabContentView: View {
  let content: [TabContentData]
  
  @State private var currIndex: Int = 0
  
  public init(content: [TabContentData]) {
    self.content = content
  }
  
  public var body: some View {
    VStack(spacing: 0) {
      Group {
        if content.count <= 4 {
          buildTabView()
        }
        else {
          ScrollView(.horizontal) {
            buildTabView()
          }
        }
      }
      .backgroundPreferenceValue(TabPreferenceKey.self) {
        preferences in
        return GeometryReader { proxy in
          ZStack {
            self.createIndicator(proxy, preferences)
          }
          .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
      }
      
      ContentView(currIndex: $currIndex, scrollContent: content)
        .edgesIgnoringSafeArea(.all)
    }
  }
  
  private func buildTabView() -> some View {
    HStack {
      Spacer()
      
      ForEach(content) {
        TabView(currIndex: self.$currIndex, index: $0.id, label: $0.label)
        Spacer()
      }
    }
  }
  
  private func createIndicator(_ proxy: GeometryProxy, _ pref: [TabPreferenceData]) -> some View {
    let p = pref.first(where: { $0.tabIndex == self.currIndex })
    let bounds = p != nil ? proxy[p!.bounds] : .zero
    
    return Rectangle()
      .foregroundColor(Color.blue)
      .frame(width: bounds.size.width, height: 2)
      .fixedSize()
      .offset(x: bounds.minX, y: bounds.size.height-2)
      .animation(.easeInOut(duration: 0.3))
  }
}
