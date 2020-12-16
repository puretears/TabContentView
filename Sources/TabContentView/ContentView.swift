//
//  ContentView.swift
//  TabContentView
//
//  Created by Mars on 2020/4/4.
//  Copyright © 2020 Mars. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @Binding var currIndex: Int
  
  @State private var offset: CGFloat = 0
  @State private var isSwiping: Bool = false
  
  let scrollContent: [TabContentData]
  
  init(currIndex: Binding<Int>, scrollContent: [TabContentData]) {
    self._currIndex = currIndex
    self.scrollContent = scrollContent
  }
  
  var body: some View {
    GeometryReader { proxy in
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .center, spacing: 0) {
          ForEach(self.scrollContent) {
            return $0.view
              .frame(width: proxy.size.width, height: proxy.size.height)
          }
        }
      }
      .content
      .offset(x: self.isSwiping ? self.offset : CGFloat(self.currIndex) * (-proxy.size.width))
      .animation(.easeInOut(duration: 0.2))
      .frame(width: proxy.size.width, alignment: .leading)
      .gesture(
        DragGesture()
          .onChanged({ value in
            self.isSwiping = true
            self.offset = value.translation.width + (-proxy.size.width) * CGFloat(self.currIndex)
          })
          .onEnded({ value in
            let distance = value.predictedEndTranslation.width
            
            if distance < 0, abs(distance) > proxy.size.width / 3, self.currIndex < (self.scrollContent.count - 1) {
              self.currIndex += 1
            }
            
            if distance > 0, distance > proxy.size.width / 3, self.currIndex > 0 {
              self.currIndex -= 1
            }
            withAnimation {
                self.isSwiping = false
            }
          })
      )
    }
  }
}
