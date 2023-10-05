//
//  RadiosView.swift
//  some-radios
//
//  Created by Taipa Xu on 2023/10/4.
//

import SwiftUI

struct RadiosView: View {
    @State var maxLines: Int = 2
    @Binding var radios: Array<Radio>
    var screenWidth: Double = UIScreen.main.bounds.width
    var count: Int = Int(UIScreen.main.bounds.width) / 100
    var width: Double = UIScreen.main.bounds.width / CGFloat(Int(UIScreen.main.bounds.width) / 100)

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<min(maxLines, radios.count / count), id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(0..<count, id: \.self) { column in
                        if (row * count + column < radios.count) {
                            RadioView(radio: radios[row * count + column])
                        }
                    }
                }
            }
        }
    }
}
