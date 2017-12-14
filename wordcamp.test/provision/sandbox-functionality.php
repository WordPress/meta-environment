<?php

ini_set( 'error_log', dirname( dirname( ABSPATH ) ) . '/logs/php-error.log' );

// Include Core themes
register_theme_directory( ABSPATH . 'wp-content/themes' );

/**
 * Load sites over HTTP instead of HTTPS
 *
 * In the Meta Environment, the sites will only have self-signed certificates, so contributors will get errors
 * from their browser, which are confusing and inconvenient.
 */
function wordcamp_dev_use_http() {
	remove_action( 'muplugins_loaded', 'wcorg_force_ssl' );
}
add_action( 'muplugins_loaded', 'wordcamp_dev_use_http', 9 );

/**
 * Setup quick cron schedules for easy debugging
 *
 * @param array $schedules
 * @return array
 */
function wordcamp_dev_cron_schedules( $schedules ) {
	$schedules['10-seconds'] = array(
		'interval' => 10,
		'display' => 'Once every 10 seconds',
	);

	$schedules['30-seconds'] = array(
		'interval' => 30,
		'display' => 'Once every 30 seconds',
	);

	$schedules['45-seconds'] = array(
		'interval' => 45,
		'display' => 'Once every 45 seconds',
	);

	$schedules['60-seconds'] = array(
		'interval' => 60,
		'display' => 'Once every 60 seconds',
	);

	return $schedules;
}
add_filter( 'cron_schedules', 'wordcamp_dev_cron_schedules' );

/**
 * Run cron jobs more frequently so don't have to wait to test results
 */
function wordcamp_dev_test_cron_jobs() {
	/** @var $camptix CampTix_Plugin */
	/** @var $camptix_network_dashboard CampTix_Network_Dashboard */
	/** @var $WCOR_Mailer WCOR_Mailer */
	global $camptix, $camptix_network_dashboard, $WCOR_Mailer;

	// Schedule custom events
	if ( ! wp_next_scheduled( 'wordcamp_dev_10_seconds' ) )
		wp_schedule_event( time(), '10-seconds', 'wordcamp_dev_10_seconds' );

	if ( ! wp_next_scheduled( 'wordcamp_dev_30_seconds' ) )
		wp_schedule_event( time(), '30-seconds', 'wordcamp_dev_30_seconds' );

	if ( ! wp_next_scheduled( 'wordcamp_dev_45_seconds' ) )
		wp_schedule_event( time(), '45-seconds', 'wordcamp_dev_45_seconds' );

	if ( ! wp_next_scheduled( 'wordcamp_dev_60_seconds' ) )
		wp_schedule_event( time(), '60-seconds', 'wordcamp_dev_60_seconds' );

	// Fire cron jobs on fast hooks
	if ( isset( $camptix_network_dashboard ) ) {
		add_action( 'wordcamp_dev_10_seconds', array( $camptix_network_dashboard, 'gather_events_data' ) );
		add_action( 'wordcamp_dev_60_seconds', array( $camptix_network_dashboard, 'update_revenue_reports_data' ) );
	}
	if ( isset( $WCOR_Mailer ) ) {
		add_action( 'wordcamp_dev_10_seconds', array( $WCOR_Mailer, 'send_timed_emails' ) );
	}
}
add_action( 'init', 'wordcamp_dev_test_cron_jobs' );

/**
 * Tell Tagregator to refresh every 10 seconds
 *
 * @param int $refresh_interval
 * @return int
 */
function tggr_refresh_interval( $refresh_interval ) {
	return 10;
}
add_filter( 'tggr_refresh_interval', 'tggr_refresh_interval' );

/**
 * De-register functionality that we don't want for one reason for another.
 *
 * The Global Login Endpoint plugin is unhooked in order to avoid dealing with self-signed SSL certificates.
 */
function wcorg_remove_unwanted_callbacks() {
	/** @var $wordcamp_gle WordCamp_Global_Login_Endpoint_Plugin */
	global $wordcamp_gle;

	remove_action( 'login_form_login', array( $wordcamp_gle, 'login_form_login' ) );
	remove_action( 'login_url',        array( $wordcamp_gle, 'login_url' ), 99, 2 );
}
add_action( 'plugins_loaded', 'wcorg_remove_unwanted_callbacks' );
