//
//  TabContentData.swift
//  TabContentView
//
//  Created by Mars on 2020/4/3.
//  Copyright © 2020 Mars. All rights reserved.
//

import SwiftUI

public struct TabContentData: Identifiable {
  public let id: Int
  public let label: String
  public let view: AnyView
  
  public init(id: Int, label: String, view: AnyView) {
    self.id = id
    self.label = label
    self.view = view
  }
}
