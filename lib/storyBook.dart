import 'package:flutter/material.dart';
import 'package:ui_kit/ui_components/Menu.dart';
import 'package:ui_kit/ui_kit.dart';

class MyForm extends StatefulWidget {
  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: ui.colors.white,
        ),
        body: Center(
          child: Form(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [

                        Input(hint: 'Введите имя',showValidationBorder: true,),
                        SizedBox(height: 28),
                        Input( value: 'Иван' , showValidationBorder: true,),
                        SizedBox(height: 28),
                        Input(label: 'Иван' ,showValidationBorder: true,hint: 'Введите имя'),
                        SizedBox(height: 28),
                        Input( hasError: true,hint: 'Имя',helperText: 'Введите ваше имя',),
                        SizedBox(height: 28),
                        Input(label: 'Имя',hint: 'Введите имя'),
                        SizedBox(height: 28),
                        Input(label: 'Имя', value: 'Введите имя'),
                        SizedBox(height: 28),
                        Input(value: '*********', isPassword: true,),
                        SizedBox(height: 28),
                        Input(hint: '--.--.----'),
                        SizedBox(height: 28),

                      ],
                    ),
                    Column(
                      children: [
                        ui.bigButton.primary(
                          text: "Подтвердить",
                          onPressed: (){},
                        ),
                        SizedBox(height: 5),
                        ui.bigButton.primary(
                          text: "Подтвердить",
                          onPressed: null,
                          enabled: false,
                        ),
                        SizedBox(height: 5),
                        ui.bigButton.delete(
                          text: "Подтвердить",
                          onPressed: (){},
                        ),
                        SizedBox(height: 5),
                        ui.bigButton.unActive(
                          text: "Подтвердить",
                          onPressed: (){},
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ui.smallButton.primary(
                          text: "Добавить",
                          onPressed: (){},
                          enabled: true,
                        ),
                        SizedBox(height: 5),

                        ui.smallButton.delete(
                          text: "Убрать",
                          onPressed: (){},
                        ),
                        SizedBox(height: 5),
                        ui.smallButton.primary(
                          text: "Добавить",
                          onPressed: null,
                          enabled: false,
                        ),
                        SizedBox(height: 5),

                        ui.smallButton.unActive(
                          text: "Подтвер...",
                          onPressed: (){},
                        ),
                      ],
                    ),

                    SizedBox(height: 5),
                    Column(
                      children: [
                        ui.chipButton.primary(
                          text: "Популярные",
                          onPressed: (){},
                          enabled: true,
                        ),
                        SizedBox(height:5),
                        ui.chipButton.unActive(
                          text: "Популярные",
                          onPressed: (){},
                        ),
                      ],
                    ),
                    SizedBox(height: 5),

                    Row(
                      children: [
                        ui.images.left(size:20 ),
                        ui.images.down(size:20 ),
                        ui.images.search(size:20 ),
                        ui.images.plus(size:20 ),
                        ui.images.minus(size:20 ),
                        ui.images.message(size:20 ),
                        ui.images.filter(size:20 ),
                        ui.images.download(size:20 ),
                        ui.images.download(size:20 ),
                        ui.images.book(size: 20),
                        ui.images.point(size: 20),
                        ui.images.close(size: 20),
                        ui.images.closeSnackBar(size: 20),
                        ui.images.delete(size: 20),
                        ui.images.shopp(size: 20),
                      ],
                    ),
                    Row(
                      children: [
                        ui.images.trueIcon(size: 20),
                        ui.images.tg(size: 20),
                        ui.images.voice(size: 20),
                        ui.images.screpka(size: 20),
                        ui.images.EyesC(size: 20),
                        ui.images.eyes(size: 20),
                      ],
                    ),
                    ui.logo.vk( onPressed: () {},),
                    ui.logo.yandex( onPressed: () {},),

                    ui.counter.active(),
                    SizedBox(height: 10),
                    ui.counter.disabled(),

                    Container(
                      child:SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child:  Row(
                          children: [
                            Menu(text: 'Популярные', isActive: _selectedIndex == 0),
                            SizedBox( width: 19),
                            Menu(text: 'Женщинам',),
                            SizedBox( width: 19),
                            Menu(text: 'Мужчинам',),
                            SizedBox( width: 19),
                            Menu(text: 'Детям',),
                            SizedBox( width: 19),
                            Menu(text: 'Аксессуары',),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Toggle(
                      isActive: false,
                      onChanged: (value) {
                      },
                    ),
                    Toggle(
                      isActive: true,
                      onChanged: (value) {
                      },
                    ),
                    SizedBox(height: 10),
                    ui.base.base(height: 136),
                    SizedBox(height: 10),
                    ui.productCard.card(
                      title: 'Рубашка Воскресенье для машинного\nвязания',
                      subtitle: 'Мужская одежда',
                      price: '300',
                      button: ui.smallButton.primary(
                        text: "Добавить",
                        onPressed: (){},
                        enabled: true,
                      ),
                    ),
                    SizedBox(height: 10),

                    ui.productCard.card(
                      title: 'Рубашка Воскресенье для машинного\nвязания',
                      subtitle: 'Мужская одежда',
                      price: '300',
                      button: ui.smallButton.delete(
                        text: "Убрать",
                        onPressed: (){},
                      ),
                    ),
                    SizedBox(height: 10),
                    ui.productCard.cartItem(
                      title: 'Рубашка Воскресенье для машинного вязания',
                      price: '300',
                      onRemove: () {

                      },
                    ),
                    SizedBox(height: 10),
                    ui.productCard.noPrice(title: 'Мой первый проект',subtitle: 'Прошло 2 дня', button:  ui.smallButton.primary(
                      text: "Открыть",
                      onPressed: (){},
                      enabled: true,
                    ), ),
                    ui.search,
                    SizedBox(height: 10),
                    ui.bottomNavigation.create(initialIndex: 0),
                    ui.bottomNavigation.create(initialIndex: 1),
                    ui.bottomNavigation.create(initialIndex: 2),
                    ui.bottomNavigation.create(initialIndex: 3),




                  ],
                ),
              ),
            ),
          ),
        )
    );

  }
}
