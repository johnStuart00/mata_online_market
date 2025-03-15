import 'package:flutter/material.dart';

class SecurityPrivacyScreen extends StatelessWidget {
  const SecurityPrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Howpsuzlyk we Gizlinlik",
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
              _buildSectionTitle("1. Hasabyňyz we Maglumatlaryňyz"),
              _buildSectionText(
                  "Siziň şahsy maglumatlaryňyzyň howpsuzlygyny üpjün etmek biziň ileri tutýan maksadymyz. Ulanyjylaryň şahsy maglumatlary üçünji taraplara berilmeýär we diňe ygtybarly ulgamlarda saklanýar."),
              _buildSectionTitle("2. Maglumatlaryňyzyň Goraglylygy"),
              _buildSectionText(
                  "Biz siziň maglumatlaryňyzy goramak üçin häzirki zaman howpsuzlyk tehnologiýalaryny ulanýarys. Şeýle-de, hasabyňyzyň howpsuzlygyny saklamak üçin, güýçli parol ulanmagy maslahat berýäris."),
              _buildSectionTitle("3. Rugsatsyz Girişleriň Öňüni Alyş"),
              _buildSectionText(
                  "Eger-de siz näbelli girizme ýa-da şübheli hereketler görseňiz, bize habar bermegiňizi haýyş edýäris. Hasabyňyza rugsatsyz girişleri öňüni almak üçin iki faktorlu tassyklamany ulanyp bilersiňiz."),
              _buildSectionTitle(
                  "4. Maglumatlary Üçünji Taraplar Bilen Paýlaşmak"),
              _buildSectionText(
                  "Biz siziň rugsadyňyz bolmazdan, şahsy maglumatlaryňyzy üçünji taraplar bilen paýlaşmaýarys. Käbir ýagdaýlarda, hukuk goraýjy edaralar bilen hyzmatdaşlyk etmek maksady bilen maglumat berlip bilner."),
              _buildSectionTitle("5. Kuki (Cookies) Ulanylyşy"),
              _buildSectionText(
                  "Biziň platformamyz siziň tejribäňizi gowulandyrmak üçin 'kuki' (cookies) faýllaryny ulanyp biler. Eger-de siz munuň bilen razy däl bolsaňyz, brauzeriňiziň sazlamalaryndan munuň öňüni alyp bilersiňiz."),
              _buildSectionTitle("6. Ulanyjy Hukuklary"),
              _buildSectionText(
                  "Siz öz maglumatlaryňyzy islendik wagt görmek, üýtgetmek ýa-da pozmak hukugyna eýe. Maglumatlarymyz bilen baglanyşykly islendik soragyňyz bar bolsa, biziň bilen habarlaşyp bilersiňiz."),
              _buildSectionTitle("7. Howpsuzlyk Üçin Maslahatlar"),
              _buildBulletPoints([
                "Güýçli parol ulanyň we ony hiç kim bilen paýlaşmaň.",
                "Şübheli e-poçta ýa-da habarlardan seresap boluň.",
                "Jübi enjamlaryňyzy we kompýuteriňizi ygtybarly gorag ulgamlary bilen üpjün ediň.",
              ]),
              _buildSectionTitle("8. Biziň Bilen Habarlaşyň"),
              _buildSectionText(
                  "Eger-de siziň howpsuzlyk ýa-da gizlinlik bilen baglanyşykly soraglaryňyz bar bolsa, biziň bilen habarlaşyp bilersiňiz:"),
              _buildContactInfo("📧 E-poçta: support@example.com"),
              _buildContactInfo("📞 Telefon: +993 XX XXX XX XX"),
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
