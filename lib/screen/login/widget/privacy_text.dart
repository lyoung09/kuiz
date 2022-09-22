// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';


// class PrivacyWidget extends StatefulWidget {
//   const PrivacyWidget({Key? key}) : super(key: key);

//   @override
//   State<PrivacyWidget> createState() => _PrivacyWidgetState();
// }

// class _PrivacyWidgetState extends State<PrivacyWidget> {
//   final settingController = Get.put(SettingService());

//   @override
//   void initState() {
//     super.initState();
//   }

//   Widget languageDiff(Locale locale) {
//     String languageCode = settingController.getLocaleMode().languageCode;
//     String language = languageCode.substring(0, languageCode.indexOf('_'));
//     switch (language) {
//       case 'en':
//         return RichText(
//             maxLines: 3,
//             text: TextSpan(children: [
//               TextSpan(
//                   text: 'Once sign up, you agree to the ',
//                   style:
//                       MyText.aboutCoinityText(context)!.copyWith(fontSize: 14)),
//               TextSpan(
//                   text: ' privacy policy',
//                   style: MyText.aboutCoinityTitle(context)!.copyWith(
//                       color: Colors.blue,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16),
//                   recognizer: TapGestureRecognizer()
//                     ..onTap = () {
//                       Get.to(() => PrivatePolicyWidget());
//                     }),
//             ]));
//       case 'es':
//         return RichText(
//             text: TextSpan(children: [
//           TextSpan(
//               text: 'Al registrarse, acepta la ',
//               style: MyText.aboutCoinityText(context)!.copyWith(fontSize: 14)),
//           TextSpan(
//               text: ' política de privacidad ',
//               style: MyText.aboutCoinityTitle(context)!.copyWith(
//                   color: Colors.blue,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16),
//               recognizer: TapGestureRecognizer()
//                 ..onTap = () {
//                   Get.to(() => PrivatePolicyWidget());
//                 }),
//           TextSpan(
//               text: 'de "Coinity" no sé que es ',
//               style: MyText.aboutCoinityText(context)!.copyWith(fontSize: 14)),
//         ]));

//       case 'ko':
//         return RichText(
//             text: TextSpan(children: [
//           TextSpan(
//               text: '가입하면 Coinity의 ',
//               style: MyText.aboutCoinityText(context)!.copyWith(fontSize: 14)),
//           TextSpan(
//               text: '개인정보 ',
//               style: MyText.aboutCoinityTitle(context)!.copyWith(
//                   color: Colors.blue,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16),
//               recognizer: TapGestureRecognizer()
//                 ..onTap = () {
//                   Get.to(() => PrivatePolicyWidget());
//                 }),
//           TextSpan(
//               text: ' 처리방침에 동의하게 됩니다.',
//               style: MyText.aboutCoinityText(context)!.copyWith(fontSize: 14)),
//         ]));
//       case 'ja':
//         return RichText(
//             text: TextSpan(children: [
//           TextSpan(
//               text: '登録するとCoinityの ',
//               style: MyText.aboutCoinityText(context)!.copyWith(fontSize: 14)),
//           TextSpan(
//               text: '個人情報',
//               style: MyText.aboutCoinityTitle(context)!
//                   .copyWith(color: Colors.blue),
//               recognizer: TapGestureRecognizer()
//                 ..onTap = () {
//                   Get.to(() => PrivatePolicyWidget());
//                 }),
//           TextSpan(
//               text: '処理方針に同意します。',
//               style: MyText.aboutCoinityText(context)!.copyWith(fontSize: 14)),
//         ]));
//       case 'tr':
//         return RichText(
//             text: TextSpan(children: [
//           TextSpan(
//               text: 'Kaydolmakla Coinity\'nin ',
//               style: MyText.aboutCoinityText(context)!.copyWith(fontSize: 14)),
//           TextSpan(
//               text: ' Gizlilik Politikasını',
//               style: MyText.aboutCoinityTitle(context)!
//                   .copyWith(color: Colors.blue),
//               recognizer: TapGestureRecognizer()
//                 ..onTap = () {
//                   Get.to(() => PrivatePolicyWidget());
//                 }),
//           TextSpan(
//               text: 'kabul etmiş sayılırsınız.',
//               style: MyText.aboutCoinityText(context)!.copyWith(fontSize: 14)),
//         ]));
//       case 'zh':
//         return RichText(
//             text: TextSpan(children: [
//           TextSpan(
//               text: '注册即表示您同意 Coinity 的',
//               style: MyText.aboutCoinityText(context)!.copyWith(fontSize: 14)),
//           TextSpan(
//               text: '隐私政策',
//               style: MyText.aboutCoinityTitle(context)!.copyWith(
//                   color: Colors.blue,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16),
//               recognizer: TapGestureRecognizer()
//                 ..onTap = () {
//                   Get.to(() => PrivatePolicyWidget());
//                 }),
//         ]));
//       case 'ru':
//         return RichText(
//             text: TextSpan(children: [
//           TextSpan(
//               text: 'Регистрируясь, Вы соглашаетесь с ',
//               style: MyText.aboutCoinityText(context)!.copyWith(fontSize: 14)),
//           TextSpan(
//               text: 'политикой конфиденциальности',
//               style: MyText.aboutCoinityTitle(context)!.copyWith(
//                   color: Colors.blue,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16),
//               recognizer: TapGestureRecognizer()
//                 ..onTap = () {
//                   Get.to(() => PrivatePolicyWidget());
//                 }),
//           TextSpan(
//               text: 'Coinity.',
//               style: MyText.aboutCoinityText(context)!.copyWith(fontSize: 14)),
//         ]));
//     }

//     return RichText(
//         text: TextSpan(children: [
//       TextSpan(
//           text: 'Once sign up, you agree to the',
//           style: MyText.aboutCoinityText(context)!.copyWith(fontSize: 14)),
//       TextSpan(
//           text: ' privacy policy',
//           style: MyText.aboutCoinityTitle(context)!.copyWith(
//               color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
//           recognizer: TapGestureRecognizer()
//             ..onTap = () {
//               Get.to(() => PrivatePolicyWidget());
//             }),
//     ]));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         // color: Colors.blue,
//         width: MediaQuery.of(context).size.width * 0.6,
//         alignment: Alignment.center,
//         child: languageDiff(settingController.getLocaleMode()));
//   }
// }
