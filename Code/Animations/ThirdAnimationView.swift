//
//  ThirdAnimationView.swift
//  WWDC_Tester
//
//  Created by Raffaele Martone on 13/04/23.
//

import SwiftUI

struct ThirdAnimationView: View {
    
    let timer = Timer
        .publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    @State var op = 1.0
    @State var showModel = false
    
    var body: some View {
        VStack{
            VStack{
                ZStack{
                    Circle()
                        .frame(width: 30,height: 30)
                        .foregroundColor(.green.opacity(0.4))
                        .offset(y: 70)
                        .animation(.easeInOut)
                    Circle()
                        .frame(width: 30,height: 30)
                        .foregroundColor(.green.opacity(0.4))
                        .offset(y: 70)
                        .animation(.easeInOut)
                        .rotationEffect(Angle(degrees: 40))
                    Circle()
                        .frame(width: 30,height: 30)
                        .foregroundColor(.green.opacity(0.4))
                        .offset(y: 70)
                        .animation(.easeInOut)
                        .rotationEffect(Angle(degrees: 80))
                    Circle()
                        .frame(width: 30,height: 30)
                        .foregroundColor(.green.opacity(0.4))
                        .offset(y: 70)
                        .animation(.easeInOut)
                        .rotationEffect(Angle(degrees: 120))
                    Circle()
                        .frame(width: 30,height: 30)
                        .foregroundColor(.green.opacity(0.4))
                        .offset(y: 70)
                        .animation(.easeInOut)
                        .rotationEffect(Angle(degrees: 160))
                    Circle()
                        .frame(width: 30,height: 30)
                        .foregroundColor(.green.opacity(0.4))
                        .offset(y: 70)
                        .animation(.easeInOut)
                        .rotationEffect(Angle(degrees: 200))
                    Circle()
                        .frame(width: 30,height: 30)
                        .foregroundColor(.green.opacity(0.4))
                        .offset(y: 70)
                        .animation(.easeInOut)
                        .rotationEffect(Angle(degrees: 240))
                    Circle()
                        .frame(width: 30,height: 30)
                        .foregroundColor(.green.opacity(0.4))
                        .offset(y: 70)
                        .animation(.easeInOut)
                        .rotationEffect(Angle(degrees: 280))
                    Circle()
                        .frame(width: 30,height: 30)
                        .foregroundColor(.green.opacity(0.4))
                        .offset(y: 70)
                        .animation(.easeInOut)
                        .rotationEffect(Angle(degrees: 320))
                    SingleCircle3View()
                }
            }.frame(height: 400)
            Text("The Anger")
                .font(.largeTitle)
                .foregroundColor(Color.white)        }
        
        .sheet(isPresented: $showModel){
            ZStack{
                Color.black.opacity(0.3)
                VStack{
                Text("The Anger")
                Text(NSLocalizedString("Anger", comment: ""))
                    
                }
            }
        }
    }
}


struct SingleCircle3View: View {
    let timer = Timer
        .publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    @State var ypos : Double = 60
    @State var xpos : Double = 0
    @State var entrata = true
    @State var opacity1 = 1.0
    @State var scaleEffect = 0.0
    @State var andata = true
    
    
    var body: some View {
        Circle()
            .frame(width: 30,height: 30)
            .foregroundColor(.white.opacity(opacity1))
            .animation(.easeInOut)
                TringlesFillAnimationView()
                    .scaleEffect(scaleEffect)
                    .animation(.easeInOut, value: scaleEffect)
            .onReceive(timer) { time in
                if opacity1 > 0{
                    opacity1 = opacity1 - 0.1
                }else{
                    if scaleEffect < 4 {
                    scaleEffect = scaleEffect + 0.1
                        
                    }
                }
            }
    }
}


struct ThirdAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdAnimationView()
    }
}
