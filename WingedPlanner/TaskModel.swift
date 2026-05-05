import Foundation

struct TaskModel: Identifiable, Equatable, Codable {
    let id: UUID
    var title: String
    var isCompleted: Bool = false
    var isArchived: Bool = false
    
    init(id: UUID = UUID(), title: String, isCompleted: Bool = false, isArchived: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.isArchived = isArchived
    }
}