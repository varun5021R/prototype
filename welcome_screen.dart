import 'package:flutter/material.dart';
import 'role_selection_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.directions_bus, color: Colors.orange[700], size: 36),
                      SizedBox(width: 8),
                      RichText(
                          text: TextSpan(
                              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue[900]),
                              children: [
                                TextSpan(text: "Campus"),
                                TextSpan(text: "Wheels", style: TextStyle(color: Colors.orange[700]))
                              ]))
                    ],
                  ),
                  Text("Your Journey, On Track.", style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                  SizedBox(height: 32),
                  Container(
                    height: 160,
                    child: Icon(Icons.people_alt, size: 120, color: Colors.orange[300]),
                  ),
                  SizedBox(height: 22),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 14, spreadRadius: -12, offset: Offset(0, 8))]
                    ),
                    child: Column(
                      children: [
                        Text('Welcome!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue[900])),
                        SizedBox(height: 4),
                        Text('Get real-time bus info.', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                        SizedBox(height: 18),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange[700],
                            minimumSize: Size(double.infinity, 46),
                            shape: StadiumBorder(),
                            elevation: 0,
                          ),
                          child: Text('Track Buses as Guest', style: TextStyle(fontSize: 15)),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const RoleSelectionScreen()));
                          },
                        ),
                        SizedBox(height: 12),
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                minimumSize: Size(double.infinity, 46),
                                side: BorderSide(color: Colors.blue[900]!),
                                foregroundColor: Colors.blue[900],
                                shape: StadiumBorder()
                            ),
                            child: Text('Log In / Sign Up', style: TextStyle(fontSize: 15)),
                            onPressed: () {
                              // TODO: Implement login/sign-up navigation
                            }),
                        SizedBox(height: 6),
                        GestureDetector(
                          onTap: () {
                            // TODO: Navigate to driver/admin login
                          },
                          child: Text("Are you a driver or admin? log in here",
                              style: TextStyle(fontSize: 13, color: Colors.orange[700], decoration: TextDecoration.underline)),
                        )
                      ],
                    ),
                  )
                ],
              )
          )
      ),
    );
  }
}
