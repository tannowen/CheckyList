import SwiftUI

@main
struct CheckyListApp: App {
    @StateObject private var store = ChecklistStore()
    
    var body: some Scene {
        WindowGroup {
            ChecklistsView()
                .environmentObject(store)
        }
    }
} 