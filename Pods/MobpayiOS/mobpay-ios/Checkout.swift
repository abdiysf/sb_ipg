//
//  Checkout.swift
//  mobpay-ios
//
//  Created by Kelsey Makale on 24/01/2023.
//  Copyright © 2023 Allan Mageto. All rights reserved.
//

import Foundation

public struct CheckoutData : Codable{
    
    public init(merchant: Merchant, payment: Payment, customer: Customer, customization: Customization) {
        self.merchantCode = merchant.merchantId
        self.domain = merchant.domain
        self.transactionReference = payment.transactionRef
        self.orderId = payment.orderId
        self.expiryTime = ""
        self.currencyCode = payment.currency
        self.amount = payment.amount
        self.narration = payment.narration
      
        self.reqId = ""
        self.dateOfPayment = ""
        self.terminalId = payment.terminalId
        self.terminalType = payment.terminalType
        self.channel = "WEB"
        self.fee = 0
        self.preauth = payment.preauth
        self.customerFirstName = customer.firstName
        self.customerSecondName = customer.secondName
        self.customerEmail = customer.email
        self.customerMobile = customer.mobile
        self.customerId = customer.customerId
        
        self.customerCountry = customer.country
        self.customerPostalCode = customer.postalCode
        self.customerStreet = customer.street
        self.customerState = customer.state
        
        //CUSTOMIZATION
        self.redirectUrl = customization.redirectUrl
        self.iconUrl = customization.iconUrl
        self.merchantName = customization.merchantName
        self.providerIconUrl = customization.providerIconUrl
        self.displayPrivacyPolicy = customization.displayPrivacyPolicy
        self.applyOffer = customization.applyOffer
        self.redirectMerchantName = customization.redirectMerchantName
        self.primaryAccentColor = customization.primaryAccentColor
    }
    
    var merchantCode: String = ""
    var domain: String = ""
    var transactionReference: String = ""
    var orderId: String = ""
    var expiryTime: String = ""
    var currencyCode: String = ""
    var amount: String = ""
    var narration: String = ""
    var merchantName: String = ""
    var reqId: String = ""
    var dateOfPayment: String = ""
    var terminalId: String = ""
    var terminalType: String = ""
    var channel: String = ""
    var fee: Int = 0
    var preauth: String = ""
    var cardTokensJson: String = ""

    //customer details
    var customerId:String = ""
    var customerFirstName:String = ""
    var customerSecondName:String = ""
    var customerEmail:String = ""
    var customerMobile:String = ""
    var customerCountry: String = ""
    var customerPostalCode: String = ""
    var customerStreet: String = ""
    var customerState: String = ""
    
    //customization
    var redirectUrl: String = ""
    var providerIconUrl: String = ""
    var iconUrl: String = ""
    var displayPrivacyPolicy: Bool = false
    var applyOffer: Bool = false
    var redirectMerchantName: String = ""
    var primaryAccentColor: String = ""
    
    

    
    
}
