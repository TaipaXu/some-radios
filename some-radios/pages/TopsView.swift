//
//  TopsView.swift
//  some-radios
//
//  Created by Taipa Xu on 2023/10/4.
//

import SwiftUI

struct TopsView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            SomeTopRadiosView(type: TopRadiosType.ByClicks)
                .padding(.vertical, 20)

            SomeTopRadiosView(type: TopRadiosType.ByVotes)
                .padding(.vertical, 20)

            SomeTopRadiosView(type: TopRadiosType.ByRecentClick)
                .padding(.vertical, 20)

            SomeTopRadiosView(type: TopRadiosType.ByRecentlyChange)
                .padding(.vertical, 20)
        }
        .navigationTitle("tops")
    }
}

#Preview {
    TopsView()
}
