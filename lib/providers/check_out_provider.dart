import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:market_online_app/models/delivery_address_model.dart';

class CheckoutProvider with ChangeNotifier {
  bool isLoading = false;

  TextEditingController ten = TextEditingController();
  TextEditingController hodem = TextEditingController();
  TextEditingController sodienthoai = TextEditingController();
  TextEditingController sokhac = TextEditingController();
  TextEditingController diachigiao = TextEditingController();
  TextEditingController xa = TextEditingController();
  TextEditingController duong = TextEditingController();
  TextEditingController quan = TextEditingController();
  TextEditingController huyen = TextEditingController();
  TextEditingController thanhpho = TextEditingController();
  LocationData setLocation;

  void validator(context, myType) async {
    if (ten.text.isEmpty) {
      Fluttertoast.showToast(msg: "Tên trống");
    } else if (hodem.text.isEmpty) {
      Fluttertoast.showToast(msg: "Họ đệm trống");
    } else if (sodienthoai.text.isEmpty) {
      Fluttertoast.showToast(msg: "Số điện thoại trống");
    } else if (sokhac.text.isEmpty) {
      Fluttertoast.showToast(msg: "Số khác trống");
    } else if (diachigiao.text.isEmpty) {
      Fluttertoast.showToast(msg: "Địa chỉ giao trống");
    } else if (xa.text.isEmpty) {
      Fluttertoast.showToast(msg: "Xã trống");
    } else if (duong.text.isEmpty) {
      Fluttertoast.showToast(msg: "Đường trống");
    } else if (quan.text.isEmpty) {
      Fluttertoast.showToast(msg: "Quận trống");
    } else if (huyen.text.isEmpty) {
      Fluttertoast.showToast(msg: "Huyện trống");
    } else if (thanhpho.text.isEmpty) {
      Fluttertoast.showToast(msg: "Thành phố trống");
    } else if (setLocation == null) {
      Fluttertoast.showToast(msg: "Địa điểm trống");
    } else {
      isLoading = true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection("AddDeliveryAddress")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .set({
        "Ten": ten.text,
        "Hodem": hodem.text,
        "Sodienthoai": sodienthoai.text,
        "Sokhac": sokhac.text,
        "Diachigiao": diachigiao.text,
        "Xa": xa.text,
        "Duong": duong.text,
        "Quan": quan.text,
        "Huyen": huyen.text,
        "ThanhPho": thanhpho.text,
        "LoaiDiaChi": myType.toString(),
        "Longitude": setLocation.longitude,
        "Latitude": setLocation.latitude,
      }).then((value) async {
        isLoading = false;
        notifyListeners();
        await Fluttertoast.showToast(msg: "Đã thêm địa chỉ giao hàng");
        Navigator.of(context).pop();
        notifyListeners();
      });
      notifyListeners();
    }
  }

  // ====================== THÁI PHONG POSH ĐỊA CHỈ GIAO HÀNG VÀ LẤY DỮ LIỆU Ở FIREBASE
  List<DeliveryAddressModel> deliveryAddressList = [];
  getDeliveryAddressData() async {
    List<DeliveryAddressModel> newList = [];

    DeliveryAddressModel deliveryAddressModel;
    DocumentSnapshot _db = await FirebaseFirestore.instance
        .collection("AddDeliveryAddress")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();
    if (_db.exists) {
      deliveryAddressModel = DeliveryAddressModel(
        ten: _db.get("Ten"),
        hoDem: _db.get("Hodem"),
        soDienthoai: _db.get("Sodienthoai"),
        soKhac: _db.get("Sokhac"),
        diaChigiao: _db.get("Diachigiao"),
        xa: _db.get("Xa"),
        duong: _db.get("Duong"),
        quan: _db.get("Quan"),
        huyen: _db.get("Huyen"),
        thanhPho: _db.get("ThanhPho"),
        loaidiahchi: _db.get("LoaiDiaChi"),
      );
      newList.add(deliveryAddressModel);
      notifyListeners();
    }

    deliveryAddressList = newList;
    notifyListeners();
  }

  List<DeliveryAddressModel> get getDeliveryAddressList {
    return deliveryAddressList;
  }

  // ====================== HẾT PHẦN CỦA PHONG
}
