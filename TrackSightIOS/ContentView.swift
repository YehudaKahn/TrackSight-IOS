import SwiftUI

struct ContentView: View {
    @State private var count = 0
    @State private var isOverlayVisible = true

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.05, green: 0.11, blue: 0.17),
                    Color(red: 0.09, green: 0.18, blue: 0.27)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 24) {
                Text("TrackSight iOS")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)

                Text("Count: \(count)")
                    .font(.title2.weight(.semibold))
                    .foregroundStyle(.white.opacity(0.92))

                Toggle(isOn: $isOverlayVisible) {
                    Text("Show overlay")
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(.white.opacity(0.9))
                }
                .toggleStyle(.switch)
                .padding(.horizontal, 18)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(Color.white.opacity(0.10))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Color.white.opacity(0.14), lineWidth: 1)
                )

                Button {
                    count += 1
                } label: {
                    Text("Increment")
                        .font(.headline.weight(.semibold))
                        .foregroundStyle(Color.white)
                        .padding(.horizontal, 28)
                        .padding(.vertical, 16)
                        .background(
                            Capsule()
                                .fill(Color.white.opacity(0.16))
                        )
                        .overlay(
                            Capsule()
                                .stroke(Color.white.opacity(0.22), lineWidth: 1)
                        )
                }
                .buttonStyle(.plain)
            }
            .padding(32)

            if isOverlayVisible {
                PassthroughOverlay()
                    .allowsHitTesting(false)
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.2), value: isOverlayVisible)
    }
}

private struct PassthroughOverlay: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.cyan.opacity(0.16))
                .ignoresSafeArea()

            Rectangle()
                .fill(.ultraThinMaterial.opacity(0.55))
                .ignoresSafeArea()

            LinearGradient(
                colors: [
                    Color.clear,
                    Color.white.opacity(0.06),
                    Color.clear
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Color.cyan.opacity(0.32),
                            Color.clear
                        ],
                        center: .center,
                        startRadius: 12,
                        endRadius: 220
                    )
                )
                .frame(width: 320, height: 320)
                .offset(x: 110, y: -260)
                .blur(radius: 10)

            VStack {
                HStack {
                    Text("Overlay active")
                        .font(.caption.weight(.bold))
                        .foregroundStyle(.white.opacity(0.88))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(
                            Capsule()
                                .fill(Color.black.opacity(0.26))
                        )
                        .overlay(
                            Capsule()
                                .stroke(Color.white.opacity(0.16), lineWidth: 1)
                        )

                    Spacer()
                }

                Spacer()
            }
                .padding()

            RoundedRectangle(cornerRadius: 36, style: .continuous)
                .stroke(Color.white.opacity(0.18), lineWidth: 1)
                .padding(20)
        }
        .accessibilityHidden(true)
    }
}

#Preview {
    ContentView()
}
