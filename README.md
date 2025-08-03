# XXTools_Swift

iOS开发常用工具类扩展库，提供UIKit组件扩展和实用工具方法

## 安装

### CocoaPods

```ruby
pod 'XXTools_Swift'
```

**重要提示：** 本SDK依赖 `Localize-Swift`，如果遇到 `No such module 'Localize_Swift'` 错误，请确保：

1. **清理CocoaPods缓存：**
   ```bash
   pod cache clean --all
   rm -rf ~/Library/Caches/CocoaPods
   rm -rf Pods
   rm -rf Podfile.lock
   ```

2. **重新安装：**
   ```bash
   pod install
   ```

3. **如果仍有问题，手动添加依赖：**
   ```ruby
   pod 'XXTools_Swift'
   pod 'Localize-Swift', '~> 3.2'
   ```

## 功能特性

- UIKit组件扩展（UIView、UILabel、UIButton等）
- 实用工具方法
- 多语言支持
- 隐私权限管理

## 使用示例

```swift
import XXTools_Swift

// 配置SDK
XXTools.config(appstoreId: "your_app_id", themColor: .blue)

// 使用工具方法
XXTools.call(telNum: "1234567890")
```

## 版本历史

- 0.1.2 - 修复访问控制问题，添加多语言支持
- 0.1.1 - 基础功能实现
- 0.1.0 - 初始版本

## 许可证

MIT License
