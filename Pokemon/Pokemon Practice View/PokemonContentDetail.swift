//
//  FashionContentDetail.swift
//  Pokemon
//
//  Created by CICE on 15/08/2021.
//

import SwiftUI

struct PokemonContentDetail: View {
    
    var modelData: Row
    @SwiftUI.Environment(\.presentationMode) var presentMode
    
    var body: some View {
        ScrollView{
            VStack{
                ZStack(alignment: .topLeading){
                    Image(modelData.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 600)
                        .clipped()
                    HStack{
                        GeometryReader{ proxy in
                            Button(action: {
                                self.presentMode.wrappedValue.dismiss()
                            }, label: {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
                            }).offset(x: 20, y: 10)

                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    HStack{
                        
                        VStack(alignment: .leading){
                            Text(modelData.name).font(.largeTitle).bold()
                            
                            if (modelData.type == "Planta"){
                                Text(modelData.type)
                                    .padding(.horizontal, 10)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                
                            } else if (modelData.type == "Agua"){
                                Text(modelData.type)
                                    .padding(.horizontal, 10)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                
                            } else if (modelData.type == "Fuego"){
                                Text(modelData.type)
                                    .padding(.horizontal, 10)
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                
                            } else if (modelData.type == "Bicho"){
                                Text(modelData.type)
                                    .padding(.horizontal, 10)
                                    .background(Color.purple)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                        
                        Spacer()
                        HStack(spacing: 10) {
                            Text(modelData.ID).foregroundColor(.gray)
                            
                        }
                    }
                    
                    HStack{
                        Text(modelData.kg)
                            .font(.subheadline)
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(20)

                        Spacer()
                       
                        Text(modelData.tall)
                            .font(.subheadline)
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                    
                    Text(modelData.description)
                    
                }
                
                .padding()
                .background(
                    rounded()
                        .fill(Color.white)
                        .shadow(radius: 10)
                )
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .padding(.top, 30)
        .edgesIgnoringSafeArea(.top)
    }
}

struct rounded: Shape {

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, .bottomLeft, .bottomRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}


struct PokemonContentDetail_Previews: PreviewProvider {
    static var previews: some View {
        PokemonContentDetail(modelData: Row(id: 0, name: "Bulbasaur", image: "poke1", ID: "#001", type: "Planta", kg: "6,9 KG", tall: "0,7 M", description: "Este Pokémon nace con una semilla en el lomo, que brota con el paso del tiempo."))
    }
}
