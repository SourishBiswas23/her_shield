import 'package:bloc/bloc.dart';
import 'package:hackathon_project/controllers/page_changer_bloc/page_changer_bloc.dart';
import 'package:hackathon_project/utils/display_snack_bar.dart';
import 'package:hackathon_project/utils/grant_permissions.dart';
import 'package:meta/meta.dart';

part 'permissions_event.dart';
part 'permissions_state.dart';

class PermissionsBloc extends Bloc<PermissionsEvent, PermissionsState> {
  PermissionsBloc({required PageChangerBloc pageChangerBloc})
      : _pageChangerBloc = pageChangerBloc,
        super(PermissionsInitial()) {
    on<GrantAllPermissionsEvent>(
      (event, emit) async {
        final bool permisisonsArePermanentlyDenied =
            await _grantPermissions.checkIfPermissionsArePermanentlyDenied();
        if (permisisonsArePermanentlyDenied) {
          DisplaySnackBar().displaySnackBar(
            message:
                'Some permissions are permanently denied. Please manually enable the permissions in the app settings',
          );
        } else {
          await _grantPermissions.grantAllPermissions();
          if (!_grantPermissions.allPermissionsGranted) {
            DisplaySnackBar().displaySnackBar(
              message: 'We need these permissions for functioning properly',
            );
          } else {
            _pageChangerBloc.add(AllPermissionsGrantedEvent());
          }
        }
      },
    );
  }
  final GrantPermissions _grantPermissions = GrantPermissions();
  final PageChangerBloc _pageChangerBloc;
}
