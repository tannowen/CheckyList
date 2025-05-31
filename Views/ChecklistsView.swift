import SwiftUI

struct ChecklistsView: View {
    @EnvironmentObject private var store: ChecklistStore
    @State private var isAddingNewChecklist = false
    @State private var newChecklistTitle = ""
    
    var body: some View {
        NavigationStack {
            List {
                if store.checklists.isEmpty {
                    ContentUnavailableView(
                        "Welcome to CheckyList*!",
                        systemImage: "checklist",
                        description: Text("Tap + to create your first list.")
                    )
                } else {
                    ForEach(store.checklists) { checklist in
                        NavigationLink(destination: ChecklistDetailView(checklist: checklist)) {
                            HStack {
                                Text(checklist.title)
                                    .font(.headline)
                                Spacer()
                                let incompleteCount = checklist.items.filter { !$0.isCompleted }.count
                                if incompleteCount > 0 {
                                    Text("\(incompleteCount)")
                                        .foregroundStyle(.secondary)
                                        .font(.caption)
                                        .padding(6)
                                        .background(.secondary.opacity(0.2))
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    .onDelete(perform: store.deleteChecklist)
                }
            }
            .navigationTitle("CheckyList*")
            .toolbar {
                Button(action: { isAddingNewChecklist = true }) {
                    Image(systemName: "plus.circle.fill")
                }
            }
            .alert("New CheckyList*", isPresented: $isAddingNewChecklist) {
                TextField("List Title", text: $newChecklistTitle)
                Button("Cancel", role: .cancel) {
                    newChecklistTitle = ""
                }
                Button("Add") {
                    if !newChecklistTitle.isEmpty {
                        store.addChecklist(title: newChecklistTitle)
                        newChecklistTitle = ""
                    }
                }
            }
        }
    }
} 