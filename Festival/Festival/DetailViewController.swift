//
//  DetailViewController.swift
//  Festival
//
//  Created by rentalhub-16pro on 2022/08/09.
//

import UIKit
import MapKit
import WebKit

class DetailViewController: UIViewController, CLLocationManagerDelegate, WKNavigationDelegate {
    // MARK: - Welcome
    struct Welcome: Codable {
        let response: Response
    }

    // MARK: - Response
    struct Response: Codable {
        let header: Header
        let body: Body
    }

    // MARK: - Body
    struct Body: Codable {
        let items: Items
        let numOfRows, pageNo, totalCount: Int
    }

    // MARK: - Items
    struct Items: Codable {
        let item: [Item]
    }

    // MARK: - Item
    struct Item: Codable {
        let contentid, contenttypeid, title, createdtime: String
        let modifiedtime, tel, telname, homepage: String
        let booktour: String
        let firstimage, firstimage2: String
        let addr1, addr2, zipcode, mapx: String
        let mapy, mlevel, overview: String
    }

    // MARK: - Header
    struct Header: Codable {
        let resultCode, resultMsg: String
    }


    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailPeriodLabel: UILabel!
    @IBOutlet weak var detailAdressLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailScrollView: UIScrollView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var ovewviewLabel: UILabel!
    var contentId = ""
    var titleStr:String = ""
    var periodStr:String = ""
    var imageUrlStr:String = ""
    var addrStr:String = ""
    var locationManager:CLLocationManager!
    var itemArray: [Item] = []
    var mapXStr:String = ""
    var mapYStr:String = ""
    var homepageUrl:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 상세페이지Label
        detailTitleLabel.text = titleStr
        detailPeriodLabel.text = periodStr
        detailAdressLabel.text = addrStr
        
        // 상세이미지
        detailImageView.downloadImage(urlString: imageUrlStr)
        
        // 상세페이지 req
        requestDetailInfo()
        
        // 지도
        loadLocation()
        
        // 네비게이션바
        navigationController?.navigationBar.topItem?.title = ""
        
    }
    func requestDetailInfo(){
        let urlString = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?MobileOS=IOS&MobileApp=EnjoyFestival&ServiceKey=qb0ZRJaz%2BrWtbR31BbXfYfRCNfdRzM1UBPkVkzvBL1Ane5kyD%2BN1c4S3qP7JPtlr09id3xxIK5m9ymuSrxu2XA%3D%3D&contentId=\(contentId)&firstImageYN=Y&addrinfoYN=Y&defaultYN=Y&mapinfoYN=Y&overviewYN=Y&_type=json"
        
        let url = URL(string: urlString)
        let req = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: req) { data, response, error in
            if let data = data,
               let info = try?JSONDecoder().decode(Welcome.self, from: data){
                self.itemArray.append(contentsOf: info.response.body.items.item)
                
                DispatchQueue.main.async {
                    self.ovewviewLabel.text = self.itemArray[0].overview.replacingOccurrences(of: "<br>", with: "\n")
                    
                    
                    
                    let home = self.itemArray[0].homepage
                    let originArr = home.split(separator: "\"") // 큰따옴표 기준 split
                    var newArr = [String]()
                    for url in originArr {
                        newArr.append(url.replacingOccurrences(of: "\"", with: "").trimmingCharacters(in: .whitespaces)) // trim
                    }
                    // http or https 찾기
                    for url in newArr {
                        if(url.contains("https") || url.contains("http")){
                            self.homepageUrl = url
                            break
                        }
                    }
                    print(newArr)
                    print("\n\n\n\n")
                    print("@@ 찾은 URL : \(self.homepageUrl)")
                    print("@@ 컨텐츠ID : \(self.contentId)")
                    print("\n\n\n\n")
                }
            }
        }
        task.resume()
        
    }
    
    func loadLocation(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        let coord = CLLocationCoordinate2D.init(latitude: Double(mapYStr)!, longitude: Double(mapXStr)!)
        updateRegion(coord: coord)
        updatePin(coord: coord)
        mapView.showsUserLocation = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        updateRegion(coord: location.coordinate)
        updatePin(coord: location.coordinate)
        locationManager.stopUpdatingLocation()
        
        
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            if let error = error{
                return
            }
        }
    }
    func updateRegion(coord: CLLocationCoordinate2D){
        let span = MKCoordinateSpan.init(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        let region = MKCoordinateRegion.init(center: coord, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func updatePin(coord: CLLocationCoordinate2D){
        let pin = MKPointAnnotation()
        pin.coordinate = coord
        mapView.addAnnotation(pin)
    }
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let homepageVC = segue.destination as? HomepageViewController{
            homepageVC.homepageUrl = self.homepageUrl
        }
    }
    
    
}
extension DetailViewController {
    
}
