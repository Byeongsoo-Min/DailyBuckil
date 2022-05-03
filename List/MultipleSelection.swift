//
//  MultipleSelection.swift
//  DailyBuckil
//
//  Created by MBSoo on 2022/05/03.
//

import Foundation
import SwiftUI

struct MultipleSelectionList: View {
    @State var items: [String] = ["데이트룩", "새내기룩", "캠퍼스룩", "캐주얼룩", "동네마실룩"]
    @State var selections: [String] = []

    var body: some View {
        List {
            ForEach(self.items, id: \.self) { item in
                MultipleSelectionRow(title: item, isSelected: self.selections.contains(item)) {
                    if self.selections.contains(item) {
                        self.selections.removeAll(where: { $0 == item })
                    }
                    else {
                        self.selections.append(item)
                    }
                }
            }
        }
    }
}


struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}


struct MultipleSelection_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSelectionList()
    }
}
