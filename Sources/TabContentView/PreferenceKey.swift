//
//  PreferenceKey.swift
//  TabContentView
//
//  Created by Mars on 2020/4/4.
//  Copyright © 2020 Mars. All rights reserved.
//

import SwiftUI

struct TabPreferenceData {
  let tabIndex: Int
  let bounds: Anchor<CGRect>
}

struct TabPreferenceKey: PreferenceKey {
  typealias Value = [TabPreferenceData]
  static var defaultValue: [TabPreferenceData] = []
  
  static func reduce(value: inout [TabPreferenceData], nextValue: () -> [TabPreferenceData]) {
    value.append(contentsOf: nextValue())
  }
}
