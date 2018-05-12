//
//  Config.swift
//  打折啦
//
//  Created by Eric on 7/21/17.
//  Copyright © 2017 INGStudio. All rights reserved.
//

import Foundation
import UIKit

enum Config {
    
    static func themeFont(_ ofSize: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica", size: ofSize)!
    }
    static var themeColor = UIColor(red: 1, green: 0.5, blue: 0.3, alpha: 1)
    
    static let themeGray = UIColor.lightGray
    static func predicate(_ type: String, _ content: String) -> Bool {
        let predicator = NSPredicate(format: "SELF MATCHES %@", type)
        return predicator.evaluate(with: content)
    }
    static let systemBlue = myColor(0, 118, 255)
    
}

enum Regex {
    static let name = "^(?!.*\\s).{1,12}$"
    static let pswd = "^(?!.*\\s).{8,16}$"
    static let email = "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$"
    static let phone = "^1[3-9]{1}[0-9]{9}$"
}



func myRect(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: width, height: height)
}
func myRange(_ location: Int, _ length: Int) -> NSRange {
    return NSRange(location: location, length: length)
}
func myColor(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ alpha: CGFloat = 1) -> UIColor {
    return UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha)
}
func myLoca2D(_ lat: Double, _ lon: Double) -> CLLocationCoordinate2D {
    return CLLocationCoordinate2D(latitude: lat, longitude: lon)
}
func mySize(_ w: CGFloat, _ h: CGFloat) -> CGSize {
    return CGSize(width: w, height: h)
}

///返回一段文字的自适应size
/// - Parameters:
///   - txt: 内容
///   - size: 字号
///   - maxSize: 所能容忍的最大尺寸
///   - lineSpa: 其实这个行距参数该直接换成 NSMutableParaStyle，便于拓展。不过现在先算了
func autoCalculateSize(_ txt: String, size fontSize: CGFloat, maxSize: CGSize = CGSize(width: 200, height: 50), lineSpa: CGFloat = 0) -> CGSize {
    let para = NSMutableParagraphStyle()
    para.lineBreakMode = .byWordWrapping
    if lineSpa != 0 {
        para.lineSpacing = lineSpa
    }
    let attri = [NSFontAttributeName: UIFont.systemFont(ofSize: fontSize),
                 NSParagraphStyleAttributeName: para.copy()]
    var siz = NSString(string: txt)
        .boundingRect(with: maxSize,
                      options: [.usesLineFragmentOrigin,.usesFontLeading, .truncatesLastVisibleLine],
                      attributes: attri, context: nil).size
    siz.height = ceil(siz.height)
    siz.width = ceil(siz.width)+2
    return siz
}
///获取带有行距的AttributedString
/// - Parameters:
///   - str: 内容
///   - lineSpca: 间距
func getAttributed(_ str: String, lineSpac: CGFloat) -> NSAttributedString {
    let atStr = NSMutableAttributedString(string: str)
    let parStyle = NSMutableParagraphStyle()
    parStyle.lineSpacing = lineSpac
    let ra = myRange(0, str.len())
    atStr.addAttribute(NSParagraphStyleAttributeName, value: parStyle, range: ra)
    return atStr
}



func v(_ i5: CGFloat, _ i6: CGFloat, _ i6P: CGFloat) -> CGFloat {
    if IPHONE5 { return i5 }
    if IPHONE6 { return i6 }
    return i6P
}



//数字键盘：5.5吋226，4.7吋216，4.0吋216
//正常：5.5吋271，4.7吋258，4.0吋253
let ScreenHeight = UIScreen.main.bounds.height
let ScreenWidth = UIScreen.main.bounds.width
let numBoardSmall:CGFloat = 216
let hh = "😄"
let dk = "😭"
let UI_IS_LANDSCAPE = UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight
let UI_IPAD = UIDevice.current.userInterfaceIdiom == .pad
let IPHONE = UIDevice.current.userInterfaceIdiom == .phone
let IPHONE4 = IPHONE && ScreenHeight < 568.0
let IPHONE5 = IPHONE && ScreenHeight == 568.0
let IPHONE6 = IPHONE && ScreenHeight == 667.0
let IPHONE6P = IPHONE && ScreenHeight == 736.0 || ScreenWidth == 736.0
let IOS8_ = UIDevice.current.systemVersion//格式：10.3.1
let IOS = Int(IOS8_.components(separatedBy: ".").first!)!
let serverError = "responseValidationFailed(Alamofire.AFError.ResponseValidationFailureReason.unacceptableStatusCode(502))"
let contentOffset = "contentOffset"
let userDefau = UserDefaults.standard
let unFilled = "未填写"
let personType = ["普通会员", "实名认证", "商家认证"]
let itemType = ["未认证", "实名认证", "商家认证"]
// 含Aspect：保留图形长宽比例；fill：填满 ImageView，fit：保持比例前提下填满ImageView，填不满就留白
let phimg = UIColor.groupTableViewBackground.getImage()

/*
 UIFontWeightUltraLight  - 超细字体
 UIFontWeightThin  - 纤细字体
 UIFontWeightLight  - 亮字体
 UIFontWeightRegular  - 常规字体
 UIFontWeightMedium  - 介于Regular和Semibold之间
 UIFontWeightSemibold  - 半粗字体
 UIFontWeightBold  - 加粗字体
 UIFontWeightHeavy  - 介于Bold和Black之间
 UIFontWeightBlack  - 最粗字体(理解)

 */





