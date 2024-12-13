//
//  IntroductionView.swift
//  WWDC_Tester
//
//  Created by Raffaele Martone on 14/04/23.
//

import SwiftUI

struct IntroductionView: View {
    
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ZStack{
                Color.gray.opacity(0.15)
                VStack(spacing: 20){
                    Text("Introduction")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                    Text(text.intro1)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .font(.title3)
                    Spacer()
                    Button(action: {
                        self.viewController?.present(style: .fullScreen, transitionStyle: .flipHorizontal) {
                            ContentView(index: 0)
                        }
                    }) {
                        Text("Start")
                            .font(.title2)
                            .fontWeight(.heavy)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 30.0)
                
            }.cornerRadius(50)
                .padding(.horizontal)
        }
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}
