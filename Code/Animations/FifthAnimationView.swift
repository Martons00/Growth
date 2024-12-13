//
//  FifthAnimationView.swift
//  WWDC_Tester
//
//  Created by Raffaele Martone on 13/04/23.
//

import SwiftUI

struct FifthAnimationView: View {
    
    
    let timer = Timer
        .publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    @State var op = 1.0
    @State var showModel = false
    
    var body: some View {
        VStack{
            VStack{
                    ZStack{
                    FlowerAnimationView()
                            .scaleEffect(0.7)
                            .offset(y: -150)
                    SingleCircle5View()
                            .offset(y: 60)
                }
            }.frame(height: 400)
            Text("The Rehab")
                .font(.largeTitle)
                .foregroundColor(Color.white)        }
        
        .sheet(isPresented: $showModel){
            ZStack{
                Color.black.opacity(0.3)
                VStack{
                Text("The Rehab")
                Text(NSLocalizedString("Rehab", comment: ""))
                    
                }
            }
        }
    }
}



struct SingleCircle5View: View {
    let timer = Timer
        .publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    @State var entrata = true
    @State var opacity = 1.0
    @State var andata = true
    @State var scaleEffect = 0.0
    
    
    var body: some View {
        TringlesFillAnimationView()
        Circle()
            .frame(width: 30,height: 30)
            .foregroundColor(.yellow.opacity(opacity))
            .scaleEffect(scaleEffect)
            .animation(.easeInOut)
            .onReceive(timer) { time in
                if andata {
                    scaleEffect = scaleEffect + 0.1
                    if scaleEffect > 2.5 {
                        andata = false
                    }
                } else {
                    
                }
            }
    }
}

struct FifthAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        FifthAnimationView()
    }
}
