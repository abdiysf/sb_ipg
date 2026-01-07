//
//  Customization.swift
//  mobpay-ios
//
//  Created by allan.mageto on 04/12/2023.
//  Copyright © 2023 Allan Mageto. All rights reserved.
//

import Foundation


public struct Customization{
    var redirectUrl,iconUrl,merchantName,providerIconUrl,redirectMerchantName,primaryAccentColor: String;
    var applyOffer,displayPrivacyPolicy: Bool;
    
    
    public init(redirectUrl: String, iconUrl: String, merchantName: String, providerIconUrl: String, redirectMerchantName: String, primaryAccentColor: String, applyOffer: Bool, displayPrivacyPolicy: Bool) {
           self.redirectUrl = redirectUrl
           self.iconUrl = iconUrl
           self.merchantName = merchantName
           self.providerIconUrl = providerIconUrl
           self.redirectMerchantName = redirectMerchantName
           self.primaryAccentColor = primaryAccentColor
           self.applyOffer = applyOffer
           self.displayPrivacyPolicy = displayPrivacyPolicy
       }
}

