//
//  Extensions.swift
//  Extensions Project
//
//  Created by Waqas Ali on 8/12/16.
//  Copyright © 2016 Jamisofttech. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration.CaptiveNetwork
//import RATreeView
//import Realm
//import RealmSwift

extension NSError {
    convenience init(errorMessage:String) {
        self.init(domain: appDomain, code: -1, userInfo: [NSLocalizedDescriptionKey: errorMessage])
    }
}

public extension UITextField {
    func isValidTextField() -> Bool {
        if self.text?.isEmpty == true {
            return false
        }
        return true
    }
}

extension String {

    func suffixNumber() -> String {
        
        var num:Double = Double(self)!;
        let sign = ((num < 0) ? "-" : "" );
        
        num = fabs(num);
        
        if (num < 1000.0){
            return "\(sign)\(num)";
        }
        
        let exp:Int = Int(log10(num) / 3.0 ); //log10(1000));
        
        let units:[String] = ["K","M","B"];
        
        let roundedNum:Double = round(10 * num / pow(1000.0,Double(exp))) / 10;
		
        return "\(sign)\(roundedNum)\(units[exp-1])";
    }
    
    func isValidEmail() -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
            let range = NSMakeRange(0, self.count)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range:range) != nil
        } catch{return false}
    }
    
    
    func isEmail(_ text:String?) -> Bool
    {
        let EMAIL_REGEX = "^([^@\\s]+)@((?:[-a-z0-9]+\\.)+[a-z]{2,})$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", EMAIL_REGEX)
        return predicate.evaluate(with: text)
    }
    
    func capitalizingFirstLetter() -> String {
        let first = String(self.prefix(1)).uppercased()
        let other = String(self.dropFirst())
        return first + other
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func monthFullNameToInt() -> Int {
        
        switch self {
        case "January":
            return 1
        case "February":
            return 2
        case "March":
            return 3
        case "April":
            return 4
        case "May":
            return 5
        case "June":
            return 6
        case "July":
            return 7
        case "August":
            return 8
        case "September":
            return 9
        case "October":
            return 10
        case "November":
            return 11
        case "December":
            return 12
        default:
            return 13
        }
    }
    
    func monthFullNameTo() -> String {
        
        switch self {
        case "January":
            return "1"
        case "February":
            return "2"
        case "March":
            return "3"
        case "April":
            return "4"
        case "May":
            return "5"
        case "June":
            return "6"
        case "July":
            return "7"
        case "August":
            return "8"
        case "September":
            return "9"
        case "October":
            return "10"
        case "November":
            return "11"
        case "December":
            return "12"
        default:
            return "13"
        }
    }
    
}

extension URL {
    
    func isEmpty(_ text:String?) -> Bool
    {
        if text == nil {return true}
        
        if text!.isEmpty == true {return true}
        
        //    if text?.lowercaseString == "null" {return true}
        
        return false
        
    }
    
    func isURLValid(_ urlString:String?) -> Bool
    {
        if isEmpty(urlString) {return false}
        
        let url =  URL(string: urlString!)
        if url == nil {return false}
        
        
        let request = URLRequest(url: url!)
        return NSURLConnection.canHandle(request)
        
    }
}

extension Date {
    
    var day:Int {
        get {
            return (Calendar.current as NSCalendar).components([.day], from: self).day!
        }
    }
    
    var weekDayCapital:String {
        get {
            let weekday = (Calendar.current as NSCalendar).components([.weekday], from: self).weekday
            
            switch weekday! {
            case 1:
                return "SUN"
            case 2:
                return "MON"
            case 3:
                return "TUE"
            case 4:
                return "WED"
            case 5:
                return "THU"
            case 6:
                return "FRI"
            case 7:
                return "SAT"
            default:
                return ""
            }
        }
    }

	var weekDaySmall:String {
		get {
			let weekday = (Calendar.current as NSCalendar).components([.weekday], from: self).weekday

			switch weekday! {
			case 1:
				return "Sun"
			case 2:
				return "Mon"
			case 3:
				return "Tue"
			case 4:
				return "Wed"
			case 5:
				return "Thu"
			case 6:
				return "Fri"
			case 7:
				return "Sat"
			default:
				return ""
			}
		}
	}
    
