include('webviewcontroller.js')
require('UIBarButtonItem')
require('WebViewController')

defineClass('SecondViewController', ['rightItemButton'], {
            
            viewDidAppear:function(animate) {
                self.super().viewDidAppear(animate)
            
                if(!self.navigationItem().rightBarButtonItem()) {
                    var item = UIBarButtonItem.alloc().initWithBarButtonSystemItem_target_action(9, self, "leftItemAction")
                    self.navigationItem().setRightBarButtonItem(item)
                }
            
            },
            
            leftItemAction:function() {
                var webVC = WebViewController.alloc().init()
                webVC.setUrlString("http://www.wandoujia.com/eyepetizer/article.html?nid=935")
                self.navigationController().pushViewController_animated(webVC, 1)
            }
            
            })