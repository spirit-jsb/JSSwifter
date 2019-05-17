# JSSwifter

<p align="center">
<a href="https://github.com/apple/swift"><img src="https://img.shields.io/badge/language-swift-red.svg"></a>
<a href="https://github.com/apple/swift"><img src="https://img.shields.io/badge/swift%20version-5.0-orange.svg"></a>
<a href="https://github.com/spirit-jsb/JSSwifter/"><img src="https://img.shields.io/cocoapods/v/JSSwifter.svg?style=flat"></a>
<a href="https://github.com/spirit-jsb/JSSwifter/blob/master/LICENSE"><img src="https://img.shields.io/cocoapods/l/JSSwifter.svg?style=flat"></a>
<a href="https://cocoapods.org/pods/JSSwifter"><img src="https://img.shields.io/cocoapods/p/JSSwifter.svg?style=flat"></a>
</p>

## 示例代码

如需要运行示例项目，请 `clone` 当前 `repo` 到本地，然后从根目录下执行 `JSSwifter.xcodeproj`，打开项目后切换 `Scheme` 至 `JSSwifter-Tests`，`CMD+U` 即可运行测试示例代码。

## 基本使用

<details>
<summary>Foundation Extensions</summary>
</br>
<ul>
<li><a href="https://github.com/spirit-jsb/JSSwifter/blob/master/Sources/Core/Foundation/DispatchQueue%2BJSSwifter.swift"><code>DispatchQueue Extensions</code></a></li>
<li><a href="https://github.com/spirit-jsb/JSSwifter/blob/master/Sources/Core/Foundation/Data%2BJSSwifter.swift"><code>Data Extensions</code></a></li>
<li><a href="https://github.com/spirit-jsb/JSSwifter/blob/master/Sources/Core/Foundation/Date%2BJSSwifter.swift"><code>Date Extensions</code></a></li>
<li><a href="https://github.com/spirit-jsb/JSSwifter/blob/master/Sources/Core/Foundation/Float%2BJSSwifter.swift"><code>Float Extensions</code></a></li>
<li><a href="https://github.com/spirit-jsb/JSSwifter/blob/master/Sources/Core/Foundation/Double%2BJSSwifter.swift"><code>Double Extensions</code></a></li>
<li><a href="https://github.com/spirit-jsb/JSSwifter/blob/master/Sources/Core/Foundation/Bool%2BJSSwifter.swift"><code>Bool Extensions</code></a></li>
<li><a href="https://github.com/spirit-jsb/JSSwifter/blob/master/Sources/Core/Foundation/Int%2BJSSwifter.swift"><code>Int Extensions</code></a></li>
<li><a href="https://github.com/spirit-jsb/JSSwifter/blob/master/Sources/Core/Foundation/Calendar%2BJSSwifter.swift"><code>Calendar Extensions</code></a></li>

</details>

<details>
<summary>UIKit Extensions</summary>
</br>
<ul>
<li><a href="https://github.com/spirit-jsb/JSSwifter/blob/master/Sources/Core/UIKit/UIColor%2BJSSwifter.swift"><code>UIColor Extensions</code></a></li>
<li><a href="https://github.com/spirit-jsb/JSSwifter/blob/master/Sources/Core/UIKit/UITableView%2BJSSwifter.swift"><code>UITableView Extensions</code></a></li>
<li><a href="https://github.com/spirit-jsb/JSSwifter/blob/master/Sources/Core/UIKit/UICollectionView%2BJSSwifter.swift"><code>UICollectionView Extensions</code></a></li>
<li><a href="https://github.com/spirit-jsb/JSSwifter/blob/master/Sources/Core/UIKit/UIScrollView%2BJSSwifter.swift"><code>UIScrollView Extensions</code></a></li>

</details>

<details>
<summary>CoreGraphics Extensions</summary>
</br>
<ul>
<li><a href="https://github.com/spirit-jsb/JSSwifter/blob/master/Sources/Core/UIKit/CGColor%2BJSSwifter.swift"><code>CGColor Extensions</code></a></li>
<li><a href="https://github.com/spirit-jsb/JSSwifter/blob/master/Sources/Core/UIKit/CGFloat%2BJSSwifter.swift"><code>CGFloat Extensions</code></a></li>
<li><a href="https://github.com/spirit-jsb/JSSwifter/blob/master/Sources/Core/UIKit/CGPoint%2BJSSwifter.swift"><code>CGPoint Extensions</code></a></li>
<li><a href="https://github.com/spirit-jsb/JSSwifter/blob/master/Sources/Core/UIKit/CGSize%2BJSSwifter.swift"><code>CGSize Extensions</code></a></li>

</details>
</p>

基本使用方法请参考测试示例代码。

## Swift 版本依赖
| Swift | JSSwifter | 
| ------| ----------|
| 5.0   | >= 0.0.1  |

## 限制条件
* **iOS 9.0** and Up
* **Xcode 10.0** and Up
* **Swift Version = 5.0**

## 安装

`JSSwifter` 可以通过 [CocoaPods](https://cocoapods.org) 获得。安装只需要在你项目的 `Podfile` 中添加如下字段：

```ruby
pod 'JSSwifter', '~> 0.0.5'
```

## 更新计划
### Foundation
- [ ] Array
- [ ] Bundle
- [x] Data
- [x] Date
- [ ] Dictionary
- [ ] KeyedUnarchiver
- [ ] NotificationCenter
- [ ] Number
- [ ] String
- [ ] Thread
- [ ] Timer
- [x] DispatchQueue
- [x] Int
- [x] Float
- [x] Double
- [x] Bool
- [x] Calendar

### UIKit
- [ ] UIApplication
- [ ] UIBarButtonItem
- [ ] UIBezierPath
- [x] UIColor
- [ ] UIControl
- [ ] UIDevice
- [ ] UIFont
- [ ] UIGestureRecognizer
- [ ] UIImage
- [ ] UIScreen
- [x] UIScrollView
- [x] UITableView
- [x] UICollectionView
- [ ] UITextField
- [ ] UITextView
- [ ] UIView

### CoreGraphics
- [x] CGColor
- [x] CGFloat
- [x] CGPoint
- [x] CGSize

### Quartz
- [ ] CALayer

## 作者

spirit-jsb, sibo_jian_29903549@163.com

## 许可文件

`JSSwifter` 可在 `MIT` 许可下使用，更多详情请参阅许可文件。