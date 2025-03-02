import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProdAndConsWidget extends StatelessWidget {
  const ProdAndConsWidget({super.key, required this.pros, required this.cons});

  final List<dynamic> pros;

  final List<dynamic> cons;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(229, 231, 235, 1)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pros and Cons',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Color.fromRGBO(2, 6, 23, 1),
            ),
          ),
          SizedBox(height: 20),

          Text(
            'Pros',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color.fromRGBO(21, 128, 61, 1),
            ),
          ),
          SizedBox(height: 30),
          ...List.generate(
            pros.length,
            (int index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(22, 163, 74, 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check,
                      color: Color.fromRGBO(18, 129, 61, 1),
                    ),
                  ),
                  SizedBox(width: 30),
                  Flexible(
                    child: Text(
                      pros[index].toString(),
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color.fromRGBO(54, 65, 83, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )..toList(),
          SizedBox(height: 30),
          Text(
            'Cons',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color.fromRGBO(180, 83, 9, 1),
            ),
          ),
          SizedBox(height: 30),
          ...List.generate(
            cons.length,
            (int index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(217, 119, 6, 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '!',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color.fromRGBO(217, 119, 6, 1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  Flexible(
                    child: Text(
                      pros[index].toString(),
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color.fromRGBO(54, 65, 83, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )..toList(),
        ],
      ),
    );
  }
}
