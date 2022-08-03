import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    var movieInfoArray:[[String: Any]] = []
    var isPaging: Bool = false
    var hasNextPage: Bool = false
    var page = 1;
    
    @IBOutlet weak var movieTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTableView.dataSource = self
        movieTableView.delegate = self
        loadPage(page: page)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = self.movieTableView.indexPath(for: cell)
        
        if let detailVC = segue.destination as? DetailViewController {
            detailVC.prepareUrl = movieInfoArray[indexPath!.row]["linkUrl"] as? String
        }
    }

    func loadPage(page: Int){
        let requestUrlString:String = "http://115.68.183.178:2029/hoppin/movies?order=releasedateasc&count=10&page=\(page)&version=1&genreId="
        let url = URL.init(string: requestUrlString)
        
        let urlReq = URLRequest.init(url: url!)
        let task = URLSession.shared.dataTask(with: urlReq) { data, response, error in
            if let data = data,
               let dic = try? JSONSerialization.jsonObject(with: data) as? [String:Any],
               let hoppin = dic["hoppin"] as? [String:Any],
               let movies = hoppin["movies"] as? [String:Any],
               let movieArray = movies["movie"] as? [[String: Any]]
            {
                self.movieInfoArray.append(contentsOf: movieArray)
                for movie in self.movieInfoArray{
                    print(movie["title"] ?? "")
                }
                // 테이블 뷰 갱신 tableView func 호출
                DispatchQueue.main.async {
                    self.movieTableView.reloadData()
                }
            }
        }
        task.resume()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func isLastestRow(row: Int) -> Bool {
        print(row)
        return (row == movieTableView.numberOfRows(inSection: 0) - 2)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell {
            /* cell 구성 */
            let movieDic = movieInfoArray[indexPath.row]
            let thumbUrl = movieDic["thumbnailImage"] as? String
            
//            if let url = URL(string: thumbUrl ?? ""){
//                URLSession.shared.dataTask(with: url) { data, response, error in
//                    if let data = data{
//                        DispatchQueue.main.async {
//                            cell.thumbnailImage?.image = UIImage(data: data)
//                        }
//                    }
//                }.resume()
//            }
            cell.titleLabel.text = "\(movieDic["title"] ?? (Any).self )"
            cell.genreNamesLabel.text = "\(movieDic["genreNames"] ?? (Any).self )"
            cell.ratingAverageLabel.text = "\(movieDic["ratingAverage"] ?? (Any).self )"
            cell.thumbnailImage.kf.setImage(with: URL(string: thumbUrl ?? ""))
            // Paging
            if isLastestRow(row: indexPath.row) {
                page = page+1
                
                movieTableView.reloadData()
                
                loadPage(page: page)
            }
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 200
    }
}

extension UIImageView{
    func downLoadImage(url: String){
        let url = URL(string: url)
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url!) {
                if let image = UIImage(data: data) {
                    
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
