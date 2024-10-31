import 'package:aplikasiresto/detail_page.dart';
import 'package:aplikasiresto/makanan.dart';
import 'package:aplikasiresto/styles.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.menu,
  });

  final Makanan menu;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(makanan: menu,)));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 100,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [BoxShadow(color: const Color.fromARGB(255, 188, 188, 188), offset: Offset(1, 2), blurRadius: 6)],
           ),
        child: Row(
          children: [
            gambar(),
            SizedBox(width: 10),
            deskripsiTeks(),
            Icon(
              Icons.food_bank_rounded,
              color: iconColor )
          ],
        ),
      ),
    );
  }

  ClipRRect gambar() {
    return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.asset(menu.gambarUtama, height: 75, width: 85, fit: BoxFit.cover));
  }

  Expanded deskripsiTeks() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(menu.nama, style: headerH1,),
              Text(menu.deskripsi, style: TextStyle(color: Colors.black38), overflow: TextOverflow.ellipsis),
              SizedBox(height: 3),
              Text(menu.harga, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
    );
  }
}
