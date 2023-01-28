import 'package:flutter/material.dart';
import 'package:task_3/product.dart';
//Products :-
List<Product> DataBase = [
  new Product("HP ZBook 15 G3","11,800","CPU : Corei7-6820HQ\nMemory : 16 GB Ram\nStorage : 512 GB-SSD\nGPU : Nvidia M1000","Images/HP.jpg"),
  new Product("Lenovo IdeaPad Gaming 3","30,000","CPU : AMD Ryzen™ 7 4800H mobile processor\nMemory : Up to 32 GB DDR4 3200MHz\nStorage : M.2 PCIe SSD: Up to 1TB\nGPU : NVIDIA® GeForce® GTX 1650 Ti; 4GB","Images/LENOVO.jpg"),
  new Product("Infinix X612B","3,333","Storage : 32 GB storage, microSDXC\nMemory : 2 GB Ram\nResolution : 720 x 1560\nCamera : 8 MP\nBattery : 5000 mAh","Images/INFINIX.jpg"),
  new Product("Oppo Reno Z6","11,999","Storage : 128 GB/256 GB storage\nMemory : 8 GB Ram\nResolution : 1080 x 2400\nCamera : 64 MP\nBattery : 4310 mAh","Images/OPPO.png"),
  new Product("LG Monitor","6,000","Size : 24 inches\nResolution : 1920 x 1080\nRate : 165 HZ\nHDMI Port\nUSB Port","Images/LG.jpg"),
  new Product("Play Station 5","25,000","CPU : 3.5GHz, 8-core AMD Zen 2\nGPU : 10.3 teraflop RDNA 2 GPU\nRAM : 16GB GDDR6\nStorage : 1 TB\nSize: 15.4 x 10.2 x 4.1 inches","Images/PS5.jpg"),
];
void main() {
  runApp(MaterialApp(home:ShoppersPage()));
}

class ShoppersPage extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("SHOPPERS",style: TextStyle(color: Colors.black)),backgroundColor: Colors.amberAccent),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(6, (index) {
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              margin: EdgeInsets.all(10),
              child: ElevatedButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>DetailsPage(index: index)));
              },
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amberAccent),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)))),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(image: AssetImage(DataBase[index].Asseturl.toString()),fit: BoxFit.fitHeight),
                    Text(DataBase[index].Name.toString(),style: TextStyle(color: Colors.black)),
                    Text("Price : "+DataBase[index].Price.toString()+" EGP",style: TextStyle(color: Colors.red))
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget
{
  final int index ;
  const DetailsPage({Key? key , required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(backgroundColor: Colors.amberAccent,title: Text("Details Page"),leading: IconButton(icon: Icon(Icons.arrow_back),onPressed:(){
          Navigator.pop(context);}),),
        body: Center(
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(image: AssetImage(DataBase[index].Asseturl.toString()),fit: BoxFit.fitHeight),
                    Text("Product",textScaleFactor: 1.5,style: TextStyle(color: Colors.deepOrange)),
                    Text(DataBase[index].Name.toString(),textScaleFactor: 1,),
                    Text("\n",textScaleFactor: 1,),
                    Text("Price",textScaleFactor: 1.5,style: TextStyle(color: Colors.deepOrange)),
                    Text(DataBase[index].Price.toString()+" EGP",textScaleFactor: 1,),
                    Text("\n",textScaleFactor: 1,),
                    Text("More Details",textScaleFactor: 1.5,style: TextStyle(color: Colors.deepOrange)),
                    Text(DataBase[index].Description.toString(),textScaleFactor: 1,),
                  ],
                )
            )
        )
    );
  }

}