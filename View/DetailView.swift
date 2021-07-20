//
//  DetailView.swift
//  UI-264
//
//  Created by nyannyan0328 on 2021/07/20.
//

import SwiftUI

struct DetailView: View {
    var animation : Namespace.ID
    @EnvironmentObject var model : CustomTabBarModel
    
    @State var showData = false
    var body: some View {
        if let card = model.currentCard,model.showDetail{
            
            
            VStack(spacing:0){
                
                Image(card.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: card.id + "IMAGE", in: animation)
                    .background(
                    
                        LinearGradient(colors: [
                        
                            Color("\(card.cardColor)1"),
                            Color("\(card.cardColor)2"),
                            Color("\(card.cardColor)3"),
                        
                        
                        ], startPoint: .topTrailing, endPoint: .bottomLeading)
                        
                        
                            .cornerRadius(20)
                            .matchedGeometryEffect(id: card.id + "BG", in: animation)
                            .ignoresSafeArea()
                    
                        
                    )
                    .overlay(
                    
                  Button(action: {
                        
                        withAnimation(.spring()){
                            
                            model.showDetail.toggle()
                        }
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(.black,in: Circle())
                        
                        
                    })
                    .padding(10)
                    .opacity(showData ? 1 : 0)
                  
                  ,alignment: .topTrailing
                    
                    )
                
                
                
                
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text(card.title)
                            .font(.title3.bold())
                            .matchedGeometryEffect(id: "\(card.id)Title", in: animation)
                        
                        
                        ForEach(1...100,id:\.self){index in
                            
                            HStack(spacing:15){
                                
                                
                                Image(systemName: "swift")
                                    .font(.title)
                                
                                Text("Day\(index) of SWIFTUI")
                                    .font(.footnote.italic())
                                
                                Spacer()
                                
                                
                                Image(systemName: "play.fill")
                                    .font(.title2)
                                
                                
                                
                                
                            }
                            .padding(.vertical,8)
                            .padding(.horizontal)
                            .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 10))
                            
                            
                        }
                        .opacity(showData ? 1 : 0)
                        
                        
                    }
                    .padding()
                    .padding(.top)
                    
                    
                }
                
                
            }
            .background(.ultraThinMaterial)
            .onAppear {
                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.09) {
                    
                    
                    
                    withAnimation{
                        
                        showData = true
              
                    }
                }
                
            }
            .onDisappear {
                withAnimation{
                    
                    
                    showData = false
                }
            }
            
         
            
            
            
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
