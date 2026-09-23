import 'package:doctor_hunt/core/routes/route_names.dart';
import 'package:doctor_hunt/core/theme/app_colors.dart';
import 'package:doctor_hunt/features/admin/doctors/doctors_list/presentation/controller/getdoctors/get_doctors_cubit.dart';
import 'package:doctor_hunt/features/admin/doctors/doctors_list/presentation/widgets/doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DoctorsListView extends StatefulWidget {
  const DoctorsListView({super.key});

  @override
  State<DoctorsListView> createState() => _DoctorsListViewState();
}

class _DoctorsListViewState extends State<DoctorsListView> {
  @override
  void initState() {
    context.read<GetDoctorsCubit>().getDoctors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDoctorsCubit, GetDoctorsState>(
      builder: (context, state) {
        if (state is GetDoctorsSucces) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 20),
            itemCount: state.doctors.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: GestureDetector(
                  child: DoctorItem(doctor: state.doctors[index]),
                  onTap: () {
                    context.push(
                      RouteNames.adminDoctorDetailsRoute,
                      extra: state.doctors[index],
                    );
                  },
                ),
              );
            },
          );
        }
        return const Padding(
          padding: EdgeInsets.only(top: 30),
          child: CircularProgressIndicator(color: AppColors.primaryColor),
        );
      },
    );
  }
}
