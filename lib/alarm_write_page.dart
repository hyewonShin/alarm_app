import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AlarmWritePage extends StatelessWidget {
  const AlarmWritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: Get.back, // 뒤로가기
          behavior: HitTestBehavior.translucent,
          child: Center(
            child: Text(
              '취소',
              style: TextStyle(
                color: Color(0xffff9f0a),
                fontSize: 20,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        title: Text('알람 추가', style: TextStyle(color: Colors.white)),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                '저장',
                style: TextStyle(
                  color: Color(0xffff9f0a),
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '오전',
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 28,
                color: Color(0xffababac),
              ),
            ),
            SizedBox(width: 15),
            SizedBox(
              width: 87,
              height: 87,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff2c2c2e),
                ),
                child: Center(
                  child: TextField(
                    maxLength: 2,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      RangeTextInputFormatter(1, 23),
                    ],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w100,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 15),
            SizedBox(
              width: 87,
              height: 87,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff2c2c2e),
                ),
                child: Center(
                  child: TextField(
                    maxLength: 2,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      RangeTextInputFormatter(1, 59),
                    ],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w100,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RangeTextInputFormatter extends TextInputFormatter {
  final int min;
  final int max;

  RangeTextInputFormatter(this.min, this.max);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final int? value = int.tryParse(newValue.text);
    if (value == null || value < min || value > max) {
      return oldValue;
    }
    return newValue;
  }
}
