import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                TitleArea()
                ButtonArea()
                Divider().padding(.leading,20)
                SongsArea()
                Footer()
            }
            .navigationBarTitle("Swift UI", displayMode: .inline)
            .overlay(
                    FloatingArea()
                        .padding(.bottom, 16)
                
            )
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
        }.padding(.top, 10)
        .padding(.bottom, 18)
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
        "Good Day", "Bouquet", "Aloha", "Sunrise Serenade", "Moonlit Melody","Ocean Breeze", "Eternal Echoes", "Whispering Wind", "Mystic Mirage","Golden Horizon", "Enchanted Evening", "Starlight Serenade","Lullaby of the Stars", "Celestial Harmony", "Serenity's Embrace","Dancing Fireflies", "Melody of the Mountains", "Hidden Oasis","Radiant Reverie", "Midnight Mirage", "Journey to Infinity","Crystal Cascade", "Soothing Symphony", "Echoes of Eternity","Harmony Haven", "Serendipity Sonata", "Velvet Twilight","Tranquil Tides", "Whimsical Waltz", "Chasing Dreams"
      ]
    var body: some View {
        VStack (alignment: .leading){
            ForEach(songs.indices, id: \.self) { index in
                VStack(alignment: .leading) {
                    SongItem(song: songs[index], num: index + 1)
                    Divider().padding(.leading, (index+1 == songs.count) ? 0 : 52)
                }
            }
        }
        .background(Color.white)
    }
}

//SongItem
struct SongItem: View {
    let song: String
    let num:Int
    var body: some View {
        Button(){} label: {
            HStack (spacing: 14){
                Text(String(num))
                    .foregroundStyle(.gray)
                    .padding(.leading,10)
                    Text(song)
                    .foregroundColor(.primary)
            
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundColor(.primary)
            }
            .padding(.vertical, 6)
        .padding(.horizontal, 20)
        }
    }
}

struct Footer: View {
    var body: some View {
            Text("2023年11月3日\n30曲、300分")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.footnote)
            .foregroundStyle(.gray)
            .padding(.leading,20)
            .padding(.top,10)
            .padding(.bottom,200)
    }
}


struct FloatingArea: View {
    var body: some View {
        VStack {
            Spacer()
            Button(){} label:{
                HStack {
                    Image("ordinary_songs")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    Text("Good Day")
                        .font(.system(size: 16))
                        .foregroundColor(Color.primary)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "play.fill")
                            .foregroundColor(Color.black)
                            .font(.system(size: 22))
                        
                        Spacer().frame(width: 24)
                        
                        Image(systemName: "forward.fill")
                            .foregroundColor(Color(UIColor(hex: "b3b3b3")))
                            .font(.system(size: 20))
                        
                        Spacer().frame(width: 12)
                    }
                }
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color(UIColor(hex: "fbfbfb")))
                        .shadow(color: Color(UIColor(hex: "909090",alpha: 0.7)), radius: 20, x: 0, y: 8)
                )
            .padding(12)
            }
        }
    }
}
