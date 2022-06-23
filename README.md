# DataFetch2
Data Fetch of random people API and random houses

'''

     //data struct 
       struct Human: Codable {
       let name, address: String
        }

        //decoded json file
         Task {
                        let (data, _) = try await URLSession.shared.data(from: URL(string:"https://api.namefake.com")!)
                        let decodedResponse = try? JSONDecoder().decode(Human.self, from: data)
                        person = "\(decodedResponse?.name ?? " ")"
                        person2 = "address :\(decodedResponse?.address ?? " ")"
                        print(person)
                        
                    }


'''




![Simulator Screen Shot - iPhone 11 - 2022-06-22 at 12 56 04](https://user-images.githubusercontent.com/106954791/175012668-0be8b653-c5ee-4c4a-ab47-ebd054f5ae8d.png)
