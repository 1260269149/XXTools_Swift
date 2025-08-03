//
//  Tools.swift
//  Calculator
//
//  Created by wangxu on 2020/10/15.
//  Copyright © 2020 wangxu. All rights reserved.
//

import UIKit
import AVFoundation
import StoreKit
public class XXTools: NSObject {
    
    internal static var appstoreId: String = ""
    internal static var themColor: UIColor = .white
    
    public static func config(appstoreId: String = "", themColor: UIColor = .white){
        XXTools.appstoreId = appstoreId
        XXTools.themColor = themColor
    }
    
    public static func call(telNum: String?){
        guard let telNum = telNum, telNum.count > 0 else {
            XXTools.alertHint(title: local_phoneNumErr, msg: "")
            return
        }
        if let phoneUrl = URL(string: "tel://\(telNum)"){
            if UIApplication.shared.canOpenURL(phoneUrl){
                
                UIApplication.shared.open(phoneUrl)
            }else{
                XXTools.alertHint(title: local_deviceNotSupported, msg: "")
            }
        }else{
            XXTools.alertHint(title: local_phoneNumErr, msg: "")
        }
    }
    public static func message(telNum: String?){
        
        
    }
    public static func openQQ(qq: String){
        if let url = URL.init(string: "mqq://im/chat?chat_type=wpa&uin=\(qq)&version=1&src_type=web"){
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url)
            }
        }
    }
    public static func alertHint(title: String, msg: String){
        guard let vc = UIApplication.shared.keyWindow?.rootViewController else {return}
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert).fitIPad(target: vc)
        
        let cancelAction = UIAlertAction(title: local_ok, style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        
        vc.present(alert, animated: true, completion: nil)
    }
    public static func alertCoosePhotoOption(targetVC: UIViewController, albumBlock: (()->())?, cameraBlock: (()->())?){
        
        let alert = UIAlertController(title: local_settingAvatars, message: local_settingAvatarsHint, preferredStyle: .alert).fitIPad(target: targetVC)
        let album = UIAlertAction(title: local_album, style: .default) { _ in
            albumBlock?()
        }
        let tackPhoto = UIAlertAction(title: local_TakeAphoto, style: .default) { _ in
            cameraBlock?()
        }
        let cancelAction = UIAlertAction(title: local_cancel, style: .cancel, handler: nil)
        alert.addAction(album)
        alert.addAction(tackPhoto)
        alert.addAction(cancelAction)
        targetVC.present(alert, animated: true, completion: nil)
    }
    public static func jumpToComment(completed: (()->())?){
        
        let openStr = "itms-apps://itunes.apple.com/app/id\(appstoreId)?action=write-review"
        UIApplication.shared.open(URL.init(string: openStr)!, options: [:]) { openUrlSuc in
            
            if openUrlSuc{
                completed?()
            }
        }
    }
    public static func getCurrentVersion() -> String?{
        let dic = Bundle.main.infoDictionary
        return dic?["CFBundleShortVersionString"] as? String
    }
    public static func getAppstoreVersion(callBack: @escaping(_: String?)->()){
        
        let appidUrl = "http://itunes.apple.com/lookup?id=\(appstoreId)"

        let url = URL.init(string: appidUrl)

        var request = URLRequest.init(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        request.httpMethod = "post"

        NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue()) { response, data, err in
            let statusDic = [String: Any]()
            
            if data != nil{
                let receiveDic = try! JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as? [String: Any]
                let result = (receiveDic?["results"] as? [Any])?.first as? [String: Any]
                let version = result?["version"] as? String
                callBack(version)
            }
        }
    }
    public static func popToComment(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 15) {
            SKStoreReviewController.requestReview()
        }
    }
    
    public static func share(targetVC: UIViewController, appId: String){
        let shareImg = "icon".toImage() ?? UIImage()
        let linkUrl = URL(string: "https://apps.apple.com/cn/app/id\(appId)")
        var activityItems = [Any]()
        activityItems.append(local_shareStr)
        activityItems.append(shareImg)
        if let linkUrl = linkUrl {
            activityItems.append(linkUrl)
        }
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: [])
        
//      适配ipad
        let isIPad = UIDevice.current.name.contains("iPad")
        if isIPad{
          activityVC.popoverPresentationController?.sourceView = targetVC.view
          activityVC.popoverPresentationController?.sourceRect = targetVC.view.frame
        }
        
        targetVC.present(activityVC, animated: true, completion: nil)
    }
    
    /// 计算字符串的尺寸大小
    ///
    /// - Parameters:
    ///   - str: 需要计算的字符串
    ///   - maxW: 最大宽度
    ///   - maxH: 最大高度
    ///   - attributes: 字符串属性
    /// - Returns: CGSize
    public static func calculateStringSize(str: String, maxW: CGFloat, maxH: CGFloat, attributes: [NSAttributedString.Key: Any]?) -> CGSize{
        
        let ocStr = str as NSString
        let size = ocStr.boundingRect(with: CGSize.init(width: maxW, height: maxH), options: .usesLineFragmentOrigin, attributes: attributes, context: nil).size
        return size
    }
    
    public static func afterTimeRunAction(time:TimeInterval = 2, _ cancleBlock: (()->())?)  {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            cancleBlock?()
        }
    }
    
    public static func getDeviceName() -> String{
        return UIDevice.current.name
    }
    public static func getUUID() -> String?{
        return UIDevice.current.identifierForVendor?.uuidString
    }
   
}


