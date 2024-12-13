//
//  FirstAnimationView.swift
//  WWDC_Tester
//
//  Created by Raffaele Martone on 13/04/23.
//

import SwiftUI

struct FirstAnimationView: View {
    
    
    let timer = Timer
        .publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    @State var op = 1.0
    @State var showModel = false
    
    var body: some View {
        VStack{
            VStack{
                ZStack{
                    GroupView()
                    Rectangle()
                        .frame(width: 100,height: 4)
                        .foregroundColor(.white)
                        .offset(y: 30)
                    SingleCircleView()
                }
            }.frame(height: 400)
            Text("The Disaster")
                .font(.largeTitle)
                .foregroundColor(Color.white)
        }
        
        .sheet(isPresented: $showModel){
            ZStack{
                Color.black.opacity(0.3)
                VStack{
                Text("The Disaster")
                Text(NSLocalizedString("Disaster", comment: ""))
                    
                }
            }
        }
    }
}


struct SingleCircleView: View {
    
    
    let timer = Timer
        .publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    @State var ypos : Double = 60
    @State var xpos : Double = 0
    @State var entrata = true
    @State var opacity = 1.0
    @State var andata = true
    
    
    var body: some View {
        Circle()
            .frame(width: 30,height: 30)
            .foregroundColor(.white.opacity(opacity))
            .offset(y: ypos)
            .offset(x: xpos)
            .animation(.easeInOut)
            .onReceive(timer) { time in
                if entrata{
                    ypos = ypos - 5
                    if ypos == 0 {
                        entrata = false
                    }
                } else {
                    if opacity > 0.4 {
                        opacity = opacity - 0.01
                        if andata{
                            xpos = xpos + 5
                            if xpos == 10{
                                andata = false
                            }
                        }else{
                            xpos = xpos - 5
                            if xpos == -10 {
                                andata = true
                            }
                        }
                    }else{
                        
                        if ypos < 60 {
                            xpos = 0
                            ypos = ypos + 5
                        }
                        
                    }
                    
                }
            }
    }
}

struct RectView: View {
    var body: some View {
        TrianglesAnimatinView()
            .offset(y: -150)
    }
}


struct GroupView: View {
    var body: some View {
        RectView()
            .rotationEffect(Angle(degrees: 60))
        RectView()
            .rotationEffect(Angle(degrees: 30))
        RectView()
        RectView()
            .rotationEffect(Angle(degrees: -30))
        RectView()
            .rotationEffect(Angle(degrees: -60))
    }
}

struct FirstAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        FirstAnimationView()
    }
}
