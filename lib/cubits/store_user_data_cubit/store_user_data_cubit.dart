import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:register_app/models/user_data_model.dart';

part 'store_user_data_state.dart';

class StoreUserDataCubit extends Cubit<StoreUserDataState> {
  StoreUserDataCubit() : super(StoreUserDataInitial());
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser({required UserDataModel userDateModel}) async {
    emit(StoreUserDataLoading());
    try {
      // Call the user's CollectionReference to add a new user
      await users.add({
        'full_name': userDateModel.name, // e.g., John Doe
        'email': userDateModel.email, // e.g., Stokes and Sons
        'password': userDateModel.password, // e.g., 42
        'created_at':
            FieldValue.serverTimestamp(), // Optional: track creation time
      });
      emit(
          StoreUserDataSuccess()); // You can emit a state if needed to notify success
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
