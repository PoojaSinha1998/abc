class StoreData{
  StoreData._privateConstructor();
static final StoreData _instance = StoreData._privateConstructor();
Map<String, int> _foodNamePrice = new Map();

factory StoreData(){
  return _instance;
}
  void storeFoodDetail(String foodName, int foodPrice){
    _foodNamePrice[foodName]=foodPrice;
  }

  void removeFoodItem(String foodName){
    _foodNamePrice.remove(foodName);

  }

  Map<String, int> retriveData(){
  return _foodNamePrice;
  }
}