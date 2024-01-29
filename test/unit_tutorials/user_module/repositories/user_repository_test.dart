import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
// import 'package:tutorials_testing/unit_tutorials/counter.dart';
import 'package:tutorials_testing/unit_tutorials/user_module/models/user_model.dart';
import 'package:tutorials_testing/unit_tutorials/user_module/repositories/user_repository.dart';

class MockHTTPClinet extends Mock implements Client {}

void main() {
  group("UserRepository -", () {
    late MockHTTPClinet mockHTTPClinet;
    late UserRepository userRepository;
    setUpAll(() {
      mockHTTPClinet = MockHTTPClinet();
      userRepository = UserRepository(mockHTTPClinet);
      // userRepository = UserRepository(Client());
    });
    group("getUser function", () {
      //give when then
      test(
          "give UserRepository class when getUser function is called and status is 200 then usermodel should be returned  ",
          () async {
        //Arrange  
        //Here  if we need to change behavior of method by using mock
        when(()=>mockHTTPClinet.get( Uri.parse('https://jsonplaceholder.typicode.com/users/1')))
        .thenAnswer((invocation) async{
          return Response('''
             {
              "id": 1,
              "name": "Leanne Graham",
              "username": "Bret",
              "email": "Sincere@april.biz",
              "website": "hildegard.org"
            }
          ''', 200);
        });

        //Act
        final user = await userRepository.getUser();
        //Assert
        expect(user, isA<User>());
      });
      test(
          "give UserRepository class when getUser function is called and status is not 200 then an exception should be thrown",
          () async {
        //Arrange
          //Here  if we need to change behavior of method by using mock
        when(()=>mockHTTPClinet.get( Uri.parse('https://jsonplaceholder.typicode.com/users/1')))
        .thenAnswer((invocation) async{
          return Response('''
             {
              "id": 1,
              "name": "Leanne Graham",
              "username": "Bret",
              "email": "Sincere@april.biz",
              "website": "hildegard.org"
            }
          ''', 500);
        });

        //Act
        final user =  userRepository.getUser();
        //Assert
        expect(user, throwsException);
      });
    });
  });
}
