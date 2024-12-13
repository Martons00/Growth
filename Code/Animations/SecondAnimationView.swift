//
//  SecondAnimationView.swift
//  WWDC_Tester
//
//  Created by Raffaele Martone on 13/04/23.
//

import SwiftUI

struct SecondAnimationView: View {
    
    @State var showModel = false
    
    var body: some View {
        VStack{
            VStack{
                ZStack{
                    Rectangle()
                        .frame(width: 100,height: 4)
                        .foregroundColor(.white)
                        .offset(y: -100)
                    SingleCircle2View()
                    Group2View()
                }
            }.frame(height: 400)
            Text("Loneliness")
                .font(.largeTitle)
                .foregroundColor(Color.white)
        }
        
        .sheet(isPresented: $showModel){
            ZStack{
                Color.black.opacity(0.3)
                VStack{
                Text("The Loneliness")
                Text(NSLocalizedString("Loneliness", comment: ""))
                    
                }
            }
        }
    }
}

struct SingleCircle2View: View {
    let timer = Timer
        .publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    @State var ypos : Double = -140
    @State var scaleFlag : Double = 1
    @State var entrata = true
    @State var opacity = 1.0
    @State var andata = true
    @State var feedback = true

    
    
    var body: some View {
        Circle()
            .frame(width: 30,height: 30)
            .foregroundColor(.white.opacity(0.4))
            .offset(y: ypos)
            .scaleEffect(scaleFlag)
            .animation(.easeInOut)
            .onReceive(timer) { time in
                if entrata{
                    ypos = ypos + 5
                    if ypos == 0 {
                        entrata = false
                    }
                } else {
                    if andata{
                        scaleFlag = scaleFlag + 0.1
                        if scaleFlag > 1.2{
                            andata = false
                        }
                    }else{
                        scaleFlag = scaleFlag - 0.1
                        if scaleFlag < 0.8 {
                            andata = true
                        }
                    }
                }
            }
    }
}


struct Group2View: View {
    let timer = Timer
        .publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    
    @State var xpos1 : Double = 0
    @State var xpos2 : Double = 0
    @State var index : Double = 0
    @State var op : Double = 0.7
    
    var body: some View {
        VStack{
            HStack{
                Circle()
                    .frame(width: 30,height: 30)
                    .foregroundColor(.blue.opacity(op))
                    .offset(y: 80)
                    .animation(.easeInOut)
            }
            HStack{
                Circle()
                    .frame(width: 30,height: 30)
                    .foregroundColor(.blue.opacity(0.7))
                    .offset(y: 100)
                    .offset(x: xpos1)
                    .animation(.easeInOut)
                Circle()
                    .frame(width: 30,height: 30)
                    .foregroundColor(.blue.opacity(0.7))
                    .offset(y: 100)
                    .offset(x: xpos2)
                    .animation(.easeInOut)
                Circle()
                    .frame(width: 30,height: 30)
                    .foregroundColor(.blue.opacity(0.7))
                    .offset(y: 100)
                    .offset(x: xpos1)
                    .animation(.easeInOut)
                Circle()
                    .frame(width: 30,height: 30)
                    .foregroundColor(.blue.opacity(0.7))
                    .offset(y: 100)
                    .offset(x: xpos2)
                    .animation(.easeInOut)
                Circle()
                    .frame(width: 30,height: 30)
                    .foregroundColor(.blue.opacity(0.7))
                    .offset(y: 100)
                    .offset(x: xpos1)
                    .animation(.easeInOut)
                Circle()
                    .frame(width: 30,height: 30)
                    .foregroundColor(.blue.opacity(0.7))
                    .offset(y: 100)
                    .offset(x: xpos2)
                    .animation(.easeInOut)
            }
        }
        .onReceive(timer) { time in
            index = index + 1
            if index > 40 {
                op = op - 0.01
                xpos1 = xpos1 + 5
                xpos2 = xpos2 - 5
            }
        }
    }
}

struct SecondAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        SecondAnimationView()
    }
}
