//
//  ContentView.swift
//  GridSearch
//
//  Created by Sraavan Chevireddy on 11/21/20.
//

import SwiftUI
import KingfisherSwiftUI

struct ContentView: View {
    
    @State var searchText = ""
    @State var isSearching = false
    
    @ObservedObject var gridViewModel = GridViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                SearchBar(searchText: $searchText, isSearching: $isSearching)
                ScrollView{
                    LazyVGrid(columns: [
                        GridItem(.flexible(minimum: 50, maximum: 200), spacing: 12,alignment: .top),
                        GridItem(.flexible(minimum: 50, maximum: 200), spacing: 12,alignment: .top),
                        GridItem(.flexible(minimum: 50, maximum: 200), spacing: 12,alignment: .top)
                    ], spacing: 12, content: {
                        
                        ForEach(gridViewModel.results, id: \.self){ result in
                            ResultsView(result: result)
                        }
                    })
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Grid view Search")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .colorScheme(.dark)
    }
}
