import UIKit
import Realm

class ClothingProfile: RLMObject {
    dynamic var name = ""
    dynamic var type = ""
    dynamic var cost = ""
    dynamic var gender : Int = 0
    dynamic var size : Int = 0
    dynamic var color = ""
    dynamic var material = ""
    dynamic var created = NSDate()
    dynamic var connectedUsername = UserProfile()
}