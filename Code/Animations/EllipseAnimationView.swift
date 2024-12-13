//
//  EllipseAnimationView.swift
//  WWDC_Tester
//
//  Created by Raffaele Martone on 14/04/23.
//

import SwiftUI

struct EllipseAnimationView: View {
    @State var start: Double = 0
    @State var progress: Double = 0
    @State var andata = true
    @State var time : Double = 0.0
    @State private var rotation: Double = 0.0
    let timer = Timer
        .publish(every: 0.2, on: .main, in: .common)
        .autoconnect()
    var body: some View {
        VStack {
            ZStack {
                CircularProgressView(start: start, progress: progress,angle: 0)
                    .rotationEffect(.degrees(rotation))
                    .animation(Animation.linear(duration: 10).repeatForever(autoreverses: true))
                    .onAppear {
                        self.rotation = 360.0
                    }
                    .rotationEffect(Angle(degrees: rotation))
                CircularProgressView(start: start, progress: progress,angle: 90)
                    .rotationEffect(.degrees(rotation))
                    .animation(Animation.linear(duration: 10).repeatForever(autoreverses: true))
                    .onAppear {
                        self.rotation = 360.0
                    }
                    .rotationEffect(Angle(degrees: rotation))
                CircularProgressView(start: start, progress: progress,angle: 180)
                    .rotationEffect(.degrees(rotation))
                    .animation(Animation.linear(duration: 10).repeatForever(autoreverses: true))
                    .onAppear {
                        self.rotation = 360.0
                    }
                    .rotationEffect(Angle(degrees: rotation))
                CircularProgressView(start: start, progress: progress,angle: 270)
                    .rotationEffect(.degrees(rotation))
                    .animation(Animation.linear(duration: 10).repeatForever(autoreverses: true))
                    .onAppear {
                        self.rotation = 360.0
                    }
                    .rotationEffect(Angle(degrees: rotation))
            }
                .onReceive(timer) { time in
                    if andata{
                        progress = progress + 0.05
                        
                        if progress >= 1.0 {
                            progress = 1.0
                            start = start + 0.05
                            
                            if start >= 1.0 {
                                andata = false
                                
                            }
                            
                        }
                    } else {
                        start = start - 0.05
                        
                        if start <= 0.0 {
                            start = 0.0
                            progress = progress - 0.05
                            
                            if progress <= 0.0 {
                                andata = true
                            }
                        }
                    }
                }
        }
    }
    
}

struct CircularProgressView: View {
    let start : Double
    let progress: Double
    let angle: Double
    
    
    var body: some View {
        if !(start == 1 && progress == 1) {
            ZStack {
                Ellipse()
                    .trim(from: start, to: progress)
                    .stroke(
                        Color.yellow,
                        style: StrokeStyle(
                            lineWidth: 2,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(angle))
                    .animation(.easeOut, value: progress)
                    .animation(.easeOut, value: start)
                Ellipse()
                    .trim(from: start, to: progress)
                    .stroke(
                        Color.yellow,
                        style: StrokeStyle(
                            lineWidth: 2,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(angle + 30))
                    .animation(.easeOut, value: progress)
                    .animation(.easeOut, value: start)
                Ellipse()
                    .trim(from: start, to: progress)
                    .stroke(
                        Color.yellow,
                        style: StrokeStyle(
                            lineWidth: 2,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(angle + 60))
                    .animation(.easeOut, value: progress)
                    .animation(.easeOut, value: start)
                
                Ellipse()
                    .trim(from: start, to: progress)
                    .stroke(
                        Color.yellow,
                        style: StrokeStyle(
                            lineWidth: 2,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(angle))
                    .animation(.easeOut, value: progress)
                    .animation(.easeOut, value: start)
                Ellipse()
                    .trim(from: start, to: progress)
                    .stroke(
                        Color.yellow,
                        style: StrokeStyle(
                            lineWidth: 2,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(angle + 15))
                    .animation(.easeOut, value: progress)
                    .animation(.easeOut, value: start)
                Ellipse()
                    .trim(from: start, to: progress)
                    .stroke(
                        Color.yellow,
                        style: StrokeStyle(
                            lineWidth: 2,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(angle + 45))
                    .animation(.easeOut, value: progress)
                    .animation(.easeOut, value: start)
                Ellipse()
                    .trim(from: start, to: progress)
                    .stroke(
                        Color.yellow,
                        style: StrokeStyle(
                            lineWidth: 2,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(angle + 75))
                    .animation(.easeOut, value: progress)
                    .animation(.easeOut, value: start)
            }
        }
    }
}


struct EllipseAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        EllipseAnimationView()
    }
}
