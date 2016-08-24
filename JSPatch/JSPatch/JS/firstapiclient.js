
var _firstAPIClientInstance

defineClass('FirstAPIClient:AFHTTPSessionManager', [ ],{
            
            },
            
            {
            
                sharedClient:function() {
                    if(!_firstAPIClientInstance) {
                        _firstAPIClientInstance = FirstAPIClient.manager()
                    }
                    return _firstAPIClientInstance
                }
            
            })