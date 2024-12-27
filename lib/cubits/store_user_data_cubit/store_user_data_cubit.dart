import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'store_user_data_state.dart';

class StoreUserDataCubit extends Cubit<StoreUserDataState> {
  StoreUserDataCubit() : super(StoreUserDataInitial());
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
}
