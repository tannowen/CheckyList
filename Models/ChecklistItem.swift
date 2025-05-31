import Foundation

struct ChecklistItem: Identifiable, Codable {
    var id = UUID()
    var text: String
    var isCompleted: Bool = false
} 