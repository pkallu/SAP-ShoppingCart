//
//  AppDelegate.swift
//  Shop
//
//  Copyright © 2017 SAP SE or an SAP affiliate company. All rights reserved.
//  Use of this software subject to the End User License Agreement located in ../EULA.pdf
//

import UIKit
import SAPCommon

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var launchManager: StandardOAuthAppLaunchManager!
    let logger = Logger.shared(named: "AppDelegate")
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Logger.root.logLevel = .info
        Logger.root.add(handler: ConsoleLogHandler())
        launchManager = StandardOAuthAppLaunchManager(application: application, window: window!, launchOptions: launchOptions)
        launchManager.manageAppLaunch { onboardingResult, onboardingError, loginResult in
            self.launch(onboardingResult: onboardingResult, onboardingError: onboardingError, loginResult: loginResult)
        }

        return true
    }
    
    func launch(onboardingResult: StandardOAuthFlowResult?, onboardingError: StandardOAuthFlowError?, loginResult: StandardLoginFlowResult?) {
        
        guard onboardingError == nil else {
            logger.error("An error occured during onboarding.")
            return
        }
        
        ConnectionManager.shared.onboardingResult = onboardingResult
        if let navigationController = self.window?.rootViewController as? UINavigationController,
            let productListViewController = navigationController.viewControllers.first as? ProductListViewController {
            productListViewController.loadProducts()
        }
    }
}
