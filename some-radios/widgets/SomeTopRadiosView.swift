//
//  SomeTopRadiosView.swift
//  some-radios
//
//  Created by Taipa Xu on 2023/10/4.
//

import SwiftUI

class RadiosViewModel: ObservableObject {
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

struct SomeTopRadiosView: View {
    let type: TopRadiosType
    var _offset: Int = 0
    var _limit: Int = 50
    @ObservedObject private var viewModel = RadiosViewModel()

    init(type: TopRadiosType) {
        self.type = type
        print("some top radios view init")
        viewModel.getRadios(type: type, offset: _offset, limit: _limit)
    }

    var body: some View {
        VStack {
            HStack {
                Text(type.description)
                Spacer()
                NavigationLink(destination: OneTypeTopRadiosView(type: type)) {
                    Image(systemName: "ellipsis")
                }
            }
            .padding([.leading, .trailing], 16)

            RadiosView(maxLines: 2, radios: $viewModel.radios)
        }
    }
}

#Preview {
    SomeTopRadiosView(type: TopRadiosType.ByClicks)
}
