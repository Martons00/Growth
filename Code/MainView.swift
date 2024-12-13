//
//  MainView.swift
//  WWDC_Tester
//
//  Created by Raffaele Martone on 14/04/23.
//

import SwiftUI

struct MainView: View {
    @State var ypos = false
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack{
                ZStack{
                    backgroungMainView()
                    VStack{
                        Text("Growth")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                        if ypos {
                            Button(action: {
                                self.viewController?.present(style: .fullScreen, transitionStyle: .crossDissolve) {
                                    IntroductionView()
                               }
                            }) {
                                    Image(systemName: "play.circle.fill")
                                        .resizable()
                                    .frame(width: 40,height: 40)
                            }
                        }
                    }.frame(width: 250, height: 150)
                        .background(){
                            RoundedRectangle(cornerSize: CGSize(width: 250, height: 120))
                                .foregroundColor(
                                    Color.gray.opacity(0.15))
                        }
                        .offset(y: ypos ? 300:0)
                        .animation(Animation.easeInOut(duration:5).delay(0))
                    
                }
            }
            .onAppear(){
                self.ypos.toggle()
            }
        }
    }
}

struct backgroungMainView: View {
    
    let timer = Timer
        .publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    
    @State var ypos1 : Double = 0
    @State var xpos1 : Double = 0
    @State var ypos2 : Double = 0
    @State var xpos2 : Double = 0
    @State var ypos3 : Double = 0
    @State var xpos3 : Double = 0
    @State var ypos4 : Double = 0
    @State var xpos4 : Double = 0
    
    @State var ypos11 : Double = 0
    @State var xpos11 : Double = 0
    @State var ypos22 : Double = 0
    @State var xpos22 : Double = 0
    @State var ypos33 : Double = 0
    @State var xpos33 : Double = 0
    @State var ypos44 : Double = 0
    @State var xpos44 : Double = 0
    
    @State var ypos5 : Double = 0
    @State var xpos5 : Double = 0
    @State var ypos6 : Double = 0
    @State var xpos6 : Double = 0
    @State var ypos7 : Double = 0
    @State var xpos7 : Double = 0
    
    @State var index = 0
    
    var body: some View {
        ZStack {
            EllipseAnimationView()
                .offset(x: xpos1,y: ypos1)
                .frame(width: 40,height: 160)
                .animation(Animation.easeInOut(duration:6).delay(0))
            FlowerAnimationView()
                .offset(x: xpos2,y: ypos2)
                .frame(width: 10,height: 10)
                .animation(Animation.easeInOut(duration:6).delay(0))
            TrianglesAnimatinView()
                .offset(x: xpos3,y: ypos3)
                .frame(width: 80,height: 160)
                .animation(Animation.easeInOut(duration:6).delay(0))
            TringlesFillAnimationView()
                .offset(x: xpos4,y: ypos4)
                .frame(width: 80,height: 160)
                .animation(Animation.easeInOut(duration:6).delay(0))
            EllipseAnimationView()
                .offset(x: xpos11,y: ypos11)
                .frame(width: 40,height: 160)
                .animation(Animation.easeInOut(duration:4).delay(0))
            EllipseAnimationView()
                .offset(x: xpos22,y: ypos22)
                .frame(width: 40,height: 160)
                .animation(Animation.easeInOut(duration:4).delay(0))
            TrianglesAnimatinView()
                .offset(x: xpos33,y: ypos33)
                .frame(width: 80,height: 160)
                .animation(Animation.easeInOut(duration:4).delay(0))
            TringlesFillAnimationView()
                .offset(x: xpos44,y: ypos44)
                .frame(width: 40,height: 160)
                .animation(Animation.easeInOut(duration:4).delay(0))
            TrianglesAnimatinView()
                .offset(x: xpos5,y: ypos5)
                .frame(width: 20,height: 80)
                .animation(Animation.easeInOut(duration:4).delay(0))
            TringlesFillAnimationView()
                .offset(x: xpos6,y: ypos6)
                .frame(width: 20,height: 80)
                .animation(Animation.easeInOut(duration:4).delay(0))
        }
        
        .onReceive(timer) { time in
            index = index + 1
            if ((index % 60) == 0) {
                xpos1 = Double.random(in: -150...150)
                ypos1 = Double.random(in: -400...140)
                xpos2 = Double.random(in: -150...150)
                ypos2 = Double.random(in: -300...100)
                xpos3 = Double.random(in: -150...150)
                ypos3 = Double.random(in: -400...140)
                xpos4 = Double.random(in: -150...150)
                ypos4 = Double.random(in: -400...140)
                xpos6 = Double.random(in: -150...150)
                ypos6 = Double.random(in: -400...140)
            }
            if ((index % 40) == 0) {
                xpos11 = Double.random(in: -150...150)
                ypos11 = Double.random(in: -400...140)
                xpos22 = Double.random(in: -150...150)
                ypos22 = Double.random(in: -300...100)
                xpos33 = Double.random(in: -150...150)
                ypos33 = Double.random(in: -400...140)
                xpos44 = Double.random(in: -150...150)
                ypos44 = Double.random(in: -400...140)
                xpos5 = Double.random(in: -150...150)
                ypos5 = Double.random(in: -400...140)
            }
        }
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
