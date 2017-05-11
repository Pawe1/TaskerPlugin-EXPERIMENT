unit Tasker.Plugin.Host;

interface

type
  TDummy = class
  end;

//// ---------------------------------- HOST  ----------------------------------------- //
//
//	public static class Host {
//
//		/**
//		 * Tell the plugin what capabilities the host support. This should be called when sending
//		 * intents to any EditActivity, FireReceiver or QueryReceiver.
//		 *
//		 * @param  toPlugin the intent we're sending
//		 * @return capabilities one or more of the EXTRA_HOST_CAPABILITY_XXX flags
//		*/
//		public static Intent addCapabilities( Intent toPlugin, int capabilities ) {
//			return toPlugin.putExtra( EXTRA_HOST_CAPABILITIES, capabilities  );
//		}
//
//		/**
//		* Add an intent to the fire intent before it goes to the plugin FireReceiver, which the plugin
//		* can use to signal when it is finished. Only use if @code{pluginWantsSychronousExecution} is true.
//		*
//		* @param fireIntent fire intent going to the plugin
//		* @param completionIntent intent which will signal the host that the plugin is finished.
//		* Implementation is host-dependent.
//       	*/
//		public static void addCompletionIntent( Intent fireIntent, Intent completionIntent ) {
//			fireIntent.putExtra(
//				Setting.EXTRA_PLUGIN_COMPLETION_INTENT,
//                        	completionIntent.toUri( Intent.URI_INTENT_SCHEME )
//                	);
//        }
//
//		/**
//	         * When a setting plugin is finished, it sends the host the intent which was passed to it
//       		  * via @code{addCompletionIntent}.
//       		  *
//       		  * @param completionIntent intent returned from the plugin when it finished.
//       		  * @return resultCode measure of plugin success, defaults to UNKNOWN
//       	*/
//		public static int getSettingResultCode( Intent completionIntent ) {
//
//			Integer val = (Integer) getExtraValueSafe( completionIntent, Setting.EXTRA_RESULT_CODE, Integer.class, "getSettingResultCode" );
//
//			return ( val == null ) ? Setting.RESULT_CODE_UNKNOWN : val;
//		}
//
//       	 /**
//		 * Extract a bundle of variables from an intent received from the FireReceiver. This
//		 * should be called if the host previously indicated to the plugin
//		 * that it supports setting variable return.
//		 *
//		 * @param resultExtras getResultExtras() from BroadcastReceiver:onReceive()
//		 * @return variables a bundle of variable name/value pairs
//		 * @see #addCapabilities(Intent, int)
//		*/
//
//		public static Bundle getVariablesBundle( Bundle resultExtras ) {
//			return (Bundle) getBundleValueSafe(
//					resultExtras, EXTRA_VARIABLES_BUNDLE, Bundle.class, "getVariablesBundle"
//			);
//		}
//
//		/**
//		* Inform a setting plugin of the timeout value the host is using.
//		*
//		* @param toPlugin the intent we're sending
//		* @param timeoutMS the hosts timeout setting for the action. Note that this may differ from
//		* that which the plugin requests.
//		* @see #REQUESTED_TIMEOUT_MS_NONE, REQUESTED_TIMEOUT_MS_MAX, REQUESTED_TIMEOUT_MS_NEVER
//		*/
//		public static void addHintTimeoutMS( Intent toPlugin, int timeoutMS ) {
//			getHintsBundle( toPlugin, "addHintTimeoutMS" ).putInt( BUNDLE_KEY_HINT_TIMEOUT_MS, timeoutMS );
//		}
//
//		private static Bundle getHintsBundle( Intent intent, String funcName ) {
//
//			Bundle hintsBundle = (Bundle) getExtraValueSafe( intent, EXTRA_HINTS_BUNDLE, Bundle.class, funcName );
//
//			if ( hintsBundle == null ) {
//				hintsBundle = new Bundle();
//				intent.putExtra( EXTRA_HINTS_BUNDLE, hintsBundle );
//			}
//
//			return hintsBundle;
//		}
//
//		public static boolean haveRequestedTimeout( Bundle extrasFromPluginEditActivity ) {
//			return extrasFromPluginEditActivity.containsKey( Setting.EXTRA_REQUESTED_TIMEOUT );
//		}
//
//		public static int getRequestedTimeoutMS( Bundle extrasFromPluginEditActivity ) {
//			return
//					(Integer) getBundleValueSafe(
//							extrasFromPluginEditActivity, Setting.EXTRA_REQUESTED_TIMEOUT,	Integer.class, "getRequestedTimeout"
//					)
//			;
//		}
//
//		public static String [] getSettingVariableReplaceKeys( Bundle fromPluginEditActivity ) {
//			return getStringArrayFromBundleString(
//					fromPluginEditActivity, Setting.BUNDLE_KEY_VARIABLE_REPLACE_STRINGS,
//					"getSettingVariableReplaceKeys"
//			);
//		}
//
//		public static String [] getKeysWithEncoding( Bundle fromPluginEditActivity, Encoding encoding ) {
//
//			String [] toReturn = null;
//
//			if ( Encoding.JSON.equals( encoding ) )
//				toReturn = getStringArrayFromBundleString(
//						fromPluginEditActivity, TaskerPlugin.BUNDLE_KEY_ENCODING_JSON_KEYS,
//						"getKeyEncoding:JSON"
//				);
//			else
//				Log.w( TAG, "Host.getKeyEncoding: unknown encoding " + encoding );
//
//			return toReturn;
//		}
//
//		public static boolean haveRelevantVariables( Bundle b ) {
//			return b.containsKey( BUNDLE_KEY_RELEVANT_VARIABLES );
//		}
//
//		public static void cleanRelevantVariables( Bundle b ) {
//			b.remove( BUNDLE_KEY_RELEVANT_VARIABLES );
//		}
//
//		public static void cleanHints( Bundle extras ) {
//			extras.remove( TaskerPlugin.EXTRA_HINTS_BUNDLE );
//		}
//
//		public static void cleanRequestedTimeout( Bundle extras ) {
//			extras.remove( Setting.EXTRA_REQUESTED_TIMEOUT );
//		}
//
//		public static void cleanSettingReplaceVariables( Bundle b ) {
//			b.remove( Setting.BUNDLE_KEY_VARIABLE_REPLACE_STRINGS );
//		}
//	}

implementation

end.
