//
//  ContentView.swift
//  toko sepeda online
//
//  Created by Admin on 02/02/21.
//

import SwiftUI

struct ProductModel : Identifiable {
    let id : Int
    let namaProduct : String
    let fotoProduct : String
    let hargaProduct : Int
    let lokasi : String
    let ratingCount : Int
    let jumlahRating : Int
    
    init(id: Int, namaProduct: String, fotoProduct: String, hargaProduct: Int, lokasi: String, ratingCount: Int, jumlahRating: Int) {
        
        self.id = id
        self.namaProduct = namaProduct
        self.hargaProduct = hargaProduct
        self.fotoProduct = fotoProduct
        self.lokasi = lokasi
        self.ratingCount = ratingCount
        self.jumlahRating = jumlahRating
    }
    
}

struct ContentView: View {
    
    let data : [ProductModel] = [ProductModel(id: 1, namaProduct: "Polygon Xtrada", fotoProduct: "g1", hargaProduct: 2000000, lokasi: "Jakarta Selatan", ratingCount: 4, jumlahRating: 69),
                                 ProductModel(id: 2, namaProduct: "Polygon Ktrada", fotoProduct: "g2", hargaProduct: 2700000, lokasi: "Jakarta Timur", ratingCount: 4, jumlahRating: 69),
                                 ProductModel(id: 3, namaProduct: "Polygon Qtrada", fotoProduct: "g3", hargaProduct: 1200000, lokasi: "Jakarta Utara", ratingCount: 4, jumlahRating: 69),
                                 ProductModel(id: 4, namaProduct: "Polygon Vtrada", fotoProduct: "g4", hargaProduct: 3400000, lokasi: "Jakarta Barat", ratingCount: 4, jumlahRating: 69),
                                 ProductModel(id: 5, namaProduct: "Polygon Strada", fotoProduct: "g5", hargaProduct: 2300000, lokasi: "Jakarta Pusat", ratingCount: 4, jumlahRating: 69),
                                 ProductModel(id: 6, namaProduct: "Polygon Utrada", fotoProduct: "g6", hargaProduct: 2600000, lokasi: "Jakarta Timur", ratingCount: 4, jumlahRating: 69),
                                 ProductModel(id: 7, namaProduct: "Polygon Rtrada", fotoProduct: "g7", hargaProduct: 1900000, lokasi: "Jakarta Pusat", ratingCount: 4, jumlahRating: 69),
                                 ProductModel(id: 8, namaProduct: "Polygon Wtrada", fotoProduct: "g8", hargaProduct: 3900000, lokasi: "Jakarta Utara", ratingCount: 4, jumlahRating: 69)]
    
    
    //@state and @Binding
    @State var jumlahKeranjang : Int = 0
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(data) { row in
                    VStack(spacing: 10){
                        Product(jumlahProduct: self.$jumlahKeranjang, data : row)
                    }
                    .padding()
                }
            }.navigationBarTitle("Bicycle")
            .navigationBarItems(trailing:
                                    HStack{
                                        Button(action: {print()}){
                                            Image(systemName: "person.fill")
                                        }
                                        keranjangView(jumlah: $jumlahKeranjang)
                                    })
            
        }.accentColor(Color.secondary)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    struct keranjangView : View {
        @Binding var jumlah : Int
        var body: some View{
            ZStack{
                Button(action: {print()}){
                    Image(systemName: "cart.fill")
                }
                Text("\(jumlah)")
                    .foregroundColor(.white)
                    .frame(width: 10, height: 10)
                    .font(.body)
                    .padding(5)
                    .background(Color.red)
                    .clipShape(Circle())
                    .offset(x: 10.0, y: -10.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Product: View {
    @Binding var jumlahProduct : Int
    let data: ProductModel
    var body: some View{
        VStack(alignment: .leading){
            ZStack(alignment: .topTrailing){
                Image(self.data.fotoProduct)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()
                
                Button(action: {print("Ok")}){
                    Image(systemName: "heart.fill")
                        .padding()
                        .foregroundColor(.white)
                }
            }
            
            Text(self.data.namaProduct)
                .font(.title)
                .bold()
                .padding(.leading)
                .padding(.trailing)
            Text("Rp\(self.data.hargaProduct)")
                .font(.title)
                .foregroundColor(Color.red)
                .bold()
                .padding(.leading)
                .padding(.trailing)
            
            HStack{
                Image(systemName: "mappin.circle")
                Text(self.data.lokasi)
            }
            .padding(.leading)
            .padding(.trailing)
            
            HStack{
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }.padding(.leading)
            .padding(.trailing)
            
            HStack{
                
                tambahKeranjang(jumlah: $jumlahProduct)
                
                Button(action: {print()}){
                    HStack{
                        Spacer()
                        HStack{
                            Image(systemName: "cart")
                            Text("Beli")
                                .font(.callout)
                                .padding()
                        }
                        Spacer()
                    }
                }
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
            }
        }.background(Color("warnague"))
        .cornerRadius(15)
    }
}
struct tambahKeranjang : View {
    @Binding var jumlah : Int
    var body: some View{
        Button(action: {self.jumlah += 1}){
            HStack{
                Spacer()
                HStack{
                    Image(systemName: "plus")
                    Text("Tambah")
                        .font(.callout)
                        .padding()
                }
                Spacer()
            }
        }
        .background(Color.green)
        .foregroundColor(.white)
        .cornerRadius(10)
        .padding()
    }
}
