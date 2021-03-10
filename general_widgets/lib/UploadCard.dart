import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marquee/marquee.dart';
import 'package:models/Uploads.dart';
import 'package:app_constants/ThemeConstants.dart';
class UploadCard extends StatelessWidget
{
  final Uploads upload;
  UploadCard({Key key, this.upload,}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return Container
    (
      child: Card
      (
          child: Row
          (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children:
            <Widget>
            [
              Align
              (
                alignment: Alignment.topLeft,
                child:
                SizedBox
                (
                  width:100,
                  height:100,
                  child:SvgPicture.asset('assets/icons/document.svg'),
                ),
              ),
              Align
                (
                alignment: Alignment.topRight,
                child:SizedBox
                  (
                  width: 100,
                  height: 100,
                  child: Align(alignment: Alignment.topRight,child:Marquee(text: upload.fileName + "      ",style:TextStyle(fontFamily: "Poppins",color: ConstantVariables.headingTextColor,fontSize: ConstantVariables.singleHeaderSize),),),
                ),
              ),

              Align
              (
                alignment: Alignment.topRight,
                child:SizedBox
                  (
                  width: 100,
                  height: 100,
                  child: Align(alignment: Alignment.topRight,child:SvgPicture.asset('assets/icons/down_arrow.svg')),
                ),
              ),
            ],
          ),
      ),
    );
  }

}