    var weekDayIndex:Int {
        get {
            let weekday = (Calendar.current as NSCalendar).components([.weekday], from: self).weekday
            
            switch weekday! {
            case 1:
                return 6
            case 2:
                return 0
            case 3:
                return 1
            case 4:
                return 2
            case 5:
                return 3
            case 6:
                return 4
            case 7:
                return 5
            default:
                return 0
            }
        }
    }
    
    var weekDayWithTwoWords:String {
        get {
            let weekday = (Calendar.current as NSCalendar).components([.weekday], from: self).weekday
            
            switch weekday! {
            case 1:
                return "Su"
            case 2:
                return "Mo"
            case 3:
                return "Tu"
            case 4:
                return "We"
            case 5:
                return "Th"
            case 6:
                return "Fr"
            case 7:
                return "Sa"
            default:
                return ""
            }
        }
    }
    
    var weekDayWithThreeWords:String {
        get {
            let weekday = (Calendar.current as NSCalendar).components([.weekday], from: self).weekday
            
            switch weekday! {
            case 1:
                return "Sun"
            case 2:
                return "Mon"
            case 3:
                return "Tue"
            case 4:
                return "Wed"
            case 5:
                return "Thu"
            case 6:
                return "Fri"
            case 7:
                return "Sat"
            default:
                return ""
            }
        }
    }
    
    var weekFullDay:String {
        get {
            let weekFullDay = (Calendar.current as NSCalendar).components([.weekday], from: self).weekday
            
            switch weekFullDay! {
            case 1:
                return "Sunday"
            case 2:
                return "Monday"
            case 3:
                return "Tuesday"
            case 4:
                return "Wednesday"
            case 5:
                return "Thursday"
            case 6:
                return "Friday"
            case 7:
                return "Saturday"
            default:
                return ""
            }
        }
    }
    
    var monthThreeWordsName: String {
        get {
            let nameInt = (Calendar.current as NSCalendar).components([.month], from: self).month
            switch nameInt! {
            case 1:
                return "Jan"
            case 2:
                return "Feb"
            case 3:
                return "Mar"
            case 4:
                return "Apr"
            case 5:
                return "May"
            case 6:
                return "Jun"
            case 7:
                return "Jul"
            case 8:
                return "Aug"
            case 9:
                return "Sep"
            case 10:
                return "Oct"
            case 11:
                return "Nov"
            case 12:
                return "Dec"
                
            default:
                return ""
            }
        }
    }
    
    var monthFullName: String {
        get {
            let nameInt = (Calendar.current as NSCalendar).components([.month], from: self).month
            switch nameInt! {
            case 1:
                return "January"
            case 2:
                return "February"
            case 3:
                return "March"
            case 4:
                return "April"
            case 5:
                return "May"
            case 6:
                return "June"
            case 7:
                return "July"
            case 8:
                return "August"
            case 9:
                return "September"
            case 10:
                return "October"
            case 11:
                return "November"
            case 12:
                return "December"
                
            default:
                return ""
            }
        }
    }
    
    var getMonth: Int {
        return (Calendar.current as NSCalendar).components([.month], from: self).month!
    }
    
    var dateDayOfMonth: String? {
        get {
            let dateDay = (Calendar.current as NSCalendar).components([.day], from: self).day!
            return String(describing: dateDay)
        }
    }
    
    var year:Int {
        get {
            return (Calendar.current as NSCalendar).components([.year], from: self).year!
        }
    }
    
    // you can create a read-only computed property to return just the nanoseconds as Int
    var nanosecond: Int { return Calendar.current.component(.nanosecond,  from: self)}
    
