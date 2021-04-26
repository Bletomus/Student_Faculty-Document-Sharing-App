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
    return ConstrainedBox
    (
      constraints: BoxConstraints.expand(height: 50,width: double.infinity),
      child: Card
      (
          child: Row
          (
            mainAxisAlignment: MainAxisAlignment.start,
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
                  width:50,
                  height:50,
                  child:SvgPicture.asset('assets/icons/down_arrow.svg'),
                ),
              ),
              Flexible(

                  child: upload.fileName.length > 25 ? Marquee(text: upload.fileName + "      ",style:TextStyle(fontFamily: "Poppins",color: ConstantVariables.headingTextColor,fontSize: ConstantVariables.singleHeaderSize),): Align(alignment: Alignment.centerLeft,child: Text.rich(TextSpan(text: upload.fileName,style: TextStyle(color: ConstantVariables.headingTextColor,fontSize: ConstantVariables.singleHeaderSize,fontFamily: "Poppins"),),textAlign: TextAlign.left),),
              ),
            ],
          ),
      ),
    );
  }

}