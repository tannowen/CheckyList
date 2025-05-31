import Foundation
import SwiftUI

class ChecklistStore: ObservableObject {
    @Published var checklists: [Checklist] = [] {
        didSet {
            saveChecklists()
        }
    }
    
    init() {
        loadChecklists()
    }
    
    // MARK: - Checklist Management
    
    func addChecklist(title: String) {
        let checklist = Checklist(title: title)
        checklists.append(checklist)
    }
    
    func deleteChecklist(at indexSet: IndexSet) {
        checklists.remove(atOffsets: indexSet)
    }
    
    func deleteChecklist(withId id: UUID) {
        if let index = checklists.firstIndex(where: { $0.id == id }) {
            checklists.remove(at: index)
        }
    }
    
    // MARK: - ChecklistItem Management
    
    func addItem(text: String, toChecklistWithId id: UUID) {
        if let index = checklists.firstIndex(where: { $0.id == id }) {
            let item = ChecklistItem(text: text)
            checklists[index].items.append(item)
        }
    }
    
    func toggleItemCompletion(itemId: UUID, inChecklistWithId checklistId: UUID) {
        if let checklistIndex = checklists.firstIndex(where: { $0.id == checklistId }),
           let itemIndex = checklists[checklistIndex].items.firstIndex(where: { $0.id == itemId }) {
            checklists[checklistIndex].items[itemIndex].isCompleted.toggle()
        }
    }
    
    func deleteItem(at indexSet: IndexSet, fromChecklistWithId checklistId: UUID) {
        if let checklistIndex = checklists.firstIndex(where: { $0.id == checklistId }) {
            checklists[checklistIndex].items.remove(atOffsets: indexSet)
        }
    }
    
    // MARK: - Persistence
    
    private func saveChecklists() {
        if let encoded = try? JSONEncoder().encode(checklists) {
            UserDefaults.standard.set(encoded, forKey: "checklists")
        }
    }
    
    private func loadChecklists() {
        if let data = UserDefaults.standard.data(forKey: "checklists"),
           let decoded = try? JSONDecoder().decode([Checklist].self, from: data) {
            checklists = decoded
        }
    }
} 