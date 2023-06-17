import Foundation

enum Status: String {
    case tas = "Taş"
    case kagit = "Kağıt"
    case makas = "Makas"
}

func randomSelection() -> String {
    let options = ["Taş", "Kağıt", "Makas"]
    let randomIndex = Int.random(in: 0..<3)
    return options[randomIndex]
}

func showMessage (with isComputerWin: Bool) {
    print(isComputerWin ? "😔 Bilgisayar Kazandı!" : "🤗 Siz Kazandınız! Tebrikler")
}

func checkStatus (userChoice: String)   {
    let bilgisayarSecim = randomSelection()
    if let secim = Status(rawValue: userChoice) {
        print("👉 Bilgisayarın seçimi: \(bilgisayarSecim), Sizin seçiminiz: \(userChoice)")
        switch secim {
        case .tas:
            bilgisayarSecim == "Makas" ? showMessage(with: false) : (bilgisayarSecim == "Taş" ? print("🫠 Eşit") : showMessage(with: true))
        case .kagit:
            bilgisayarSecim == "Taş" ? showMessage(with: false) : (bilgisayarSecim == "Kağıt" ? print("🫠 Eşit") : showMessage(with: true))
        case .makas:
            bilgisayarSecim == "Kağıt" ? showMessage(with: false) : (bilgisayarSecim == "Makas" ? print("🫠 Eşit") : showMessage(with: true))
        }
    }else {
        print("Girdiğiniz değer doğru değil")
    }
}

func playGame() {
    print("Taş, Kağıt, Makas?")
    let input = readLine()
    checkStatus(userChoice: input!)
    print("🔸Yeniden oynamak ister misin?\nEvet ise 1️⃣, Hayır ise 2️⃣")
    let playAgain = readLine()
    playAgain == "1" ? playGame() : print("Oyun Bitti")
}

playGame()
