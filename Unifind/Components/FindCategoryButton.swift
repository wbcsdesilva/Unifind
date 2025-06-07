import SwiftUI

/// A tappable “card” that:
///  • Has a fixed‐width left column, within which the icon+title are centered
///  • Always draws the divider in exactly the same spot
///  • Shows a left‐aligned, multi-line description on the right
struct FindCategoryButton: View {
    // MARK: – Public API
    
    /// SF Symbol name (e.g. “person.3.fill”)
    let iconName: String
    
    /// Title under the icon (e.g. “Lecturers”)
    let title: String
    
    /// Right-hand description text (left-aligned)
    let descriptionText: String
    
    /// Callback when the user taps this card
    let action: () -> Void
    
    
    // MARK: – Internal Constants
    
    /// The total width (in points) of the **entire left column**
    /// (including any padding). Because this is “fixed,” the divider can
    /// always live at the same X-offset, no matter how long/short the description is.
    private let leftColumnWidth: CGFloat = 116
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                
                // ─── 1) LEFT COLUMN: Centered Icon + Title ────────────
                VStack(spacing: 8) {
                    Image(systemName: iconName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.black)
                    
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.black)
                }
                // Force this VStack to occupy exactly `leftColumnWidth` points,
                // and center its contents horizontally and vertically:
                .frame(width: leftColumnWidth, alignment: .center)
                .padding(.vertical, 12)
                
                // ─── 3) RIGHT COLUMN: Left-aligned Description ─────────
                Text(descriptionText)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    // push text in from border by 16 points:
                    .padding(.vertical, 12)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    // overlay a 1-point rectangle on the left edge:
                    .overlay(
                        Rectangle()
                            .frame(width: 1)
                            .foregroundColor(Color.gray.opacity(0.4))
                            // match the same vertical insets as the Text’s vertical padding
                            .padding(.vertical, 12),
                        alignment: .leading
                    )
                    // push the entire Text block 12 points away from the left column
                    .padding(.leading, 12)
            }
            // ─── 4) CARD BACKGROUND + CORNERS ──────────────────────
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color(.systemGray6))
            )
        }
        // Use a plain style so SwiftUI doesn’t override our custom background:
        .buttonStyle(.plain)
        // Fill horizontal space of parent container:
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
}


/// A live preview showing how the left column’s contents stay perfectly centered,
/// and how the divider never moves—no matter how long the right-hand text is.
#Preview {
    VStack(spacing: 16) {
        FindCategoryButton(
            iconName: "person.3.fill",
            title: "Lecturers",
            descriptionText: "Find any lecturer that is teaching in the university",
            action: { print("Tapped Lecturers") }
        )
        
        FindCategoryButton(
            iconName: "book.closed.fill",
            title: "Library",
            descriptionText: """
                Browse and reserve books or journals from all academic departments across campus. Hames james jmaes jamse jeamsasf asdfasf asdfasfasdf asdfasf .
                """,
            action: { }
        )
        
        // A very short description to prove the divider still stays in place:
        FindCategoryButton(
            iconName: "star.fill",
            title: "Favorites",
            descriptionText: "Find everything you have marked as favorites",
            action: { }
        )
    }
    // Remove any horizontal padding so these cards truly “touch” the screen’s edges:
    .padding(.horizontal, 0)
    .background(Color.white.ignoresSafeArea())
}
