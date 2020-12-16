//
//  TabView.swift
//  TabContentView
//
//  Created by Mars on 2020/4/4.
//  Copyright © 2020 Mars. All rights reserved.
//

import SwiftUI

struct TabView: View {
  @Binding var currIndex: Int
  
  let index: Int
  let label: String
  
  var body: some View {
    Text(label)
      .font(.caption)
      .padding(10)
      .foregroundColor(index == currIndex ? .blue : .gray)
      .scaleEffect(index == currIndex ? 1.1 : 1.0)
      .animation(.easeInOut(duration: 0.1))
      .anchorPreference(
        key: TabPreferenceKey.self,
        value: .bounds,
        transform: { [TabPreferenceData(tabIndex: self.index, bounds: $0)] })
      .onTapGesture { self.currIndex = self.index }
  }
}
