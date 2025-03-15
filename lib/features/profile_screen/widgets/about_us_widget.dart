import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Biz Barada",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Biz Kim?"),
              _buildSectionText(
                  "Biziň platformamyz, müşderilere ýokary hilli hyzmat bermek we olaryň isleglerini kanagatlandyrmak üçin döredildi. Maksadymyz, adamlaryň gündelik durmuşynda matalary has elýeterli we peýdaly etmekdir."),
              _buildSectionTitle("Maksadymyz"),
              _buildSectionText(
                  "Biz, müşderilerimize iň oňat tejribäni hödürlemek üçin yzygiderli ösüşe we innowasiýalara üns berýäris. Gowy hyzmat, ýokary hilli önümler we müşderileriň kanagatlanmagy biziň esasy gymmatlyklarymyzdyr."),
              _buildSectionTitle("Hyzmatlarymyz"),
              _buildBulletPoints([
                "Müşderilere ýokary hilli önümleri hödürlemek.",
                "Täze matalar bilen, hyzmatlary gowulandyrmak.",
                "Ulanyjylara amatly we ygtybarly platforma döretmek.",
                "Müşderi goldaw we maslahat beriş hyzmatlaryny bermek.",
              ]),
              _buildSectionTitle("Biziň Gymmatlyklarymyz"),
              _buildBulletPoints([
                "Müşderi kanagatlanmasy - Biziň birinji nobatdaky maksadymyz.",
                "Täzelik we innowasiýa - Geljege açyk bolmak we üýtgeşmelere uýgunlaşmak.",
                "Howpsuzlyk we gizlinlik - Ulanyjylaryň maglumatlarynyň goraglylygy biziň borjumyz.",
                "Toparlaýyn işlemek - Netijeli we dostlukly hyzmatdaşlyk.",
              ]),
              _buildSectionTitle("Biziň Taryhymyz"),
              _buildSectionText(
                  "Biziň kompaniýamyz ... ýylynda döredildi we şol wagt bäri müşderilere ýokary hilli hyzmat bermek üçin işleýär. Biz, başlangyç etapdan başlap, müşderilerimize iň oňat tejribäni hödürlemek üçin yzygiderli täzelenip durduk."),
              _buildSectionTitle("Näme Üçin Bizi Saýlamaly?"),
              _buildBulletPoints([
                "Iň täze matalar.",
                "Ygtybarly we amatly hyzmatlar.",
                "Müşderilere çalt we netijeli kömek bermek.",
                "Hil we howpsuzlyk kepilligi.",
              ]),
              _buildSectionTitle("Biziň Bilen Habarlaşyň"),
              _buildSectionText(
                  "Eger-de soraglaryňyz bar bolsa, biziň bilen islendik wagt habarlaşyp bilersiňiz:"),
              _buildContactInfo("📧 E-poçta: contact@example.com"),
              _buildContactInfo("📞 Telefon: +993 XX XXX XX XX"),
              _buildContactInfo("🌍 Websaýt: www.example.com"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildSectionText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, color: Colors.black54),
    );
  }

  Widget _buildBulletPoints(List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: points
          .map(
            (point) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("• ", style: TextStyle(fontSize: 16)),
                  Expanded(
                    child: Text(
                      point,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildContactInfo(String info) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(
        info,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}
