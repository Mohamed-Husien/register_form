import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:register_app/models/user_data_model.dart';

part 'store_user_data_state.dart';

class StoreUserDataCubit extends Cubit<StoreUserDataState> {
  StoreUserDataCubit() : super(StoreUserDataInitial());

  Future<void> addUser({required UserDataModel userDateModel}) async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    emit(StoreUserDataLoading());
    try {
      await users.add({
        'full_name': userDateModel.name,
        'email': userDateModel.email,
        'password': userDateModel.password,
        'created_at': FieldValue.serverTimestamp(),
      });
      emit(StoreUserDataSuccess());
    } catch (e) {
      // Handle errors if needed
      emit(
        StoreUserDataFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
