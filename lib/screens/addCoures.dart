import 'package:aug_reg/models/courceModel.dart';
import 'package:aug_reg/providerr/courceProvider.dart';
import 'package:aug_reg/widgets/button.dart';
import 'package:aug_reg/widgets/textFiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

class AddCoures extends StatefulWidget {
  int? id;

  AddCoures({this.id});

  @override
  _AddCouresState createState() => _AddCouresState();
}

class _AddCouresState extends State<AddCoures> {
  var formKey = GlobalKey<FormState>();
  String? title;
  String? grade;

  saveTitle(String value) {
    this.title = value;
  }

  saveGrade(String value) {
    this.grade = value;
  }

  nullValidator(String value) {
    if (value == '' || value == null) {
      return 'required field';
    }
  }

  CourceModel? courceModel;

  saveForm(context) async {
    bool validate = formKey.currentState!.validate();

    if (validate) {
      formKey.currentState!.save();
      courceModel = CourceModel(
        grade: grade,
        title: title,
        stdId: widget.id,
      );

      Provider.of<CourceProvider>(context, listen: false)
          .insertIntoCourceTable(courceModel!);
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.id);
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('إضافة مقرر'),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: size.height / 2 - 200,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: MyTextField(
                              label: 'اسم المقرر',
                              icon: Icon(Icons.menu_book_outlined),
                              keyboardType: TextInputType.text,
                              validateFun: nullValidator,
                              saveFun: saveTitle,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: MyTextField(
                              label: ' الدرجة',
                              icon: Icon(Icons.control_point),
                              keyboardType: TextInputType.number,
                              validateFun: nullValidator,
                              saveFun: saveGrade,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                          onTap: () {
                            saveForm(context);
                          },
                          label: 'إضافة مقرر')
                    ],
                  ),
                ),
              ),
              Divider(),
              Container(
                width: double.infinity,
                height: size.height / 2 - 150,
                child: Container(
                  width: double.infinity,
                  child: Consumer<CourceProvider>(
                    builder: (context, value, child) => ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 24,
                      ),
                      itemBuilder: (context, index) =>
                          widget.id == value.cources[index].stdId
                              ? ListTile(
                                  tileColor: Colors.white,
                                  title: Row(
                                    children: [
                                      Text(
                                        'اسم المقرر:',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        value.cources[index].title!,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Text(
                                        'الدرجة:',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        value.cources[index].grade!,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  leading: IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {},
                                  ),
                                )
                              : Container(),
                      itemCount: value.cources.length,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
