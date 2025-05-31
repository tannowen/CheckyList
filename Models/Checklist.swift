import Foundation

struct Checklist: Identifiable, Codable {
    var id = UUID()
    var title: String
    var items: [ChecklistItem] = []
} 