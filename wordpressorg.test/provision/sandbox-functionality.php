<?php

ini_set( 'error_log', dirname( dirname( ABSPATH ) ) . '/logs/php-error.log' );

define( 'PLUGINS_TABLE_PREFIX',  $table_prefix );
define( 'WP_CORE_STABLE_BRANCH', '4.5' );

// Include Core themes
register_theme_directory( ABSPATH . 'wp-content/themes' );

// Load global must-use plugins.
foreach ( glob( __DIR__ . "pub/*.php" ) as $filename ) {
	require_once( $filename );
}

// Run site-specific functionality
switch( $_SERVER['HTTP_HOST'] ) {
	case 'developer.wordpressorg.test':
		wme_developer_wordpressorg_dev();
		break;

	case 'global.wordpressorg.test':
	case 'en.wordpressorg.test':
	case 'es.wordpressorg.test':
	case 'ja.wordpressorg.test':
		wme_global_wordpressorg_dev();
		break;
}

/**
 * developer.wordpressorg.test
 */
function wme_developer_wordpressorg_dev() {
	add_filter( 'show_admin_bar', '__return_false' );
}

/**
 * global.wordpressorg.test
 */
function wme_global_wordpressorg_dev() {
	// Load mu-plugins in subdirectories
	require_once( __DIR__ . '/global_wordpressorg_dev/downloads/rosetta-downloads.php' );
	require_once( __DIR__ . '/global_wordpressorg_dev/roles/rosetta-roles.php' );
	require_once( __DIR__ . '/global_wordpressorg_dev/showcase/rosetta-showcase.php' );

	// Stub the Rosetta plugin until it's open-sourced, to avoid fatal PHP errors
	class Rosetta_WordPress {
		/**
		 * Whether this site is the main site (locale.wordpress.org) or not.
		 *
		 * @var string|bool
		 */
		public $is_main_site = false;

		/**
		 * Holds the current locale, false if not found or en_US.
		 *
		 * @var string|bool
		 */
		public $locale = false;

		/**
		 * Holds the Rosetta instance.
		 *
		 * @var Rosetta
		 */
		public $rosetta = null;

		/**
		 * Holds the Rosetta_Showcase instance.
		 *
		 * @var Rosetta_Showcase
		 */
		public $showcase = null;

		/**
		 * Holds the Rosetta_Downloads instance.
		 *
		 * @var Rosetta_Downloads
		 */
		public $downloads = null;

		/**
		 * Holds the Rosetta_Roles instance.
		 *
		 * @var Rosetta_Roles
		 */
		public $roles = null;

		/**
		 * Constructor.
		 */
		public function __construct() {
			$this->locale = $this->get_locale();
			if ( 'en_US' === $this->locale ) {
				$this->locale = false;
			}

			// Sub-sites like /themes or /forums have another path.
			$this->is_main_site = ( '/' === get_blog_details( null, false )->path );

			if ( $this->is_main_site ) {
				$this->rosetta = new Rosetta();
				$this->showcase = new Rosetta_Showcase();
				$this->downloads = new Rosetta_Downloads();
				$this->roles = new Rosetta_Roles();
			}

			add_action( 'plugins_loaded', array( $this, 'plugins_loaded' ) );
		}

		/**
		 * Attaches hooks once plugins are loaded.
		 */
		public function plugins_loaded() {
			add_action( 'init', array( $this, 'load_textdomain' ) );
			add_filter( 'locale', array( $this, 'get_locale' ) );
		}

		/**
		 * Loads the textdomain for Rosetta.
		 */
		public function load_textdomain() {
			load_textdomain( 'rosetta', WP_LANG_DIR . '/rosetta/rosetta-' .  $this->locale . '.mo' );
		}

		/**
		 * Retrieves the locale associated with the current subdomain.
		 *
		 * @return string Associated locale or 'en_US' if no locale was not found.
		 */
		public function get_locale() {
			static $locales = array();
			$hostname = $_SERVER['HTTP_HOST'];

			if ( isset( $locales[ $hostname ] ) ) {
				return $locales[ $hostname ];
			}

			$locale = '';
			if ( preg_match( "/^([a-z-]+)\.wordpressorg.test$/", $hostname, $matches ) ) {
				switch( $matches[1] ) {
					case 'es' :
						$locale = 'es_ES';
						break;
					case 'ja' :
						$locale = 'ja';
						break;
				}
			}

			if ( ! $locale ) {
				$locale = 'en_US';
			}

			$locales[ $hostname ] = $locale;

			return $locale;
		}

		/**
		 * Provides a screenshot URL of a site.
		 *
		 * Used by the theme.
		 *
		 * @param  string $url  URL of a site.
		 * @param  int    $size Width of the screenshot.
		 * @return string URL to the screenshot.
		 */
		function screenshot_url( $url, $size ) {
			if ( 0 !== strpos( $url, 'http://' ) ) {
				$url = 'http://' . $url;
			}

			return 'http://s.wordpress.com/mshots/v1/' . urlencode( esc_url( $url ) ) . '?w=' . intval( $size );
		}
	}

	class Rosetta {
		public function get_latest_release() {
			return array(
				'version'     => WP_CORE_STABLE_BRANCH,
				'zip_size_mb' => '6.4',
				'targz_url'   => 'download.tar.gz',
				'zip_url'     => 'download.zip',
				'tar_size_mb' => '5.9',
			);
		}

		public function get_releases_breakdown() {
			return array();
		}

		public function get_latest_public_release() {
			return $this->get_latest_release();
		}
	}

	$GLOBALS['rosetta'] = new Rosetta_WordPress();

	/**
	 * Filters the URLs to use the current localized domain name, rather than wordpressorg.test.
	 *
	 * Required for the theme and plugin directory which are available at multiple URLs (internationalized domains).
	 * This function allows for the one blog (a single blog_id) to be presented at multiple URLs yet have correct
	 * localized links.
	 */
	function wme_rosetta_network_localize_url( $url ) {
		static $localized_url = null;

		if ( is_null( $localized_url ) ) {
			$localized_url = 'http://' . preg_replace( '![^a-z.-]+!', '', $_SERVER['HTTP_HOST'] );
		}

		return preg_replace( '!^[http]+://wordpressorg\.test!i', $localized_url, $url );
	}
	add_filter( 'option_home',    'wme_rosetta_network_localize_url' );
	add_filter( 'option_siteurl', 'wme_rosetta_network_localize_url' );
}
