//
//  PlayControl.swift
//  some-radios
//
//  Created by Taipa Xu on 2023/10/4.
//

import SwiftUI

struct PlayControlView: View {
    var name: String?;
    var favicon: String?;
    var url: String?;
    @EnvironmentObject var radioPlayState: RadioPlayState

    var body: some View {
        HStack {
            HStack {
                AsyncImage(url: URL(string: favicon ?? "")) {phase in
                    switch phase {
                    case .empty:
                        Image(systemName: "radio")
                            .resizable()
                            .frame(width: 40, height: 40)
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 40, height: 40)
                    case .failure(_):
                        Image(systemName: "radio")
                            .resizable()
                            .frame(width: 40, height: 40)
                    @unknown default:
                        Text("未知问题")
                    }
                }

                Text(name ?? "")

                Spacer()
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)

            HStack {
                Image(systemName: "stop.circle")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .onTapGesture {
                        print("tap")
                        radioPlayState.stop()
                    }

                Image(systemName: radioPlayState.isPlaying ? "pause.circle" : "play.circle")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .onTapGesture {
                        print("tap")
                        if (radioPlayState.isPlaying) {
                            radioPlayState.pause()
                        } else {
                            radioPlayState.resume()
                        }
                    }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)

            Spacer()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 40)
        .padding(8)
        .background(.thinMaterial)
    }
}

#Preview {
    PlayControlView(name: "name", favicon: "http://www.funradio.sk/img/logo/apple-icon-120x120.png?v=2023-07-12-2215", url: "http://stream.funradio.sk:8000/fun128.mp3")
        .environmentObject(RadioPlayState())
}
