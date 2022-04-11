import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/layout/HomePage.dart';
import 'package:graduation_project/shared/components/componenets.dart';

class ChatBot extends StatefulWidget {
  //const ChatBot({Key? key}) : super(key: key);

  @override
  _ChatBotState createState() => _ChatBotState();
}
bool x=false;
bool v1 = false;
bool v1A = false;
bool v11 = false;
bool v11A = false;
bool v12 = false;
bool v12A = false;
bool v2 = false;
bool v2A = false;
bool v21 = false;
bool v21A = false;
bool v22 = false;
bool v22A = false;
bool v23 = false;
bool v23A = false;
bool v211=false;
bool v211A=false;
bool v212=false;
bool v212A=false;
bool v213=false;
bool v213A=false;
bool v221=false;
bool v221A=false;
bool v222=false;
bool v222A=false;
bool d221=false;
bool d221A=false;
bool d222=false;
bool d222A=false;
bool v3 = false;
bool v3A = false;
bool v31 = false;
bool v31A = false;
bool v4 = false;
bool v4A = false;
bool GS=true;
bool GSA=false;
final dataKey = new GlobalKey();
class _ChatBotState extends State<ChatBot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(60) ,
        child: AppBar(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle( statusBarBrightness: Brightness.light,),
          automaticallyImplyLeading: false,
          title: Text("ChatBot", style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,

          ),),
          //centerTitle: true,
          backgroundColor: Color.fromRGBO(42,65,88, 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight:Radius.circular(10),bottomLeft:Radius.circular(10) ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
                setState(() {
                  x=false;
                  v1 = false;
                  v1A = false;
                  v11 = false;
                  v11A = false;
                  v12 = false;
                  v12A = false;
                  v2 = false;
                  v2A = false;
                  v21 = false;
                  v21A = false;
                  v22 = false;
                  v22A = false;
                  v23 = false;
                  v23A = false;
                  v211=false;
                  v211A=false;
                  v212=false;
                  v212A=false;
                  v213=false;
                  v213A=false;
                  v221=false;
                  v221A=false;
                  v222=false;
                  v222A=false;
                  d221=false;
                  d221A=false;
                  d222=false;
                  d222A=false;
                  v3 = false;
                  v3A = false;
                  v31 = false;
                  v31A = false;
                  v4 = false;
                  v4A = false;
                  GS=true;
                  GSA=false;
                });
              },
                icon:const Icon(Icons.home_rounded),
                color: Colors.white,
                iconSize: 35,


              ),
            ),


          ],
        ),
      ),
      body:SingleChildScrollView(
        //controller: _controller,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              Visibility(
                visible: GS,
                child: send(
                  message: 'GET START',
                  function:(){
                    setState(() {
                      GSA=true;
                      v1=true;
                      v2=true;
                      v3=true;
                      v4=true;
                    });
                    return[GSA,v1,v2,v3,v4];
                  },
                ),
              ), //get started
              Visibility(
                visible: GSA,
                child: Answer(
                    message: 'Hello There! \nHow can I help you?'
                ),

              ), //

              Visibility(
                visible: v1,
                child:send(
                  message: 'What is color blindness?',
                  function:(){

                    setState(() {
                      v1A=true;
                      v11=true;
                      v12=true;
                      x=true;
                    });
                    return [v1A,v11,v12];
                  },
                ),

              ), //Q1
              Visibility(
                visible: v1A,
                child: Answer(
                    message: 'Color blindness occurs when you are unable to see colors in a normal way.\nIt is also known as color deficiency. Color blindness often happens when someone cannot distinguish between certain colors. \nThis usually happens between greens and reds, and occasionally blues.'
                ),

              ), //Q1ANSWER

              Visibility(
                visible: v11,
                child:send(
                  message:'Causes of color blindness',
                  function:(){
                    setState(() {
                      v11A=true;
                      v12=false;
                    });
                    return[v11A,v12];
                  },
                ),

              ), //Q1.1
              Visibility(
                visible: v11A,
                child: Answer(
                    message: 'Usually, genes inherited from your parents cause faulty photopigments -- molecules that detect color in the cone-shaped cells, or “cones,” in your retina.\nBut sometimes color blindness is not because of your genes, but rather because of: \nPhysical or chemical damage to the eye \nDamage the optic nerve \nDamage to parts of the brain that process color information \nCataract -- a clouding of the eye’s lens Age'
                ),

              ), //Q1.1ANSWER

              Visibility(
                visible: v12,
                child:send(
                  message:'Color blindness symptoms ',
                  function:(){
                    setState(() {
                      v12A=true;
                      v11=false;
                    });
                    return[v12A,v11];
                  },
                ),

              ), //Q1.2
              Visibility(
                visible: v12A,
                child: Answer(
                    message: 'The main symptom of color blindness is difficulty telling colors apart or making mistakes when identifying colors. \nPeople with color blindness may not be able to tell the difference between:\n Shades of colors, especially shades of red and green or shades of green and blue\nThe brightness of colors\nIn rare cases, people with severe color blindness may also experience symptoms such as nystagmus (rapid, uncontrollable eye movements) or sensitivity to light.'
                ),



              ), //Q1.2ANSWER

              Visibility(
                visible: v2,
                child:send(
                  message:
                  'Types of color blindness',
                  function:(){
                    setState(() {
                      x=true;
                      v2A=true;
                      v21=true;
                      v22=true;
                      v23=true;
                    });
                    if (v1A==false){
                      setState(() {
                        v1=false;
                      });
                    }
                    if (v12A==false){
                      setState(() {
                        v12=false;
                      });
                    }
                    if (v11A==false){
                      setState(() {
                        v11=false;
                      });
                    }
                    return[v2A,v21,v22,v23,v1,v12,v11];

                  },
                ),

              ), //Q2
              Visibility(
                visible: v2A,
                child: Answer(
                    message: 'There are seven official diagnoses of color blindness: four different types of color blindness fall in the red-green category, two are in the blue-yellow spectrum and one version describes a type of vision completely lacking in color.'
                ),



              ), //Q2ANSWER

              Visibility(
                visible: v21,
                child:send(
                  message:
                  'Red-green color blindness',
                  function:(){
                    setState(() {
                      v21A=true;
                      v211=true;
                      v212=true;
                    });
                    if (v22A==false){
                      setState(() {
                        v22=false;
                      });
                    }
                    if (v23A==false){
                      setState(() {
                        v23=false;
                      });
                    }
                    return[v21A,v211,v212,v22,v23];
                  },
                ),

              ), //q2.1
              Visibility(
                visible: v21A,
                child: Answer(
                    message: 'The most common type of color blindness makes it hard to tell the difference between red and green.'
                ),



              ), //q2.1answer

              Visibility(
                visible: v211,
                child:send(
                  message:
                  'Deuteranomaly',
                  function:(){
                    setState(() {
                      v211A=true;
                      v212=false;
                      v213=false;
                    });
                    return[v211A,v212,v213];
                  },
                ),

              ), //q2.1.1
              Visibility(
                visible: v211A,
                child: Answer(
                    message: 'Deuteranomaly (aka green-weak) is the most common type of red-green color blindness. It makes the green look more red.'
                ),



              ),//q2.1.1 answer

              Visibility(
                visible: v212,
                child:send(
                  message:
                  'Protanomaly',
                  function:(){
                    setState(() {
                      v212A=true;
                      v211=false;
                      v213=false;
                    });
                    return[v212A,v211,v213];
                  },
                ),

              ), //Q2.1.2
              Visibility(
                visible: v212A,
                child: Answer(
                    message: 'Protanomaly (aka red-weak) makes red look more green and less bright.'
                ),

              ),

              Visibility(
                visible: v213,
                child:send(
                  message: 'Protanopia and Deuteranopia',

                  function:(){
                    setState(() {
                      v213A=true;
                      v211=false;
                      v212=false;
                    });
                    return[v213A,v211,v212];
                  },
                ),
              ), //q2.1.3
              Visibility(
                visible: v213A,
                child: Answer(
                    message: 'Protanopia and deuteranopia both make you unable to tell the difference between red and green at all.'
                ),
              ),

              Visibility(
                visible: v22,
                child:send(
                  message: 'Blue-yellow color blindness',
                  function:(){
                    setState(() {
                      v22A=true;
                      v221=true;
                      v222=true;

                    });
                    if (v21A==false){
                      setState(() {
                        v21=false;
                      });
                    }
                    if (v23A==false){
                      setState(() {
                        v23=false;
                      });
                    }
                    return[v22A,v221,v222,v21,v23];
                  },
                ),

              ), //q2.2
              Visibility(
                visible: v22A,
                child: Answer(
                    message: 'This less-common type of color blindness makes it hard to tell the difference between blue and green, and between yellow and red.'
                ),
              ),

              Visibility(
                visible: v221,
                child:send(
                  message: 'Tritanomaly',
                  function:(){
                    setState(() {
                      v221A=true;
                      v222=false;

                    });
                    return[v221A,v222];
                  },
                ),

              ), //q2.2.1
              Visibility(
                visible: v221A,
                child: Answer(
                    message:  'Tritanomaly makes it hard to tell the difference between blue and green, and between yellow and red.'
                ),

              ),

              Visibility(
                visible: v222,
                child:send(
                  message: 'Tritanopia',
                  function:(){
                    setState(() {
                      v222A=true;
                      v221=false;
                    });
                    return[v222A,v221];
                  },
                ),

              ), //q2.2.2
              Visibility(
                visible: v222A,
                child: Answer(
                    message: 'Tritanopia makes you unable to tell the difference between blue and green, purple and red, and yellow and pink. It also makes colors look less bright.'
                ),

              ),

              Visibility(
                visible: v23,
                child:send(
                  message: 'Complete color blindness ',
                  function:(){
                    setState(() {
                      v23A=true;
                    });
                    if (v21A==false){
                      setState(() {
                        v21=false;
                      });
                    }
                    if (v22A==false){
                      setState(() {
                        v22=false;
                      });
                    }
                    return[v23A,v21,v22];
                  },
                ),

              ), //q2.3
              Visibility(
                visible: v23A,
                child: Answer(
                    message: 'If you have complete color blindness, you can’t see colors at all. This is also called monochromacy, and it’s quite uncommon.\n Depending on the type, you may also have trouble seeing clearly and you may be more sensitive to light.'
                ),



              ),

              Visibility(
                visible: v3,
                child:send(
                  message: 'Cures of color blindness',
                  function:(){
                    setState(() {
                      x=true;
                      v3A=true;
                      v31=true;
                    });
                    if (v1A==false){
                      setState(() {
                        v1=false;
                      });
                    }
                    if (v2A==false){
                      setState(() {
                        v2=false;
                      });
                    }
                    if (v21A==false){
                      setState(() {
                        v21=false;
                      });
                    }
                    if (v22A==false){
                      setState(() {
                        v22=false;
                      });
                    }
                    if (v23A==false){
                      setState(() {
                        v23=false;
                      });
                    }
                    if (v11A==false){
                      setState(() {
                        v11=false;
                      });
                    }
                    if (v12A==false){
                      setState(() {
                        v12=false;
                      });
                    }
                    return[v3A,v31,v1,v2,v3,v21,v22,v23,v11,v12];

                  },
                ),

              ), //q3
              Visibility(
                visible: v3A,
                child: Answer(
                    message: 'There are no treatments for most types of color vision difficulties, unless the color vision problem is related to the use of certain medicines or eye conditions. Discontinuing the medication causing your vision problem or treating the underlying eye disease may result in better color vision.Wearing a colored filter over eyeglasses or a colored contact lens may enhance your perception of contrast between the confused colors. But such lenses wont improve your ability to see all colors.'
                ),

              ),

              Visibility(
                visible: v31,
                child:send(
                  message: 'About EnChroma',

                  function:(){
                    setState(() {
                      v31A=true;
                      d222=true;
                      d221=true;
                    });
                    return[v31A,d221,d222];
                  },

                ),

              ), //q3.1
              Visibility(
                visible: v31A,
                child: Answer(
                    message: 'EnChroma glasses are designed to improve color vision of people with forms of anomalous trichromacy, which are estimated to comprise four out of five cases of color blindness. The most common types are Protanomaly and Deuteranomaly, which are forms of partial red-green color blindness. '
                ),

              ),

              Visibility(
                visible: d221,
                child:send(
                  message: 'Deuteranomaly',
                  function:(){
                    setState(() {
                      d221A=true;
                      d222=false;

                    });
                    return[d221A,d222];
                  },
                ),

              ), //q2.2.1
              Visibility(
                visible: d221A,
                child: Answer(
                    message:  'Tritanomaly makes it hard to tell the difference between blue and green, and between yellow and red.'
                ),

              ),

              Visibility(
                visible: d222,
                child:send(
                  message: 'Protanomaly',

                  function:(){
                    setState(() {
                      d222A=true;
                      d221=false;

                    });
                    return[d222A,d221];
                  },
                ),

              ), //q2.2.2
              Visibility(
                visible: v212A,
                child: Answer(
                    message: 'Protanomaly (aka red-weak) makes red look more green and less bright.'
                ),



              ),

              Visibility(
                visible: v4,
                key: dataKey,
                child:send(
                  message: 'About color blindness test',

                  function:(){
                    setState(() {
                      x=true;
                      v4A=true;
                    });
                    if (v1A==false){
                      setState(() {
                        v1=false;
                      });
                    }
                    if (v2A==false){
                      setState(() {
                        v2=false;
                      });
                    }
                    if (v3A==false){
                      setState(() {
                        v3=false;
                      });
                    }
                    if (v31A==false){
                      setState(() {
                        v31=false;
                      });
                    }
                    if (v21A==false){
                      setState(() {
                        v21=false;
                      });
                    }
                    if (v22A==false){
                      setState(() {
                        v22=false;
                      });
                    }
                    if (v23A==false){
                      setState(() {
                        v23=false;
                      });
                    }
                    if (v11A==false){
                      setState(() {
                        v11=false;
                      });
                    }
                    if (v12A==false){
                      setState(() {
                        v12=false;
                      });
                    }
                    if (d221A==false){
                      setState(() {
                        d221=false;
                      });
                    }
                    if (d222A==false){
                      setState(() {
                        d222=false;
                      });
                    }
                    return[v4A,v1,v2,v3,v31,v21,v22,v23,v11,v12,d221,d222];

                  },
                ),

              ), //q4
              Visibility(
                visible: v4A,
                child: Answer(
                    message: 'A color vision test, also known as the Ishihara color test, measures your ability to tell the difference among colors. If you don’t pass this test, you may have poor color vision, or your doctor may tell you that you’re color blind. However, being truly color blind is a very rare condition in which you’re only able to see shades of gray.\nIf you wear glasses or contact lenses, you should continue to wear them during the exam.'

                ),

              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Visibility(
          visible: x,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              new FloatingActionButton(
                mini: true,
                backgroundColor: Color.fromRGBO(112, 128, 144, 1.0),
                onPressed: () => Scrollable.ensureVisible(dataKey.currentContext),
                child: Icon(
                  Icons.keyboard_arrow_down_outlined,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