    // or an extension function to format your date
    func formattedWith(_ format:String)-> String {
        let formatter = DateFormatter()
        //formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)  // you can set GMT time
        formatter.timeZone = NSTimeZone.local        // or as local time
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    //Replica
    func formattedWithString(_ format:String)-> String {
        let formatter = DateFormatter()
        //formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)  // you can set GMT time
        formatter.timeZone = NSTimeZone.local        // or as local time
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
    
    //12:18 PM
    static func timeStringFromUnixTime(_ unixTime: Double) -> String {
        let date = Date(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        // Returns date formatted as 12 hour time.
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: date)
    }
    
    static func dayStringFromTime(_ unixTime: Double) -> String {
        let date = Date(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: Locale.current.identifier)
        dateFormatter.dateFormat = "dd-MMMM"
        return dateFormatter.string(from: date)
    }
    
    //2016-19-18 12:18 PM
    static func timeAndDateFromUnix(_ unixTime:Double) -> String {
        let date = Date(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        // Returns date formatted as 12 hour time.
        dateFormatter.dateFormat = "yyyy-dd-MM hh:mm a"
        return dateFormatter.string(from: date)
    }
    
    static func yearFromUnixTime(_ unixTime:Double) -> Date {
        let date = Date(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        // Returns date formatted as 12 hour time.
        dateFormatter.dateFormat = "MM dd yyyy"
        let string = dateFormatter.string(from: date)
        return dateFormatter.date(from: string)!
    }
    
    static func yearStringFromUnixTime(_ unixTime:Double) -> String {
        let date = Date(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        // Returns date formatted as 12 hour time.
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: date)
        //        return dateFormatter.dateFromString(string)!
    }
    
    static func dateFromStrings(_ stringDate:String) -> Date {
        let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        //        dateFormatter.dateFormat = "hh:mm:ss a"
        //        dateFormatter.dateStyle = .NoStyle
        //        dateFormatter.timeStyle = .ShortStyle
        let date = dateFormatter.date(from: stringDate)
        return date!
    }

	static func get12HTime(from: Date) -> String {
		let dateFormatter = DateFormatter()
		// Returns date formatted as 12 hour time.
		dateFormatter.locale = Locale(identifier: "en_US_POSIX")
		dateFormatter.dateFormat = "hh:mm a"
		dateFormatter.amSymbol = "AM"
		dateFormatter.pmSymbol = "PM"

		let date = dateFormatter.string(from: from)
		return date
	}
    
    static func dateFromStringConvertToString(_ stringDate: String) -> String  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: stringDate)
        dateFormatter.dateFormat =  "hh:mm a"
        let  newTime =  dateFormatter.string(from: date!)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let newDate = dateFormatter.string(from: date!)
        return newDate + " " + newTime
    }
    
    //    static func date(withFormat format: String, dateString: String) -> Date? {
    //        let dateFormatter = DateFormatter()
    //        dateFormatter.dateFormat = format
    //        let newDate = dateFormatter.date(from: dateString)
    //        return newDate
    //    }
    
    static func date(withFormat format: String, dateString: String) -> String  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let newDate = dateFormatter.date(from: dateString)
        dateFormatter.dateFormat = format
        let newDate1 = dateFormatter.string(from: newDate!)
        return newDate1
    }
    
    static func date(fromString: String) -> Date?  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let newDate = dateFormatter.date(from: fromString)
        return newDate
    }

	static func date24Hours(fromString: String) -> Date?  {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
		let newDate = dateFormatter.date(from: fromString)
		return newDate
	}
    
