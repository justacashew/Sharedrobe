import UIKit
import Realm

class UserProfile: RLMObject {
    dynamic var nameFirst = ""
    dynamic var nameLast = ""
    dynamic var email = ""
    dynamic var username = ""
    dynamic var password = ""
    dynamic var created = NSDate()
    dynamic var clothing_profile = RLMArray(objectClassName: ClothingProfile.className())
    dynamic var profpic : UIImage?

}