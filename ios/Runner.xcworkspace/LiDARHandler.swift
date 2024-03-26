import ARKit
import Flutter

class LiDARHandler: NSObject, ARSessionDelegate {
    private var arSession: ARSession?
    private var lastResult: FlutterResult?

    override init() {
        super.init()
        arSession = ARSession()
        arSession?.delegate = self
    }

    func startLiDARSession(result: @escaping FlutterResult) {
        // Ensure LiDAR is available
        guard ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) else {
            result(FlutterError(code: "UNAVAILABLE", message: "LiDAR not available on this device", details: nil))
            return
        }

        // Configure ARSession for scene reconstruction
        let configuration = ARWorldTrackingConfiguration()
        configuration.sceneReconstruction = .mesh
        arSession?.run(configuration)

        lastResult = result
    }

    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        // Example: Count the number of mesh anchors, indicating parts of the scene reconstructed using LiDAR
        let meshAnchors = anchors.compactMap { $0 as? ARMeshAnchor }
        lastResult?("Mesh anchors detected: \(meshAnchors.count)")
    }

    func stopLiDARSession() {
        arSession?.pause()
    }
}
