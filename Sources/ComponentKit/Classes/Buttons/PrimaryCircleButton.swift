import UIKit
import ThemeKit
import SnapKit

open class PrimaryCircleButton: UIButton {
    public static let size: CGFloat = .heightButton

    private var style: Style?

    public init() {
        super.init(frame: .zero)

        cornerRadius = Self.size / 2

        setBackgroundColor(.themeSteel20, for: .disabled)

        snp.makeConstraints { maker in
            maker.size.equalTo(Self.size)
        }
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func set(image: UIImage?) {
        if let style = style, case .yellow = style {
            setImage(image?.withTintColor(.themeDark), for: .normal)
            setImage(image?.withTintColor(.themeDark), for: .highlighted)
        } else if let style = style, case .cyan = style {
            setImage(image?.withTintColor(.themeDark), for: .normal)
            setImage(image?.withTintColor(.themeDark), for: .highlighted)
        } else {
            setImage(image?.withTintColor(.themeClaude), for: .normal)
            setImage(image?.withTintColor(.themeClaude), for: .highlighted)
        }
        setImage(image?.withTintColor(.themeSteel20), for: .disabled)
    }

    public func set(style: Style) {
        self.style = style

        switch style {
        case .yellow:
            setImage(imageView?.image?.withTintColor(.themeDark), for: .normal)
            setBackgroundColor(.themeYellowD, for: .normal)
            setBackgroundColor(.themeYellow50, for: .highlighted)
        case .black:
            setImage(imageView?.image?.withTintColor(.themeDark), for: .normal)
            setBackgroundColor(.themeBlack, for: .normal)
            setBackgroundColor(.themeBlack50, for: .highlighted)
        case .red:
            setBackgroundColor(.themeLucian, for: .normal)
            setBackgroundColor(.themeRed50, for: .highlighted)
        case .gray:
            setBackgroundColor(.themeLeah, for: .normal)
            setBackgroundColor(.themeNina, for: .highlighted)
        case .cyan:
            setBackgroundColor(.themeCyanD, for: .normal)
            setBackgroundColor(.themeCyanD, for: .highlighted)
        }
    }

    public enum Style {
        case yellow
        case black
        case red
        case gray
        case cyan
    }

}
