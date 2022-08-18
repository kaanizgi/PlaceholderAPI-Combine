//
//  ContentView.swift
//  PlaceholderAPI-Combine
//
//  Created by Kaan İzgi on 18.08.2022.
//



import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    var body: some View {
        List {
            ForEach(vm.posts) { data in
                VStack{
                    Text(data.body)
                    Text(data.title)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
