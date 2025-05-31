import SwiftUI

struct ChecklistDetailView: View {
    let checklist: Checklist
    @EnvironmentObject private var store: ChecklistStore
    @State private var newItemText = ""
    
    var body: some View {
        List {
            if checklist.items.isEmpty {
                ContentUnavailableView(
                    "No items yet",
                    systemImage: "square.list",
                    description: Text("No items in this CheckyList* yet. Add some!")
                )
            } else {
                ForEach(checklist.items) { item in
                    HStack {
                        Button(action: {
                            store.toggleItemCompletion(itemId: item.id, inChecklistWithId: checklist.id)
                        }) {
                            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(item.isCompleted ? .green : .gray)
                                .font(.title2)
                        }
                        .buttonStyle(.plain)
                        
                        Text(item.text)
                            .font(.body)
                            .strikethrough(item.isCompleted)
                            .foregroundStyle(item.isCompleted ? .gray : .primary)
                    }
                    .padding(.vertical, 4)
                }
                .onDelete { indexSet in
                    store.deleteItem(at: indexSet, fromChecklistWithId: checklist.id)
                }
            }
            
            HStack {
                TextField("New item", text: $newItemText)
                    .textFieldStyle(.roundedBorder)
                
                Button(action: {
                    if !newItemText.isEmpty {
                        store.addItem(text: newItemText, toChecklistWithId: checklist.id)
                        newItemText = ""
                    }
                }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.accentColor)
                }
                .disabled(newItemText.isEmpty)
            }
            .listRowSeparator(.hidden)
        }
        .navigationTitle(checklist.title)
    }
} 