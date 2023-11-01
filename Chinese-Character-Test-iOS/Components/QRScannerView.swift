//
//  QRScannerView.swift
//  Chinese-Character-Test-iOS
//
//  Created by Steven McVey on 11/1/23.
//

import SwiftUI

struct QRScannerView: View {
    @State var scanResult = "No QR code detected"
    var body: some View {
        ZStack(alignment: .bottom) {
                    QRScanner()
         
                    Text(scanResult)
                        .padding()
                        .background(.black)
                        .foregroundColor(.white)
                        .padding(.bottom)
                }
    }
}

#Preview {
    QRScannerView()
}
