//
//  Home.swift
//  UI-264
//
//  Created by nyannyan0328 on 2021/07/19.
//

import SwiftUI

struct Home: View {
    var animation : Namespace.ID
    @EnvironmentObject var model : CustomTabBarModel
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            
            VStack(spacing:20){
                
            Text("***Best Selling***")
                    .font(.system(size: 35, weight: .heavy))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.bottom)
                
                ForEach(cards){card in
                    
                    Button {
                        withAnimation(.spring()){
                            
                            model.currentCard = card
                            model.showDetail = true
                        }
                    } label: {
                        VStack(spacing:25){
                            cardView(card: card)
                            
                         
                        }
                        .padding()
                        .background(
                        
                          cardBG(card: card)
                        
                            
                        )
                        .foregroundColor(.white)
                        
                        
                    }
                    .buttonStyle(CardButtonStyle())

                    
                    
                }
                
                
            }
            .padding()
            .padding(.bottom,80)
            
        }
    }
    
    @ViewBuilder
    
    func cardBG(card : Card) -> some View{
        
        ZStack{
            
            
            if model.showDetail && model.currentCard == card{
                
                LinearGradient(colors: [
                
                    Color("\(card.cardColor)1"),
                    Color("\(card.cardColor)2"),
                    Color("\(card.cardColor)3"),
                
                
                ], startPoint: .topTrailing, endPoint: .bottomLeading)
                
                    
                    .cornerRadius(20)
                    .opacity(0)
                
                
                
                
            }
            
            else{
                
                LinearGradient(colors: [
                
                    Color("\(card.cardColor)1"),
                    Color("\(card.cardColor)2"),
                    Color("\(card.cardColor)3"),
                
                
                ], startPoint: .topTrailing, endPoint: .bottomLeading)
                
                    .matchedGeometryEffect(id: card.id + "BG", in: animation)
                    .cornerRadius(20)
            }
        }
        
        
        
    }
    
    @ViewBuilder
    
    func cardView(card : Card) -> some View{
        
        VStack{
            
            
            if model.showDetail && model.currentCard == card{
                
                Image(card.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(0)
                 
                
                
                Text(card.title)
                    .font(.title3.italic())
                    .opacity(0)
                    
                
                
            }
            
            else{
                
                Image(card.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: card.id + "IMAGE", in: animation)
                
                
                Text(card.title)
                    .font(.title3.italic())
                    .matchedGeometryEffect(id: "\(card.id)Title", in: animation)
                
            }
        }
        
        
    }
    
    
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardButtonStyle : ButtonStyle{
    
    
    func makeBody(configuration: Configuration) -> some View {
        return configuration.label
        
          
        
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
            .animation(.easeIn,value: configuration.isPressed)
            .shadow(radius: configuration.isPressed ? 10 : 0)
    }
}
