import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:desktop_application/helpers/navigation.dart';
import 'package:desktop_application/helpers/responsive.dart';
import 'package:desktop_application/src/policy/models/user_policy_model.dart';
import 'package:desktop_application/src/policy/screens/policy_info.dart';
import 'package:desktop_application/utils/common_utils.dart';

class UserPolicies extends StatefulWidget {
  final int clientID;
  final int userID;

  const UserPolicies({
    super.key,
    required this.clientID,
    required this.userID,
  });

  @override
  State<UserPolicies> createState() => _UserPoliciesState();
}

class _UserPoliciesState extends State<UserPolicies> {
  //

  late Future<List<UserPolicyModel>> _userPolicies;

  Future<List<UserPolicyModel>> _fetchPolicies({
    required int clientId,
    required int userId,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(
            'http://166.0.242.94:80/api/policies?clientId=$clientId&userId=$userId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Basic YXBpa2V5Om1ldXNhbTEyIw==',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        return List<UserPolicyModel>.from(
          jsonResponse.map((model) => UserPolicyModel.fromJson(model)),
        );
      } else {
        throw Exception('Failed to load policies');
      }
    } catch (e) {
      debugPrint('Unable to fetch policies: $e');
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    _userPolicies = _fetchPolicies(
      clientId: widget.clientID,
      userId: widget.userID,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserPolicyModel>>(
      future: _userPolicies,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final UserPolicyModel policy = snapshot.data![index];

              final String dueDate =
                  CommonUtils.formattedDate(policy.premiumDueDate);

              return ListTile(
                leading: Text('$index'),
                title: Text(policy.policyNumber),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${policy.policyAmount}'),
                    Text(dueDate),
                  ],
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 4 * AppUI.dw,
                ),
                onTap: () {
                  Navigation.navigatorKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) => PolicyInfo(policyInfo: policy),
                    ),
                  );
                },
              );
            },
          );
        } else {
          return const Text('No data found');
        }
      },
    );
  }
}
