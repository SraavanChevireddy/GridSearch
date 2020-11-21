//
//  ResultsView.swift
//  GridSearch
//
//  Created by Sraavan Chevireddy on 11/21/20.
//

import SwiftUI
import KingfisherSwiftUI

struct ResultsView: View {
    var result : AppInformation
    var body: some View {
        VStack(alignment: .leading,spacing: 4){
            
            KFImage(URL(string: result.artworkUrl100))
                .resizable()
                .scaledToFit()
                .cornerRadius(22)
            
            Text(result.name).font(.headline)
            Text(result.releaseDate).font(.caption).foregroundColor(.secondary)
            Text(result.copyright).font(.caption2).foregroundColor(.secondary)
            Spacer()
        }.padding(.horizontal)
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(result: AppInformation(copyright: "2132312", artworkUrl100: "ds", name: "ExamWorks", releaseDate: "Today"))
    }
}
