//
//  HMSVideoViewFactory.swift
//  hmssdk_flutter
//
//  Created by Vivek Yadav on 17/07/21.
//

import Foundation
import Flutter
import HMSSDK
class  HMSVideoViewFactory: NSObject,FlutterPlatformViewFactory {
    let messenger: FlutterBinaryMessenger
    let plugin:SwiftHmssdkFlutterPlugin
    
    init(messenger:FlutterBinaryMessenger,plugin:SwiftHmssdkFlutterPlugin) {
        self.messenger = messenger
        self.plugin = plugin
    }
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {

        let arguments = args as! Dictionary<String, AnyObject>
        var newFrame = frame
        let isLocal:Bool = arguments["is_local"] as? Bool ?? true
        let id:String = arguments["peer_id"] as? String ?? ""
        let height:Int = arguments["height"] as? Int ?? 100
        let width:Int = arguments["width"] as? Int ?? 100
        
        if frame.height == 0 && frame.width == 0{
            newFrame = CGRect(x: 0, y: 0, width: width, height: height)
        }

        let peer:HMSPeer? = plugin.getPeerById(id: id, isLocal: isLocal)
        return HMSVideoViewWidget(frame: newFrame, viewIdentifier: viewId, arguments: args, binaryMessenger: messenger,peer: peer)
    }
    
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
        
    }
}

class HMSVideoViewWidget: NSObject,FlutterPlatformView {
    private var args:Any?
    var timer = Timer()
    private var _view:UIView
    private var peer:HMSPeer?
    var count:Int = 0
    let frame:CGRect
    
    init(frame:CGRect,viewIdentifier viewId:Int64, arguments args:Any?, binaryMessenger messenger: FlutterBinaryMessenger, peer:HMSPeer?) {
        self.args=args
        self.frame=frame
        self._view=UIView(frame: frame)
        self.peer=peer
        super.init()
        createHMSVideoView()
    }
    
    func createHMSVideoView(){
       let videoView = HMSVideoView()
        videoView.frame = frame
        if let videoTrack = peer?.videoTrack{
            videoView.setVideoTrack(videoTrack)
            _view.addSubview(videoView)
            print("attaching video track")
        }else{
            let lable:UILabel=UILabel()
            lable.text = "NO Video available"
            print("NO video found")
        }
       
    }
    
    
    func view() -> UIView {
        return _view
    }
    
}
