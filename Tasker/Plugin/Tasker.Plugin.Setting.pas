unit Tasker.Plugin.Setting;

interface


type
  TDummy = class
  end;

//// ----------------------------- SETTING PLUGIN ONLY --------------------------------- //
//
//	public static class Setting {
//
//		/**
//	     * 	Variable name into which a description of any error that occurred can be placed
//	     *  for the user to process.
//	     *
//	     *  Should *only* be set when the BroadcastReceiver result code indicates a failure.
//		 *
//	     *  Note that the user needs to have configured the task to continue after failure of the plugin
//	     *  action otherwise they will not be able to make use of the error message.
//	     *
//	     *  For use with #addRelevantVariableList(Intent, String[]) and #addVariableBundle(Bundle, Bundle)
//	     *
//	     */
//		public final static String		VARNAME_ERROR_MESSAGE = VARIABLE_PREFIX + "errmsg";
//
//		/**
//		 *	@see #setVariableReplaceKeys(Bundle, String[])
//	     */
//		private final static String		BUNDLE_KEY_VARIABLE_REPLACE_STRINGS = EXTRAS_PREFIX + "VARIABLE_REPLACE_KEYS";
//
//		/**
//		 *	@see #requestTimeoutMS(android.content.Intent, int)
//	     */
//		private final static String 	EXTRA_REQUESTED_TIMEOUT = EXTRAS_PREFIX + "REQUESTED_TIMEOUT";
//
//		/**
//		 *	@see #requestTimeoutMS(android.content.Intent, int)
//	     */
//
//        public final static int 		REQUESTED_TIMEOUT_MS_NONE = 0;
//
//		/**
//		 *	@see #requestTimeoutMS(android.content.Intent, int)
//	     */
//
//        public final static int 		REQUESTED_TIMEOUT_MS_MAX = 3599000;
//
//		/**
//		 *	@see #requestTimeoutMS(android.content.Intent, int)
//	     */
//
//        public final static int 		REQUESTED_TIMEOUT_MS_NEVER = REQUESTED_TIMEOUT_MS_MAX + 1000;
//
//		 /**
//         *  @see #signalFinish(Context, Intent, int, Bundle)
//         *  @see Host#addCompletionIntent(Intent, Intent)
//         */
//        private final static String 	EXTRA_PLUGIN_COMPLETION_INTENT = EXTRAS_PREFIX + "COMPLETION_INTENT";
//
//		/**
//         *  @see #signalFinish(Context, Intent, int, Bundle)
//         *  @see Host#getSettingResultCode(Intent)
//         */
//        public final static String 		EXTRA_RESULT_CODE = EXTRAS_PREFIX + "RESULT_CODE";
//
//		/**
//		*  @see #signalFinish(Context, Intent, int, Bundle)
//        *  @see Host#getSettingResultCode(Intent)
//        */
//
//        public final static int	RESULT_CODE_OK = Activity.RESULT_OK;
//        public final static int	RESULT_CODE_OK_MINOR_FAILURES = Activity.RESULT_FIRST_USER;
//        public final static int	RESULT_CODE_FAILED = Activity.RESULT_FIRST_USER + 1;
//        public final static int	RESULT_CODE_PENDING = Activity.RESULT_FIRST_USER + 2;
//        public final static int	RESULT_CODE_UNKNOWN = Activity.RESULT_FIRST_USER + 3;
//
//        /**
//        * If a plugin wants to define it's own error codes, start numbering them here.
//        * The code will be placed in an error variable (%err in the case of Tasker) for
//        * the user to process after the plugin action.
//        */
//
//        public final static int	RESULT_CODE_FAILED_PLUGIN_FIRST = Activity.RESULT_FIRST_USER + 9;
//
//        /**
//		 * Used by: plugin EditActivity.
//		 *
//		 * Indicates to plugin that host will replace variables in specified bundle keys.
//		 *
//		 * Replacement takes place every time the setting is fired, before the bundle is
//		 * passed to the plugin FireReceiver.
//		 *
//		 * @param  extrasFromHost intent extras from the intent received by the edit activity
//		 * @see #setVariableReplaceKeys(Bundle, String[])
//		*/
//		public static boolean hostSupportsOnFireVariableReplacement( Bundle extrasFromHost ) {
//			return hostSupports( extrasFromHost, EXTRA_HOST_CAPABILITY_SETTING_FIRE_VARIABLE_REPLACEMENT );
//		}
//
//		/**
//		 * Used by: plugin EditActivity.
//		 *
//		 * Description as above.
//		 *
//		 * This version also includes backwards compatibility with pre 4.2 Tasker versions.
//		 * At some point this function will be deprecated.
//		 *
//		 * @param  editActivity the plugin edit activity, needed to test calling Tasker version
//		 * @see #setVariableReplaceKeys(Bundle, String[])
//		*/
//
//		public static boolean hostSupportsOnFireVariableReplacement( Activity editActivity ) {
//
//			boolean supportedFlag = hostSupportsOnFireVariableReplacement( editActivity.getIntent().getExtras() );
//
//			if ( ! supportedFlag ) {
//
//				ComponentName callingActivity = editActivity.getCallingActivity();
//
//				if ( callingActivity == null )
//					Log.w( TAG, "hostSupportsOnFireVariableReplacement: null callingActivity, defaulting to false" );
//				else {
//					String callerPackage = callingActivity.getPackageName();
//
//					// Tasker only supporteed this from 1.0.10
//					supportedFlag =
//						( callerPackage.startsWith( BASE_KEY ) ) &&
//						( getPackageVersionCode( editActivity.getPackageManager(), callerPackage ) > FIRST_ON_FIRE_VARIABLES_TASKER_VERSION )
//					;
//				}
//			}
//
//			return supportedFlag;
//		}
//
//		public static boolean hostSupportsSynchronousExecution( Bundle extrasFromHost ) {
//			return hostSupports( extrasFromHost, EXTRA_HOST_CAPABILITY_SETTING_SYNCHRONOUS_EXECUTION );
//		}
//
//		/**
//	 	* Request the host to wait the specified number of milliseconds before continuing.
//	 	* Note that the host may choose to ignore the request.
//	 	*
//	 	* Maximum value is REQUESTED_TIMEOUT_MS_MAX.
//	 	* Also available are REQUESTED_TIMEOUT_MS_NONE (continue immediately without waiting
//	 	* for the plugin to finish) and REQUESTED_TIMEOUT_MS_NEVER (wait forever for
//	 	* a result).
//	 	*
//	 	* Used in EditActivity, before setResult().
//	 	*
//	 	* @param  intentToHost the intent being returned to the host
//	 	* @param  timeoutMS
//	 	*/
//		public static void requestTimeoutMS( Intent intentToHost, int timeoutMS ) {
//			if ( timeoutMS < 0 )
//				Log.w( TAG, "requestTimeoutMS: ignoring negative timeout (" + timeoutMS + ")" );
//			else {
//				if (
//						( timeoutMS > REQUESTED_TIMEOUT_MS_MAX ) &&
//						( timeoutMS != REQUESTED_TIMEOUT_MS_NEVER )
//				) {
//					Log.w( TAG, "requestTimeoutMS: requested timeout " + timeoutMS + " exceeds maximum, setting to max (" + REQUESTED_TIMEOUT_MS_MAX + ")" );
//					timeoutMS = REQUESTED_TIMEOUT_MS_MAX;
//				}
//				intentToHost.putExtra( EXTRA_REQUESTED_TIMEOUT, timeoutMS );
//			}
//		}
//
//		/**
//		 * Used by: plugin EditActivity
//		 *
//		 * Indicates to host which bundle keys should be replaced.
//		 *
//		 * @param  resultBundleToHost the bundle being returned to the host
//		 * @param  listOfKeyNames which bundle keys to replace variables in when setting fires
//		 * @see #hostSupportsOnFireVariableReplacement(Bundle)
//		 * @see #setKeyEncoding(Bundle,String[],Encoding)
//		*/
//		public static void setVariableReplaceKeys( Bundle resultBundleToHost, String [] listOfKeyNames ) {
//			addStringArrayToBundleAsString(
//					listOfKeyNames, resultBundleToHost, BUNDLE_KEY_VARIABLE_REPLACE_STRINGS,
//					"setVariableReplaceKeys"
//			);
//		}
//
//		/**
//		 * Used by: plugin FireReceiver
//		 *
//		 * Indicates to plugin whether the host will process variables which it passes back
//		 *
//		 * @param  extrasFromHost intent extras from the intent received by the FireReceiver
//		 * @see #signalFinish(Context, Intent, int, Bundle)
//		*/
//		public static boolean hostSupportsVariableReturn( Bundle extrasFromHost ) {
//			return hostSupports( extrasFromHost, EXTRA_HOST_CAPABILITY_SETTING_RETURN_VARIABLES );
//		}
//
//		 /**
//         * Used by: plugin FireReceiver
//         *
//         * Tell the host that the plugin has finished execution.
//         *
//         * This should only be used if RESULT_CODE_PENDING was returned by FireReceiver.onReceive().
//         *
//         * @param originalFireIntent the intent received from the host (via onReceive())
//         * @param resultCode level of success in performing the settings
//         * @param vars any variables that the plugin wants to set in the host
//         * @see #hostSupportsSynchronousExecution(Bundle)
//        */
//        public static boolean signalFinish( Context context, Intent originalFireIntent, int resultCode, Bundle vars ) {
//
//        	String errorPrefix = "signalFinish: ";
//
//        	boolean okFlag = false;
//
//        	String completionIntentString = (String) getExtraValueSafe( originalFireIntent, Setting.EXTRA_PLUGIN_COMPLETION_INTENT, String.class, "signalFinish" );
//
//        	if ( completionIntentString != null ) {
//
//        		Uri completionIntentUri = null;
//        		try {
//        			completionIntentUri = Uri.parse( completionIntentString );
//        		}
//        		// 	should only throw NullPointer but don't particularly trust it
//        		catch ( Exception e ) {
//        			Log.w( TAG, errorPrefix + "couldn't parse " + completionIntentString );
//        		}
//
//        		if ( completionIntentUri != null ) {
//        			try {
//        				Intent completionIntent = Intent.parseUri( completionIntentString, Intent.URI_INTENT_SCHEME );
//
//        				completionIntent.putExtra( EXTRA_RESULT_CODE, resultCode );
//
//        				if ( vars != null )
//        					completionIntent.putExtra( EXTRA_VARIABLES_BUNDLE, vars );
//
//        				context.sendBroadcast( completionIntent );
//
//        				okFlag = true;
//        			}
//        			catch ( URISyntaxException e ) {
//        				Log.w( TAG, errorPrefix + "bad URI: " + completionIntentUri );
//        			}
//        		}
//        	}
//
//        	return okFlag;
//        }
//
//        /**
//		 * Check for a hint on the timeout value the host is using.
//		 * Used by: plugin FireReceiver.
//		 * Requires Tasker 4.7+
//		 *
//		 * @param  extrasFromHost intent extras from the intent received by the FireReceiver
//		 * @return timeoutMS the hosts timeout setting for the action or -1 if no hint is available.
//		 *
//		 * @see #REQUESTED_TIMEOUT_MS_NONE, REQUESTED_TIMEOUT_MS_MAX, REQUESTED_TIMEOUT_MS_NEVER
//		 */
//        public static int getHintTimeoutMS( Bundle extrasFromHost ) {
//
//        	int timeoutMS = -1;
//
//			Bundle hintsBundle = (Bundle) TaskerPlugin.getBundleValueSafe( extrasFromHost, EXTRA_HINTS_BUNDLE, Bundle.class, "getHintTimeoutMS" );
//
//			if ( hintsBundle != null ) {
//
//				Integer val = (Integer) getBundleValueSafe( hintsBundle, BUNDLE_KEY_HINT_TIMEOUT_MS, Integer.class, "getHintTimeoutMS" );
//
//				if ( val != null )
//					timeoutMS = val;
//			}
//
//			return timeoutMS;
//		}
//	}

implementation

end.
