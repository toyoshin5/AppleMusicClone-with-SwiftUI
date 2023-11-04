//
//  ContentView.swift
//  AppleMusicClone
//
//  Created by Shin Toyo on 2023/11/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                TitleArea()
                ButtonArea()
                Divider()
                SongsArea()
            }
            .navigationBarTitle("Swift UI", displayMode: .inline)
        }
    }
}

#Preview(traits: PreviewTrait.portrait) {
    ContentView()
}
struct TitleArea: View {
    var body: some View {
        VStack (spacing: 2) {
            Image("ordinary_songs")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .clipped()
                .cornerRadius(10.0)
                .shadow(color: Color.black.opacity(0.2), radius: 10,y:10)
                .padding()
            Text("List of Songs - EP")
                .font(.title3)
                .fontWeight(.medium)
            Text("Toyoda Shingo")
                .font(.title3)
                .foregroundColor(.red)
            Text("Electronic・2023年・ロスレス")
                .font(.caption)
                .foregroundColor(.gray)
                .fontWeight(.semibold)
        }
        .frame(maxWidth: .infinity)
    }
}

struct ButtonArea: View {
    var body: some View {
        HStack (spacing: 20){
            AppButton(icon: Image(systemName: "play.fill"), text: "再生")
            AppButton(icon: Image(systemName: "shuffle"), text: "シャッフル")
        }.padding(.top, 8)
        .padding(.bottom, 20)
    .padding(.horizontal, 20)
    }
}

struct AppButton: View {
    let icon:Image
    let text:String
    var body: some View {
        Button() {} label: {
            HStack {
                icon
                Text(text)
                    .bold()
            }.foregroundColor(.red)
                .padding()
                .frame(height: 48)
                .frame(maxWidth: .infinity)
                .background(Color(UIColor(hex: "eeedef")))
                .cornerRadius(10)
        }
    }
}

struct SongsArea: View {
    let songs: [String] = [
        "Good Day", "Bouquet", "Aloha", "Sunrise Serenade", "Moonlit Melody",
        "Ocean Breeze", "Eternal Echoes", "Whispering Wind", "Mystic Mirage",
        "Golden Horizon", "Enchanted Evening", "Starlight Serenade",
        "Lullaby of the Stars", "Celestial Harmony", "Serenity's Embrace",
        "Dancing Fireflies", "Melody of the Mountains", "Hidden Oasis",
        "Radiant Reverie", "Midnight Mirage", "Journey to Infinity",
        "Crystal Cascade", "Soothing Symphony", "Echoes of Eternity",
        "Harmony Haven", "Serendipity Sonata", "Velvet Twilight",
        "Tranquil Tides", "Whimsical Waltz", "Chasing Dreams"
      ]
    var body: some View {
        VStack (alignment: .leading){
            ForEach(songs, id: \.self) { song in
                SongItem(song: song)
            }
        }
        .background(Color.white)
    }
}

//SongItem
struct SongItem: View {
    let song: String
    var body: some View {
        HStack (spacing: 20){
                Text(song)
                    .font(.title3)
                    .fontWeight(.medium)
            Spacer()
            Image(systemName: "ellipsis")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 20)
    }
}

