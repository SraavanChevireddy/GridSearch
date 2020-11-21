//
//  NetworkResponse.swift
//  GridSearch
//
//  Created by Sraavan Chevireddy on 11/21/20.
//

struct NetworkResponse : Decodable{
    let feed : Feed
}

struct Feed : Decodable{
    let results : [AppInformation]
}

struct AppInformation : Decodable,Hashable{
    let copyright,artworkUrl100,name,releaseDate : String
}
