create table access_rate (rateId bigint generated by default as identity (start with 1), ipAddress varchar(255) not null, rate bit, created_at date, comments_commentId bigint, poll_poll_id bigint, survey_sid bigint, tweetPoll_tweet_poll_id bigint, user_uid bigint, primary key (rateId), unique (rateId))
create table account (uid bigint generated by default as identity (start with 1), account_created_date timestamp not null, account_enabled bit, primary key (uid), unique (uid))
create table application (application_id bigint generated by default as identity (start with 1), api_key varchar(255), callback_url varchar(255), description varchar(255), icon_url varchar(255), name varchar(255), secret varchar(255), slug varchar(255), account_uid bigint, primary key (application_id), unique (application_id))
create table application_connection (connection_id bigint generated by default as identity (start with 1), access_token varchar(255), api_key varchar(255), secret varchar(255), account_uid bigint, application_application_id bigint, primary key (connection_id), unique (connection_id))
create table attachment (attachment_id bigint generated by default as identity (start with 1), filename varchar(255) not null, uploadDate timestamp, project_id bigint not null, primary key (attachment_id), unique (attachment_id))
create table client (client_id bigint generated by default as identity (start with 1), description varchar(255), email varchar(255), facebook varchar(255), fax varchar(255), name varchar(255) not null, telephone varchar(255), twitter varchar(255), url varchar(255), project_id bigint, primary key (client_id), unique (client_id))
create table comments (commentId bigint generated by default as identity (start with 1), comment varchar(2000) not null, created_at date, dislikeVote bigint, likeVote bigint, parentId bigint, pollId bigint, sid bigint, tweetPollId bigint, uid bigint not null, is_published bit, is_spam bit, comment_status integer, primary key (commentId), unique (commentId))
create table dashboard (dashboardId bigint generated by default as identity (start with 1), sequence integer, description varchar(255), favorite bit, favorite_counter integer, dashboardName varchar(255) not null, dashboad_layout integer, dashboard_selected bit, userBoard_uid bigint, primary key (dashboardId), unique (dashboardId))
create table email (email_id bigint generated by default as identity (start with 1), created_at timestamp, email varchar(255) not null, emailAccount varchar(255), subscribed bit not null, id_list bigint, primary key (email_id), unique (email_id), unique (email))
create table emailList (id_list bigint generated by default as identity (start with 1), createdAt timestamp, descripcionList varchar(255), list_name varchar(255), listState varchar(255), uid bigint not null, primary key (id_list), unique (id_list))
create table emailSubscribe (id_subscribe bigint generated by default as identity (start with 1), hashCode varchar(255) not null, email_id bigint not null, id_list bigint not null, primary key (id_subscribe), unique (id_subscribe))
create table gadget (gadgetId bigint generated by default as identity (start with 1), gadgetColor varchar(255), gadgetColumn integer not null, gadgetName varchar(255) not null, gadgetPosition integer, gadgetType integer not null, status bit, dashboard_dashboardId bigint, primary key (gadgetId), unique (gadgetId))
create table gadget_properties (propertyId bigint generated by default as identity (start with 1), gadget_prop_name varchar(255) not null, gadget_prop_value varchar(255) not null, gadget_gadgetId bigint, userAccount_uid bigint, primary key (propertyId), unique (propertyId))
create table geoPoint (locate_id bigint generated by default as identity (start with 1), lat float, lng float, accuracy integer, address varchar(255), country_code varchar(255), country_name varchar(255), description varchar(255), location_status varchar(255), account_uid bigint, geoPointFolder_locate_folder_id bigint, loc_id_type bigint, primary key (locate_id), unique (locate_id))
create table geoPoint_folder (locate_folder_id bigint generated by default as identity (start with 1), created_at date, folderName varchar(255) not null, folder_status integer, type varchar(255), createdBy_uid bigint, uid bigint not null, subLocationFolder_locate_folder_id bigint, primary key (locate_folder_id), unique (locate_folder_id))
create table geoPoint_type (loc_id_type bigint generated by default as identity (start with 1), description varchar(255), level integer, users_uid bigint, primary key (loc_id_type), unique (loc_id_type))
create table group_permission (sec_id_permission bigint not null, sec_id_group bigint not null, primary key (sec_id_permission, sec_id_group))
create table groups (group_id bigint generated by default as identity (start with 1), des_info varchar(255), name varchar(50), type varchar(255), id_state bigint, account_uid bigint, primary key (group_id), unique (group_id))
create table groups_permission (sec_id_group bigint not null, sec_id_permission bigint not null, primary key (sec_id_group, sec_id_permission))
create table hash_tags (hash_tag_id bigint generated by default as identity (start with 1), tag varchar(255), hits bigint, size bigint, hashtag_updated_date timestamp, created_updated timestamp, primary key (hash_tag_id), unique (hash_tag_id))
create table hits (hit_id bigint generated by default as identity (start with 1), hit_category integer not null, created_at date, hits_ip_address varchar(100) not null, hashTag_hash_tag_id bigint, poll_poll_id bigint, survey_sid bigint, tweetPoll_tweet_poll_id bigint, userAccount_uid bigint, primary key (hit_id), unique (hit_id))
create table notification (notification_id bigint generated by default as identity (start with 1), additional_description varchar(255) not null, created timestamp not null, description varchar(255) not null, group_notification bit, readed bit not null, reference varchar(255), uid bigint not null, primary key (notification_id), unique (notification_id))
create table permission (id_permission bigint generated by default as identity (start with 1), permission varchar(255), description varchar(255), primary key (id_permission), unique (id_permission))
create table poll (poll_id bigint generated by default as identity (start with 1), lat float, lng float, additional_info varchar(255), closeAfterDate bit, close_after_quota bit, close_date timestamp, closed_quota integer, created_at timestamp, custom_final_message integer, custom_message bit, custom_start_message varchar(255), dislike_vote bigint, end_date timestamp, favorites bit, hits bigint, ip_protection varchar(255), ip_restrictions bit, like_vote bigint, multiple_response integer, name varchar(255), notifications bit, number_votes bigint, optional_title varchar(255), password_protection varchar(255), password_restrictions bit, relevance bigint, showAdditionalInfo bit, comment_option integer, show_results bit, update_date timestamp, poll_completed bit not null, poll_hash varchar(255) not null, publish_poll bit, editor bigint, owner_id bigint, poll_folder bigint, qid bigint not null, primary key (poll_id), unique (poll_id), unique (poll_hash))
create table poll_folder (pollFolderId bigint generated by default as identity (start with 1), created_at date, folderName varchar(255) not null, folder_status integer, createdBy_uid bigint, uid bigint not null, primary key (pollFolderId), unique (pollFolderId))
create table poll_hashtags (poll_id bigint not null, hastag_id bigint not null, primary key (poll_id, hastag_id))
create table poll_result (poll_resultId bigint generated by default as identity (start with 1), ipAddress varchar(255) not null, votation_date timestamp not null, q_answer_id bigint not null, poll_id bigint not null, primary key (poll_resultId), unique (poll_resultId))
create table project (project_id bigint generated by default as identity (start with 1), hide_project bit, notify_members bit, priority varchar(255), date_finish timestamp not null, date_start timestamp not null, description varchar(600), project_info longvarchar, project_name varchar(255) not null, project_status varchar(255), published bit, lead_uid bigint, users_uid bigint, primary key (project_id), unique (project_id))
create table project_geoPoint (cat_id_project bigint not null, cat_id_loc bigint not null, primary key (cat_id_project, cat_id_loc))
create table project_group (sec_id_group bigint not null, cat_id_project bigint not null, primary key (cat_id_project, sec_id_group))
create table project_locations (cat_id_loc bigint not null, cat_id_project bigint not null, primary key (cat_id_loc, cat_id_project))
create table question_category (qCategory bigint generated by default as identity (start with 1), category varchar(18), primary key (qCategory), unique (qCategory))
create table question_category_questions (question_category_qCategory bigint not null, questionLibrary_qid bigint not null, primary key (question_category_qCategory, questionLibrary_qid))
create table question_collection (id_q_colection bigint generated by default as identity (start with 1), creation_date timestamp not null, des_coleccion varchar(255) not null, uid bigint not null, primary key (id_q_colection), unique (id_q_colection))
create table question_dependence_survey (question_dependence_survey bigint generated by default as identity (start with 1), sid bigint not null, primary key (question_dependence_survey), unique (question_dependence_survey))
create table question_relations (question_id bigint not null, id_q_colection bigint not null, primary key (question_id, id_q_colection))
create table questions (qid bigint generated by default as identity (start with 1), question_created_date timestamp, question_hits bigint, qid_key varchar(255), question varchar(255) not null, shared_question bit, question_slug varchar(255) not null, uid bigint not null, question_pattern bigint, section_ssid bigint, primary key (qid), unique (qid))
create table questions_answers (q_answer_id bigint generated by default as identity (start with 1), answer varchar(255) not null, answerType integer, color varchar(255) not null, created_date timestamp, short_url_provider integer, answer_hash varchar(255), answer_url varchar(255), id_question_answer bigint not null, primary key (q_answer_id), unique (q_answer_id))
create table questions_dependencies (question_dependenceId bigint generated by default as identity (start with 1), descriptionDependence varchar(255) not null, questionId_from bigint not null, questionId_to bigint not null, q_answer_id bigint not null, primary key (question_dependenceId), unique (questionId_to), unique (questionId_from), unique (descriptionDependence), unique (question_dependenceId))
create table questions_pattern (pattenr_id bigint generated by default as identity (start with 1), des_qid varchar(255), finallity_patter varchar(255), label_qid varchar(255) not null, level_patter integer, template_patron varchar(255), type_pattern varchar(255), primary key (pattenr_id), unique (pattenr_id))
create table social_account (social_account_id bigint generated by default as identity (start with 1), oauth_token varchar(255), type_account integer, oauth_app_key bigint, oauth2_expires varchar(255), picture_profile_url varchar(255), public_profile_url varchar(255), oauth_refresh_token varchar(255), oauth_secret_token varchar(255), social_profile_id varchar(255) not null, added_account_date timestamp not null, default_selected bit, description_profile varchar(255), social_account_email varchar(255), picture_url varchar(255), picture_thumbnail_url varchar(255), profile_url varchar(255), real_name varchar(255), social_account_name varchar(255) not null, social_support integer, type_auth varchar(255), upgraded_credentials_last_date timestamp not null, account_verified bit, account_uid bigint, userOwner_uid bigint, primary key (social_account_id), unique (social_account_id), unique (social_account_name))
create table survey_folder (survey_folderId bigint generated by default as identity (start with 1), created_at date, folderName varchar(255) not null, folder_status integer, createdBy_uid bigint, uid bigint not null, primary key (survey_folderId), unique (survey_folderId))
create table survey_format (id_sid_format bigint generated by default as identity (start with 1), date_created timestamp, name varchar(60), primary key (id_sid_format), unique (id_sid_format))
create table survey_group (sg_id bigint generated by default as identity (start with 1), date_create timestamp, group_name varchar(60), primary key (sg_id), unique (sg_id))
create table survey_group_format (sg_id bigint not null, id_sid_format bigint not null, primary key (id_sid_format, sg_id))
create table survey_group_project (id_sid_format bigint not null, cat_id_project bigint not null, primary key (cat_id_project, id_sid_format))
create table survey_pagination (pagination_id bigint generated by default as identity (start with 1), pageNumber integer, sid bigint not null, ssid bigint not null, primary key (pagination_id), unique (pagination_id))
create table survey_result (rid bigint generated by default as identity (start with 1), txtResponse varchar(255), answer_q_answer_id bigint, question_qid bigint, survey_sid bigint, primary key (rid), unique (rid))
create table survey_section (ssid bigint generated by default as identity (start with 1), desc_section varchar(255), section_name varchar(255), survey_sid bigint, primary key (ssid), unique (ssid))create table surveys (sid bigint generated by default as identity (start with 1), lat float, lng float, additional_info varchar(255), closeAfterDate bit, close_after_quota bit, close_date timestamp, closed_quota integer, created_at timestamp, custom_final_message integer, custom_message bit, custom_start_message varchar(255), dislike_vote bigint, end_date timestamp, favorites bit, hits bigint, ip_protection varchar(255), ip_restrictions bit, like_vote bigint, multiple_response integer, name varchar(255), notifications bit, number_votes bigint, optional_title varchar(255), password_protection varchar(255), password_restrictions bit, relevance bigint, showAdditionalInfo bit, comment_option integer, show_results bit, update_date timestamp, complete varchar(2), date_interview date, schedule_date_survey timestamp, is_Schedule bit, show_progress_bar bit, start_date timestamp, survey_slug_name varchar(255), ticket integer, editor bigint, owner_id bigint, project_project_id bigint, survey_folder bigint, primary key (sid), unique (sid))
create table tweetPoll (tweet_poll_id bigint generated by default as identity (start with 1), lat float, lng float, allow_live_results bit, allow_repeated_votes bit, captcha bit, close_notification bit, completed bit not null, create_date timestamp, limit_with_date bit, date_limited timestamp, dislikeVote bigint, favourite bit, hits bigint, likeVote bigint, limit_votes integer, limits_votes_enabled bit, max_repeated_votes integer, numberVotes bigint, publish bit, relevance bigint, result_notification bit, resume_live_results bit, resume_tweetpoll_dashboard bit, schedule_date_tweet timestamp, schedule bit, last_date_updated timestamp, editor bigint, qid bigint not null, uid bigint not null, tweetPollFolderId bigint, comment_option integer, primary key (tweet_poll_id), unique (tweet_poll_id))
create table tweetPoll_Folder (tweetPollFolderId bigint generated by default as identity (start with 1), created_at date, folderName varchar(255) not null, folder_status integer, createdBy_uid bigint, uid bigint not null, primary key (tweetPollFolderId), unique (tweetPollFolderId))
create table tweetPoll_save_published_status (status_save_poll_id bigint generated by default as identity (start with 1), type varchar(255), status_description varchar(255), publication_date_tweet timestamp, status integer, tweet_content varchar(255), tweet_id varchar(255), poll_poll_id bigint, socialAccount_social_account_id bigint, survey_sid bigint, tweetPoll_tweet_poll_id bigint, primary key (status_save_poll_id), unique (status_save_poll_id))
create table tweetpoll_hashtags (tweetpoll_id bigint not null, hastag_id bigint not null, primary key (hastag_id, tweetpoll_id))
create table tweetpoll_result (tweetpoll_resultId bigint generated by default as identity (start with 1), lat float, lng float, ip_vote varchar(100) not null, tweet_date_response timestamp not null, tweetpoll_switch_id bigint not null, primary key (tweetpoll_resultId), unique (tweetpoll_resultId))
create table tweetpoll_switch (tweetpoll_switch_id bigint generated by default as identity (start with 1), tweet_code varchar(255) not null, last_date_updated timestamp not null, relative_url varchar(400), short_url varchar(400), q_answer_id bigint not null, tweet_poll_id bigint not null, primary key (tweetpoll_switch_id), unique (tweet_code), unique (tweetpoll_switch_id))
create table userAccount (uid bigint generated by default as identity (start with 1), lat float, lng float, name varchar(50), date_new timestamp, invite_code varchar(255), last_ip_logged varchar(255), last_time_logged timestamp, password varchar(255) not null, picture_source integer, shared_profile bit, email varchar(150) not null, userProfilePicture varchar(255), status bit, username varchar(30) not null, account_uid bigint, groupId bigint, primary key (uid), unique (username), unique (uid), unique (email), unique (username, email))
create table userAccount_followers (uid bigint not null, uid_follower bigint not null, primary key (uid, uid_follower))
create table userAccount_permission (sec_id_secondary bigint not null, sec_id_permission bigint not null, primary key (sec_id_permission, sec_id_secondary))
create table userAccount_project (sec_id_secondary bigint not null, cat_id_project bigint not null, primary key (cat_id_project, sec_id_secondary))
create table survey_temporal_result (IdTempResult bigint generated by default as identity (start with 1), txtResponse varchar(255), hash varchar(255) not null, answer_q_answer_id bigint, question_qid bigint, survey_sid bigint, primary key (IdTempResult), unique (hash), unique (IdTempResult))
create table question_preferences (preferenceId bigint generated by default as identity (start with 1), preference varchar(255), preference_value varchar(255), question_qid bigint, primary key (preferenceId), unique (preferenceId))
create table hash_tags_ranking (rank_id bigint generated by default as identity (start with 1), average float, ranking_updated timestamp, hashTag_hash_tag_id bigint, primary key (rank_id), unique (rank_id))

create table scheduled (scheduled_id bigint generated by default as identity (start with 1), tweetPoll_tweet_poll_id bigint, poll_poll_id bigint, survey_sid bigint, type varchar(255), tweet_text varchar(255), scheduled_date timestamp, socialAccount_social_account_id bigint, status integer, attempts integer, tweetPoll_save_published_status_status_save_poll_id bigint primary key (scheduled_id), unique (scheduled_id))