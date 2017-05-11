unit Tasker.Plugin.Event;

interface


type
  TDummy = class
  end;

//// ----------------------------- EVENT PLUGIN ONLY --------------------------------- //
//
//	public static class Event {
//
//		public final static String	PASS_THROUGH_BUNDLE_MESSAGE_ID_KEY = BASE_KEY + ".MESSAGE_ID";
//
//		private final static String	EXTRA_REQUEST_QUERY_PASS_THROUGH_DATA = EXTRAS_PREFIX + "PASS_THROUGH_DATA";
//
//		/**
//		 * @param  extrasFromHost intent extras from the intent received by the QueryReceiver
//		 * @see #addPassThroughData(Intent, Bundle)
//		*/
//		public static boolean hostSupportsRequestQueryDataPassThrough( Bundle extrasFromHost ) {
//			return hostSupports( extrasFromHost,  EXTRA_HOST_CAPABILITY_REQUEST_QUERY_DATA_PASS_THROUGH );
//		}
//
//		/**
//		 * Specify a bundle of data (probably representing whatever change happened in the condition)
//		 * which will be included in the QUERY_CONDITION broadcast sent by the host for each
//		 * event instance of the plugin.
//		 *
//		 * The minimal purpose is to enable the plugin to associate a QUERY_CONDITION to the
//		 * with the REQUEST_QUERY that caused it.
//		 *
//		 * Note that for security reasons it is advisable to also store a message ID with the bundle
//		 * which can be compared to known IDs on receipt. The host cannot validate the source of
//		 * REQUEST_QUERY intents so fake data may be passed. Replay attacks are also possible.
//		 * addPassThroughMesssageID() can be used to add an ID if the plugin doesn't wish to add it's
//		 * own ID to the pass through bundle.
//		 *
//		 * Note also that there are several situations where REQUEST_QUERY will not result in a
//		 * QUERY_CONDITION intent (e.g. event throttling by the host), so plugin-local data
//		 * indexed with a message ID needs to be timestamped and eventually timed-out.
//		 *
//		 * This function can be called multiple times, each time all keys in data will be added to
//		 * that of previous calls.
//		 *
//		 * @param requestQueryIntent intent being sent to the host
//		 * @param data the data to be passed-through
//		 * @see #hostSupportsRequestQueryDataPassThrough(Bundle)
//		 * @see #retrievePassThroughData(Intent)
//		 * @see #addPassThroughMessageID
//		 *
//		*/
//		public static void addPassThroughData( Intent requestQueryIntent, Bundle data ) {
//
//			Bundle passThroughBundle = retrieveOrCreatePassThroughBundle( requestQueryIntent );
//
//			passThroughBundle.putAll( data );
//		}
//
//		/**
//		 * Retrieve the pass through data from a QUERY_REQUEST from the host which was generated
//		 * by a REQUEST_QUERY from the plugin.
//		 *
//		 * Note that if addPassThroughMessageID() was previously called, the data will contain an extra
//		 * key TaskerPlugin.Event.PASS_THOUGH_BUNDLE_MESSAGE_ID_KEY.
//		 *
//		 * @param queryConditionIntent QUERY_REQUEST sent from host
//		 * @return data previously added to the REQUEST_QUERY intent
//		 * @see #hostSupportsRequestQueryDataPassThrough(Bundle)
//		 * @see #addPassThroughData(Intent,Bundle)
//		*/
//		public static Bundle retrievePassThroughData( Intent queryConditionIntent ) {
//			return (Bundle) getExtraValueSafe(
//					queryConditionIntent,
//					EXTRA_REQUEST_QUERY_PASS_THROUGH_DATA,
//					Bundle.class,
//					"retrievePassThroughData"
//			);
//		}
//
//		/**
//		 * Add a message ID to a REQUEST_QUERY intent which will then be included in the corresponding
//		 * QUERY_CONDITION broadcast sent by the host for each event instance of the plugin.
//		 *
//		 * The minimal purpose is to enable the plugin to associate a QUERY_CONDITION to the
//		 * with the REQUEST_QUERY that caused it. It also allows the message to be verified
//		 * by the plugin to prevent e.g. replay attacks
//		 *
//		 * @param requestQueryIntent intent being sent to the host
//		 * @return a guaranteed non-repeating within 100 calls message ID
//		 * @see #hostSupportsRequestQueryDataPassThrough(Bundle)
//		 * @see #retrievePassThroughData(Intent)
//		 * @return an ID for the bundle so it can be identified and the caller verified when it is again received by the plugin
//		 *
//		*/
//		public static int addPassThroughMessageID( Intent requestQueryIntent ) {
//
//			Bundle passThroughBundle = retrieveOrCreatePassThroughBundle( requestQueryIntent );
//
//			int id = getPositiveNonRepeatingRandomInteger();
//
//			passThroughBundle.putInt( PASS_THROUGH_BUNDLE_MESSAGE_ID_KEY, id );
//
//			return id;
//		}
//
//		/*
//		 * Retrieve the pass through data from a QUERY_REQUEST from the host which was generated
//		 * by a REQUEST_QUERY from the plugin.
//		 *
//		 * @param queryConditionIntent QUERY_REQUEST sent from host
//		 * @return the ID which was passed through by the host, or -1 if no ID was found
//		 * @see #hostSupportsRequestQueryDataPassThrough(Bundle)
//		 * @see #addPassThroughData(Intent,Bundle)
//		*/
//		public static int retrievePassThroughMessageID( Intent queryConditionIntent ) {
//
//			int toReturn = -1;
//
//			Bundle passThroughData = Event.retrievePassThroughData( queryConditionIntent );
//
//			if ( passThroughData != null ) {
//				Integer id = (Integer) getBundleValueSafe(
//						passThroughData,
//						PASS_THROUGH_BUNDLE_MESSAGE_ID_KEY,
//						Integer.class,
//						"retrievePassThroughMessageID"
//				);
//
//				if ( id != null )
//					toReturn = id;
//			}
//
//			return toReturn;
//		}
//
//		// internal use
//		private static Bundle retrieveOrCreatePassThroughBundle( Intent requestQueryIntent ) {
//
//			Bundle passThroughBundle;
//
//			if ( requestQueryIntent.hasExtra( EXTRA_REQUEST_QUERY_PASS_THROUGH_DATA ) )
//				passThroughBundle = requestQueryIntent.getBundleExtra( EXTRA_REQUEST_QUERY_PASS_THROUGH_DATA );
//			else {
//				passThroughBundle = new Bundle();
//				requestQueryIntent.putExtra( EXTRA_REQUEST_QUERY_PASS_THROUGH_DATA, passThroughBundle );
//			}
//
//			return passThroughBundle;
//		}
//	}

implementation

end.
