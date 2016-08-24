include('navigationcontroller.js')
include('firstviewcontroller.js')

require('SecondViewController')
require('UIColor')
require('UITabBarItem')

defineClass('TabBarController : UITabBarController', [], {
            
            viewDidLoad:function() {
                self.ORIGviewDidLoad();
            
                var first = FirstViewController.alloc().init()
                var firstItem = first.tabBarItem()
                first.setTitle('精选')
            
                var second = SecondViewController.alloc().init()
                var secondItem = second.tabBarItem()
                second.setTitle('发现')
            
                var firstNavi = NavigationController.alloc().initWithRootViewController(first)
                var secondNavi = NavigationController.alloc().initWithRootViewController(second)
        
                self.setViewControllers([firstNavi, secondNavi])
            }
            
            })