import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/components/components.dart';
import 'package:social_app/cubit/cubit.dart';
import 'package:social_app/cubit/states.dart';
import 'package:social_app/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: SizeConfig.scaleHeight(200),
            child: Card(
              elevation: 10,
              margin: EdgeInsets.all(SizeConfig.scaleHeight(8)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Image.network(
                    'https://img.freepik.com/free-photo/contemplative-female-looks-seriously-pensively-aside-purses-lips-concentrated-dressed-green-loose-jumper-makes-choice-mind_273609-34206.jpg',
                    fit: BoxFit.cover,
                    height: SizeConfig.scaleHeight(200),
                    width: double.infinity,
                  ),
                  Padding(
                    padding: EdgeInsets.all(SizeConfig.scaleHeight(8)),
                    child: Text(
                      'Communicate with friends now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.scaleTextFont(14),
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          BlocConsumer<SocialCubit, SocialState>(
            listener: (context, state) {},
            builder: (context, state) {
              var height = MediaQuery.of(context).size.height -
                  SizeConfig.scaleHeight(330);
              var cubit = SocialCubit.get(context);

              if (cubit.likes.length > 0) {

                  return Column(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return buildPostItem(
                            cubit.posts[index],
                            userImage: cubit.user.image ?? '',
                            likes: ' ${cubit.likes[index]}',
                            commentFunction: () {},
                            likeFunction: () {
                              cubit.likePost(cubit.postsId[index]);
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: SizeConfig.scaleHeight(5),
                          );
                        },
                        itemCount: cubit.posts.length,
                      ),
                    ],
                  );



              }else{
                return SizedBox(height: height,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

            },
          ),
        ],
      ),
    );
  }
}

/*
    if (cubit.likes.length > 0) {
                  return Column(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return buildPostItem(

                            cubit.posts[index],
                            userImage: cubit.user.image ?? '',
                            likes:' ${cubit.likes[index]}',
                            commentFunction: (){},
                            likeFunction: (){
                              cubit.likePost(cubit.postsId[index]);
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: SizeConfig.scaleHeight(5),
                          );
                        },
                        itemCount: cubit.posts.length,
                      ),
                    ],
                  );
                } else{
                  return SizedBox(
                    height: height,
                    child: Center(
                      child: Text(
                        'Post Is Empty',
                        style: TextStyle(
                          fontSize: SizeConfig.scaleTextFont(22),
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                }

 */
