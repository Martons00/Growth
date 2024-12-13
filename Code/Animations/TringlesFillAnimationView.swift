//
//  TringlesFillAnimationView.swift
//  WWDC_Tester
//
//  Created by Raffaele Martone on 13/04/23.
//

import SwiftUI

struct TringlesFillAnimationView: View {
    @State var start: Double = 0.0
    @State var progress: Double = 0.0
    @State var andata = true
    @State var time : Double = 0.0
    let timer = Timer
        .publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    var body: some View {
        VStack {
            ZStack {
                TriangularFillView(progress: progress, start: start, angle: 0)
                TriangularFillView(progress: progress, start: start, angle: 180)
            }
            .onReceive(timer) { time in
                if andata{
                    progress = progress + 0.01
                    
                    if progress >= 1 {
                        progress = 1
                        start = start + 0.01
                        
                        if start >= 1 {
                            start = 1
                            andata = false
                        }
                        
                    }
                } else {
                    start = start - 0.01
                    
                    if start <= 0 {
                        start = 0
                        progress = progress - 0.01
                        
                        if progress <= 0 {
                            andata = true
                            progress = 0
                        }
                    }
                }
            }
        }.frame(width: 50,height: 50)
    }
    
}

struct TriangularFillView: View {
    @State private var rotation: Double = 0.0
    let progress : Double
    let start: Double
    let angle : Double
    
    
    var body: some View {
        Triangle()
            .foregroundColor(.red.opacity(0.5))
            .rotationEffect(.degrees(rotation))
            .animation(.easeOut, value: progress)
            .animation(.easeOut, value: start)
            .animation(Animation.linear(duration: 10).repeatForever(autoreverses: false))
            .onAppear {
                self.rotation = 360.0
            }
            .rotationEffect(Angle(degrees: angle + rotation))
        Triangle()
            .foregroundColor(.red.opacity(0.3))
            .rotationEffect(.degrees(rotation))
            .animation(.easeOut, value: progress)
            .animation(.easeOut, value: start)
            .animation(Animation.linear(duration: 10).repeatForever(autoreverses: false))
            .onAppear {
                self.rotation = 360.0
            }
            .rotationEffect(Angle(degrees: angle + 30  + rotation))
        Triangle()
            .foregroundColor(.red.opacity(0.5))
            .rotationEffect(.degrees(rotation))
            .animation(.easeOut, value: progress)
            .animation(.easeOut, value: start)
            .animation(Animation.linear(duration: 10).repeatForever(autoreverses: false))
            .onAppear {
                self.rotation = 360.0
            }
        
            .rotationEffect(Angle(degrees: angle + 60  + rotation))
        Triangle()
            .foregroundColor(.red.opacity(0.3))
            .rotationEffect(.degrees(rotation))
            .animation(.easeOut, value: progress)
            .animation(.easeOut, value: start)
            .animation(Animation.linear(duration: 10).repeatForever(autoreverses: false))
            .onAppear {
                self.rotation = 360.0
            }
        
            .rotationEffect(Angle(degrees: angle + 90  + rotation))
        Triangle()
            .foregroundColor(.red.opacity(0.5))
            .rotationEffect(.degrees(rotation))
            .animation(.easeOut, value: progress)
            .animation(.easeOut, value: start)
            .animation(Animation.linear(duration: 10).repeatForever(autoreverses: false))
            .onAppear {
                self.rotation = 360.0
            }
        
            .rotationEffect(Angle(degrees: angle + 120  + rotation))
        Triangle()
            .foregroundColor(.red.opacity(0.3))
            .rotationEffect(.degrees(rotation))
            .animation(.easeOut, value: progress)
            .animation(.easeOut, value: start)
            .animation(Animation.linear(duration: 10).repeatForever(autoreverses: false))
            .onAppear {
                self.rotation = 360.0
            }
        
            .rotationEffect(Angle(degrees: angle + 150  + rotation))
        
    }
}



struct TringlesFillAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        TringlesFillAnimationView()
    }
}
