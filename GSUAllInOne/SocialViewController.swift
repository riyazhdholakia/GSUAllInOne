//
//  SocialViewController.swift
//  GSUAllInOne
//
//  Created by Riyazh Dholakia on 10/6/18.
//  Copyright © 2018 Riyazh Dholakia. All rights reserved.
//

import UIKit
import SCSDKLoginKit
import SCSDKCreativeKit
import CoreLocation

class SocialViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, CLLocationManagerDelegate {
    
    var imageUpload = UIImage.self
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    
    func sendSnapchat(photo: UIImage) {
        let snapPhoto = SCSDKSnapPhoto(image: photo)
        let snap = SCSDKPhotoSnapContent(snapPhoto: snapPhoto)
        // snap.sticker = /* Optional, add a sticker to the Snap */
        // snap.caption = /* Optional, add a caption to the Snap */
        // snap.attachmentUrl = /* Optional, add a link to the Snap */
        let api = SCSDKSnapAPI(content: snap)
        api.startSnapping { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                // Successfully shared content to Snapchat!
            }
        }
    }
    
    func send() {
        let img = createMapImage()
        let sticker = SCSDKSnapSticker(stickerImage: img)
        let snap = SCSDKNoSnapContent()
        snap.sticker = sticker
        snap.attachmentUrl = "https://developer.here.com"
        
        let api = SCSDKSnapAPI(content: snap)
        api.startSnapping { (error) in }
    }
    
    func createMapImage() -> UIImage {
        struct here {
            static var id = "H0Q6AfofIxkwATr3e3AQ"
            static var code = "QJpQWDRWxTCurQP5ZIQSkg"
        }
        
        let lat = locationManager.location!.coordinate.latitude
        let long = locationManager.location!.coordinate.longitude
        
        //Map Image API parameters
        let zoom = 14 //Zoom level
        let quality = 100 //Image quality
        let markerType = 1 //Marker type
        let mapStyle = 5 //Map style, currently set to normal day grey
        let endpoint = URL(string: "https://image.maps.api.here.com/mia/1.6/mapview?app_id=\(here.id)&app_code=\(here.code)&poi=\(lat),\(long)&z=\(zoom)&q=\(quality)&poithm=\(markerType)&t=\(mapStyle)")
        let response = try? Data(contentsOf: endpoint!)
        let mapImage = UIImage(data: response!)
        return mapImage!
    }
//    func albumOrCameraAction(source: UIImagePickerController.SourceType) {
//        let imagePickerVC = UIImagePickerController()
//        imagePickerVC.delegate = self
//        imagePickerVC.sourceType = source
//        present(imagePickerVC, animated: true, completion: nil)
//    }
    
    @IBAction func addPhotoToSnapChatPressed(_ sender: Any) {
        //albumOrCameraAction(source: .savedPhotosAlbum)
        //sendSnapchat(photo: self.imageUpload)
        send()
    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : UIImage]) {
//        if var image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            imageUpload = image
//        }
//        picker.dismiss(animated: true, completion: nil)
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            image = image
//        }
//        picker.dismiss(animated: true, completion: nil)
//    }
    
    @IBAction func onSnapChatPressed(_ sender: Any) {
        SCSDKLoginClient.login(from: self) { success, error in
            if let error = error {
                // An error occurred during the login process
                print(error.localizedDescription)
            } else {
                // The login was a success! This user is now
                // authenticated with Snapchat!
                //sendSnapchat(photo: UIImage)
            }
        }
    }
    
}
