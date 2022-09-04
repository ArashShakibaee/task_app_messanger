import 'package:diaco/Model/custom_error.dart';
import 'package:diaco/Model/delete_message.dart';
import 'package:diaco/Model/edit_messages.dart';
import 'package:diaco/Model/get_list.dart';
import 'package:diaco/Model/post_message.dart';
import 'package:diaco/exceptions/diaco_exception.dart';
import 'package:diaco/server/diaco_api_services.dart';

class DiacoRepositories {
  final DiacoApiServices diacoApiServices;
  DiacoRepositories({
    required this.diacoApiServices,
  });

  Future<GetList> fetchList() async {
    try {
      final GetList getList = await diacoApiServices.getListOfMessages();
      return getList;
    } on DiacoException catch (e) {
      throw CustomError(errorMsg: e.msg);
    } catch (e) {
      throw CustomError(errorMsg: e.toString());
    }
  }

  Future<GetList> fetchPost(PostMessage model) async {
    try {
      final GetList getList = await diacoApiServices.setListOfMessages(model);
      return getList;
    } on DiacoException catch (e) {
      throw CustomError(errorMsg: e.msg);
    } catch (e) {
      throw CustomError(errorMsg: e.toString());
    }
  }

  Future<GetList> fetchDelete(DeleteMessage model) async {
    try {
      final GetList getList = await diacoApiServices.deleteMessages(model);
      return getList;
    } on DiacoException catch (e) {
      throw CustomError(errorMsg: e.msg);
    } catch (e) {
      throw CustomError(errorMsg: e.toString());
    }
  }

  Future<GetList> fetchUpdate(EditMessage model) async {
    try {
      final GetList getList = await diacoApiServices.updateMessages(model);
      return getList;
    } on DiacoException catch (e) {
      throw CustomError(errorMsg: e.msg);
    } catch (e) {
      throw CustomError(errorMsg: e.toString());
    }
  }
}
