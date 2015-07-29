<?php

/**
 * Mock Themes API
 */
class Themes_API {

	/**
	 * @var string
	 */
	protected $action;

	/**
	 * @var array
	 */
	protected $request;

	/**
	 * Constructs the object and does the api call
	 *
	 * @param string $action
	 * @param array  $request
	 */
	public function __construct( $action, $request ) {
		$this->action   = $action;
		$this->request  = $request;
		$this->response = $this->api_call();
	}

	/**
	 * Returns the cache key for the transient
	 *
	 * @return string
	 */
	private function get_cache_key() {
		return 'wporgapi' . md5( $this->get_url() );
	}

	/**
	 * Get the url we want to request
	 *
	 * @return string
	 */
	private function get_url() {
		$url = 'https://api.wordpress.org/themes/info/1.1/';

		$url = add_query_arg( array(
			'action'  => $this->action,
			'request' => $this->request,
		), $url );

		return $url;
	}

	/**
	 * Do an API call to the wordpress.org API
	 *
	 * @return mixed
	 */
	private function api_call() {
		$themes_list = get_transient( $this->get_cache_key() );
		if ( ! empty( $themes_list ) ) {
			return $themes_list;
		}

		$response    = wp_remote_get( $this->get_url() );
		$themes_list = json_decode( wp_remote_retrieve_body( $response ) );

		if ( isset( $themes_list->info ) ) {
			$themes_list->info = (array) $themes_list->info;
		}

		if ( isset( $themes_list->themes ) ) {
			$themes_list->themes = array_map( array( $this, 'map_themes' ), $themes_list->themes );
		}

		if ( ! empty( $themes_list ) ) {
			set_transient( $this->get_cache_key(), $themes_list, DAY_IN_SECONDS );
		}

		return $themes_list;
	}

	/**
	 * Map themes
	 *
	 * @param stdClass $theme Theme to map.
	 *
	 * @return stdClass
	 */
	private function map_themes( $theme ) {
		if ( isset( $theme->ratings ) ) {
			$theme->ratings = (array) $theme->ratings;
		}

		return $theme;
	}
}
