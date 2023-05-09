import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//  handles going to a new page and back
Future goToNextPageAndBack(BuildContext context, String nextPage) {
  return GoRouter.of(context).pushNamed(nextPage);
}


void popPageFromStack(BuildContext context){
  return GoRouter.of(context).pop();
}


void goToPageAndRemoveFromStack(BuildContext context, String locationPage) {
  return GoRouter.of(context).pushReplacementNamed(locationPage);
}
