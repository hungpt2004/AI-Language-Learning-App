import 'package:carenet_attendance_app/core/api-type/apiListResponse.dart';
import 'package:carenet_attendance_app/core/api-type/apiSingleResponse.dart';
import 'package:carenet_attendance_app/core/exception/app_exception_handler.dart';
import 'package:carenet_attendance_app/core/exception/app_exception_type.dart';
import 'package:carenet_attendance_app/core/network/dio_client.dart';
import 'package:carenet_attendance_app/features/authentication/data/datasources/authLocalDataImpl.dart';
import 'package:carenet_attendance_app/features/authentication/data/datasources/authenticationRemoteDataSource.dart';
import 'package:carenet_attendance_app/features/authentication/data/entities/user.entity.dart';
import 'package:dio/dio.dart';

class Authenticationremotedatasourceimpl
    implements Authenticationremotedatasource {
  final AuthlocaldataImpl authlocaldataImpl;
  final Dio publicDio;
  late final Dio privateDio;

  Authenticationremotedatasourceimpl(this.authlocaldataImpl)
    : publicDio = DioClient.createPublicDio() {
    privateDio = DioClient.createPrivateDio(() => authlocaldataImpl.getToken());
  }

  @override
  Future<List<User>> findAllUsers() async {
    try {
      await Future.delayed(Duration(seconds: 500));
      var response = await publicDio.get('/volunteer/all-users');
      // Response data -> status & data

      // Sử dụng ApiListResponse để parse phần response
      final apiParseResponse = ApiListResponse<User>.fromJson(
        response.data,
        (json) => User.fromJson(json),
      );

      print('Danh sách user: ${apiParseResponse.data}');

      // Kiểm tra status => trả về danh sách user
      if (apiParseResponse.status.toLowerCase() == 'success') {
        return apiParseResponse.data;
      } else {
        throw ServerException(
          errorMessage: 'Lỗi lấy danh sách users',
          code: 'Lỗi server',
        );
      }
    } on DioException catch (error) {
      throw ExceptionHandler.handleDioException(error);
    } catch (error) {
      throw ServerException(errorMessage: error.toString(), code: 'Lỗi server');
    }
  }

  @override
  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await Future.delayed(Duration(seconds: 500));

      // Api lấy kết quả từ API
      var response = await publicDio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      // Lấy phần data trong response.data
      // final userData = response.data['data'];

      // Sử dụng ApiListResponse để parse phần response
      final apiParseResponse = ApiSingleResponse<User>.fromJson(
        response.data,
        (json) => User.fromJson(json),
      );

      // Kiểm tra status
      if (apiParseResponse.status.toLowerCase() == 'success') {
        final user = apiParseResponse.data;

        // Kiểm tra access token
        if (user.accessToken != null && user.accessToken!.isNotEmpty) {
          print('Access Token trng Remote Data : ${user.accessToken}');
          await authlocaldataImpl.saveToken(user.accessToken!);
        }
        return user;

      } else {
        throw AuthException(
          errorMessage: 'Đăng nhập lỗi',
          code: 'LOGIN_FAILED',
        );
      }

    } on DioException catch (error) {
      throw ExceptionHandler.handleDioException(error);
    } catch (error) {
      throw AuthException(
        errorMessage: error.toString(),
        code: 'Lỗi đăng nhập',
      );
    }
  }

}
