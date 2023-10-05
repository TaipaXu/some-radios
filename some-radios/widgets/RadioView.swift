//
//  RadioView.swift
//  some-radios
//
//  Created by Taipa Xu on 2023/10/4.
//

import SwiftUI
import AVKit

struct RadioView: View {
    let radio: Radio;
    var screenWidth: Double = UIScreen.main.bounds.width
    var count: Int = Int(UIScreen.main.bounds.width) / 100
    var width: Double = UIScreen.main.bounds.width / CGFloat(Int(UIScreen.main.bounds.width) / 100)
    @EnvironmentObject var radioPlayState: RadioPlayState

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: radio.favicon), transaction: Transaction(animation: Animation.easeInOut(duration: 1.0))) { phase in
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
            
            Text(radio.name)
                .font(.caption2)
        }
        .frame(width: width - Double((count - 1)) * 10.0, height: 100)
        .background(Color.yellow)
        .cornerRadius(8, antialiased: true)
        .onTapGesture {
            print("tap")
            guard let url = URL(string: radio.url) else { return }
            let playerItem = AVPlayerItem(url: url)
            radioPlayState.play(radio: radio)
        }
    }
}

#Preview {
    Group {
        HStack {
            RadioView(radio: Radio(name: "Deutschlandfunk [MP3 128k]", favicon: "http://www.deutschlandfunk.de/static/img/deutschlandfunk/icons/apple-touch-icon-128x128.png", url: ""))
            RadioView(radio: Radio(name: "Deutschlandfunk [MP3 128k]", favicon: "", url: ""))
        }
        RadioView(radio: Radio(name: "Deutschlandfunk [MP3 128k]", favicon: "http://www.deutschlandfunk.de/static/img/deutschlandfunk/icons/apple-touch-icon-128x128.png", url: ""))
    }
}
