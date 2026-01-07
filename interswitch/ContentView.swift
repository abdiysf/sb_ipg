//
//  ContentView.swift
//  interswitch
//
//  Created by Abdirahman Abdisalam on 07/01/26.
//

import SwiftUI
import CryptoSwift
import SafariServices
import CocoaMQTT
import MqttCocoaAsyncSocket
import MobpayiOS
import UIKit

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Pay Now") {
                Task {
                    await call_IPG()
                }
            }
                .frame(width: 200, height: 50)
        }
        .padding()
    }
    @MainActor
    private func call_IPG() async {
        let paymentInput = Payment(amount: "1000.00", transactionRef: "TC2BCCFE6P", orderId: "TC2BCCFE6P", terminalType: "MOBILE", terminalId: "3CRZ0001", paymentItem: "", currency: "KES", preauth: "1", narration: "TOPUP")
        let customerInput = Customer(customerId: "105693", firstName: "ABDIRAHMAN", secondName: "ABDISLAM", email: "mustafeabdisalam@gmail.com", mobile: "252614492522", city: "mogdishu", country: "somalia", postalCode: "01000", street: "trepiano", state: "Banadir")
        let merchantInput = Merchant(merchantId: "ISWKEN0001", domain: "ISWKE")

        let customizationData = Customization(redirectUrl: "https://sombank.so/", iconUrl: "https://tplusdev.sombank.so/Cards/tpluslogo.png", merchantName: "SomBank", providerIconUrl: "https://tplusdev.sombank.so/Cards/sombank.png", redirectMerchantName: "SomBank", primaryAccentColor: "#223FAD", applyOffer: true, displayPrivacyPolicy: true)
       
        let checkoutData: CheckoutData = CheckoutData(merchant: merchantInput, payment: paymentInput, customer: customerInput, customization: customizationData)
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
////            self.modifiyTopUpButton(false)
//        }
        print("CheckoutData-- \(checkoutData) ")
        
        Task {
            guard let vc = HostingControllerProvider.topViewController() else {
                print("❌ No UIViewController found")
                
                return
            }

            do {
                print("VC visible:", vc.view.window != nil)
                try await Mobpay.instance.submitPayment(
                    checkout: checkoutData,
                    isLive: false,
                    previousUIViewController: vc
                ) { result in
                    print("✅ Mobpay result:", result)
                }
            } catch {
                print("❌ Mobpay error:", error)
            }
            }
//        Task{
//            do {
//              
//                
//                if let vc = HostingControllerProvider.topViewController() {
//                    try await Mobpay.instance.submitPayment(
//                        checkout: checkoutData,
//                        isLive: false,
//                        previousUIViewController: vc
//                    ) { result in
//                        print("result====>>>> ", result)
//                    }
//                }
//                
//                
//            } catch {
//                // Handle the error here
//                print("Error during payment submission: \(error)")
//                
//                // Present an appropriate error message to the user within the UI context
////                DispatchQueue.main.async {
////                    self.showAlert(isError: true, title: "Failed", message: "\(error)", fromController: self)
////                    // Update UI elements to display the error message, such as using an alert or label
////                }
//            }
//        }
                
    }
     
   
}

#Preview {
    ContentView()
}


final class HostingControllerProvider {
    static func topViewController() -> UIViewController? {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let root = scene.windows.first?.rootViewController else {
            return nil
        }

        var top = root
        while let presented = top.presentedViewController {
            top = presented
        }
        return top
    }
}
