//
//  CameraViewController.swift
//  Instagram
//
//  Created by Greg Garman on 10/2/21.
//

import UIKit
import AlamofireImage
import Parse

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    

    @IBOutlet weak var IVpost: UIImageView!
    
    
    @IBOutlet weak var TFpost: UITextField!
    
    @IBAction func btnSubmit(_ sender: Any) {
        let post=PFObject(className:"Posts")
        post["author"]=PFUser.current()!
        post["caption"]=TFpost.text
        
        let imagedata=IVpost.image!.pngData()
        let file=PFFileObject(name: "image.png", data: imagedata!)
        
        post["image"]=file
      
        post.saveInBackground { success, Error in
            if success{
                self.dismiss(animated: true, completion: nil)
            }
            else{
                print("failed to save post")
            }
        }
        
    }
    
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker=UIImagePickerController()
        picker.delegate=self
        picker.allowsEditing=true
        print("clicking")
    
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
            
        }
        else{
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image=info[.editedImage] as! UIImage
        
        let size=CGSize(width: 300, height: 300)
        let scaledimage=image.af_imageScaled(to: size)
        
        IVpost.image=scaledimage
        
        dismiss(animated: true, completion: nil)
    }
    
    
}
