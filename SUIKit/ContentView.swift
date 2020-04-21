import SwiftUI
import SwiftUIKit

struct ContentView: View {
    var body: some View {
        List {
            Button(action: {
                Navigate.shared.toast(style: .success, pinToTop: false, secondsToPersist: 5, padding: 8) {
                    Label.title1("Toast!")
                }
            }) {
                Text("Get Toast")
            }
            SwiftUIView {
                Button({
                    Navigate.shared.alert(title: "Hello SwiftUI", message: "From... UIKit!", withActions: [.cancel], secondsToPersist: 5)
                }) {
                    Label("Show Alert")
                }
            }
        }
        .onAppear {
            Navigate.shared.set(title: "SwiftUIKit")
                .setRight(barButton:
                    BarButton {
                        NavButton(destination: ViewController {
                            UIView(withPadding: 32, backgroundColor: .white) {
                                VStack(distribution: .fillEqually) {
                                    [
                                        Label.title1("Example push ViewController")
                                            .number(ofLines: 3),
                                        Button({
                                            Navigate.shared.back(toRoot: true)
                                        }) {
                                            Label("Go Back to Root!")
                                                .text(alignment: .center)
                                                .text(color: .red)
                                        },
                                        Button({
                                            Navigate.shared.back()
                                        }) {
                                            Label("Go Back")
                                                .text(alignment: .center)
                                                .text(color: .blue)
                                        },
                                        NavButton(destination: UIHostingController(rootView: ContentView()), style: .push) {
                                            Label("Go Deeper")
                                                .text(alignment: .center)
                                                .text(color: .blue)
                                        }
                                    ]
                                }
                                .navigateSet(title: "ViewController (UIKit)")
                            }
                        }, style: .push) {
                            Label("EX Push").text(color: .blue)
                        }
                    }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
