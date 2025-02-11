

import UIKit

extension String{
    func sizeWithWith(with:CGFloat,font:UIFont)->CGSize{
        let txt:String = self
        if txt.count == 0 {
            return CGSize(width: 0, height: 0)
        }else{
            let rect:CGRect = (txt as NSString).boundingRect(with: CGSize.init(width: with, height: 10000) , options: [NSStringDrawingOptions.usesFontLeading,NSStringDrawingOptions.usesLineFragmentOrigin,NSStringDrawingOptions.truncatesLastVisibleLine], attributes: [NSAttributedString.Key.font:font], context: nil)
            return rect.size
        }
    }
}
extension UIColor {
    convenience init(r:UInt64 ,g:UInt64 , b:UInt64 , a:CGFloat = 1.0) {
        self.init(red: CGFloat(r) / 255.0,
                  green: CGFloat(g) / 255.0,
                  blue: CGFloat(b) / 255.0,
                  alpha: a)
    }
    class func hex(hexString: String) -> UIColor {
        return UIColor.hex(hexString: hexString, alpha: 1)
    }
    class func hex(hexString: String,alpha:CGFloat) -> UIColor {
        var cString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        if cString.count < 6 { return UIColor.clear }
        
        let index = cString.index(cString.endIndex, offsetBy: -6)
        let subString = cString[index...]
        if cString.hasPrefix("0X") { cString = String(subString) }
        if cString.hasPrefix("#") { cString = String(subString) }
        
        if cString.count != 6 { return UIColor.black }
        
        var range: NSRange = NSMakeRange(0, 2)
        let rString = (cString as NSString).substring(with: range)
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        var r: UInt64 = 0x0
        var g: UInt64 = 0x0
        var b: UInt64 = 0x0
        
        Scanner(string: rString).scanHexInt64(&r)
        Scanner(string: gString).scanHexInt64(&g)
        Scanner(string: bString).scanHexInt64(&b)
        
        return UIColor(r: r, g: g, b: b,a: alpha)
    }
}

open class GhjToast: UIView {
    
    convenience init(message:String){
        self.init()
        self.layer.cornerRadius = 6
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.hex(hexString: "000000",alpha: 0.8)
        
        let maxBgW:CGFloat  = 300
        
        
        let lbContent:UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: maxBgW, height: 32))
        lbContent.font = UIFont.systemFont(ofSize: 14);
        lbContent.textColor = UIColor.white
        lbContent.lineBreakMode = NSLineBreakMode.byCharWrapping
        lbContent.numberOfLines = 0;
        lbContent.text = message;
        lbContent.textAlignment = NSTextAlignment.center
        addSubview(lbContent)
        
        let textSize:CGSize = message.sizeWithWith(with: maxBgW-30, font: lbContent.font)
        self.frame = CGRect(x: 0, y: 0, width: textSize.width+30, height: textSize.height+30)
        lbContent.frame = CGRect(x: 15, y: 15, width: textSize.width, height: textSize.height)
    }
    
    @objc open class func show(msg:String,_ delay:TimeInterval = 2) {
        if msg.count == 0{
            return
        }
        DispatchQueue.main.async {
            showP(msg: msg, delay)
        }
    }
    
    private class func showP(msg:String,_ delay:TimeInterval = 2){
        let toast:GhjToast = GhjToast.init(message: msg)
        toast.alpha = 0
        let window: UIWindow = ((UIApplication.shared.delegate?.window)!)!
        window.addSubview(toast)
        toast.center = CGPoint(x: window.frame.width/2, y: window.frame.height/2)
        toast.layer.zPosition = 1000
        UIView.animate(withDuration: 0.5, animations: {
            toast.alpha = 1
        }) { (completed) in
            UIView.animate(withDuration: 0.5, delay: delay, options: UIView.AnimationOptions.curveEaseOut, animations: {
                toast.alpha = 0
            }) { (completed) in
                toast.removeFromSuperview()
            }
        }
    }

}
