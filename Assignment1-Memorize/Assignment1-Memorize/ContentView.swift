//
//  ContentView.swift
//  week1
//
//  Created by Mohamed Abdelkhalek Salah on 01/10/2021.
//

import SwiftUI



struct ContentView: View {
    
    static let vehicleTheme = ["π", "π", "π", "π", "π", "π",
                                "π","π", "π","π", "π»", "π",
                                "π", "π","π΅" , "π", "πΊ", "π",
                                "π", "π", "π", "π", "π ", "βοΈ"]

    static let sportTheme = ["β½οΈ", "π", "π", "βΎοΈ", "π₯", "πΎ",
                              "π", "π", "π₯", "πͺ", "π±", "π",
                              "πΈ", "π", "π", "π₯", "π", "πͺ",
                              "π₯", "β³οΈ", "πͺ", "πΉ", "π£", "π€Ώ"]

    static let foodTheme = ["π", "π", "π", "π", "π", "π",
                             "π", "π", "π", "π«", "π", "π",
                             "π", "π₯­", "π", "π₯₯", "π₯", "π",
                             "π₯", "π", "π₯¦", "π₯¬", "π₯", "πΆ"]
    
    @State var emojiCount = Int.random(in: 8..<24)
    @State var emojis = vehicleTheme
    var body: some View {
        VStack {
            Text("Memorize!").font(.title)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(emojis[0..<emojiCount].shuffled(), id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)

            Spacer()
            HStack {
                Spacer()
                vehiclesThemeButton
                Spacer()
                sportThemeButton
                Spacer()
                foodThemeButton
                Spacer()
            }
        }
        .font(.largeTitle)
        .padding(.horizontal)
    }
    
    var vehiclesThemeButton: some View {
        Button {
            emojis = ContentView.vehicleTheme
            emojiCount = Int.random(in: 8..<24)
        } label: {
            VStack {
                Image(systemName: "car").font(.title)
                Text("Vehicles").font(.caption)
            }
        }
    }
    
    var sportThemeButton: some View {
        Button{
            emojis = ContentView.sportTheme
            emojiCount = Int.random(in: 8..<24)
        } label: {
            VStack {
                Image(systemName: "sportscourt").font(.title)
                Text("Sports").font(.caption)
            }
        }
    }
    
    var foodThemeButton: some View {
        Button{
            emojis = ContentView.foodTheme
            emojiCount = Int.random(in: 8..<24)
        } label: {
            VStack{
                Image(systemName: "pills").font(.title)
                Text("Foods").font(.caption)
            }
        }
    }
}

struct CardView: View {
    @State var isFaceUp = false
    var content: String
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text("\(content)").font(.largeTitle)
            } else {
                shape.fill()
            }
            
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12 mini")
    }
}