    static func date2(fromString: String) -> Date?  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let newDate = dateFormatter.date(from: fromString)
        return newDate
    }
    
    //    static func date(withFormat format: String, date: Date) -> Date? {
    //        let dateString = String(describing: date)
    //        let dateFormatter = DateFormatter()
    //        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
    //        let newDate = dateFormatter.date(from: dateString)
    //        dateFormatter.dateFormat = format
    //        let newDate1 = dateFormatter.string(from: date)
    //        return newDate1
    //    }
    
    static func date(withFormat format: String, date: Date) -> String  {
        let dateString = String(describing: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
        let date = dateFormatter.date(from: dateString)
        dateFormatter.dateFormat = format
        let newDate = dateFormatter.string(from: date!)
        return newDate
    }
    
    static func dateFromStringConvertToStringInTuple(_ stringDate: String) -> (newDate:String,newTime:String)  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
        let date = dateFormatter.date(from: stringDate)
        dateFormatter.dateFormat =  "hh:mm a"
        let  newTime =  dateFormatter.string(from: date!)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let newDate = dateFormatter.string(from: date!)
        return (newDate,newTime)
    }
    
    static func checkDate(_ date: Date) -> String {
        var returnedDate = ""
        let calendar = Calendar.current
        if calendar.isDateInToday(date) {
            returnedDate = "Today"
        } else if calendar.isDateInYesterday(date) {
            returnedDate = "Yesterday"
        } else {
            returnedDate = "None"
        }
        return returnedDate
    }
    
    static func dateFromStringConvertToDate(_ stringDate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let newDate = dateFormatter.date(from: stringDate)
        return newDate!
    }
    
    func lastDayOfMonth() -> (Date,Int)
    {
        let calendar = Calendar.current
        let now = self
        var components = calendar.dateComponents([.year, .month, .day], from: now)
        let range = calendar.range(of: .day, in: .month, for: now)!
//        return range.upperBound - 1
        components.day = range.upperBound - 1
        return (calendar.date(from: components)!, range.upperBound - 1)
    }
    
    func lowerDate(limit: Int = -5) -> Date
    {
        return Calendar.current.date(byAdding: .day, value: limit, to: self)!
    }
    
    func upperDate(limit: Int = 5) -> Date
    {
        return Calendar.current.date(byAdding: .day, value: limit, to: self)!
    }
    
    /// Returns a Date with the specified days added to the one it is called with
    func add(days: Int = 0) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: self)!
    }
    
    /// Returns a Date with the specified days subtracted from the one it is called with
    func subtract(days: Int = 0) -> Date {
        let inverseDays = -1 * days
        return add(days: inverseDays)
    }
    
    func hour() -> Int
    {
        //Get Hour
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: self)
        
        //Return Hour
        return hour
    }
    
    
    func minute() -> Int
    {
        //Get Minute
        let calendar = Calendar.current
        let minute = calendar.component(.minute, from: self)
        
        //Return Minute
        return minute
    }

	func seconds() -> Int
	{
		//Get Minute
		let calendar = Calendar.current
		let seconds = calendar.component(.second, from: self)

		//Return Minute
		return seconds
	}
    
    func toShortTimeString() -> String
    {
        //Get Short Time String
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let timeString = formatter.string(from:self)
        
        //Return Short Time String
        return timeString
    }

	public func compare(now:Date) -> ComparisonResult {
		return Calendar.current.compare(now, to: self, toGranularity: .day)
	}

	func isInSameWeek(date: Date) -> Bool {
		return Calendar.current.isDate(self, equalTo: date, toGranularity: .weekOfYear)
	}
	func isInSameMonth(date: Date) -> Bool {
		return Calendar.current.isDate(self, equalTo: date, toGranularity: .month)
	}
	func isInSameYear(date: Date) -> Bool {
		return Calendar.current.isDate(self, equalTo: date, toGranularity: .year)
	}
	func isInSameDay(date: Date) -> Bool {
		return Calendar.current.isDate(self, equalTo: date, toGranularity: .day)
	}
	var isInThisWeek: Bool {
		return isInSameWeek(date: Date())
	}
	var isInToday: Bool {
		return Calendar.current.isDateInToday(self)
	}
	var isInTheFuture: Bool {
		return Date() < self
	}
	var isInThePast: Bool {
		return self < Date()
	}

	func add(day: Int) -> Date {
		return Calendar(identifier: .gregorian).date(byAdding: .day, value: day, to: self)!
	}

	func isToday() -> Bool {
		return Calendar.current.isDateInToday(self)
	}
}


extension Calendar {
    
}

extension UIImageView {
    
    //    public func imageFromUrl(urlString: String) {
    //        if let url = NSURL(string: urlString) {
    //            let request = NSURLRequest(url: url as URL)
    //            NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.mainQueue) {
    //                (response: URLResponse!, data: NSData!, error: NSError!) -> Void in
    //                self.image = UIImage(data: data as Data)
    //            }
    //        }
    //    }
}

