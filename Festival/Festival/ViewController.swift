//
//  ViewController.swift
//  Festival
//
//  Created by 해피스마일 on 2022/08/08.
//

import UIKit

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)
import Alamofire
import Foundation


// MARK: - Welcome
struct News: Codable {
    let lastBuildDate: String
    let total, start, display: Int
    let items: [NewsItem]
}
// MARK: - Item
struct NewsItem: Codable {
    let title: String
    let originallink, link: String
    let itemDescription, pubDate: String
    enum CodingKeys: String, CodingKey {
        case title, originallink, link
        case itemDescription = "description"
        case pubDate
    }
}



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
  let addr1, addr2, booktour: String
  let cat1: Cat1
  let cat2: Cat2
  let cat3: Cat3
  let contentid, contenttypeid, createdtime, eventstartdate: String
  let eventenddate: String
  let firstimage, firstimage2: String
  let mapx, mapy, mlevel, modifiedtime: String
  let readcount: Int
  let areacode, sigungucode, tel, title: String
}
enum Cat1: String, Codable {
  case a02 = "A02"
}
enum Cat2: String, Codable {
  case a0207 = "A0207"
  case a0208 = "A0208"
  case a0209 = "A0209"
}
enum Cat3: String, Codable {
  case a02070200 = "A02070200"
  case a02080100 = "A02080100"
  case a02080300 = "A02080300"
  case a02080600 = "A02080600"
  case a02080700 = "A02080700"
  case a02081300 = "A02081300"
  case a02090100 = "A02090100"
}
// MARK: - Header
struct Header: Codable {
  let resultCode, resultMsg: String
}


extension UIImageView {
    func downloadImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }.resume()
    }
}
extension String {
    func toDate() -> Date? { //"yyyy-MM-dd HH:mm:ss"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return nil
        }
    }
}

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter.string(from: self)
    }
}


class ViewController: UIViewController {

    @IBOutlet weak var festivalTableView: UITableView!
    @IBOutlet weak var indicatorImageView: UIImageView!
    
    var itemArray: [Item] = []
    var pageNo: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        festivalTableView.dataSource = self
        festivalTableView.delegate = self
        
        requestFestivalInfo()
        requestNewsInfo()
    }
    
    func requestFestivalInfo() {
        let urlString = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?serviceKey=qb0ZRJaz%2BrWtbR31BbXfYfRCNfdRzM1UBPkVkzvBL1Ane5kyD%2BN1c4S3qP7JPtlr09id3xxIK5m9ymuSrxu2XA%3D%3D&numOfRows=20&MobileOS=IOS&MobileApp=Festival&pageNo=\(pageNo)&arrange=A&eventStartDate=20220601&_type=json"
        
        let url = URL(string: urlString)
        let req = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: req) { data, response, error in
            if let data = data,
               let info = try? JSONDecoder().decode(Welcome.self, from: data)
            {
                print(info.response.body.items.item[1].title)
                self.itemArray.append(contentsOf: info.response.body.items.item)
                
                DispatchQueue.main.async {
                    self.festivalTableView.reloadData()
                }
            }
        }
        task.resume()
    }
    
    func getAnimationImageArray() -> [UIImage] {
        var loadingImageArray: [UIImage] = []
        loadingImageArray.append(UIImage(named: "iconLoading1")!)
        loadingImageArray.append(UIImage(named: "iconLoading2")!)
        loadingImageArray.append(UIImage(named: "iconLoading3")!)
        loadingImageArray.append(UIImage(named: "iconLoading4")!)
        loadingImageArray.append(UIImage(named: "iconLoading5")!)
        loadingImageArray.append(UIImage(named: "iconLoading6")!)
        loadingImageArray.append(UIImage(named: "iconLoading7")!)
        return loadingImageArray
    }

    func startLoading(){
        indicatorImageView.animationImages = getAnimationImageArray()
        indicatorImageView.animationDuration = 1
        indicatorImageView.startAnimating()
    }

    func stopLoading(){
        if indicatorImageView.isAnimating {
            indicatorImageView.stopAnimating()
        }
    }
    func getPeriodDate(startDate:String, endDate:String) -> String{
        let festivalStartDate = startDate.toDate()?.toString()
        let festivalEndDate = endDate.toDate()?.toString()

        let periodString = "\(festivalStartDate!) ~ \(festivalEndDate!)"

        return periodString
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailViewController,
           let cell = sender as? UITableViewCell{
            
            let index = self.festivalTableView.indexPath(for: cell)
            detailVC.titleStr = itemArray[index!.row].title
            detailVC.contentId = itemArray[index!.row].contentid
            
            let period = getPeriodDate(startDate: itemArray[index!.row].eventstartdate, endDate: itemArray[index!.row].eventenddate)
            detailVC.periodStr = period
            detailVC.imageUrlStr = itemArray[index!.row].firstimage2
            detailVC.addrStr = itemArray[index!.row].addr1
            detailVC.mapXStr = itemArray[index!.row].mapx
            detailVC.mapYStr = itemArray[index!.row].mapy
        }
    }
    
    func requestNewsInfo() {
        let params = [
          "query": "애플"
        ]
        let headers: HTTPHeaders = [
          "X-Naver-Client-Id": "rPcfh7uUlCXnWdok42vC",
          "X-Naver-Client-Secret": "T8ROu2Pu6F"
        ]
        AF.request("https://openapi.naver.com/v1/search/news.json", parameters: params, headers: headers).responseDecodable(of: News.self) { response in
          print(response.value?.items ?? [])
        }
      }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FestivalCell",
                                                    for: indexPath) as? FestivalCell {
            let imageUrlString = itemArray[indexPath.row].firstimage
            cell.festivalImageView.downloadImage(urlString: imageUrlString)
            cell.festivalTitleLabel.text = itemArray[indexPath.row].title
            
            let period = getPeriodDate(startDate: itemArray[indexPath.row].eventstartdate, endDate: itemArray[indexPath.row].eventenddate)


            cell.festivalPeriodLabel.text = period
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == itemArray.count - 1 {
            pageNo += 1
            requestFestivalInfo()
        }
    }
}
