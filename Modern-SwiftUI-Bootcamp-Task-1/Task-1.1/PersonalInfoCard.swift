struct PersonalInfoCard {
    let name: String
    let age: Int
    let height: Double
    let isStudent: Bool
    var phoneNumber: String?
    var linkedin: String?
    var github: String?

    func displayInfo() {
        print("KİŞİSEL BİLGİ KARTI")
        print("İsim: \(name)")
        print("Yaş: \(age)")
        print("Boy: \(height) m")
        print("Öğrenci mi?: \(isStudent ? "Evet" : "Hayır")")
        if let phone = phoneNumber {
            print("Telefon: \(phone)")
        } else {
            print("Telefon: Bilgi yok")
        }
        guard let linkedinAccount = linkedin else {
            print("LinkedIn: Bilgi yok")
            if let githubAccount = github {
                print("GitHub: \(githubAccount)")
            } else {
                print("GitHub: Bilgi yok")
            }
            return
        }
        print("LinkedIn: \(linkedinAccount)")
        guard let githubAccount = github else {
            print("GitHub: Bilgi yok")
            return
        }
        print("GitHub: \(githubAccount)")
    }
}