extension Float {
    var round: String {
        return String(format: "%.1f", self)
    }
    var string2: String {
        return String(format: "%.2f", self)
    }
}

extension Double {
    
    /**
     Rounds the double to decimal places value
     */
    
    mutating func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10, Double(places))
		return Darwin.round(self * divisor) / divisor
//		let value = roundedValue.clean
//		return Double(Float(value)!)
    }

	var clean: String {
		return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
	}
    
    /** Returns a timeStamp from a NSDate instance */
    static func timeStampFromDate(date: Date) -> Double {
        return date.timeIntervalSince1970
    }
}

extension CALayer {
    
    func addBorder(_ edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect.init(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect.init(x: 0, y: 0, width: thickness, height: frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect.init(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
    }
}

func *=(left:CGSize, right:CGFloat) -> CGSize {
    return CGSize(width: left.width * right, height: left.height * right)
}
enum GradientDirection {
    case topBottom, leftRight, rightLeft
}

extension UIView {

	class func animatedTransform(onView view: UIView) {
		UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
			view.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
		}) { (finished) in
			UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
				view.transform = CGAffineTransform.identity
			}, completion: nil)
		}
	}

	class func selecteAnimatedTransform(onView view: UIView) {
		UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
			view.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
		}) { (finished) in
//			UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
//				view.transform = CGAffineTransform.identity
//			}, completion: nil)
		}
	}

	class func deSelecteAnimatedTransform(onView view: UIView) {
		UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
//			view.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
		}) { (finished) in
			UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
				view.transform = CGAffineTransform.identity
			}, completion: nil)
		}
	}

	func animatedTransform(onView view: UIView) {
		UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
			view.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
		}) { (finished) in
			UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
				view.transform = CGAffineTransform(scaleX: 1, y: 1)
			}, completion: nil)
		}
	}
    
    class func loadFromNibNamed(_ nibNamed: String, bundle : Bundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
    
    //
    func sunriseGradientBackground(_ direction: GradientDirection = .topBottom, startAlpha:CGFloat = 1, endAlpha:CGFloat = 1) {
        removeExistingGradientLayer()
        let gradient        = CAGradientLayer()
        gradient.name       = "gradient"
        gradient.masksToBounds  = true
        gradient.frame      = CGRect(origin: CGPoint.zero, size: CGSize(width: frame.width+500, height: frame.height))
        //        gradient.frame = self.frame


//      135 Degree
//        1st #007061 #009485 #00C4B0

        gradient.colors = [UIColor(hex: "#007061").cgColor,
                           UIColor(hex: "#009485").cgColor,
                           UIColor(hex: "#00C4B0").cgColor]

        gradient.locations  = [0,1,1]
        switch direction {
        case .topBottom: break
        case .leftRight: gradient.startPoint = CGPoint(x: 0, y: 0.5); gradient.endPoint = CGPoint(x: 1, y: 0.5)
        case .rightLeft: gradient.startPoint = CGPoint(x: 1, y: 0.5); gradient.endPoint = CGPoint(x: 0, y: 0.5)
        }
        layer.insertSublayer(gradient, at: 0)
    }
    
    func removeExistingGradientLayer() {
        if layer.sublayers != nil {
            for l in layer.sublayers! {
                if l is CAGradientLayer && (l as! CAGradientLayer).name == "gradient" {
                    (l as! CAGradientLayer).removeFromSuperlayer()
                }
            }
        }
    }

    func setGradient(colors: [CGColor], angle: Float = 0) {
        let gradientLayerView: UIView = UIView(frame: CGRect(x:0, y: 0, width: bounds.width, height: bounds.height))
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = gradientLayerView.bounds
        gradient.colors = colors

        let _: Float = angle / 360
//        let startPointX = powf(
//            sinf(2 * Float.pi * ((alpha + 0.75) / 2)),
//            2
//        )
//        let startPointY = powf(
//            sinf(2 * Float.pi * ((alpha + 0) / 2)),
//            2
//        )
//        let endPointX = powf(
//            sinf(2 * Float.pi * ((alpha + 0.25) / 2)),
//            2
//        )
//        let endPointY = powf(
//            sinf(2 * Float.pi * ((alpha + 0.5) / 2)),
//            2
//        )

        gradient.endPoint = CGPoint(x: CGFloat(0),y: CGFloat(0))
        gradient.startPoint = CGPoint(x: CGFloat(1), y: CGFloat(1))

        gradientLayerView.layer.insertSublayer(gradient, at: 0)
        layer.insertSublayer(gradientLayerView.layer, at: 0)
    }

    func makeCircle() {
        layer.cornerRadius      = max(frame.size.height, frame.size.width) / 2
        layer.masksToBounds     = true
    }
    
    class func autoHeight(_ view: UIView, constraint: NSLayoutConstraint) {
        constraint.constant = view.sizeThatFits(CGSize(width: view.frame.size.width, height: CGFloat(MAXFLOAT))).height
    }
    
    class func autoWidth(_ view: UIView, constraint: NSLayoutConstraint) {
        constraint.constant = view.sizeThatFits(CGSize(width: CGFloat(MAXFLOAT), height: view.frame.size.height)).width
    }
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 1
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        //        var bounds = self.bounds
        //        bounds.size.width = bounds.size.width + 50
        //        self.bounds = bounds
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
extension UITextField {
    func isValid() -> Bool {
        if self.text?.isEmpty == true {
            return false
        }
        return true
    }
}

extension UITextView {
    func isValid() -> Bool {
        if self.text?.isEmpty == true {
            return false
        }
        return true
    }
}

extension UIDevice {
    func getDeviceModel() -> String {
        
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        switch identifier {
        // iPhones
        case "iPhone1,1":
            return "iPhone 2G (A1203)"
        case "iPhone1,2":
            return "iPhone 3G (A1241/A1324)"
        case "iPhone2,1":
            return "iPhone 3GS (A1303/A1325)"
        case "iPhone3,1":
            return "iPhone 4 (A1332)"
        case "iPhone3,2":
            return "iPhone 4 (A1332)"
        case "iPhone3,3":
            return "iPhone 4 (A1349)"
        case "iPhone4,1":
            return "iPhone 4S (A1387/A1431)"
        case "iPhone5,1":
            return "iPhone 5 (A1428)"
        case "iPhone5,2":
            return "iPhone 5 (A1429/A1442)"
        case "iPhone5,3":
            return "iPhone 5C (A1456/A1532)"
        case "iPhone5,4":
            return "iPhone 5C (A1507/A1516/A1526/A1529)"
        case "iPhone6,1":
            return "iPhone 5C (A1453/A1533)"
        case "iPhone6,2":
            return "iPhone 5S (A1457/A1518/A1528/A1530)"
        case "iPhone7,1":
            return "iPhone 6 Plus (A1522/A1524)"
        case "iPhone7,2":
            return "iPhone 6 (A1549/A1586)"
        case "iPhone8,1":
            return "iPhone 6s"
        case "iPhone8,2":
            return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":
            return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":
            return "iPhone 7 Plus"
        case "iPhone8,4":
            return "iPhone SE"
        case "iPhone10,1", "iPhone10,4":
            return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":
            return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":
            return "iPhone X"
            
        // iPods
        case "iPod1,1":
            return "iPod Touch 1G (A1213)"
        case "iPod2,1":
            return "iPod Touch 2G (A1288)"
        case "iPod3,1":
            return "iPod Touch 3G (A1318)"
        case "iPod4,1":
            return "iPod Touch 4G (A1367)"
        case "iPod5,1":
            return "iPod Touch 5G (A1421/A1509)"
            
        // iPads
        case "iPad1,1":
            return "iPad 1G (A1219/A1337)"
        case "iPad2,1":
            return "iPad 2 (A1395)"
        case "iPad2,2":
            return "iPad 2 (A1396)"
        case "iPad2,3":
            return "iPad 2 (A1397)"
        case "iPad2,4":
            return "iPad 2 (A1395+New Chip)"
        case "iPad2,5":
            return "iPad Mini 1G (A1432)"
        case "iPad2,6":
            return "iPad Mini 1G (A1454)"
        case "iPad2,7":
            return "iPad Mini 1G (A1455)"
        case "iPad3,1":
            return "iPad 3 (A1416)"
        case "iPad3,2":
            return "iPad 3 (A1403)"
        case "iPad3,3":
            return "iPad 3 (A1430)"
        case "iPad3,4":
            return "iPad 4 (A1458)"
        case "iPad3,5":
            return "iPad 4 (A1459)"
        case "iPad3,6":
            return "iPad 4 (A1460)"
        case "iPad4,1":
            return "iPad Air (A1474)"
        case "iPad4,2":
            return "iPad Air (A1475)"
        case "iPad4,3":
            return "iPad Air (A1476)"
        case "iPad4,4":
            return "iPad Mini 2G (A1489)"
        case "iPad4,5":
            return "iPad Mini 2G (A1490)"
        case "iPad4,6":
            return "iPad Mini 2G (A1491)"
            
        // Simulators
        case "i386":
            return "iPhone Simulator 32Bit"
        case "x86_64":
            return "iPhone Simulator 64Bit"
            
        // Default
        default:
            return "watting to update"
        }
    }
    
    func getDeviceTypeOn456() -> Int {
        switch getDeviceModel() {
        case "iPhone 4 (A1332)", "iPhone 4 (A1349)", "iPhone 4S (A1387/A1431)":
            return 4
        case "iPhone 5 (A1428)", "iPhone 5 (A1429/A1442)", "iPhone 5C (A1456/A1532)", "iPhone 5C (A1507/A1516/A1526/A1529)",
             "iPhone 5C (A1453/A1533)", "iPhone 5S (A1457/A1518/A1528/A1530)":
            return 5
        case "iPhone 6 Plus (A1522/A1524)", "iPhone 6 (A1549/A1586)":
            return 6
        default:
            return 4
        }
    }
    
    func getSystemVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
    func getIdfv() -> String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
}

//MARK:- UIColor Extension
extension UIColor {
    convenience init(hex:String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
//            UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: CGFloat(1.0)
        )
    }
    /**
     *  Returns the hex color code for this color.
     *
     *  @return The hex color code.
     */
    @objc public func hexString() -> String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        let rgb:Int = (Int)(red*255)<<16 | (Int)(green*255)<<8 | (Int)(blue*255)<<0 | (Int)(alpha*255)<<24
        return String(format: "#%06x", rgb)
    }
    
    /**
     *  Returns the inverse of this color.
     *
     *  @return The inverse color.
     */
    @objc public func inverse() -> UIColor {
        var r:CGFloat = 0.0; var g:CGFloat = 0.0; var b:CGFloat = 0.0; var a:CGFloat = 0.0;
        if self.getRed(&r, green: &g, blue: &b, alpha: &a) {
            return UIColor(red: 1.0-r, green: 1.0 - g, blue: 1.0 - b, alpha: a)
        }
        return .black // Return a default colour
    }
}
//MARK:- UIViewController Extension
extension UIViewController {
    @IBAction func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dismissVCAction() {
        self.dismiss(animated: true) {
            
        }
    }

