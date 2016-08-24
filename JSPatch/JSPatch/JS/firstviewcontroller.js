include('firstcell.js')
include('firstvideo.js')
include('firstapiclient.js')
require('UITableView')
require('FirstCell')
require('AVPlayerViewController')
require('AVPlayer')
require('NSURL')
require('NSBundle')
require('NSMutableArray')
var bundle = NSBundle.bundleWithPath("/System/Library/Frameworks/AVKit.framework");
bundle.load();
bundle = NSBundle.bundleWithPath("/System/Library/Frameworks/AVFoundation.framework");
bundle.load();

defineClass('FirstViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>', [ 'tableView', 'data' ], {
            
            viewDidLoad: function() {
                self.super().viewDidLoad()
            
                self.view().setBackgroundColor(require('UIColor').whiteColor())
            
                self.setData([])
            
                var tableView = UITableView.alloc().initWithFrame(self.view().frame())
                self.setTableView(tableView)
                self.tableView().setDelegate(self)
                self.tableView().setDataSource(self)
                self.view().addSubview(tableView)
            
                self.getItemsCompletion()
            },
            
            
            
            numberOfSectionsInTableView: function(tableView) {
                return 1;
            },
            
            tableView_numberOfRowsInSection: function(tableView, section) {
                console.log(self.data().length)
                return self.data().length;
            },
            
            tableView_cellForRowAtIndexPath: function(tableView, indexPath) {
                var cell = tableView.dequeueReusableCellWithIdentifier("cell")
                if (!cell) {
                    cell = FirstCell.alloc().initWithStyle_reuseIdentifier(0, "cell")
                }
                cell.setModel(self.data()[indexPath.row()])
                return cell
            },
            
            tableView_heightForRowAtIndexPath: function(tableView, indexPath) {
                return tableView.frame().width * 3.0 / 5.0
            },
            
            tableView_didSelectRowAtIndexPath: function(tableView, indexPath) {
                var video = self.data()[indexPath.row()]
                var string = video.playUrl
                var url = NSURL.URLWithString(string)
                var player = AVPlayer.playerWithURL(url)
                var vc = AVPlayerViewController.alloc().init()
                vc.setPlayer(player)
                self.presentViewController_animated_completion(vc, 1, null)
            },
            
            
            getItemsCompletion:function() {
                var weakSelf = __weak(self)
                var params =   {
                    "_s":"4f9b3345d32ebc6eb84e0c8b06f6a922",
                    "f":"iphone",
                    "net":"wifi",
                    "u":"df7e3f78c0ca206776252f02465ef4b05ccc8391",
                    "v":"2.4.0",
                    "vc":"1014"
                }
                
                var urlString = "http://baobab.wandoujia.com/api/v3/tabs/selected"
                
                var client = FirstAPIClient.sharedClient()
                client.GET_parameters_progress_success_failure(urlString,
                                                               params,
                                                               block("NSProgress *", function(downloadProgress) {
                                                                     }),
                                                               block("NSURLSessionDataTask *, id", function(task, responseObject) {
                                                                     
                                                                     var list = responseObject.objectForKey("sectionList")
                                                                     var itemList
                                                                     if(list.firstObject())
                                                                     {
                                                                        itemList = list.firstObject().objectForKey("itemList").toJS()
                                                                     }
                                                                     var result = NSMutableArray.array()
                                                                     for (var index in itemList) {
                                                                         var item = itemList[index]
                                                                         var json = item["data"]
                                                                         var video = FirstVideo.modelWithJSON(json)
                                                                         result.addObject(video)
                                                                     }
                                                                    
                                                                    console.log(result)
                                                                    dispatch_async_main(function(){
                                                                                        weakSelf.setData(result.toJS())
                                                                                        weakSelf.tableView().reloadData()
                                                                                        })
                                                                     
                                                                     }),
                                                               block("NSURLSessionDataTask *, NSError *", function(task, error) {
                                                                     console.log(error)
                                                                     }))
            
            }
})














