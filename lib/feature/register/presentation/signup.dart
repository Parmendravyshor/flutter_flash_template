import '../../../services/push_notification_services.dart';
import '../register_view.dart';
import 'bloc/register_bloc.dart';
import 'bloc/register_event.dart';
import 'bloc/register_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.id});
  final String id;
  @override
  RegisterWidget createState() => RegisterWidget();
}

/// Main Widget that decides either to show Login Scree screen or Forgot password
class RegisterWidget extends State<RegisterScreen> {
  TextEditingController _fnameController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _cnfpasswordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  // final PushNotificationService _pushNotificationService =
  //     PushNotificationService();

  // Future<void> _getDeviceToken() async {
  //   String? token = await _pushNotificationService.getToken();
  //   print("Device Token: $token");
  // }

  @override
  void initState() {
    // _pushNotificationService.initialize();
    // _getDeviceToken();
    _passwordController = TextEditingController();
    _fnameController = TextEditingController();
    _lnameController = TextEditingController();
    _emailController = TextEditingController();
    _lnameController = TextEditingController();
    _cnfpasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _fnameController.dispose();
    _lnameController.dispose();
    _cnfpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: AppStyle.colors.cardbg,
                    child: BlocProvider(
                      create: (context) =>
                          KiwiContainer().resolve<RegisterBloc>(),
                      child: BlocBuilder<RegisterBloc, RegisterState>(
                        builder: (context, state) {
                          if (state is RegisterSuccess) {
                            SchedulerBinding.instance.addPostFrameCallback((_) {
                              /// Navigate to next page
                              ///
                            });
                            return Container();
                          } else if (state is RegisterFailure) {
                            Future.delayed(const Duration(seconds: 1), () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.black,
                                  content: Text(state.errorMessage,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Quicksand',
                                          fontSize: 20,
                                          color:
                                              AppStyle.colors.textColorWhite)),
                                ),
                              );
                            });
                          }
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    //  margin: EdgeInsets.only(top: 20),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Welcome to",
                                          style: AppStyle.text.medium,
                                        ))),
                                Expanded(
                                    flex: 1,
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Kompanion.ai",
                                          style: AppStyle.text.medium,
                                        ))),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                    height: 30,
                                    child:
                                        Image.asset("assets/images/beta.png")),
                                const SizedBox(
                                  height: 10,
                                ),
                                ThemedTextField(
                                    "First Name", TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    onChanged: (text) {
                                  BlocProvider.of<RegisterBloc>(context)
                                      .add(FNameChanged(text));
                                }, editingController: _fnameController),
                                const SizedBox(
                                  height: 5,
                                ),
                                ThemedTextField("Last Name", TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    onChanged: (text) {
                                  BlocProvider.of<RegisterBloc>(context)
                                      .add(LNameChanged(text));
                                }, editingController: _lnameController),
                                const SizedBox(
                                  height: 5,
                                ),
                                ThemedTextField(
                                    "Email", TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    onChanged: (text) {
                                  BlocProvider.of<RegisterBloc>(context)
                                      .add(EmailChanged(text));
                                }, editingController: _emailController),
                                const SizedBox(
                                  height: 5,
                                ),
                                ThemedTextField(
                                    "Password", TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.next,
                                    suffixIcon: const AssetImage(
                                        "assets/images/eye-off.png"),
                                    onChanged: (text) {
                                  BlocProvider.of<RegisterBloc>(context)
                                      .add(PasswordChanged(text));
                                },
                                    editingController: _passwordController,
                                    password: true),
                                const SizedBox(
                                  height: 5,
                                ),
                                ThemedTextField("Confirm Password",
                                    TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.done,
                                    suffixIcon: const AssetImage(
                                        "assets/images/eye-off.png"),
                                    onChanged: (text) {},
                                    editingController: _cnfpasswordController,
                                    password: true),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextButton(
                                  child: const Text("Register"),
                                  onPressed: () {
                                    String fname = _fnameController.text;
                                    String lname = _lnameController.text;
                                    String email = _emailController.text;
                                    String password = _passwordController.text;
                                    String cnfpassword =
                                        _cnfpasswordController.text;

                                    if (fname.isEmpty) {
                                      AlertManager.showErrorMessage(
                                          "Please enter first name", context);
                                    } else if (lname.isEmpty) {
                                      AlertManager.showErrorMessage(
                                          "Please enter last name", context);
                                    } else if (!EmailValidator.validate(
                                        email)) {
                                      AlertManager.showErrorMessage(
                                          "Please enter valid email", context);
                                    } else if (password.length < 6) {
                                      AlertManager.showErrorMessage(
                                          "Password must be 6 characters long",
                                          context);
                                    } else if (password != cnfpassword) {
                                      AlertManager.showErrorMessage(
                                          "Password do not match", context);
                                    } else {
                                      // AlertManager.disclaimerPopup(context,
                                      //     onSuccess: () {
                                      //   BlocProvider.of<RegisterBloc>(context)
                                      //       .add(RegisterButtonTapped());
                                      // });
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                state is RegisterInProgress
                                    ? const Center(
                                        child: SizedBox(
                                        width: 5,
                                        height: 5,
                                        child: CircularProgressIndicator(),
                                      ))
                                    : Container(),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
