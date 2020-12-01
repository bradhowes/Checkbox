import SnapshotTesting
import XCTest
@testable import Checkbox

import UIKit

class TVC15 : UIViewController {

    let checkbox1 = Checkbox()
    let checkbox2 = Checkbox()
    let checkbox3 = Checkbox()
    let checkbox4 = Checkbox()
    let label = UILabel()

    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }

    override func loadView() {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 200, height: 600)))
        view.backgroundColor = .black
        self.view = view
        view.addSubview(checkbox1)
        view.addSubview(checkbox2)
        view.addSubview(checkbox3)
        view.addSubview(checkbox4)
        view.addSubview(label)

        checkbox1.addTarget(self, action: #selector(update), for: .valueChanged)
        checkbox2.addTarget(self, action: #selector(update), for: .valueChanged)
        checkbox3.addTarget(self, action: #selector(update), for: .valueChanged)
        checkbox4.addTarget(self, action: #selector(update), for: .valueChanged)

        let inset = CGFloat(6)
        let insets = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)

        checkbox1.borderShape = .square
        checkbox1.uncheckedBorderColor = .darkGray
        checkbox1.checkedBorderColor = .darkGray
        checkbox1.checkShape = .square
        checkbox1.checkInsets = insets

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

        label.textColor = .white
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let size: CGFloat = 24.0
        checkbox1.frame = CGRect(x: view.bounds.midX - size / 2, y: 40, width: size, height: size)
        checkbox2.frame = CGRect(x: view.bounds.midX - size / 2, y: 80, width: size, height: size)
        checkbox3.frame = CGRect(x: view.bounds.midX - size / 2, y: 120, width: size, height: size)
        checkbox4.frame = CGRect(x: view.bounds.midX - size / 2, y: 160, width: size, height: size)
        label.frame = CGRect(x: view.bounds.midX - 60, y: view.bounds.midY + size / 2 + 20, width: 120, height: 40)
    }

    @IBAction func update(_ sender: Checkbox) {
        label.text = "\(sender.isChecked)"
        print("\(sender.isChecked)")
    }
}

final class CheckboxTests: XCTestCase {

    func testRenderDefaults() {
        let vc = TVC15()
        assertSnapshot(matching: vc, as: .image(on: .iPhoneSe), record: false)
    }

    func testAllOn() {
        let vc = TVC15()
        vc.checkbox1.setChecked(true, animated: false)
        vc.checkbox2.setChecked(true, animated: false)
        vc.checkbox3.setChecked(true, animated: false)
        vc.checkbox4.setChecked(true, animated: false)
        assertSnapshot(matching: vc, as: .image(on: .iPhoneSe), record: false)
    }

    func testAllOnOff() {
        let vc = TVC15()
        vc.checkbox1.setChecked(true, animated: false)
        vc.checkbox2.setChecked(true, animated: false)
        vc.checkbox3.setChecked(true, animated: false)
        vc.checkbox4.setChecked(true, animated: false)
        vc.checkbox1.setChecked(false, animated: false)
        vc.checkbox2.setChecked(false, animated: false)
        vc.checkbox3.setChecked(false, animated: false)
        vc.checkbox4.setChecked(false, animated: false)
        assertSnapshot(matching: vc, as: .image(on: .iPhoneSe), record: false)
    }

    func testToggleOnOff() {
        let vc = TVC15()
        vc.checkbox2.setChecked(true, animated: false)
        vc.checkbox2.setChecked(false, animated: false)
        assertSnapshot(matching: vc, as: .wait(for: 2, on: .image(on: .iPhoneSe)), record: false)
    }
}
