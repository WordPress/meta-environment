<?php

ini_set( 'error_log', dirname( dirname( ABSPATH ) ) . '/logs/php-error.log' );

// Include Core themes
register_theme_directory( ABSPATH . 'wp-content/themes' );

add_filter( 'pre_option_link_manager_enabled', '__return_true' );

/**
 * Override the ID of the user that uploaded videos are assigned to
 *
 * @param int $drafts_author_id
 *
 * @return int
 */
function wptv_override_drafts_author_id( $drafts_author_id ) {
	return 1;
}
add_filter( 'wptv_drafts_author_id', 'wptv_override_drafts_author_id' );

/**
 * Simulate an uploaded video when creating a new post.
 *
 * This is a workaround because posts are created manually instead of using WPTV_Anon_Upload.
 *
 * @param string  $new_status
 * @param string  $old_status
 * @param WP_Post $post
 */
function wptv_simulate_uploaded_video( $new_status, $old_status, $post ) {
	if ( 'auto-draft' != $old_status ) {
		return;
	}

	update_post_meta( $post->ID, '_wptv_submitted_video', array(
		'attachment_id'   => 0,
		'submitted_by'    => 'Jane Doe',
		'submitted_email' => 'foo@example.org',
		'title'           => '',
		'producer'        => '',
		'speakers'        => '',
		'event'           => '',
		'language'        => '',
		'categories'      => '',
		'description'     => '',
		'ip'              => '127.0.0.1',
	) );
}
add_action( 'transition_post_status', 'wptv_simulate_uploaded_video', 10, 3 );
