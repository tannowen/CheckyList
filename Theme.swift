import SwiftUI

enum Theme {
    static let backgroundColor = Color(.systemBackground)
    static let primaryText = Color(.label)
    static let secondaryText = Color(.secondaryLabel)
    static let accentColor = Color.blue
    
    static let itemSpacing: CGFloat = 8
    static let listPadding: CGFloat = 16
    
    static func configureNavigationBarAppearance() {
        let appearance = UINavigationBar.appearance()
        appearance.largeTitleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 34, weight: .bold)
        ]
        appearance.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 17, weight: .semibold)
        ]
    }
} 