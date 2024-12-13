//
//  FourthAnimationView.swift
//  WWDC_Tester
//
//  Created by Raffaele Martone on 13/04/23.
//

import SwiftUI

struct FourthAnimationView: View {
    
    let timer = Timer
        .publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    @State var op = 1.0
    @State var ypos : Double = 0
    @State var xpos : Double = 0
    @State var showModel = false
    @State var index = 0
    
    var body: some View {
        VStack{
            VStack{
                ZStack{
                    Rectangle()
                        .frame(width: 250,height: 4)
                        .foregroundColor(.white)
                        .offset(y: 100)
                    Rectangle()
                        .frame(width: 250,height: 4)
                        .foregroundColor(.white)
                        .offset(y: -100)
                    Rectangle()
                        .frame(width: 4,height: 250)
                        .foregroundColor(.white)
                        .offset(x: 100)
                    Rectangle()
                        .frame(width: 4,height: 250)
                        .foregroundColor(.white)
                        .offset(x: -100)
                    TringlesFillAnimationView()
                        .offset(x: xpos,y: ypos)
                        .animation(.easeInOut, value: xpos)
                        .animation(.easeInOut, value: ypos)
                    
                }
            }.frame(height: 400)
            Text("The Quarantine")
                .font(.largeTitle)
                .foregroundColor(Color.white)
        }
        .onReceive(timer) { time in
            index = index + 1
            if ((index % 15) == 0) {
                xpos = Double.random(in: -80...80)
                ypos = Double.random(in: -80...80)
            }
        }
        .sheet(isPresented: $showModel){
            ZStack{
                Color.black.opacity(0.3)
                VStack{
                Text("The Quarantine")
                Text(NSLocalizedString("Quarantine", comment: ""))
                    
                }
            }
        }
    }
}

struct FourthAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        FourthAnimationView()
    }
}
