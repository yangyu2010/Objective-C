import UIKit

class Window {
    var rootView: View?
    
    deinit {
        print("Window deinit")
    }
}

class View {
    unowned var window: Window
    init(window: Window) {
        self.window = window
    }
    
    deinit {
        print("View deinit")
    }
}

//var window: Window? = Window()
//window = nil


var window: Window? = Window() // window: 1
var view: View? = View(window: window!) // window: 2, view: 1
window?.rootView = view // window: 2, view: 2
window = nil
//print(view?.window)
//view = nil
