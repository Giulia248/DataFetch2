//
//  ContentView.swift
//  DataFetch2
//
//  Created by user on 22/06/22.
//

import Foundation
import SwiftUI
struct ContentView: View {
    @State private var person: String = " Name "
    @State private var person2: String = " Address "
    @State private var img: String = " "
    @State var ck = false
    var body: some View {
       
        
        
        ZStack{
            Image("a").resizable().frame(width: 800, height: 1000)
            
            Text(person).foregroundColor(.black).padding().font(.system(size: 20)).offset(x: 0, y: 90)
            Text(person2).foregroundColor(.black).padding().font(.system(size: 20)).offset(x: 0, y: 125)
            
            AsyncImage(url: URL(string: img)).frame(width: 1, height: 1).offset(x: 0, y: -200)
            
                Button {
                    img = house
                    
                    Task {
                        let (data, _) = try await URLSession.shared.data(from: URL(string:"https://api.namefake.com")!)
                        let decodedResponse = try? JSONDecoder().decode(Human.self, from: data)
                        person = "\(decodedResponse?.name ?? " ")"
                        person2 = "address :\(decodedResponse?.address ?? " ")"
                        print(person)
                        
                    }
                    
                    ck = true
                }label: {

                    Text("Generate a Person").foregroundColor(.black).padding().font(.system(size: 30)).overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.black, lineWidth: 5))
 
                }.offset(x: 0, y: 300).disabled(ck)
            
            
            Button {
                img = " "
                ck = false
                person = "Name"
                person2 = "Address"
            }label: {

                Text("Clear").foregroundColor(CustomColor.verde).padding().font(.system(size: 30)).overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.black, lineWidth: 5))

            }.offset(x: 0, y: 225)
   
        }
    }
}


//°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°

let house : String = "https://api.lorem.space/image/house?w=300&h=300"

struct Human: Codable {
    let name, address: String

}

struct CustomColor {
    static let verde = Color("verde")
    // Add more here...
}

