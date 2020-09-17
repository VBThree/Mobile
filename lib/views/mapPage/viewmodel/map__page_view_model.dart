import 'package:VBThreeMobile/views/mapPage/model/mapPageModel.dart';
import 'package:mobx/mobx.dart';
part 'map__page_view_model.g.dart';

class MapPageViewModel = _MapPageViewModelBase with _$MapPageViewModel;

abstract class _MapPageViewModelBase with Store {
  List<MapPageModel> annotations;

  
  @action
  void load() {
    annotations = [
      // TODO remove mock data pls
      MapPageModel(
          "123",
          "Yusuf 1",
          "https://lh3.googleusercontent.com/proxy/OeeFLvXMk1IGUA2DCnlf5hHYnFLHE-8J8f19a5EuauXccW3DDKHYQ68NHo55ikdADiJxCgAuBK1ROwFd7AstlMtfM78-2j2i3KBAsrkcxfsOtBCx6yWE69ZOKWOd",
          "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır.",
          "17.09.2020",
          12.7,
          "Bekliyor",
          36.88000,
          30.704044,
          MapPageTypes.value1),
      MapPageModel(
          "1233",
          "Yusuf 2",
          "https://lh3.googleusercontent.com/proxy/OeeFLvXMk1IGUA2DCnlf5hHYnFLHE-8J8f19a5EuauXccW3DDKHYQ68NHo55ikdADiJxCgAuBK1ROwFd7AstlMtfM78-2j2i3KBAsrkcxfsOtBCx6yWE69ZOKWOd",
          "Lorem Ipsum pasajlarının birçok çeşitlemesi vardır. Ancak bunların büyük bir çoğunluğu mizah katılarak veya rastgele sözcükler eklenerek değiştirilmişlerdir.",
          "17.09.2020",
          12.7,
          "Bekliyor",
          36.88000,
          31.704044,
          MapPageTypes.value1),
      MapPageModel(
          "12345",
          "Yusuf 3",
          "https://lh3.googleusercontent.com/proxy/OeeFLvXMk1IGUA2DCnlf5hHYnFLHE-8J8f19a5EuauXccW3DDKHYQ68NHo55ikdADiJxCgAuBK1ROwFd7AstlMtfM78-2j2i3KBAsrkcxfsOtBCx6yWE69ZOKWOd",
          "Yinelenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilinen bir gerçektir. Lorem Ipsum kullanmanın amacı, sürekli 'buraya metin gelecek, buraya metin gelecek' yazmaya kıyasla daha dengeli bir harf dağılımı sağlayarak okunurluğu artırmasıdır.",
          "17.09.2020",
          12.7,
          "Çözüldü",
          36.00,
          30.704044,
          MapPageTypes.value1)
    ];
  }

  @action
  MapPageModel selectPoint(String uuid) {
    return annotations.where((item) => item.uuid == uuid).first;
  }

  @action
  void updateStatus(String uuid) {
    // TODO: implement updateStatus
  }
}
