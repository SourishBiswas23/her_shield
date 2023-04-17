import 'package:hackathon_project/controllers/page_changer_bloc/page_changer_bloc.dart';

final homeScreenGridData = [
  {
    'imagePath': 'assets/images/directions.jpg',
    'label': 'Directions',
    'eventName': LoadDirectionsScreenEvent(),
  },
  {
    'imagePath': 'assets/images/friends.jpg',
    'label': 'Community Posts',
    'eventName': LoadCommunityPostsScreenEvent(),
  },
  {
    'imagePath': 'assets/images/be_aware.jpg',
    'label': 'Be Aware',
    'eventName': LoadBeAwareScreenEvent(),
  },
  {
    'imagePath': 'assets/images/helpline_numbers.jpg',
    'label': 'Helpline Numbers',
    'eventName': LoadHelplineNumbersScreenEvent(),
  },
  {
    'imagePath': 'assets/images/e_learning.jpg',
    'label': 'e-learning',
    'eventName': LoadElearningScreenEvent(),
  },
  {
    'imagePath': 'assets/images/report_as_victim.jpg',
    'label': 'Report As Victim',
    'eventName': LoadReportAsVictimScreenEvent(),
  },
  {
    'imagePath': 'assets/images/report_as_witness.jpg',
    'label': 'Report As Witness',
    'eventName': LoadReportAsWitnessScreenEvent(),
  },
  {
    'imagePath': 'assets/images/report_history.jpg',
    'label': 'Report History',
    'eventName': LoadReportHistoryScreenEvent(),
  },
  {
    'imagePath': 'assets/images/sos_history.jpg',
    'label': 'Sos History',
    'eventName': LoadSosHistoryScreenEvent(),
  },
  {
    'imagePath': 'assets/images/sakhi.jpg',
    'label': 'Sakhi',
    'eventName': LoadSakhiScreenEvent(),
  },
];
