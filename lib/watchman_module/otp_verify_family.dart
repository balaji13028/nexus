import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/models/apartment_model.dart';
import 'package:flutter_application/watchman_module/homepage_wm.dart';
import 'package:loader_overlay/loader_overlay.dart';


class OtpVerify  extends StatefulWidget {
  String apartmentNo;
  

  OtpVerify({Key? key,required this.apartmentNo}) : super(key: key);

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {

List<ApartmentData> details=flatList;

String num1='';

String num2='';

String num3='';

String num4='';

String num5='';


  @override
  Widget build(BuildContext context) {    
  Size size=MediaQuery.of(context).size;    
  return  
      GlobalLoaderOverlay(
       child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: true,
            backgroundColor: Colors.white,             
            leading:                                                                    
              IconButton(icon:const Icon(Icons.arrow_back_sharp,
                size: 30,
                color: Colors.black87,
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePageWM()));
              }
            ), 
          ), 
          resizeToAvoidBottomInset: false,
          body: 
            Container(  
                  padding: const EdgeInsets.only(top: 20),                                    
                   child: Stack(
                     children:[
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Column(   
                          mainAxisAlignment:MainAxisAlignment.start ,
                                                    
                           children:[ 
                              
                          SizedBox(height: size.height*0.03,),
                          Row(                             
                            children:const [
                              Padding(
                                padding: EdgeInsets.symmetric(),
                                child: Text('Enter the 5 digit OTP',
                                  style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ] 
                            ),
                          SizedBox(height: size.height*0.054,),
                          Form(
                            child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 SizedBox(
                                  height: 48,
                                   width: 48,
                                   child: TextFormField(
                                     style: Theme.of(context).textTheme.headline5,
                                     keyboardType: TextInputType.number,
                                     textAlign: TextAlign.center,
                                     inputFormatters: [
                                       LengthLimitingTextInputFormatter(1),
                                       FilteringTextInputFormatter.digitsOnly,
                                     ],
                                     decoration: InputDecoration(                                                                                        
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(6),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1.8                                    
                                              ),
                                            ),
                                             focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(6),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1.8  
                                              ),
                                            ),
                                          ),
                                      onChanged: ((value) {
                                       if(value.length == 1){
                                         FocusScope.of(context).nextFocus();
                                       }
                                       num1=value;
                                      }
                                   ),
                                   ),
                                 ),
                                 SizedBox(
                                   height: 48,
                                   width: 48, 
                                   child: TextFormField(
                                     style: Theme.of(context).textTheme.headline5,
                                     keyboardType: TextInputType.number,
                                     textAlign: TextAlign.center,
                                     inputFormatters: [
                                       LengthLimitingTextInputFormatter(1),
                                       FilteringTextInputFormatter.digitsOnly,
                                     ],
                                     decoration: InputDecoration(                                                                                        
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(6),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1.8                                    
                                              ),
                                            ),
                                             focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(6),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1.8  
                                              ),
                                            ),
                                          ),
                                      onChanged: ((value) {
                                       if(value.length == 1){
                                         FocusScope.of(context).nextFocus();
                                       }
                                       num2=value;
                                      }
                                   ),
                                 ),
                                 ),
                                 SizedBox(
                                  height: 48,
                                   width: 48,
                                   child: TextFormField(
                                     style: Theme.of(context).textTheme.headline5,
                                     keyboardType: TextInputType.number,
                                     textAlign: TextAlign.center,
                                     inputFormatters: [
                                       LengthLimitingTextInputFormatter(1),
                                       FilteringTextInputFormatter.digitsOnly,
                                     ],
                                     decoration: InputDecoration(                                                                                        
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(6),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1.8                                    
                                              ),
                                            ),
                                             focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(6),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1.8  
                                              ),
                                            ),
                                          ),
                                      onChanged: ((value) {
                                       if(value.length == 1){
                                         FocusScope.of(context).nextFocus();
                                       }
                                       num3=value;
                                      }
                                   ),
                                 ),
                                 ),
                                 SizedBox(
                                  height: 48,
                                   width: 48,
                                   child: TextFormField(
                                     style: Theme.of(context).textTheme.headline5,
                                     keyboardType: TextInputType.number,
                                     textAlign: TextAlign.center,
                                     inputFormatters: [
                                       LengthLimitingTextInputFormatter(1),
                                       FilteringTextInputFormatter.digitsOnly,
                                     ],
                                     decoration: InputDecoration(                                                                                        
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(6),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1.8                                    
                                              ),
                                            ),
                                             focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(6),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1.8  
                                              ),
                                            ),
                                          ),
                                      onChanged: ((value) {
                                       if(value.length == 1){
                                         FocusScope.of(context).nextFocus();
                                       }
                                       num4=value;
                                      }
                                   ),
                                 ),
                                 ),
                                 SizedBox(
                                  height: 48,
                                   width: 48,
                                   child: TextFormField(                      
                                     style: Theme.of(context).textTheme.headline5,
                                     keyboardType: TextInputType.number,
                                     textAlign: TextAlign.center,
                                     inputFormatters: [
                                       LengthLimitingTextInputFormatter(1),
                                       FilteringTextInputFormatter.digitsOnly,
                                     ],
                                     decoration: InputDecoration(                                                                                        
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(6),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1.8                                    
                                              ),
                                            ),
                                             focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(6),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1.8  
                                              ),
                                            ),
                                          ),
                                      onChanged: ((value) {
                                       
                                        num5=value;
                                       }
                                      ),
                                   ),
                                  ),
                                  
                                 ]
                               ),
                          ),
                          SizedBox(height:size.height*0.09),  
                          SizedBox(
                            height: size.height*0.458,
                            child: ListView.builder(
                              itemCount: details.length,
                              itemBuilder: (context,index){
                               if(details[index].flatno == widget.apartmentNo){
                              
                              return Column(
                                children: [
                                  Row(
                                    children: const [
                                      Text('Apartment Details',
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.indigo,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),  
                                  SizedBox(height: size.height*0.003,),
                                  Divider(
                                    color: Colors.grey.shade500,  
                             thickness: 1,         
                            
                              ), 
                                  SizedBox(height: size.height*0.014,),                                              
                            Row(               
                              children: [                                                                            
                                Column(                             
                                  crossAxisAlignment: CrossAxisAlignment.start,                 
                                 children:[                                                                                                           
                                    Icon(Icons.person,
                                    size: 20,
                                     color: Colors.indigo.shade300,
                                     ),
                                  ]
                                  ),
                                   SizedBox(width: size.width*0.08,),
                                  Column(
                                   
                                    children: const[
                                      Text('Name  ',
                                         style: TextStyle(
                                           fontSize: 16,
                                           color: Colors.black
                                         ),
                                         ),
                                    ]
                                  ),
                                   SizedBox(width: size.width*0.216,),
                                  Column(
                                   
                                    children: [
                                         Text(details[index].name!,                        
                                         style: const TextStyle(
                                         fontSize: 21,
                                         color: Colors.black,                          
                                    ),
                                    ),
                                    ],
                                  ),
                                    
                                  ],
                                ),
                              
                             SizedBox(height: size.height*0.013,),
                            Divider(
                             color: Colors.grey.shade400,           
                            
                              ),
                              Row(               
                              children: [                                                                            
                                Column(                             
                                  crossAxisAlignment: CrossAxisAlignment.start,                 
                                 children: [                                                                                                           
                                    Icon(Icons.call,
                                     size: 20,
                                     color: Colors.indigo.shade300,
                                     ),
                                  ]
                                  ),
                                   SizedBox(width: size.width*0.08,),
                                  Column(
                                   
                                    children: const[
                                      Text('Mobile No',
                                         style: TextStyle(
                                           fontSize: 16,
                                           color: Colors.black
                                         ),
                                         ),
                                    ]
                                  ),
                                   SizedBox(width: size.width*0.16,),
                                  Column(
                                   
                                    children:[
                                         Text(details[index].mobilenumber!,                        
                                         style:const TextStyle(
                                         fontSize: 21,
                                         color: Colors.black,                          
                                    ),
                                    ),
                                    ],
                                  ),
                                    
                                  ],
                                ),
                              
                             SizedBox(height: size.height*0.013,),
                            Divider(
                             color: Colors.grey.shade400,           
                            
                              ),
                             
                            
                        Row(               
                              children: [                                                                            
                                Column(                             
                                  crossAxisAlignment: CrossAxisAlignment.start,                 
                                 children: [                                                                                                           
                                    Icon(Icons.people,
                                     size: 20,
                                     color: Colors.indigo.shade300,
                                     ),
                                  ]
                                  ),
                                   SizedBox(width: size.width*0.08,),
                                  Column(
                                   
                                    children: const[
                                      Text('Apartment No ',
                                         style: TextStyle(
                                           fontSize: 16,
                                           color: Colors.black
                                         ),
                                         ),
                                    ]
                                  ),
                                   SizedBox(width: size.width*0.07,),
                                  Column(
                                   
                                    children: [
                                         Text(widget.apartmentNo,                        
                                         style:const TextStyle(
                                         fontSize: 21,
                                         color: Colors.black,                          
                                    ),
                                    ),
                                    ],
                                  ),
                                    
                                  ],
                                ),
                              
                             SizedBox(height: size.height*0.014,),
                            Divider(
                             color: Colors.grey.shade400,           
                            
                              ),
                             Row(               
                              children: [                                                                            
                                Column(                             
                                  crossAxisAlignment: CrossAxisAlignment.start,                 
                                 children: [                                                                                                           
                                    Icon(Icons.home,
                                     size: 20,
                                    color: Colors.indigo.shade300,
                                     ),
                                  ]
                                  ),
                                   SizedBox(width: size.width*0.08,),
                                  Column(
                                   
                                    children: const[
                                      Text('Block Name',
                                         style: TextStyle(
                                           fontSize: 16,
                                           color: Colors.black
                                         ),
                                         ),
                                    ]
                                  ),
                                   SizedBox(width: size.width*0.125,),
                                  Column(
                                   
                                    children: [
                                         Text(details[index].block!,                        
                                         style: const TextStyle(
                                         fontSize: 21,
                                         color: Colors.black,                          
                                        ),
                                       ),
                                      ],
                                     ),
                                    
                                   ],
                                ),
                        ]
                      );
                              }
                              // else{
                              //   return Row(
                              //     children: const [
                              //       Flexible(
                              //         child: Text('There is any one not resident in on this apartment no,so please entre correct apartment no')),
                              //     ],
                              //   );
                              // }
                              return const SizedBox(height: 5,);
                              }
                    ),
                          ), 
                    Align(
                      alignment: Alignment.bottomCenter,
                       child: TextButton(
                          onPressed: () async {                    
                              // //String num= await Verifyapi(num1, num2, num3, num4, num5,num);
                              //  //String role=await userRoleApi(widget.number);                                                                                          
                              },                                                                                                                                      
                              child:  Container( 
                                   height: size.height*0.065,                                                                                                                                                                                                         
                                   decoration:BoxDecoration( 
                                   borderRadius: BorderRadius.circular(2),                                                                                                                                
                                   color:const Color.fromRGBO(39, 105, 170, 1)),
                                   alignment: Alignment.center,
                                   child: const Text(                                                                        
                                          'Verify',
                                          style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          letterSpacing: 0.9,
                                          fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                       ),
                                ), 
                           ),
                       ), 
                    ]
                  ),
              ),
                     ]
            )  
            )
      ),
     
    );
  }
}