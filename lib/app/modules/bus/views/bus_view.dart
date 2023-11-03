import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final/app/modules/home/views/home_view.dart';
import 'package:flutter_final/app/modules/mytickets/views/mytickests.dart';
import 'package:flutter_final/app/modules/profile/profile_screen.dart';
// import 'package:flutter_final/app/modules/search_form/views/search_form.dart';
import 'package:flutter_final/app/modules/search_tickets/views/search_tickets.dart';
// import 'package:flutter_final/app/modules/search_to/views/search_to.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class BusView extends StatefulWidget {
  const BusView({Key? key}) : super(key: key);

  @override
  _BusViewState createState() => _BusViewState();
}

const Color pColor = Color(0xFFEC2028);

class _BusViewState extends State<BusView> {
  String _message = "ຫຼວງພະບາງ";
  String name = "ໄຊຍະບູລີ";
  DateTime selectedDate = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      selectedDate = day;
    });
  }

  final FocusNode _focus = FocusNode();
  final FocusNode _focusN = FocusNode();

  @override
  void initState() {
    super.initState();

    _focus.addListener(_onFocusChange);
    _focusN.addListener(_onFocusChange2);
  }

  @override
  void dispose() {
    super.dispose();

    _focus.removeListener(_onFocusChange);
    _focus.dispose();

    _focusN.removeListener(_onFocusChange2);
    _focusN.dispose();
  }

  void _onFocusChange() {
    Get.offAllNamed('/search_to');
  }

  void _onFocusChange2() {
    Get.offAllNamed('/search_form');
  }

  var formatter = DateFormat.yMMMMEEEEd();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white60,
      body: Container(
        // color: Colors.white70,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/img-1.png"),
                    fit: BoxFit.cover,
                  ),
                  gradient: LinearGradient(
                    colors: [
                      pColor.withOpacity(0.8),
                      pColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeView()),
                                  );
                                },
                                child: const Icon(CupertinoIcons.chevron_left,
                                    color: Colors.white),
                              ),
                              const Icon(
                                CupertinoIcons.bus,
                                color: Colors.white,
                              )
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            margin: EdgeInsets.only(top: 130, bottom: 5),
                            width: MediaQuery.of(context).size.width,
                            height: 270,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: 10),
                                    _iconDestination(),
                                    SizedBox(width: 5),

                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return SizedBox(
                                                      height: 600,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                const Text(
                                                                  "ເລືອກສະຖານີຕົ້ນທາງ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child: Icon(
                                                                      Icons
                                                                          .close,
                                                                      size: 20),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      _message =
                                                                          'ຫຼວງພະບາງ';
                                                                      Navigator.pop(
                                                                          context);
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 100,
                                                                    height: 50,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                8),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.grey)),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        "ຫຼວງພະບາງ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      _message =
                                                                          'ເມືອງພຽງ';
                                                                      Navigator.pop(
                                                                          context);
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 100,
                                                                    height: 50,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                8),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.grey)),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        "ເມືອງພຽງ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      _message =
                                                                          'ເມືອງປາກລາຍ';
                                                                      Navigator.pop(
                                                                          context);
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 100,
                                                                    height: 50,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                8),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.grey)),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        "ເມືອງປາກລາຍ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                                height: 10),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      _message =
                                                                          'ເມືອງແກ່ນທ້າວ';
                                                                      Navigator.pop(
                                                                          context);
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 100,
                                                                    height: 50,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                8),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.grey)),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        "ເມືອງແກ່ນທ້າວ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      _message =
                                                                          'ເມືອງຫົງສາ';
                                                                      Navigator.pop(
                                                                          context);
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 100,
                                                                    height: 50,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                8),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.grey)),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        "ເມືອງຫົງສາ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      _message =
                                                                          'ເມືອງເງີນ';
                                                                      Navigator.pop(
                                                                          context);
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 100,
                                                                    height: 50,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                8),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.grey)),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        "ເມືອງເງີນ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                height: 10),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      _message =
                                                                          'ເມືອງຊຽງຮ່ອນ';
                                                                      Navigator.pop(
                                                                          context);
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 100,
                                                                    height: 50,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                8),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.grey)),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        "ເມືອງຊຽງຮ່ອນ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      _message =
                                                                          'ເມືອງຄອບ';
                                                                      Navigator.pop(
                                                                          context);
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 100,
                                                                    height: 50,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                8),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.grey)),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        "ເມືອງຄອບ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      _message =
                                                                          'ໂພນສະຫວັນ';
                                                                      Navigator.pop(
                                                                          context);
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 100,
                                                                    height: 50,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                8),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.grey)),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        "ໂພນສະຫວັນ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                height: 10),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      _message =
                                                                          'ເມືອງນານ';
                                                                      Navigator.pop(
                                                                          context);
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 100,
                                                                    height: 50,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                8),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.grey)),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        "ເມືອງນານ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      _message =
                                                                          'ເມືອງພູຄູນ';
                                                                      Navigator.pop(
                                                                          context);
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 100,
                                                                    height: 50,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                8),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.grey)),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        "ເມືອງພູຄູນ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      _message =
                                                                          'ເມືອງຊຽງເງີນ';
                                                                      Navigator.pop(
                                                                          context);
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 100,
                                                                    height: 50,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                8),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.grey)),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        "ເມືອງຊຽງເງີນ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      _message =
                                                                          'ວຽງຈັນ';
                                                                      Navigator.pop(
                                                                          context);
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 100,
                                                                    height: 50,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                8),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.grey)),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        "ວຽງຈັນ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      _message =
                                                                          'ວັງວຽງ';
                                                                      Navigator.pop(
                                                                          context);
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 100,
                                                                    height: 50,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                8),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.grey)),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        "ວັງວຽງ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      _message =
                                                                          'ກິວກະຈໍາ';
                                                                      Navigator.pop(
                                                                          context);
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 100,
                                                                    height: 50,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                8),
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.grey)),
                                                                    child:
                                                                        const Center(
                                                                      child:
                                                                          Text(
                                                                        "ກິວກະຈໍາ",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            // Additional widgets for your bottom sheet go here
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: RichText(
                                                text: TextSpan(
                                                  children: [
                                                    const TextSpan(
                                                      text: "ຈາກ \n",
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xFFFb7b7c5),
                                                          fontSize: 14),
                                                    ),
                                                    TextSpan(
                                                      text: "$_message",
                                                      style: const TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        GestureDetector(
                                          onTap: () {
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return SizedBox(
                                                  height: 1000,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                              "ເລືອກສະຖານີປາຍທາງ",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(); // Use Navigator.of(context)
                                                              },
                                                              child: const Icon(
                                                                  Icons.close,
                                                                  size: 20),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  name =
                                                                      'ໄຊຍະບູລີ';
                                                                  Navigator.pop(
                                                                      context);
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 100,
                                                                height: 50,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey)),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    "ໄຊຍະບູລີ",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  name =
                                                                      'ເມືອງພຽງ';
                                                                  Navigator.pop(
                                                                      context);
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 100,
                                                                height: 50,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey)),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    "ເມືອງພຽງ",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  name =
                                                                      'ເມືອງປາກລາຍ';
                                                                  Navigator.pop(
                                                                      context);
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 100,
                                                                height: 50,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey)),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    "ເມືອງປາກລາຍ",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  name =
                                                                      'ເມືອງແກ່ນທ້າວ';
                                                                  Navigator.pop(
                                                                      context);
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 100,
                                                                height: 50,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey)),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    "ເມືອງແກ່ນທ້າວ",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  name =
                                                                      'ເມືອງຫົງສາ';
                                                                  Navigator.pop(
                                                                      context);
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 100,
                                                                height: 50,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey)),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    "ເມືອງຫົງສາ",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  name =
                                                                      'ເມືອງເງີນ';
                                                                  Navigator.pop(
                                                                      context);
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 100,
                                                                height: 50,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey)),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    "ເມືອງເງີນ",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  name =
                                                                      'ເມືອງຊຽງຮ່ອນ';
                                                                  Navigator.pop(
                                                                      context);
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 100,
                                                                height: 50,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey)),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    "ເມືອງຊຽງຮ່ອນ",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  name =
                                                                      'ເມືອງຄອບ';
                                                                  Navigator.pop(
                                                                      context);
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 100,
                                                                height: 50,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey)),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    "ເມືອງຄອບ",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  name =
                                                                      'ໂພນສະຫວັນ';
                                                                  Navigator.pop(
                                                                      context);
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 100,
                                                                height: 50,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey)),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    "ໂພນສະຫວັນ",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  name =
                                                                      'ເມືອງນານ';
                                                                  Navigator.pop(
                                                                      context);
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 100,
                                                                height: 50,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey)),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    "ເມືອງນານ",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  name =
                                                                      'ເມືອງພູຄູນ';
                                                                  Navigator.pop(
                                                                      context);
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 100,
                                                                height: 50,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey)),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    "ເມືອງພູຄູນ",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  name =
                                                                      'ເມືອງຊຽງເງີນ';
                                                                  Navigator.pop(
                                                                      context);
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 100,
                                                                height: 50,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8),
                                                                    border: Border.all(
                                                                        color: const Color
                                                                            .fromARGB(
                                                                            255,
                                                                            201,
                                                                            188,
                                                                            188))),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    "ເມອງຊຽງເງີນ",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  name =
                                                                      'ວຽງຈັນ';
                                                                  Navigator.pop(
                                                                      context);
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 100,
                                                                height: 50,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey)),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    "ວຽງຈັນ",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  name =
                                                                      'ວັງວຽງ';
                                                                  Navigator.pop(
                                                                      context);
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 100,
                                                                height: 50,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey)),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    "ວັງວຽງ",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  name =
                                                                      'ກິວກະຈໍາ';
                                                                  Navigator.pop(
                                                                      context);
                                                                });
                                                              },
                                                              child: Container(
                                                                width: 100,
                                                                height: 50,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey)),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    "ກິວກະຈໍາ",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Column(
                                            children: <Widget>[
                                              RichText(
                                                text: TextSpan(
                                                    children: <TextSpan>[
                                                      const TextSpan(
                                                        text: "ຮອດ \n",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFFb7b7c5),
                                                            fontSize: 14),
                                                      ),
                                                      TextSpan(
                                                        text: "$name",
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),

                                    const SizedBox(width: 70),
                                    // _originAndDestionationIcon(),
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text("",
                                            style: TextStyle(fontSize: 25)),
                                        SizedBox(height: 15),
                                        Icon(Icons.swap_vert,
                                            color: Color(0xFFF00d5d8),
                                            size: 40),
                                        SizedBox(height: 15),
                                        Text("",
                                            style: TextStyle(fontSize: 25)),
                                      ],
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        // Removed extra parentheses here
                                        return SizedBox(
                                          height: 600,
                                          child: Center(
                                            child: TableCalendar(
                                              locale: "lo_LA",
                                              rowHeight: 43,
                                              headerStyle: const HeaderStyle(
                                                  formatButtonVisible: false,
                                                  titleCentered: true),
                                              availableGestures:
                                                  AvailableGestures.all,
                                              selectedDayPredicate: (day) =>
                                                  isSameDay(day, selectedDate),
                                              focusedDay: selectedDate,
                                              firstDay:
                                                  DateTime.utc(2010, 10, 16),
                                              lastDay:
                                                  DateTime.utc(2030, 3, 14),
                                              //
                                              onDaySelected:
                                                  (selectedDay, focusedDay) {
                                                // Update the selectedDate when a day is selected.
                                                setState(() {
                                                  selectedDate = selectedDay;
                                                });

                                                // Add your logic here when a day is selected.
                                                Navigator.pop(
                                                    context); // Dismiss the modal when a day is selected.
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "ເລືອກເວລາເດີນທາງ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFFFb7b7c5)),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "${formatter.format(selectedDate)}",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          const Icon(
                                            Icons.calendar_month,
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(),
                                GestureDetector(
                                  onTap: () {
                                    // Navigate to the "Home" screen when tapped
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Search_tickets()),
                                    );
                                  },
                                  child: Container(
                                    width: 280,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: <Color>[
                                          Colors.redAccent,
                                          Colors.orangeAccent,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    padding: EdgeInsets.all(16.0),
                                    child: const Text(
                                      "ກວດສອບປີ້",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "ຄົ້ນຫາລ້າສຸດຂອງທ່ານ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "ລົບທັງໝົດ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: 5),
                    Container(
                      height: 500,
                      child: Column(
                        children: [
                          const Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ໄຊຍະບູລີ "),
                                Text("-- "),
                                Text("ຫູວງພະບາງ "),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ItemTerbaru(
                                  image: "assets/images/img-6.png",
                                ),
                                ItemTerbaru(
                                  image: "assets/images/img-5.png",
                                ),
                                ItemTerbaru(
                                  image: "assets/images/img-6.png",
                                ),
                                ItemTerbaru(
                                  image: "assets/images/img-7.png",
                                ),
                                ItemTerbaru(
                                  image: "assets/images/img-8.png",
                                ),
                                ItemTerbaru(
                                  image: "assets/images/img-9.png",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/beranda.png"),
            ),
            label: "ໜ້າຫຼັກ",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/ticket.png"),
            ),
            label: "ປີ້ຂອງຂ້ອຍ",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/profile.png"),
              color: Color(0xFF3A5A98),
            ),
            label: "ບັນຊີຂອງຂ້ອຍ",
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeView()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Mytickests()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
        },
      ),
    );
  }
}

class ItemTerbaru extends StatelessWidget {
  ItemTerbaru({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: Get.width * 0.7,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ItemKategori extends StatelessWidget {
  ItemKategori({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          child: Image.asset(
            icon,
            // color: Color(0xFFF7B731),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class ItemNav extends StatelessWidget {
  ItemNav({
    Key? key,
    required this.status,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final bool status;
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30,
          child: Image.asset(
            (status == true)
                ? "assets/icons/$icon-active.png"
                : "assets/icons/$icon.png",
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Text(
              status ? "$title" : "$title",
              style: TextStyle(
                color: (status == true)
                    ? Color.fromARGB(255, 103, 32, 236)
                    : Color(0xFF747D8C),
              ),
            ),

            // Text(
            //   "ໜ້າຫຼັກ",
            //   style: TextStyle(
            //     color: (status == true)
            //         ? Color.fromARGB(255, 103, 32, 236)
            //         : Color(0xFF747D8C),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}

class StatusCard extends StatelessWidget {
  StatusCard({
    Key? key,
    required this.title,
    required this.data,
    required this.satuan,
  }) : super(key: key);

  final String title;
  final String data;
  final String satuan;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        width: Get.width * 0.25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            RichText(
              text: TextSpan(
                text: data,
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFFEC2028),
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: " $satuan",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF747D8C),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClipInfoClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width - 50, size.height);
    path.lineTo(size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

Widget _iconDestination() {
  return Container(
    child: Column(
      children: <Widget>[
        Icon(Icons.bus_alert, color: Color(0xFFF00d5d8), size: 30),
        Icon(Icons.fiber_manual_record, color: Color(0xFFF00d5d8), size: 12),
        Icon(Icons.fiber_manual_record, color: Color(0xFFF00d5d8), size: 12),
        Icon(Icons.fiber_manual_record, color: Color(0xFFF00d5d8), size: 12),
        Icon(Icons.fiber_manual_record, color: Color(0xFFFf89380), size: 12),
        Icon(Icons.fiber_manual_record, color: Color(0xFFFf89380), size: 12),
        Icon(Icons.fiber_manual_record, color: Color(0xFFFf89380), size: 12),
        Icon(Icons.location_on, color: Color(0xFFFf89380), size: 30),
      ],
    ),
  );
}
