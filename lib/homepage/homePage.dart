import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mindwell/widgets/app_bar.dart';
import 'package:mindwell/widgets/bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa>
    with SingleTickerProviderStateMixin {
  final List<bool> _isHisVisible = [false, false, false, false];
  int _currentButtonIndex = 1;
  late AnimationController _controller;

  final List<List<String>> _additionalBoxTexts = [
    [''], // İlk öğeyi boş bırakıyoruz
    [
      '"Güzel olan her şey değişir, değişmeyen her şey güzeldir." - Hz. Mevlana',
      '"Düşünce, insanın ruh halini belirler." - Marcus Aurelius',
      '"Ruhunuzun yorgunluğunu dinlendirecek şeyleri bulun ve onlara zaman ayırın." - Buddha',
      '"Mutluluk, içimizdeki huzurun dışa yansımasıdır." - Epiktetos',
      '"Her sabah, yeni bir başlangıçtır." - Meister Eckhart'
    ], // 1. kutuya metinler
    [
      '"Mutluluk, içsel bir yolculuktur." - Thich Nhat Hanh',
      '"Kendini sevmek, iç huzurun anahtarıdır." - Oprah Winfrey ',
      '"Hayat, iç huzurunu bulduğunuzda gerçekten anlam kazanır." - Jim Carrey',
      '"Huzur, kendinizi kabul ettiğinizde gelir." - Ellen DeGeneres',
      '"Huzur, içsel bir durumdur ve dış şartlara bağlı değildir." - Eckhart Tolle'
    ], // 2. kutuya metinler
    [
      '"Mutlu olmak için iki şey gerekir: İyi bir sağlık ve kötü bir hafıza." - Irwin Shaw',
      '"Gülümsemek, başkalarının da gülümsemesine neden olur." - Thich Nhat Hanh',
      '"Kendini sev, başkaları da seni sevecektir." - Lucile Ball',
      '"Hayat bir armağandır, onu boşa harcama." - Leo Tolstoy',
      '"Mutluluğun sırrı, geçmişe takılıp kalmadan, gelecek için endişelenmeden, bugünün tadını çıkarmaktır."'
    ], // 3. kutuya metinler
    [
      '"Hayat bir bisiklet gibidir. Dengede kalmak için pedal çevirmeye devam etmelisin." - Claude Monet',
      '"Her şey mümkün, yeter ki inan." - André Gide',
      '"Hayat bir tiyatro gibidir. Herkes bir rol oynar ve en önemlisi, kendin olmaktır." - William Shakespeare',
      '"Kendine inan. Sen her şeyi başarabilirsin." ',
      '"Her şey bir sebeple olur. Belki de şimdi göremiyorsun ama zamanla her şeyin bir araya geldiğini göreceksin."'
    ], // 4. kutuya metinler
    [
      '"Asla pes etme." - Winston Churchill ',
      ' "Mutluluğun sırrı, geçmişe takılıp kalmadan, gelecek için endişelenmeden, bugünün tadını çıkarmaktır." ',
      '"Güçlü ol. Hayat sana ne kadar zorluk sunarsa sunsun, pes etme."',
      '"Hayattaki her şey bir sebeple olur." - Paulo Coelho',
      ' "Geçmişi affet ve geleceğe odaklan." '
    ], // 5. kutuya metinler
  ];

  final List<List<String>> _backCardNames = [
    [''], // İlk öğeyi boş bırakıyoruz
    [
      '"Sevgiyle bakanlar, yaşamı güzelleştirirler." - M. K. Atatürk',
      '"Güzel düşünceler, güzel bir yaşamın temelidir." - Epiktetos',
      '"Güzel düşünceler, güzel bir yaşamın tohumlarıdır." - Marcus Aurelius',
      '"Güzellik, içimizdeki barışla birlikte gelir." - Can Yücel',
      '"Güçlü bir ruh, her zorluğun üstesinden gelebilir." - Cemal Süreya'
    ], // 1. kutuya isimler
    [
      '"Mutluluk, içinde bulunduğun şeyden memnun olmaktır. Keyif ise, içinde bulunduğun şeyden zevk almaktır." - André Gide',
      '"Geçmişi değiştiremezsin ama geleceği şekillendirebilirsin." - Eleanor Roosevelt',
      '"Hayat bir oyun gibidir, tadını çıkar." - William Shakespeare',
      '"Kendine inan, her şeyi başarabilirsin." - Muhammad Ali',
      '"Her gün bir adım daha ileri git." - Nelson Mandela'
    ], // 2. kutuya isimler
    [
      '"Yüzünü güneşe dön, gölgeler arkanda kalacaktır." - Walt Whitman',
      '"Hayattaki en güzel şey, başkalarının mutluluğu için bir şeyler yapabilmektir." - Oscar Wilde',
      '"Başarısızlık, pes etmediğin sürece bir yenilgi değildir." - Henry Ford',
      '"Geçmişi değiştiremezsin ama geleceği şekillendirebilirsin." - Eleanor Roosevelt',
      '"Hayattaki en önemli şey, kendin olma cesaretine sahip olmaktır." - Oprah Winfrey'
    ], // 3. kutuya isimler
    [
      '"Her fırtınadan sonra güneş yeniden doğar." ',
      '"Güçlü ol. Hayat sana ne kadar zorluk sunarsa sunsun, pes etme."',
      '"Yaşadığın her deneyim seni daha güçlü yapar."',
      ' "Gülümse! Gülümsemek, ruh halini iyileştirmenin en basit yollarından biridir." ',
      '"Mutluluk bir yolculuktur, varış noktası değil." - Ben Sweetland'
    ], // 4. kutuya isimler
    [
      '"En karanlık gece bile biter ve güneş yeniden doğar." - Victor Hugo',
      '"Her fırtına bir gökkuşağına gebe olabilir." - Abraham Lincoln',
      '"Yenilmek korkmayın. Yenilmekten ders almayı öğrenin." - Nelson Mandela',
      '"Yıldızlara ulaşmaya cesaret etmeyin, onlara dokunun." - Mahatma Gandhi',
      '"Küçük adımlar bile ilerleme adımlarıdır. Devam edin." - Dr. John Kim Kim'
    ], // 5. kutuya isimler
  ];

  void _scrollButton(bool isRight) {
    setState(() {
      if (isRight) {
        _currentButtonIndex =
            (_currentButtonIndex % 5) + 1; // 5 buton olduğu için 5'e ayarlandı
      } else {
        _currentButtonIndex = (_currentButtonIndex - 1) %
            5; // _currentButtonIndex 1-5 arasında olduğu için sadece 1 çıkarmak yeterlidir
        if (_currentButtonIndex == 0) {
          _currentButtonIndex = 5; // Eğer _currentButtonIndex 0 ise, 5'e ayarla
        }
      }
    });
  }

  String _randomText() {
    // Rastgele bir metin seçmek için bu fonksiyonu kullanacağız
    Random random = Random();
    int randomIndex =
        random.nextInt(5); // 0 ile 4 arasında rastgele bir sayı seçin
    return _additionalBoxTexts[_currentButtonIndex][randomIndex];
  }

  String _randomBackText() {
    // Arka yüz için farklı bir metin seçmek için bu fonksiyonu kullanacağız
    Random random = Random();
    int randomIndex =
        random.nextInt(5); // 0 ile 4 arasında rastgele bir sayı seçin
    return _backCardNames[_currentButtonIndex][randomIndex];
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(context),
      appBar: appBar1(),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isHisVisible[1] = !_isHisVisible[1];
              });
            },
            child: Center(
              child: Container(
                height: 310,
                width: 350,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(
                      255, 188, 186, 2), // Kutu rengini güncelle
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isHisVisible[1] = false;
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.arrow_left, color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _isHisVisible[1]
                              ? 'Nasıl hissediyorsun?'
                              : 'Nasıl hissediyorsun?',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isHisVisible[1] = true;
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.arrow_right, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    if (_isHisVisible[1]) ...[
                      const SizedBox(height: 8),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 1; i <= 5; i++) // 5 buton için döngü
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _currentButtonIndex =
                                        i; // Butona tıklandığında _currentButtonIndex'i güncelle
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.white, // Buton rengini beyaz yap
                                  elevation: 0, // Gölgeyi kaldır
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: _currentButtonIndex ==
                                          i // Check if this is the "Very Good" button
                                      ? Image.asset(
                                          'assets/button_$i.png', // Path to your image asset
                                          height:
                                              30, // Adjust the height as needed
                                          width:
                                              30, // Adjust the width as needed
                                        )
                                      : Text(
                                          [
                                            'Çok İyi',
                                            'İyi',
                                            'Orta',
                                            'Kötü',
                                            'Çok Kötü'
                                          ][i - 1],
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_left),
                            onPressed: () => _scrollButton(false),
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_right),
                            onPressed: () => _scrollButton(true),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                if (_controller.status == AnimationStatus.completed ||
                    _controller.status == AnimationStatus.forward) {
                  _controller.reverse();
                } else {
                  _controller.forward();
                }
              },
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform(
                    transform: Matrix4.rotationY(pi * _controller.value),
                    alignment: Alignment.center,
                    child: child,
                  );
                },
                child: Container(
                  height: 155,
                  width: 350,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(
                        255, 188, 186, 2), // Kutu rengini güncelle
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          _isHisVisible[1]
                              ? _randomText()
                              : 'Modunu Seç', // Ön yüzde rastgele metin göster veya "Select your mood" metnini görüntüle
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      ),
                      if (!_isHisVisible[1]) // Arka yüzdeki ismi göster
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: BackCardText(
                              isVisible: !_isHisVisible[1],
                              text: _randomBackText(),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isHisVisible[1] =
                      false; // Kutuyu tıkladığında _isHisVisible[1] değerini false yap
                });
              },
              child: Container(
                height: 50,
                width: 350,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(
                      255, 188, 186, 2), // Kutu rengini güncelle
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Sıfırla',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BackCardText extends StatelessWidget {
  final bool isVisible;
  final String text;

  const BackCardText({
    super.key,
    required this.isVisible,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(
              255, 188, 186, 2), // Arkaplan rengini beyaz yap
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text, // Arka yüzdeki isim
          style: const TextStyle(
              color: Colors.white,
              fontSize: 20), // Yazı rengini ve boyutunu güncelle
        ),
      ),
    );
  }
}
