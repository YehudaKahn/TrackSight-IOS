import SwiftUI

struct ContentView: View {
    @State private var count = 0

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

            PassthroughOverlay()
                .allowsHitTesting(false)
        }
    }
}

private struct PassthroughOverlay: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.ultraThinMaterial.opacity(0.18))
                .ignoresSafeArea()

            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Color.cyan.opacity(0.22),
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
