//
//  SeventhAnimationView.swift
//  WWDC_Tester
//
//  Created by Raffaele Martone on 13/04/23.
//

import SwiftUI

struct SeventhAnimationView: View {
    
    @State var showModel = false
    let timer = Timer
        .publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    
@State var ypos : Double = 100
    
    var body: some View {
        VStack{
            VStack{
                ZStack{
                    GroupView()
                    Rectangle()
                        .frame(width: 100,height: 4)
                        .foregroundColor(.white)
                        .offset(y: 100)
                    EllipseAnimationView()
                        .frame(width: 20,height: 80)
                }
            }.frame(height: 400)
            Text("Redemption")
                .font(.largeTitle)
                .foregroundColor(Color.white)
        }
        .onReceive(timer) { time in
            
            ypos = ypos + 10
        }
        
        .sheet(isPresented: $showModel){
            ZStack{
                Color.black.opacity(0.3)
                VStack{
                Text("The Redemption")
                Text(NSLocalizedString("Redemption", comment: ""))
                    
                }
            }
        }
    }
}



struct SeventhAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        SeventhAnimationView()
    }
}
