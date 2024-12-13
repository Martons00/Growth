import SwiftUI

struct ContentView: View {
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder
    }
    
    @State var showModel = false
    @State var showInfoModel = false
    
    let index : Int
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack{
                
                HStack{
                    Spacer()
                    Button(action: { showInfoModel=true }){
                        Image(systemName: "info.circle.fill").foregroundColor(.yellow)
                        
                    }
                    
                }
                .padding(.horizontal)
                .padding(.bottom, 10.0)
                
                CardAnimationView(index: index)
                    .padding(.horizontal)
                Text("\(index+1)/7")
                    .foregroundColor(.white)
                HStack{
                    if index != 0 {
                        Button(action: {
                            self.viewController?.present(style: .fullScreen, transitionStyle: .crossDissolve) {
                                ContentView(index: index - 1)
                            }
                        }) {
                            VStack{
                                Image(systemName: "arrow.left.circle.fill")
                                    .resizable()
                                    .frame(width: 40,height: 40)
                                Text("Prev")
                            }
                        }
                        .padding()
                    } else {
                        Button (action: {
                            self.viewController?.present(style: .fullScreen, transitionStyle: .crossDissolve) {
                                ContentView(index: 0)
                            }
                        }) {
                            VStack{
                                Image(systemName: "arrow.left.circle.fill")
                                    .resizable()
                                    .foregroundColor(Color.gray)
                                    .frame(width: 40,height: 40)
                                Text("Prev")
                                    .foregroundColor(Color.gray)
                            }
                        }
                        .padding()
                    }
                    Button(action: {showModel = true}){
                        VStack{
                            Image(systemName: "book.circle.fill")
                                .resizable()
                                .frame(width: 40,height: 40)
                            Text("Read")
                        }
                    }
                    if index != 6 {
                        Button(action: {
                            self.viewController?.present(style: .fullScreen, transitionStyle: .partialCurl) {
                                ContentView(index: index + 1)
                            }
                        }) {
                            VStack{
                                Image(systemName: "arrow.right.circle.fill")
                                    .resizable()
                                    .frame(width: 40,height: 40)
                                Text("Next")
                            }
                        }
                        .padding()
                    } else {
                        Button (action: {
                            self.viewController?.present(style: .fullScreen, transitionStyle: .crossDissolve) {
                                ContentView(index: 6)
                            }
                        }) {
                            VStack{
                                Image(systemName: "arrow.right.circle.fill")
                                    .resizable()
                                    .foregroundColor(Color.gray)
                                    .frame(width: 40,height: 40)
                                Text("Next")
                                    .foregroundColor(Color.gray)
                            }
                        }
                        .padding()
                    }
                }.padding()
            }
            .sheet(isPresented: $showInfoModel){
                ZStack{
                    Color.black.opacity(0.9).ignoresSafeArea()
                    VStack{
                        VStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 100, height: 8)
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 30.0)
                            Text("Introduction\n")
                                .font(.largeTitle)
                                .foregroundColor(Color.white)
                        
                            Text(text.intro1)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                                .font(.title3)
                            Spacer()
                        }
                    .padding(.horizontal)
                    }
            }
            .sheet(isPresented: $showModel){
                ZStack{
                    Color.black.opacity(0.9).ignoresSafeArea()
                    VStack{
                        VStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 100, height: 8)
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 30.0)
                        VStack(spacing: 20){
                            Text(text.title[index])
                                .font(.largeTitle)
                                .foregroundColor(Color.white)
                            Text("\(index + 1)° scene \n")
                                .font(.title2)
                                .foregroundColor(Color.white)
                            Text(text.quadri[index])
                                .font(.title3)
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.leading)
                            
                        }
                        .padding(.horizontal)
                        Spacer()
                    }
                }
            }
        }
    }
}



struct ViewControllerHolder {
    weak var value: UIViewController?
}

struct ViewControllerKey: EnvironmentKey {
    static var defaultValue: ViewControllerHolder {
        return ViewControllerHolder(value: UIApplication.shared.windows.first?.rootViewController)
        
    }
}

extension EnvironmentValues {
    var viewController: UIViewController? {
        get { return self[ViewControllerKey.self].value }
        set { self[ViewControllerKey.self].value = newValue }
    }
}

extension UIViewController {
    func present<Content: View>(style: UIModalPresentationStyle = .automatic, transitionStyle: UIModalTransitionStyle = .coverVertical, @ViewBuilder builder: () -> Content) {
        let toPresent = UIHostingController(rootView: AnyView(ZStack{Color.black}))
        toPresent.modalPresentationStyle = style
        toPresent.modalTransitionStyle = transitionStyle
        toPresent.rootView = AnyView(
            builder()
                .environment(\.viewController, toPresent)
        )
        self.present(toPresent, animated: true, completion: nil)
    }
}
