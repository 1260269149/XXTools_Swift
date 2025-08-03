//
//  PrivacyManager.swift
//  ElderCall
//
//  Created by wangxu on 2/28/25.
//

import UIKit
import Photos
import AVFoundation
import Contacts

public class PrivacyManager: NSObject {

    class func checkPhotoLibraryPermission(success: (()->())?) {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .notDetermined:
            // 未决定，直接触发系统权限弹窗
            PHPhotoLibrary.requestAuthorization { status in
                DispatchQueue.main.async {
                    if status == .authorized || status == .limited {
                        success?()
                    } else {
                        showPermissionDeniedAlert(title: local_needAlubmPrivacy, message: local_needAlubmPrivacyDes)
                    }
                }
            }
        case .denied, .restricted:
            // 已拒绝，引导用户去设置
            showPermissionDeniedAlert(title: local_needAlubmPrivacy, message: local_needAlubmPrivacyDes)
        case .authorized, .limited:
            // 已授权，打开相册
            success?()
        @unknown default:
            break
        }
    }
    
    class func checkCameraPermission(success: (()->())?) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .notDetermined:
            // 直接触发系统权限弹窗
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    if granted {
                        success?()
                    } else {
                        showPermissionDeniedAlert(title: local_needCamaraPrivacy, message: local_needCamaraPrivacyDes)
                    }
                }
            }
        case .denied, .restricted:
            // 已拒绝权限，引导用户去设置
            showPermissionDeniedAlert(title: local_needCamaraPrivacy, message: local_needCamaraPrivacyDes)
        case .authorized:
            // 已授权，直接打开相机
            success?()
        @unknown default:
            break
        }
    }

    class func checkContactsPermission(success: (()->())?) {
        let status = CNContactStore.authorizationStatus(for: .contacts)
        switch status {
        case .notDetermined:
            // 未决定，触发系统权限弹窗
            CNContactStore().requestAccess(for: .contacts) { granted, error in
                DispatchQueue.main.async {
                    if granted {
                        success?()
                    } else {
                        showPermissionDeniedAlert(title: local_needContactPrivacy, message: local_needContactPrivacyDes)
                    }
                }
            }
        case .denied, .restricted:
            // 已拒绝，引导用户去设置
            showPermissionDeniedAlert(title: local_needContactPrivacy, message: local_needContactPrivacyDes)
        case .authorized, .limited:
            // 已授权，访问通讯录
            success?()
        @unknown default:
            break
        }
    }
    
    class func showPermissionDeniedAlert(title: String?, message: String) {
        guard let vc = UIApplication.shared.keyWindow?.rootViewController else {return}
        
        let alert = UIAlertController(title: title, message: message,preferredStyle: .alert).fitIPad(target: vc)
        alert.addAction(UIAlertAction(title: local_toSetting, style: .default) { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        })
        alert.addAction(UIAlertAction(title: local_notNow, style: .cancel))
        vc.present(alert, animated: true)
    }
    
}
