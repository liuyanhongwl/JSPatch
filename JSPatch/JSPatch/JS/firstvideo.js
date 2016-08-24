defineJSClass('FirstVideo', {
              
                  setTitle:function(title) {
                      this.title = title
                  },
              
                  setCover:function(cover) {
                      this.cover = cover
                  },
                  
                  setPlayUrl:function(playUrl) {
                      this.playUrl = playUrl
                  },
              
              },
              {
                  modelWithJSON:function(json) {
                      var video = FirstVideo.alloc().init()
              
                      video.setTitle(json["title"])
                      var cover = json["cover"] ? json["cover"]["feed"] : null
                      video.setCover(cover)
                      video.setPlayUrl(json["playUrl"])
              
                      return video
                  }
              }
              )