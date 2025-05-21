import 'package:autobazzaar/core/theme/colors.dart';
import 'package:autobazzaar/presentation/screens/PostScreens/components/Choose_plan/payment_successful.dart';
import 'package:autobazzaar/src/credit_card_form.dart';
import 'package:autobazzaar/src/credit_card_widget.dart';
import 'package:autobazzaar/src/models/credit_card_brand.dart';
import 'package:autobazzaar/src/models/credit_card_model.dart';
import 'package:autobazzaar/src/models/custom_card_type_icon.dart';
import 'package:autobazzaar/src/models/glassmorphism_config.dart';
import 'package:autobazzaar/src/models/input_configuration.dart';
import 'package:autobazzaar/src/utils/enumerations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<StatefulWidget> createState() => PaymentMethodState();
}

class PaymentMethodState extends State<PaymentMethod> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  bool useFloatingAnimation = true;
  final OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black.withOpacity(0.7), width: 2.0),
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: Colors.black, fontSize: 18),
        ),
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: Colors.white,
          background: Colors.white,
          primary: Colors.black,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(color: Colors.black),
          labelStyle: const TextStyle(color: Colors.black),
          focusedBorder: border,
          enabledBorder: border,
        ),
      ),
      home: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Payment", style: TextStyle(color: Colors.white)),
          backgroundColor: red,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),

        body: Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage(
                    'assets/images/credit_card/bg-light.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    CreditCardWidget(
                      enableFloatingCard: useFloatingAnimation,
                      glassmorphismConfig: _getGlassmorphismConfig(),
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      bankName: 'Axis Bank',
                      frontCardBorder:
                          useGlassMorphism
                              ? null
                              : Border.all(color: Colors.grey),
                      backCardBorder:
                          useGlassMorphism
                              ? null
                              : Border.all(color: Colors.grey),
                      showBackView: isCvvFocused,
                      obscureCardNumber: true,
                      obscureCardCvv: true,
                      isHolderNameVisible: true,
                      cardBgColor: AppColors.cardBgLightColor,
                      backgroundImage:
                          useBackgroundImage
                              ? 'assets/images/credit_card/card_bg.png'
                              : null,
                      isSwipeGestureEnabled: true,
                      onCreditCardWidgetChange:
                          (CreditCardBrand creditCardBrand) {},
                      customCardTypeIcons: <CustomCardTypeIcon>[
                        CustomCardTypeIcon(
                          cardType: CardType.mastercard,
                          cardImage: Image.asset(
                            'assets/images/credit_card/mastercard.png',
                            height: 48,
                            width: 48,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            CreditCardForm(
                              formKey: formKey,
                              obscureCvv: true,
                              obscureNumber: true,
                              cardNumber: cardNumber,
                              cvvCode: cvvCode,
                              isHolderNameVisible: true,
                              isCardNumberVisible: true,
                              isExpiryDateVisible: true,
                              cardHolderName: cardHolderName,
                              expiryDate: expiryDate,
                              inputConfiguration: const InputConfiguration(
                                cardNumberDecoration: InputDecoration(
                                  labelText: 'Number',
                                  hintText: 'XXXX XXXX XXXX XXXX',
                                ),
                                expiryDateDecoration: InputDecoration(
                                  labelText: 'Expired Date',
                                  hintText: 'XX/XX',
                                ),
                                cvvCodeDecoration: InputDecoration(
                                  labelText: 'CVV',
                                  hintText: 'XXX',
                                ),
                                cardHolderDecoration: InputDecoration(
                                  labelText: 'Card Holder',
                                ),
                              ),
                              onCreditCardModelChange: onCreditCardModelChange,
                            ),
                            const SizedBox(height: 20),
                            _buildSwitchRow(
                              'Glassmorphism',
                              useGlassMorphism,
                              (val) => setState(() => useGlassMorphism = val),
                            ),
                            _buildSwitchRow(
                              'Card Image',
                              useBackgroundImage,
                              (val) => setState(() => useBackgroundImage = val),
                            ),
                            _buildSwitchRow(
                              'Floating Card',
                              useFloatingAnimation,
                              (val) =>
                                  setState(() => useFloatingAnimation = val),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: _onValidate,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[red, redlight],
                                    begin: Alignment(-1, -4),
                                    end: Alignment(1, 4),
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Validate',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onValidate() {
    if (formKey.currentState?.validate() ?? false) {
      print('valid!');
    } else {
      print('invalid!');
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentSuccessScreen()),
    );
    // PaymentSuccessScreen()
  }

  Glassmorphism? _getGlassmorphismConfig() {
    if (!useGlassMorphism) return null;
    final LinearGradient gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[Colors.black.withAlpha(50), Colors.black.withAlpha(50)],
      stops: const <double>[0.3, 0],
    );
    return Glassmorphism(blurX: 8.0, blurY: 16.0, gradient: gradient);
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  Widget _buildSwitchRow(String label, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(label, style: const TextStyle(color: Colors.black)),
          const Spacer(),
          Switch(
            value: value,
            inactiveTrackColor: Colors.grey,
            activeColor: Colors.black,
            activeTrackColor: redlight,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
