//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
import Checkbox

class MyViewController : UIViewController {

    let checkbox1 = Checkbox()
    let checkbox2 = Checkbox()
    let checkbox3 = Checkbox()
    let checkbox4 = Checkbox()
    let label = UILabel()
    let button = UIButton()

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .black
        self.view = view
        view.addSubview(checkbox1)
        view.addSubview(checkbox2)
        view.addSubview(checkbox3)
        view.addSubview(checkbox4)
        view.addSubview(label)
        view.addSubview(button)

        checkbox1.addTarget(self, action: #selector(update), for: .valueChanged)
        checkbox2.addTarget(self, action: #selector(update), for: .valueChanged)
        checkbox3.addTarget(self, action: #selector(update), for: .valueChanged)
        checkbox4.addTarget(self, action: #selector(update), for: .valueChanged)

        label.textColor = .white
        label.text = "\(checkbox1.isChecked)"

        button.setTitle("Uncheck", for: .normal)
        button.addTarget(self, action: #selector(doUncheck), for: .touchUpInside)

        let inset = CGFloat(6)
        let insets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        checkbox1.borderShape = .square
        checkbox1.uncheckedBorderColor = .darkGray
        checkbox1.checkedBorderColor = .darkGray
        checkbox1.checkShape = .square
        checkbox1.checkInsets = insets
        checkbox1.isChecked = true

        checkbox2.borderShape = .circle
        checkbox2.uncheckedBorderColor = .darkGray
        checkbox2.checkedBorderColor = .darkGray
        checkbox2.checkShape = .circle
        checkbox2.checkInsets = insets

        checkbox3.borderShape = .square
        checkbox3.uncheckedBorderColor = .darkGray
        checkbox3.checkedBorderColor = .darkGray
        checkbox3.checkShape = .check
        checkbox3.checkInsets = insets

        checkbox4.borderShape = .square
        checkbox4.uncheckedBorderColor = .darkGray
        checkbox4.checkedBorderColor = .darkGray
        checkbox4.checkShape = .cross
        checkbox4.checkInsets = insets
    }

    @objc func doUncheck(_ sender: Any) {
        checkbox1.isChecked = !checkbox1.isChecked
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let size: CGFloat = 24.0
        checkbox1.frame = CGRect(x: view.bounds.midX - size / 2, y: 40, width: size, height: size)
        checkbox2.frame = CGRect(x: view.bounds.midX - size / 2, y: 80, width: size, height: size)
        checkbox3.frame = CGRect(x: view.bounds.midX - size / 2, y: 120, width: size, height: size)
        checkbox4.frame = CGRect(x: view.bounds.midX - size / 2, y: 160, width: size, height: size)
        label.frame = CGRect(x: view.bounds.midX - 60, y: view.bounds.midY + size / 2 + 20, width: 120, height: 40)
        button.frame = CGRect(x: view.bounds.midX - 60, y: view.bounds.midY + size / 2 + 70, width: 120, height: 40)
    }

    @IBAction func update(_ sender: Checkbox) {
        label.text = "\(sender.isChecked)"
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
