import 'package:lyc_clinic/ui/home/repository/home_repository.dart';
import 'package:lyc_clinic/ui/home/repository/home_data_repository.dart';
import 'package:lyc_clinic/ui/doctors/repository/doctor_profile_data_repository.dart';
import 'package:lyc_clinic/ui/doctors/repository/doctor_profile_repository.dart';
import 'package:lyc_clinic/ui/home/repository/feature_articles_repository.dart';
import 'package:lyc_clinic/ui/home/repository/feature_articles_data_repository.dart';
import 'package:lyc_clinic/ui/doctors/repository/doctor_list_repository.dart';
import 'package:lyc_clinic/ui/doctors/repository/doctor_list_data_repository.dart';
import 'package:lyc_clinic/ui/doctors/repository/doctor_booking_repository.dart';
import 'package:lyc_clinic/ui/doctors/repository/doctor_booking_data_repository.dart';
import 'package:lyc_clinic/ui/home/repository/health_education_repository.dart';
import 'package:lyc_clinic/ui/home/repository/health_education_data_repository.dart';
import 'package:lyc_clinic/ui/home/repository/user_booking_repository.dart';
import 'package:lyc_clinic/ui/home/repository/user_booking_data_repository.dart';
import 'package:lyc_clinic/ui/home/repository/user_saved_repository.dart';
import 'package:lyc_clinic/ui/home/repository/user_saved_data_repository.dart';
import 'package:lyc_clinic/ui/home/repository/user_activity_repository.dart';
import 'package:lyc_clinic/ui/home/repository/user_activity_data_repository.dart';
import 'package:lyc_clinic/ui/article/repository/article_details_repository.dart';
import 'package:lyc_clinic/ui/article/repository/article_details_data_repository.dart';
import 'package:lyc_clinic/ui/comment/repository/comment_reply_repository.dart';
import 'package:lyc_clinic/ui/comment/repository/comment_reply_data_repository.dart';
import 'package:lyc_clinic/ui/comment/repository/comment_repository.dart';
import 'package:lyc_clinic/ui/comment/repository/comment_data_repository.dart';
import 'package:lyc_clinic/ui/doctors/repository/doctor_filter_repository.dart';
import 'package:lyc_clinic/ui/doctors/repository/doctor_filter_data_repository.dart';
import 'package:lyc_clinic/ui/home/repository/health_education_filter_repository.dart';
import 'package:lyc_clinic/ui/home/repository/health_education_filter_data_repository.dart';
import 'package:lyc_clinic/ui/service/repository/services_repository.dart';
import 'package:lyc_clinic/ui/service/repository/services_data_repository.dart';
import 'package:lyc_clinic/ui/service/repository/sub_services_details_repository.dart';
import 'package:lyc_clinic/ui/service/repository/sub_services_details_data_repository.dart';
import 'package:lyc_clinic/ui/notification/repository/notification_data_repository.dart';
import 'package:lyc_clinic/ui/notification/repository/notification_repository.dart';
import 'package:lyc_clinic/ui/about/repository/about_data_repository.dart';
import 'package:lyc_clinic/ui/about/repository/about_repository.dart';
import 'package:lyc_clinic/ui/chat/repository/chat_repository.dart';
import 'package:lyc_clinic/ui/chat/repository/chat_data_repository.dart';
import 'package:lyc_clinic/ui/otheruser/repository/other_user_repository.dart';
import 'package:lyc_clinic/ui/otheruser/repository/other_user_data_repository.dart';
class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  HomeContractRepository get homeContractRepository {
    return new HomeDataRepository();
  }

  DoctorProfileRepository get doctorProfileRepository{
    return new DoctorProfileDataRepository();
  }

  FeatureArticlesRepository get featureArticlesRepository{
    return new FeatureArticlesDataRepository();
  }

  DoctorListRepository get doctorListRepository{
    return new DoctorListDataRepository();
  }

  DoctorBookingRepository get doctorBookingRepository{
    return new DoctorBookingDataRepository();
  }

  HealthEducationRepository get healthEducationRepository{
    return new HealthEducationDataRepository();
  }

  UserBookingRepository get userBookingRepository{
    return new UserBookingDataRepository();
  }

  UserSavedRepository get userSavedRepository{
    return new UserSavedDataRepository();
  }

  UserActivityRepository get userActivityRepository{
    return new UserActivityDataRepository();
  }

  ArticleDetailsRepository get articleDetailsRepository{
    return new ArticleDetailsDataRepository();
  }

  CommentReplyRepository get commentReplyRepository{
    return new CommentReplyDataRepository();
  }

  CommentRepository get commentRepository{
    return new CommentDataRepository();
  }

  DoctorFilterRepository get doctorFilterRepository{
    return new DoctorFilterDataRepository();
  }

  HealthEducationFilterRepository get healthEducationFilterRepository{
    return new HealthEducationFilterDataRepository();
  }

  ServicesRepository get servicesRepository{
    return new ServicesDataRepository();
  }

  SubServicesDetailsRepository get subServicesDetailsRepository{
    return new SubServicesDetailsDataRepository();

  }

  NotificationRepository get notificationRepository{
    return new NotificationDataRepository();
  }

  AboutRepository get aboutRepository{
    return new AboutDataRepository();
  }

  ChatRepository get chatRepository{
    return new ChatDataRepository();
  }

  OtherUserRepository get otherUserRepository{
    return new OtherUserDataRepository();
  }
}
//DI
