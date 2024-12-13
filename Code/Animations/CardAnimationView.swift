//
//  CardAnimationView.swift
//  WWDC_Tester
//
//  Created by Raffaele Martone on 12/04/23.
//

import SwiftUI

struct CardAnimationView: View {
    let index : Int 
    var body: some View {
        ZStack{
            Color.gray.opacity(0.15)
                
            switch index {
            case 0:
                FirstAnimationView()
            case 1:
                SecondAnimationView()
            case 2:
                ThirdAnimationView()
            case 3:
                FourthAnimationView()
            case 4:
                FifthAnimationView()
            case 5:
                SixthAnimationView()
            case 6:
                SeventhAnimationView()
            default:
                Text("Error")
            }
        }
        .border(.gray)
    }
}

struct CardAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CardAnimationView(index: 0)
    }
}
