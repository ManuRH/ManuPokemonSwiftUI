//
//  PokemonContentView.swift
//  Pokemon
//
//  Created by CICE on 13/08/2021.
//

import SwiftUI

struct ToolBar: View {
    var body: some View {
        ZStack{
            HStack(spacing: 15) {
                Text("Pokedex")
                    .font(.title)
                
                Image("pokeball")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 20, height: 20)
                Spacer()

                Button(action: {
                }, label: {
                    Image("Options")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 10, height: 10)
                })
            }
            .font(.callout)
            .foregroundColor(.black)
        }
        .padding([.leading, .trailing], 20)
    }
}

struct CustomMainView: View {
    var body: some View {
        VStack(spacing: 20){
            DetailScroll()
        }
    }
}


struct DetailScroll: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(datas) { item in
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2)){
                    ForEach(item.myRows) { itemX in
                        NavigationLink(
                            destination: PokemonContentDetail(modelData: itemX),
                            label: {
                                Card(modelData: itemX)
                            })
                            .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
}

struct Card: View {
    
    var modelData: Row
    
    var body: some View {
        VStack(spacing: 10) {
            Image(modelData.image)
                .resizable()
                .frame(width: 150, height: 150)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(radius: 5)
                
            HStack{
                Text(modelData.name).font(.title2).lineLimit(1)
                    
            }
            Spacer()
        }
    }
}


struct SplashView: View {
    
    // 1.
    @State var isActive:Bool = false
    
    var body: some View {
        VStack {
            // 2.
            if self.isActive {
                // 3.
                PokemonContentView()
            } else {
                // 4.
                Image("pokeball")
            }
        }
        // 5.
        .onAppear {
            // 6.
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                // 7.
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
    
}

struct PokemonContentView: View {
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                ToolBar()
                CustomMainView()
            }
            .navigationBarHidden(true)
        }
    }
}

struct PokemonContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonContentView()//.preferredColorScheme(.dark)
        
    }
}

// MARK: - Model Data
struct type: Identifiable {
    var id: Int
    var myRows: [Row]
}

struct Row: Identifiable {
    var id: Int
    var name: String
    var image: String
    var ID: String
    var type: String
    var kg: String
    var tall: String
    var description: String
    
}

var datas = [type(id: 0, myRows: [Row(id: 0, name: "Bulbasaur", image: "poke1", ID: "#001", type: "Planta", kg: "6,9 KG", tall: "0,7 M", description: "Este Pokémon nace con una semilla en el lomo, que brota con el paso del tiempo."),
                                 Row(id: 1, name: "Ivysaur", image: "poke2", ID: "#002", type: "Planta", kg: "13 KG", tall: "1 M", description: "Cuando le crece bastante el bulbo del lomo, pierde la capacidad de erguirse sobre las patas traseras."),
                                 Row(id: 2, name: "Venusaur", image: "poke3", ID: "#003", type: "Planta", kg: "100 KG", tall: "2 M", description: "La planta florece cuando absorbe energía solar, lo cual le obliga a buscar siempre la luz del sol."),
                                 Row(id: 3, name: "Charmander", image: "poke4", ID: "#004", type: "Fuego", kg: "8,5 KG", tall: "0,6 M", description: "Prefiere las cosas calientes. Dicen que cuando llueve le sale vapor de la punta de la cola."),
                                 Row(id: 4, name: "Charmeleon", image: "poke5", ID: "#005", type: "Fuego", kg: "19 KG", tall: "1,1 M", description: "Este Pokémon de naturaleza agresiva ataca en combate con su cola llameante y hace trizas al rival con sus afiladas garras."),
                                 Row(id: 5, name: "Charizard", image: "poke6", ID: "#006", type: "Fuego", kg: "90 KG", tall: "1,7 M", description: "Escupe un fuego tan caliente que funde las rocas. Causa incendios forestales sin querer."),
                                 Row(id: 6, name: "Squirtle", image: "poke7", ID: "#007", type: "Agua", kg: "9 KG", tall: "0,5 M", description: "Cuando retrae su largo cuello en el caparazón, dispara agua a una presión increíble."),
                                 Row(id: 7, name: "Wartortle", image: "poke8", ID: "#008", type: "Agua", kg: "22,5 KG", tall: "1 M", description: "Se lo considera un símbolo de longevidad. Los ejemplares más ancianos tienen musgo sobre el caparazón"),
                                 Row(id: 8, name: "Blastoise", image: "poke9", ID: "#009", type: "Agua", kg: "85,5 KG", tall: "1,6 M", description: "Para acabar con su enemigo, lo aplasta con el peso de su cuerpo. En momentos de apuro, se esconde en el caparazón."),
                                 Row(id: 9, name: "Caterpie", image: "poke10", ID: "#010", type: "Bicho", kg: "2,9 KG", tall: "0,3 M", description: "Para protegerse, despide un hedor horrible por las antenas con el que repele a sus enemigos."),
                                 Row(id: 10, name: "Metapod", image: "poke11", ID: "#011", type: "Bicho", kg: "9,9 KG", tall: "0,7 M", description: "Como en este estado solo puede endurecer su coraza, permanece inmóvil a la espera de evolucionar."),
                                 Row(id: 11, name: "Buterfree", image: "poke12", ID: "#012", type: "Bicho", kg: "32 KG", tall: "1,1 M", description: "Aletea a gran velocidad para lanzar al aire sus escamas extremadamente tóxicas."),
                                 Row(id: 12, name: "Weedle", image: "poke13", ID: "#013", type: "Bicho", kg: "3,2 KG", tall: "0,3 M", description: "El aguijón de la cabeza es muy puntiagudo. Se alimenta de hojas oculto en la espesura de bosques y praderas.")])]
