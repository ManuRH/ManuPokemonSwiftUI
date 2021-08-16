//
//  HeaderComponent.swift
//  Pokemon
//
//  Created by CICE on 10/08/2021.
//

import SwiftUI

struct HeaderComponent: View {
    var body: some View {
        VStack(spacing: 20){
            CustomTitle(title: "Manuel Romero")
            CustomSubtitle(subtitle: "swift UI")
            CustomDescription(customDescription: "Constreuir una vistra en swift UI es muy facil y lo que hace basicamente contener subvistas")

        }
    }
}

struct HeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponent()
    }
}

//Sub Components
struct CustomTitle: View {
    var title: String
    var body: some View {
        Text(title)
            .padding(.horizontal, 20)
            .font(.title2)
            .background(Color.red)
            .cornerRadius(10)
    }
}

struct CustomSubtitle: View {
    var subtitle: String
    var body: some View{
        Text(subtitle)
            .font(.title)
            .foregroundColor(.gray)
          
    }
}

struct CustomDescription: View {
    var customDescription: String
    var body: some View {
        Text(customDescription)
            .frame(maxWidth: .infinity)
            .font(.title)
            .padding()
            .background(Color.orange)
           
    }
}
