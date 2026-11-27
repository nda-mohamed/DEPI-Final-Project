import 'package:flutter/material.dart';
import '../../../../core/app_color/app_color.dart';
import 'widgets/edit_profile_form.dart';
import 'widgets/profile_header.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 28),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                  style: IconButton.styleFrom(side: const BorderSide(color: AppColor.secondary2)),
                ),
                const SizedBox(width: 12),
                const Expanded(child: Text('Edit profile', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800, color: AppColor.primarytext))),
                TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Save', style: TextStyle(color: AppColor.primary, fontWeight: FontWeight.w700))),
              ]),
              const SizedBox(height: 20),
              const Center(child: Column(children: [ProfileAvatar(showCamera: true), SizedBox(height: 10), Text('Change photo', style: TextStyle(color: AppColor.primary, fontSize: 13, fontWeight: FontWeight.w700))])),
              const SizedBox(height: 24),
              const EditProfileForm(),
            ]),
          ),
        ),
      );
}
