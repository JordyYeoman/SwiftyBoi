import Observation
import SwiftUI

enum WalletInputState {
    case focused
    case inputting
    case disabled
    case defaultState
}

func getWalletInputBackgroundStyle(state: WalletInputState) -> Color {
    switch state {
    case .focused, .inputting:  // semanticsSystemBgSecondary
        return Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
    case .disabled:  // semanticsOpacityDark5
        return Color(red: 0, green: 0, blue: 0, opacity: 0.05)
    case .defaultState:  // semanticsBgNeutral200
        return Color(red: 251 / 255, green: 251 / 255, blue: 251 / 255)
    }
}

func getWalletInputTextStyle(state: WalletInputState) -> Color {
    switch state {
    case .focused, .inputting:  // semanticsContentPrimary
        return Color(red: 39 / 255, green: 45 / 255, blue: 53 / 255)
    case .disabled, .defaultState:  // semanticsContentDisabled
        return Color(red: 126 / 255, green: 134 / 255, blue: 149 / 255)
    }
}

func getWalletBorderStyle(state: WalletInputState) -> Color {
    switch state {
    case .focused, .inputting:  // semanticsBorderPrimary
        return Color(red: 235 / 255, green: 238 / 255, blue: 243 / 255)
    case .disabled:  // No border?
        return Color(red: 0, green: 0, blue: 0, opacity: 0.05)
    case .defaultState:  // No border?
        return Color.clear
    }
}

struct WalletInputDynamicView: View {
    @State var inputState: WalletInputState = .defaultState
    @State var inputVal = ""
    @State var isDisabled: Bool = false
    @FocusState var focused: Bool

    var body: some View {
        VStack {
            TextField(
                "Min $5",
                text: $inputVal
            )
            .focused($focused)
            .disabled(inputState == .disabled)
            .keyboardType(.decimalPad)
            .multilineTextAlignment(.center)
            .font(.largeTitle)
            .fontWeight(.heavy)

            if inputVal.isEmpty {
                Text("Bro youve cooked it")
                    .font(.caption2)
            }
        }
        .padding(.vertical, 29)
        .frame(height: 100)
        .onChange(of: focused) {
            if focused {
                inputState = .focused
                return
            }

            inputState = .defaultState
        }
        .onChange(of: inputVal) {
            if focused && !inputVal.isEmpty {
                inputState = .inputting
                return
            }

            inputState = .defaultState
        }
        .foregroundStyle(getWalletInputTextStyle(state: inputState))
        .background(getWalletInputBackgroundStyle(state: inputState))
        .cornerRadius(16)  // radiusLg
        .overlay(
            inputState == .inputting || inputState == WalletInputState.focused
                ? RoundedRectangle(cornerRadius: 16)  // radiusLg
                    .inset(by: -1)
                    .stroke(
                        getWalletBorderStyle(state: inputState), lineWidth: 2)
                : nil
        )
    }
}

struct WalletInputViewList: View {
    var body: some View {
        WalletInputDynamicView()
            .padding()
            .background(.red)
    }
}

#Preview {
    WalletInputViewList()
}
