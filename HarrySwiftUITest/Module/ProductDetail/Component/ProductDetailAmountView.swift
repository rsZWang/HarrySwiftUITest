//
//  ProductDetailAmountView.swift
//  HarrySwiftUITest
//
//  Created by Harry on 2023/10/6.
//

import SwiftUI

struct ProductDetailAmountView: View {
    
    @ObservedObject var viewModel: ProductDetailViewModel
    
    private var amountLimit: Int {
        viewModel.detail.amountLimit
    }
    
    private var minusButtonDisabled: Bool {
        viewModel.amount <= 0
    }
    
    private var plusButtonDisabled: Bool {
        viewModel.amount >= viewModel.detail.amountLimit
    }
    
    var body: some View {
        VStack(spacing: 0) {
            makeSeparator()
            
            HStack(spacing: 0) {
                HStack(spacing: 10) {
                    Button(action: { viewModel.minusAmount() }) {
                        Image(systemName: "minus")
                    }
                    .tint(minusButtonDisabled ? .gray : .buttonNormalPink)
                    .disabled(minusButtonDisabled)
                    
                    Text("\(viewModel.amount)")
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
                    
                    Button(action: { viewModel.plusAmount() }) {
                        Image(systemName: "plus")
                    }
                    .tint(plusButtonDisabled ? .gray : .buttonNormalPink)
                    .disabled(plusButtonDisabled)
                }
                .padding([.leading, .trailing])
                
                Button(action: { viewModel.putInCart() }) {
                    HStack(spacing: 10) {
                        Image(systemName: "cart")
                            .font(.system(size: 18, weight: .bold))
                        
                        Text("product_detail_button_put_in_cart".localised)
                            .font(.system(size: 20, weight: .bold))
                    }
                }
                .buttonStyle(ShopButtonStyle())
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
        ProductDetailAmountView(viewModel: ProductDetailViewModel())
    }
}
