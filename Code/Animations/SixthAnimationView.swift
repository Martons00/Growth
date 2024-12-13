//
//  SixthAnimationView.swift
//  WWDC_Tester
//
//  Created by Raffaele Martone on 13/04/23.
//

import SwiftUI

struct SixthAnimationView: View {
    
    let timer = Timer
        .publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    @State var op = 1.0
    @State var showModel = false
    
    var body: some View {
        VStack{
            VStack{
                ZStack{
                        Group6View()
                        .offset(y: -150)
                        Rectangle()
                            .frame(width: 250,height: 4)
                            .foregroundColor(.white)
                        SingleCircle6View()
                        .offset(y: 80)
                }
            }.frame(height: 400)
            Text("The Metamorphosis")
                .font(.largeTitle)
                .foregroundColor(Color.white)
        }
        .sheet(isPresented: $showModel){
            ZStack{
                Color.black.opacity(0.3)
                VStack{
                Text("The Metamorphosis")
                Text(NSLocalizedString("Metamorphosis", comment: ""))
                    
                }
            }
        }
    }
}

struct SingleCircle6View: View {
    let timer = Timer
        .publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    @State var entrata = true
    @State var opacity = 1.0
    @State var andata = true
    @State var appear = false
    @State var scaleEffect = 2.5
    
    
    var body: some View {
        
    if appear{
    EllipseAnimationView()
        .frame(width: 20,height: 80)
        
    }
        Circle()
            .frame(width: 30,height: 30)
            .foregroundColor(.yellow.opacity(opacity))
            .scaleEffect(scaleEffect)
            .animation(.easeInOut)
        
            .onReceive(timer) { time in
                if andata {
                    scaleEffect = scaleEffect - 0.1
                    if scaleEffect < 0 {
                        andata = false
                    }
                } else {
                    appear = true
                }
            }
    }
}



struct Group6View: View {
    var body: some View {
        VStack{
            HStack{
                Circle()
                    .foregroundColor(Color.pink.opacity(1))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(1))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(1))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(1))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(1))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(1))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(1))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(1))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(1))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(1))
                    .frame(width: 20)
            }
            HStack{
                Circle()
                    .foregroundColor(Color.pink.opacity(0.8))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.8))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.8))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.8))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.8))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.8))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.8))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.8))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.8))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.8))
                    .frame(width: 20)
            }
            HStack{
                Circle()
                    .foregroundColor(Color.pink.opacity(0.6))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.6))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.6))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.6))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.6))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.6))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.6))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.6))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.6))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.6))
                    .frame(width: 20)
            }
            HStack{
                Circle()
                    .foregroundColor(Color.pink.opacity(0.4))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.4))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.4))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.4))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.4))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.4))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.4))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.4))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.4))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.4))
                    .frame(width: 20)
            }
            HStack{
                Circle()
                    .foregroundColor(Color.pink.opacity(0.2))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.2))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.2))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.2))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.2))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.2))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.2))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.2))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.2))
                    .frame(width: 20)
                Circle()
                    .foregroundColor(Color.pink.opacity(0.2))
                    .frame(width: 20)
            }
        }
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}


struct SixthAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        SixthAnimationView()
    }
}
