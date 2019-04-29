//
//  Constants.swift
//  Preplsy
//
//  Created by Waqas Ali on 7/13/16.
//  Copyright © 2016 dinosoftlabs. All rights reserved.
//

import Foundation
import UIKit

let cellIndentifier = "cell"
let IPHONE_HEIGHT = UIScreen.main.bounds.height
let IPHONE_WIDTH = UIScreen.main.bounds.width
let APP_VERSION = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
let shareApp = UIApplication.shared
let isIPad = UIDevice.current.userInterfaceIdiom == .pad
let appUtility: PlayMovieUtility = PlayMovieUtility.sharedPlayMovieUtility

let apiKey = "25aaa557f2b0d891d56ad03950ff849c"
let baseUrl = "https://api.themoviedb.org/3/movie/"

////////////////////////////////////////////////////////////////@@@@@@@@@@@@@@@@@@@@@@@@@@---------------

let leftMenuCell = "LeftMenuCell"
let doctorCell = "DoctorCell"
let interactionHistoryCell = "InteractionHistoryCell"


let doctorChooseVC = "ChooseVC"
let firstTimeUse = "firstTimeUse"

////////////////////////////////////////////////////////////////@@@@@@@@@@@@@@@@@@@@@@@@@@---------------

let userDefaults:UserDefaults = UserDefaults.standard
let notifyCenter: NotificationCenter = NotificationCenter.default
let appDelegate = UIApplication.shared.delegate

let REQUEST_DATE_FORMAT = "yyyy-MM-dd"

// Alert Messages

let titleServerError: String            = "Error"
let titleNetworkError: String           = "Limited/No Connectivity"

let messageServerError: String          = "Server is not responding"
let messageNetworkError: String         = "Please try again later, once your network connectivity is available"
let messageCancelledError: String       = "Requested Cancelled"

let titleValidationFailed: String       = "Validation Failed"
let messageLoginValidationFailed        = "Please enter valid a email and password"
let messageUserProfileValidationFailed  = "Please enter all name fields"
let buttonOK                            = "OK"
let buttonLogout                        = "Logout"
let buttonSend                          = "Send"
let buttonDelete                        = "Delete"
let buttonCancel                        = "Cancel"

let messageOldPasswordValidationFailed  = "Please enter old password."
let messageNewPasswordValidationFailed  = "Please enter a valid new password."
let messagePasswordMatchValidationFailed    = "New passwords don't match."

/*
 **
 */

let keyAppUser = "appUser"
let keyAppValidationUser = "AppValidationUser"

let key_Title = "Title"
let key_Image = "Image"
let appDomain = "com.millim"
