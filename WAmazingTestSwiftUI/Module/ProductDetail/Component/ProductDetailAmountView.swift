//
//  ProductDetailAmountView.swift
//  WAmazingTestSwiftUI
//
//  Created by Harry on 2023/10/6.
//

import SwiftUI

struct ProductDetailAmountView: View {
    
    @State private var amount = 0
    
    private var minusButtonDisabled: Bool {
        amount <= 0
    }
    
    private var plusButtonDisabled: Bool {
        amount >= 100
    }
    
    var body: some View {
        VStack(spacing: 0) {
            makeSeparator()
            
            HStack(spacing: 0) {
                HStack(spacing: 10) {
                    Button(action: { amount -= 1 }) {
                        Image(systemName: "minus")
                    }
                    .tint(minusButtonDisabled ? .gray : .buttonNormalPink)
                    .disabled(minusButtonDisabled)
                    
                    Text("\(amount)")
                        .frame(minWidth: 20)
                        .padding(
                            EdgeInsets(
                                top: 8,
                                leading: 12,
                                bottom: 8,
                                trailing: 12
                            )
                        )
                        .background(Color.airportSelectionGrey)
                        .cornerRadius(2)
                    
                    Button(action: { amount += 1 }) {
                        Image(systemName: "plus")
                    }
                    .tint(plusButtonDisabled ? .gray : .buttonNormalPink)
                    .disabled(plusButtonDisabled)
                }
                .padding([.leading, .trailing])
                
                makeButton {
                    
                }
                .padding([.top, .bottom], 10)
                .padding(.trailing)
            }
            
            makeSeparator()
        }
    }
    
    private func makeSeparator() -> some View {
        Rectangle()
            .frame(height: 0.7)
            .foregroundColor(.gray)
    }
    
    private func makeButton(action: @escaping () -> ()) -> some View {
        Button(action: action) {
            HStack(spacing: 10) {
                Image(systemName: "cart")
                    .font(.system(size: 18, weight: .bold))
                
                Text("加入購物車")
                    .font(.system(size: 20, weight: .bold))
            }
        }
        .buttonStyle(ShopButtonStyle())
    }
}

fileprivate struct ShopButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding([.top, .bottom], 10)
            .foregroundColor(.white)
            .background(configuration.isPressed ? Color(.buttonPressedPink) : Color(.buttonNormalPink))
            .cornerRadius(10)
    }
}

struct ProductDetailAmountView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailAmountView()
    }
}
