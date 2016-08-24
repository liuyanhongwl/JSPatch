include('firstvideo.js')
require('UIImageView')
require('UILabel')
require('UIFont')
require('UIColor')
require('NSURL')
require('MASUtilities')
require('View+MASAdditions')
require('View+MASShorthandAdditions')
require('ViewController+MASAdditions')
require('NSArray+MASAdditions')
require('NSArray+MASShorthandAdditions')
require('MASConstraint')
require('MASCompositeConstraint')
require('MASViewAttribute')
require('MASViewConstraint')
require('MASConstraintMaker')
require('MASLayoutConstraint')
require('NSLayoutConstraint+MASDebugAdditions')

defineClass('FirstCell:UITableViewCell', [ 'imgView', 'titleLabel', 'video' ], {
            
            initWithStyle_reuseIdentifier:function(style, identifier) {
                
                var result = self.super().initWithStyle_reuseIdentifier(style, identifier)
                if(result) {
            
                    var view = UIImageView.alloc().init()
                    self.setImgView(view)
                    self.contentView().addSubview(view)
            
                    view = UILabel.alloc().init()
                    view.setFont(UIFont.boldSystemFontOfSize(20))
                    view.setTextColor(UIColor.whiteColor())
                    self.setTitleLabel(view)
                    self.contentView().addSubview(view)
            
                    var weakSelf = __weak(self)
            
                    self.imgView().mas__makeConstraints(block("MASConstraintMaker *", function(make) {
                                                             make.leading().equalTo()(weakSelf.contentView())
                                                             make.trailing().equalTo()(weakSelf.contentView())
                                                             make.top().equalTo()(weakSelf.contentView())
                                                             make.bottom().equalTo()(weakSelf.contentView())
                                                             }))
            
                    self.titleLabel().mas__makeConstraints(block("MASConstraintMaker *", function(make) {
                                                                 make.center().equalTo()(weakSelf.contentView())
                                                                 }))

                }
                return result
            },
            
            
            setModel: function(model) {
            
                self.setVideo(model)
            
                self.imgView().setImage(null)
                var url = NSURL.URLWithString(self.video().cover)
                self.imgView().setImageWithURL(url)
                self.titleLabel().setText(self.video().title)
            
            }
    
            })