	@IBAction func endEditing() {
		self.view.endEditing(true)
	}
}
extension UIButton {
    enum iconPosition {
        case center,left,right
    }
    
    enum arrowDirection {
        case up,down,linear,left,right,check,uncheck,dot
    }
    
    func drawLine(iconPosition position: iconPosition, direction:arrowDirection) {
        switch position {
        case .center:
            let center = self.center
            let fromPoint = CGPoint(x: center.x - 20, y: center.y)
            let toPoint = CGPoint(x: center.x + 20, y: center.y)
            self.drawLine(onLayer: self.layer, fromPoint: fromPoint, toPoint: toPoint, arrowDirection: direction)
        case .left:
            break
        case .right:
            break
        }
    }
    
    fileprivate func drawLine(onLayer layer: CALayer, fromPoint start: CGPoint, toPoint end: CGPoint, arrowDirection direction: arrowDirection) {
        let startPoint = start
        let center = self.center
        var lineCenter = CGPoint()
        switch direction {
        case .up:
            if layer.sublayers!.count > 0 {
                for lay in layer.sublayers! {
                    lay.removeFromSuperlayer()
                }
            }
            lineCenter = CGPoint(x: center.x, y: start.y - 8)
        case .down:
            if layer.sublayers == nil {
                lineCenter = CGPoint(x: center.x, y: start.y + 8)
                break }
            for lay in layer.sublayers! {
                lay.removeFromSuperlayer()
            }
            lineCenter = CGPoint(x: center.x, y: start.y + 8)
        case .linear:
            for lay in layer.sublayers! {
                lay.removeFromSuperlayer()
            }
            lineCenter = center
        case .left:
            break
        case .right:
            break
        case .check:
            break
        case .uncheck:
            break
        case .dot:
            break
        }
        
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: startPoint)
        linePath.addLine(to: lineCenter)
        linePath.move(to: lineCenter)
        linePath.addLine(to: end)
        line.path = linePath.cgPath
        line.lineWidth = 5
        line.lineCap = CAShapeLayerLineCap.round
        line.lineJoin = CAShapeLayerLineJoin.round
        line.fillColor = UIColor.red.cgColor
        line.opacity = 1.0
        line.strokeColor = UIColor.red.cgColor
        layer.addSublayer(line)
    }
}
extension Dictionary {
    
