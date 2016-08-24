include('tabbarcontroller.js')

defineClass('AppDelegate', [  ], {
            
            runJS: function() {
                var tabBarController = TabBarController.alloc().init()
                var window = require('UIWindow').alloc().initWithFrame(require('UIScreen').mainScreen().bounds())
                self.setWindow(window)
                window.setRootViewController(tabBarController)
                window.makeKeyAndVisible()
            }
            
            })