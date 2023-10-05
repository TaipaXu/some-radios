//
//  OneTypeTopRadiosView.swift
//  some-radios
//
//  Created by Taipa Xu on 2023/10/4.
//

import SwiftUI

class OneTypeRadiosViewModel: ObservableObject {
    @Published var radios: [Radio] = []

    func getRadios(type: TopRadiosType, offset: Int, limit: Int) {
        getRadiosByType(type: type, withParams: [
            "offset": offset,
            "limit": limit
        ]) { result in
            switch result {
            case .success(let decodedData):
                DispatchQueue.main.async {
                    self.radios = decodedData
                    debugPrint("radios count \(self.radios.count)")
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

struct OneTypeTopRadiosView: View {
    let type: TopRadiosType
    var _offset: Int = 0
    var _limit: Int = 50
    @ObservedObject private var viewModel = OneTypeRadiosViewModel()

    init(type: TopRadiosType) {
        self.type = type
        print("some top radios view init")
        viewModel.getRadios(type: type, offset: _offset, limit: _limit)
    }

    var body: some View {
        ScrollView {
            RadiosView(maxLines: Int.max, radios: $viewModel.radios)

            Rectangle()
                .background(.white)
                .onAppear() {
                    debugPrint("last show")
                }
        }
        .navigationTitle(type.description)
    }
}

#Preview {
    OneTypeTopRadiosView(type: TopRadiosType.ByClicks)
}
