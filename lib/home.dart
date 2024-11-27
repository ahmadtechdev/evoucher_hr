import 'package:flutter/material.dart';
import 'widgets/colors.dart';
import 'widgets/text_utils.dart';

class HomeDashboard extends StatelessWidget {
  final String name;
  final String joiningDate;
  final int allowedLeaves;
  final int approvedLeaves;
  final int unapprovedAbsents;
  final int totalUsedLeaves;
  final int remainingLeaves;
  final int overLeaves;
  final int missingCheckout;
  final int doubleAbsents;
  final int actualHours;
  final int workingHours;
  final int differenceHours;

  HomeDashboard({
    required this.name,
    required this.joiningDate,
    required this.allowedLeaves,
    required this.approvedLeaves,
    required this.unapprovedAbsents,
    required this.totalUsedLeaves,
    required this.remainingLeaves,
    required this.overLeaves,
    required this.missingCheckout,
    required this.doubleAbsents,
    this.actualHours = 90,
    this.workingHours = 90,
    this.differenceHours = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              _buildHeader(context),
              const SizedBox(height: 16.0),
              _buildHoursCard(),
              const SizedBox(height: 16.0),
              _buildAttendancePeriod(),
              const SizedBox(height: 16.0),
              _buildLeaveStatusCards(),
              const SizedBox(height: 16.0),
              _buildActionButtons(),
              const SizedBox(height: 16.0),
              _buildTodoAndPayment(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Card(
      elevation: 2,

      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // CircleAvatar(
            //   radius: 30.0,
            //   backgroundColor: TColor.primary,
            //   child: Image.asset("assets/img/mypic.jpg"),
            //   // child: TextUtil(
            //   //   text: name.substring(0, 1).toUpperCase(),
            //   //   size: 24.0,
            //   //   color: TColor.white,
            //   //   weight: true,
            //   // ),
            // ),
            CircleAvatar(
              radius: 30.0,
              backgroundColor: TColor.primary,
              backgroundImage: AssetImage("assets/img/mypic.jpg"),
            ),

            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtil(
                    text: name,
                    size: 20.0,
                    weight: true,
                  ),
                  SizedBox(height: 4.0),
                  TextUtil(
                    text: 'Flutter app developer',
                    size: 14.0,
                    color: TColor.secondaryText,
                  ),
                  SizedBox(height: 4.0),
                  TextUtil(
                    text: 'Joined on $joiningDate',
                    size: 14.0,
                    color: TColor.secondaryText,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHoursCard() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildHourItem('ACTUAL\nHOUR', actualHours),
            _buildVerticalDivider(),
            _buildHourItem('WORKING\nHOUR', workingHours),
            _buildVerticalDivider(),
            _buildHourItem('DIFFERENCE', differenceHours),
          ],
        ),
      ),
    );
  }

  Widget _buildHourItem(String label, int hours) {
    return Column(
      children: [
        TextUtil(
          text: '$hours Hours',
          size: 18.0,
          weight: true,
        ),
        SizedBox(height: 4.0),
        TextUtil(
          text: label,
          size: 12.0,
          color: TColor.secondaryText,
          align: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 40,
      width: 1,
      color: TColor.textfield,
    );
  }

  Widget _buildAttendancePeriod() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextUtil(
              text: 'Attendance Period',
              size: 16.0,
              weight: true,
            ),
            SizedBox(height: 8.0),
            TextUtil(
              text: 'From 01 Nov 2024 To 31 Oct 2025',
              size: 14.0,
              color: TColor.secondaryText,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLeaveStatusCards() {
    return Column(
      children: [
        _buildLeaveStatusItem('Allowed Leaves', allowedLeaves, 15, TColor.secondary),
        SizedBox(height: 8.0),
        _buildLeaveStatusItem('Approved Leaves', approvedLeaves, 15, TColor.third),
        SizedBox(height: 8.0),
        _buildLeaveStatusItem('Unapproved Absents', unapprovedAbsents, 15, TColor.fourth),
        SizedBox(height: 8.0),
        _buildLeaveStatusItem('Total Used Leaves', totalUsedLeaves, 15, TColor.primary),
        SizedBox(height: 8.0),
        _buildLeaveStatusItem('Remaining Leaves', remainingLeaves, 15, TColor.secondary),
        SizedBox(height: 8.0),
        _buildLeaveStatusItem('Over Leaves', overLeaves, 15, TColor.third),
      ],
    );
  }

  Widget _buildLeaveStatusItem(String title, int value, int total, Color color) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextUtil(
                  text: title,
                  size: 16.0,
                  weight: true,
                ),
                TextUtil(
                  text: '$value/$total',
                  size: 16.0,
                  color: color,
                  weight: true,
                ),
              ],
            ),
            SizedBox(height: 8.0),
            LinearProgressIndicator(
              value: value / total,
              backgroundColor: color.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.access_time),
            label: Text('Leaves/Absents'),
            style: ElevatedButton.styleFrom(
              backgroundColor: TColor.secondary,
              padding: EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.assignment),
            label: Text('Todo'),
            style: ElevatedButton.styleFrom(
              backgroundColor: TColor.third,
              padding: EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTodoAndPayment() {
    return Row(
      children: [
        Expanded(
          child: _buildInfoCard(
            'Todo Dashboard',
            'Manage your daily tasks',
            Icons.list_alt,
            TColor.third,
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: _buildInfoCard(
            'Payment Dashboard',
            'Track your payments',
            Icons.payment,
            TColor.fourth,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(String title, String subtitle, IconData icon, Color color) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            SizedBox(height: 8.0),
            TextUtil(
              text: title,
              size: 14.0,
              weight: true,
            ),
            SizedBox(height: 4.0),
            TextUtil(
              text: subtitle,
              size: 12.0,
              color: TColor.secondaryText,
              align: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}