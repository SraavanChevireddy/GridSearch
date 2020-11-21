//
//  SearchBar.swift
//  SearchBarInSwiftUI
//
//  Created by Sraavan Chevireddy on 11/21/20.
//

import SwiftUI

struct SearchBar : View{
    
    @Binding var searchText : String
    @Binding var isSearching : Bool
    
    var body: some View{
        HStack{
            HStack{
                TextField("Search", text: $searchText)
                    .padding(.leading,24)
            }
            .frame(height: 10)
            .padding()
            .background(Color(.systemGray4))
            .cornerRadius(20)
            .padding(.horizontal)
            .onTapGesture {
                isSearching = true
            }
            .overlay(
                HStack{
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    if isSearching{
                        Button(action: {
                            isSearching = false
                            searchText = ""
                            hideKeyboard()
                        }, label: {
                            Button(action: {
                                searchText = ""
                                hideKeyboard()
                                isSearching = false
                            }, label: {
                                Image(systemName: "xmark.circle.fill")
                            })
                        })
                    }
                }.padding(.horizontal,24)
                .foregroundColor(Color.black)
            ).transition(.move(edge: .trailing))
            .animation(.interactiveSpring())
            
            // Cancel button
            if isSearching{
                Button(action: {
                    searchText = ""
                    hideKeyboard()
                    isSearching = false
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.primary)
                        .font(.custom("Arial Rounded MT Bold", size: 20, relativeTo: .body))
                }).padding(.trailing,15)
                .transition(.move(edge: .trailing))
                .animation(.interactiveSpring())
            }
        }
    }
}


#if canImport(UIKit)
extension View{
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
