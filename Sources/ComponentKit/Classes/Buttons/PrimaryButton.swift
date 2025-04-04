import UIKit
import SnapKit
import ThemeKit
import HUD

open class PrimaryButton: UIButton {
    private static let horizontalPadding: CGFloat = .margin16
    private static let leftPaddingWithImage: CGFloat = 14
    private static let rightPaddingWithImage: CGFloat = 26
    private static let imageMargin: CGFloat = .margin8
    public static let height: CGFloat = .heightButton

    private let spinner = HUDActivityView.create(with: .medium24)

    public init() {
        super.init(frame: .zero)

        cornerRadius = Self.height / 2
        layer.cornerCurve = .continuous

        titleLabel?.font = .headline2
        setTitleColor(.themeGray50, for: .disabled)

        snp.makeConstraints { make in
            make.height.equalTo(Self.height)
        }

        addSubview(spinner)
        spinner.snp.makeConstraints { make in
            if let titleLabel {
                make.trailing.equalTo(titleLabel.snp.leading).offset(-Self.imageMargin)
            } else {
                make.leading.equalToSuperview().inset(Self.leftPaddingWithImage)
            }
            make.centerY.equalToSuperview()
        }
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func set(style: Style, accessoryType: AccessoryType = .none) {
        switch style {
        case .yellow:
            setBackgroundColor(.themeYellowD, for: .normal)
            setBackgroundColor(.themeYellow50, for: .highlighted)
            setBackgroundColor(.themeSteel20, for: .disabled)
        case .black:
            setBackgroundColor(.themeBlack, for: .normal)
            setBackgroundColor(.themeBlack, for: .highlighted)
            setBackgroundColor(.themeBlack50, for: .disabled)
        case .red:
            setBackgroundColor(.themeLucian, for: .normal)
            setBackgroundColor(.themeRed50, for: .highlighted)
            setBackgroundColor(.themeSteel20, for: .disabled)
        case .gray:
            setBackgroundColor(.themeLeah, for: .normal)
            setBackgroundColor(.themeNina, for: .highlighted)
            setBackgroundColor(.themeSteel20, for: .disabled)
        case .transparent:
            setBackgroundColor(.clear, for: .normal)
            setBackgroundColor(.clear, for: .highlighted)
            setBackgroundColor(.clear, for: .disabled)
        case .lightCyan:
            setBackgroundColor(.themeCyanD, for: .normal)
            setBackgroundColor(.themeCyanD, for: .highlighted)
            setBackgroundColor(.themeSteel20, for: .disabled)
        case .blackYellow:
            setBackgroundColor(.themeDarkYellow, for: .normal)
            setBackgroundColor(.themeDarkYellow, for: .highlighted)
            setBackgroundColor(.themeSteel20, for: .disabled)
        }

        switch style {
        case .yellow:
            setTitleColor(.themeDark, for: .normal)
            setTitleColor(.themeDark, for: .highlighted)
            setTitleColor(.themeGray50, for: .disabled)
        case .black:
            setTitleColor(.themeWhite, for: .normal)
            setTitleColor(.themeWhite, for: .highlighted)
            setTitleColor(.themeWhite50, for: .disabled)
        case .red, .gray:
            setTitleColor(.themeClaude, for: .normal)
            setTitleColor(.themeClaude, for: .highlighted)
            setTitleColor(.themeGray50, for: .disabled)
        case .transparent:
            setTitleColor(.themeLeah, for: .normal)
            setTitleColor(.themeGray, for: .highlighted)
            setTitleColor(.themeGray50, for: .disabled)
        case .lightCyan:
            setTitleColor(.themeDark, for: .normal)
            setTitleColor(.themeDark, for: .highlighted)
            setTitleColor(.themeGray50, for: .disabled)
        case .blackYellow:
            setTitleColor(.themeYellowDark, for: .normal)
            setTitleColor(.themeYellowDark, for: .highlighted)
            setTitleColor(.themeGray50, for: .disabled)
        }

        switch accessoryType {
        case .icon(let image):
            switch style {
            case .yellow:
                setImage(image?.withTintColor(.themeDark), for: .normal)
                setImage(image?.withTintColor(.themeDark), for: .highlighted)
                setImage(image?.withTintColor(.themeGray50), for: .disabled)
            case .black:
                setImage(image?.withTintColor(.themeDark), for: .normal)
                setImage(image?.withTintColor(.themeDark), for: .highlighted)
                setImage(image?.withTintColor(.themeGray50), for: .disabled)
            case .red, .gray:
                setImage(image?.withTintColor(.themeClaude), for: .normal)
                setImage(image?.withTintColor(.themeClaude), for: .highlighted)
                setImage(image?.withTintColor(.themeGray50), for: .disabled)
            case .transparent:
                setImage(image?.withTintColor(.themeLeah), for: .normal)
                setImage(image?.withTintColor(.themeGray), for: .highlighted)
                setImage(image?.withTintColor(.themeGray50), for: .disabled)
            case .lightCyan:
                setImage(image?.withTintColor(.themeDark), for: .normal)
                setImage(image?.withTintColor(.themeDark), for: .highlighted)
                setImage(image?.withTintColor(.themeGray50), for: .disabled)
            case .blackYellow:
                setImage(image?.withTintColor(.themeYellowDark), for: .normal)
                setImage(image?.withTintColor(.themeYellowDark), for: .highlighted)
                setImage(image?.withTintColor(.themeGray50), for: .disabled)
            }

            let verticalPadding = (height - CGFloat.iconSize24) / 2
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: Self.imageMargin)
            contentEdgeInsets = UIEdgeInsets(top: verticalPadding, left: Self.leftPaddingWithImage, bottom: verticalPadding, right: Self.rightPaddingWithImage)

            spinner.isHidden = true
            spinner.stopAnimating()
        case .noTintIcon(let image):
            setImage(image, for: .normal)
            setImage(image, for: .highlighted)
            setImage(image, for: .disabled)
            let verticalPadding = (height - CGFloat.iconSize24) / 2
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: Self.imageMargin)
            contentEdgeInsets = UIEdgeInsets(top: verticalPadding, left: Self.leftPaddingWithImage, bottom: verticalPadding, right: Self.rightPaddingWithImage)

            spinner.isHidden = true
            spinner.stopAnimating()
        case .spinner:
            setImage(nil, for: .normal)
            setImage(nil, for: .highlighted)
            setImage(nil, for: .disabled)

            imageEdgeInsets = .zero
            contentEdgeInsets = UIEdgeInsets(top: 0, left: Self.leftPaddingWithImage + .iconSize24 + Self.imageMargin, bottom: 0, right: Self.rightPaddingWithImage)

            spinner.isHidden = false
            spinner.startAnimating()
        case .none:
            setImage(nil, for: .normal)
            setImage(nil, for: .highlighted)
            setImage(nil, for: .disabled)

            imageEdgeInsets = .zero
            contentEdgeInsets = UIEdgeInsets(top: 0, left: Self.horizontalPadding, bottom: 0, right: Self.horizontalPadding)

            spinner.isHidden = true
            spinner.stopAnimating()
        }
    }

    public enum Style {
        case yellow
        case black
        case red
        case gray
        case transparent
        case lightCyan
        case blackYellow
    }

    public enum AccessoryType {
        case icon(image: UIImage?)
        case noTintIcon(image: UIImage?)
        case spinner
        case none
    }

}
