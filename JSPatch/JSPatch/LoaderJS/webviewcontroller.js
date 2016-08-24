require('NSURL')
require('NSURLRequest')
require('UIWebView')

defineClass('WebViewController', {
            
            viewDidLoad:function() {
            self.ORIGviewDidLoad()
            console.log("didload")
            
            var url = NSURL.alloc().initWithString("http://www.apple.com")
            var request = NSURLRequest.requestWithURL(url)
            self.webView().loadRequest(request)
            

//            var slf = __weak(self)
//            return UIWebView.alloc().performSelectorInOC('initWithFrame:', [self.view().bounds()],function(webView){
//                         if(slf) {
//                             var url = NSURL.alloc().initWithString("http://www.apple.com");
//                             webView.loadRequest(NSURLRequest.requestWithURL(url));
//                             slf.view().addSubview(webView);
//                             slf.setWebView(webView)
//                         }
//                  });
            },
            
            
            dealloc:function() {
                 console.log("dealloc")
            }
            
            })

