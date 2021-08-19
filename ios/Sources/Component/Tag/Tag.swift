import Model
import SwiftUI
import Styleguide

public struct Tag: View {
    private let type: Media
    private let tapAction: () -> Void

    public init(
        type: Media,
        tapAction: @escaping () -> Void
    ) {
        self.type = type
        self.tapAction = tapAction
    }

    public var body: some View {
        Text(type.title)
            .font(.caption)
            .foregroundColor(AssetColor.Base.white.color)
            .padding(.vertical, 4)
            .padding(.horizontal, 12)
            .background(type.backgroundColor)
            .clipShape(
                CutCornerRectangle(
                    targetCorners: [.topLeft, .bottomRight],
                    radius: 8
                )
            )
            .minimumScaleFactor(0.1)
    }
}

public struct Tag_Previews: PreviewProvider {
    public static var previews: some View {
        Group {
            ForEach(Media.allCases, id: \.self) { type in
                Tag(type: type, tapAction: {})
                    .frame(width: 103, height: 24)
                    .environment(\.colorScheme, .light)
            }

            ForEach(Media.allCases, id: \.self) { type in
                Tag(type: type, tapAction: {})
                    .frame(width: 103, height: 24)
                    .environment(\.colorScheme, .dark)
            }
        }
        .previewLayout(.sizeThatFits)
    }
}

private extension Media {
    var title: String {
        switch self {
        case .droidKaigiFm:
            return L10n.Component.Tag.droidKaigiFm
        case .medium:
            return L10n.Component.Tag.medium
        case .youtube:
            return L10n.Component.Tag.youtube
        case .other:
            return L10n.Component.Tag.other
        }
    }

    var backgroundColor: Color {
        switch self {
        case .droidKaigiFm:
            return AssetColor.secondary.color
        case .medium:
            return AssetColor.Tag.medium.color
        case .youtube:
            return AssetColor.Tag.video.color
        case .other:
            return AssetColor.Tag.other.color
        }
    }
}
