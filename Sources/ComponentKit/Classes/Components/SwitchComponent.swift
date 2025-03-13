import UIKit
import SnapKit

public class SwitchComponent: UIView {
    public let switchView = UISwitch()

    public var thumbTintColor : UIColor? = nil
    
    public var onSwitch: ((Bool) -> ())?
    
    public var blockSwitch: ((UISwitch) -> ())?

    override public init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(switchView)
        switchView.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview()
            maker.centerY.equalToSuperview()
        }

        switchView.setContentCompressionResistancePriority(.required, for: .horizontal)
        switchView.setContentHuggingPriority(.required, for: .horizontal)
        switchView.tintColor = .themeSteel20
//        switchView.onTintColor = .themeYellowD
        switchView.onTintColor = .themeBlack
        if (thumbTintColor != nil) {
            switchView.thumbTintColor = thumbTintColor
        }
        
        switchView.addTarget(self, action: #selector(onToggle), for: .valueChanged)
        
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func onToggle() {
        if (thumbTintColor != nil) {
            switchView.thumbTintColor = thumbTintColor
        }
        onSwitch?(switchView.isOn)
        blockSwitch?(switchView)
    }

}