    mutating func merge(with dictionary: Dictionary) {
        dictionary.forEach { updateValue($1, forKey: $0) }
    }
    
    func merged(with dictionary: Dictionary) -> Dictionary {
        var dict = self
        dict.merge(with: dictionary)
        return dict
    }
}

//extension UITableViewCell {
//    func addShadowToCell(in tableView: RATreeView , at indexPath: Int) {
//        let isFirstRow: Bool = indexPath == 0
//        let isLastRow: Bool = indexPath == tableView.numberOfRows() - 1
//        var shadowRect: CGRect = backgroundView!.bounds.insetBy(dx: 0, dy: -10)
//        if isFirstRow {
//            shadowRect.origin.y += 10
//        }
//        else if isLastRow {
//            shadowRect.size.height -= 10
//        }
//        var maskRect: CGRect = backgroundView!.bounds.insetBy(dx: -20, dy: 0)
//        if isFirstRow {
//            maskRect.origin.y -= 10
//            maskRect.size.height += 10
//        }
//        else if isLastRow {
//            maskRect.size.height += 10
//        }
//        let layer: CALayer? = backgroundView?.layer
//        layer?.shadowColor = UIColor.red.cgColor
//        layer?.shadowOffset = CGSize(width: 0, height: 0)
//        layer?.shadowRadius = 3
//        layer?.shadowOpacity = 0.75
//        layer?.shadowPath = UIBezierPath(roundedRect: shadowRect, cornerRadius: 5).cgPath
//        layer?.masksToBounds = false
//        let maskLayer = CAShapeLayer()
//        maskLayer.path = UIBezierPath(rect: maskRect).cgPath
//        layer?.mask = maskLayer
//    }
//}

extension Bool {
	init(int: Int) {
		if int == 0 {
			self = false
		}else {
			self = true
		}
	}
}

extension Array where Element: Equatable {
	mutating func remove(object obj: Element) {
		self = self.filter { $0 != obj }
	}

//	func indexOfObject(object : Element) -> NSInteger {
//		return (self as NSArray).index(of: object)
//	}

//	mutating func removeObject(object : Element) {
//		let index = self.indexOfObject(object: object)
//		self.remove(at: index)
////		for var index = self.indexOfObject(object); index != NSNotFound; index = self.indexOfObject(object) {
////			self.removeAtIndex(index)
////		}
//	}

	mutating func removeObject<T>(obj: T) where T : Equatable {
		self = self.filter({$0 as? T != obj})
	}
}

//extension RealmSwift.Results {
//    func toArray<T>(ofType: T.Type) -> [T] {
//        var array = [T]()
//        for i in 0 ..< count {
//            if let result = self[i] as? T {
//                array.append(result)
//            }
//        }
//        
//        return array
//    }
//}
