# FFWheelView
循环轮播
使用三个试图实现轮播循环功能，支持自定义轮播试图
## 安装
```bash
pod FFWheelView
```
### 使用

需实现 FFWheelViewDataSources 协议:
```Swift
    func wheel(_ numberInWheelView:FFWheelView) -> Int
    func wheel(_ itemInWheelView:FFWheelView,forIndex index:Int) -> FFWheelImageItemView
    func wheel(_ itemInWheelView:FFWheelView,dataToItem item:FFWheelImageItemView,forIndex index:Int)
		
  eg:
extension ViewController:FFWheelViewDataSources{
    
    func wheel(_ numberInWheelView: FFWheelView) -> Int {
        
        return dataSources.count
    }
    func wheel(_ itemInWheelView: FFWheelView, dataToItem item: FFWheelImageItemView, forIndex index: Int) {
        
        item.imageView.image = UIImage(named: dataSources[index])
        (item as?FFCustomItemView)?.title.text = "哈哈哈==\(index)"
    }
    
    func wheel(_ itemInWheelView: FFWheelView, forIndex index: Int) -> FFWheelImageItemView {
        
          let item = FFCustomItemView()
          item.imageView.image = UIImage(named: dataSources[index])
          item.title.text = "哈哈哈==\(index)"
          return item
        
    }
}
extension ViewController:FFWheelViewDelegate{
    
    func wheel(_ wheelView: FFWheelView, selectItem item: FFWheelImageItemView, selectIndex index: Int) {
        
        print("点击了==\(index)")
    }
}
```
### 自定义试图
```bash
需要继承 FFWheelImageItemView
```
