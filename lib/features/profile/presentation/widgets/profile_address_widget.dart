import 'package:flutter/material.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';
import 'package:test_task_application/features/users/domain/entities/address_entity.dart';
import 'package:test_task_application/generated/l10n.dart';

class ProfileAddressWidget extends StatelessWidget {
  const ProfileAddressWidget({super.key, required this.address});

  final AddressEntity address;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.extension<AppColors>()!.base100!,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 20,
                color: theme.extension<AppColors>()!.primary400!,
              ),
              SizedBox(width: 8),
              Text(
                S.current.address,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              SizedBox(width: 28),
              Text(
                S.current.city,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              Text(address.city),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              SizedBox(width: 28),
              Text(
                S.current.street,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              Text(
                S.current.street_home(
                  address.street,
                  address.number.toString(),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              SizedBox(width: 28),
              Text(
                S.current.index,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              Text(address.zipcode),
            ],
          ),
        ],
      ),
    );
  }
}
