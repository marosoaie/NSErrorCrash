import Foundation
import ReactiveSwift


enum MyError: Error {
    case pleaseCrash
}

class ViewModel {

    private let action: Action<Void, Bool, NSError>

    private let needsReset = MutableProperty(false)

    init() {
        action = Action<Void, Bool, NSError> { input in
            return SignalProducer(error: MyError.pleaseCrash as NSError)
        }

        needsReset <~ action.errors.map { error in
            if error is URLError {
                return false
            }

            return true
        }
    }

    func activate() {
        action.apply().start()
    }
}
