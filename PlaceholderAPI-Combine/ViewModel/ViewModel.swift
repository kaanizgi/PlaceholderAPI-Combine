//
//  ViewModel.swift
//  PlaceholderAPI-Combine
//
//  Created by Kaan İzgi on 18.08.2022.
//

import Foundation
import Combine

class ViewModel:ObservableObject {
    
    
    @Published var posts = [PostModel]()
    var cancellable = Set<AnyCancellable>()
    
    init(){
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap { (data,response) -> Data in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .sink { (completion) in
                print(completion)
            } receiveValue: { postData in
                self.posts = postData
            }
            .store(in: &cancellable)

    
    }
   
    
}
