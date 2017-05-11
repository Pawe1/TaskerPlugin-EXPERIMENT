unit Tasker.Plugin;

{$SCOPEDENUMS OFF}

interface

implementation

// Constants and functions for Tasker *extensions* to the plugin protocol
// Lightweight Delphi port of TaskerPlugin.java (v1.8) by PC
// Source: http://tasker.dinglisch.net/code/TaskerPlugin.java
// See Also: http://tasker.dinglisch.net/plugins.html

//<!--
//             This is the "edit" Activity. Note that the host will reject plug-in
//             Activities for the following reasons:
//                 - Missing "android:label=[...]"
//                 - Missing "android:icon=[...]"
//                 - The Activity isn't exported (e.g. android:exported="false")
//                 - The Activity isn't enabled (e.g. android:enabled="false")
//                 - The Activity requires permissions not available to the host
//        -->
//        <activity-alias
//                android:name="com.twofortyfouram.locale.example.setting.toast.ui.activity.PluginActivity"
//                android:exported="true"
//                android:icon="@drawable/ic_plugin"
//                android:label="@string/plugin_name"
//                android:targetActivity="com.twofortyfouram.locale.example.setting.toast.ui.activity.EditActivity"
//                tools:ignore="ExportedActivity">
//            <!-- this Intent filter allows the plug-in to be discovered by the host. -->
//            <intent-filter>
//                <action android:name="com.twofortyfouram.locale.intent.action.EDIT_SETTING"/>
//            </intent-filter>
//        </activity-alias>


//<!--
//             If this plug-in does not stand alone (e.g. it is only a plug-in for Locale and does not
//             have a Launcher Activity), including this in the manifest will help when users try to
//             open the app directly from the app store.
//        -->
//        <activity
//                android:name="com.twofortyfouram.locale.sdk.client.ui.activity.InfoActivity"
//                android:exported="true"
//                tools:ignore="ExportedActivity">
//            <intent-filter>
//                <action android:name="android.intent.action.MAIN"/>
//
//                <category android:name="android.intent.category.INFO"/>
//            </intent-filter>
//        </activity>

//<!--
//             This is the "fire" BroadcastReceiver. Note that the host will reject plug-in
//             BroadcastReceivers for the following reasons:
//                - The BroadcastReceiver isn't exported (e.g. android:exported="false")
//                - The BroadcastReceiver isn't enabled (e.g. android:enabled="false")
//                - The BroadcastReceiver requires permissions not available to the host
//                - There are multiple BroadcastReceivers for com.twofortyfouram.locale.intent.action.FIRE_SETTING
//        -->
//        <receiver
//                android:name="com.twofortyfouram.locale.example.setting.toast.receiver.FireReceiver"
//                android:exported="true"
//                android:process=":background"
//                tools:ignore="ExportedReceiver">
//
//            <!-- this Intent filter allows the plug-in to discovered by the host. -->
//            <intent-filter>
//                <action android:name="com.twofortyfouram.locale.intent.action.FIRE_SETTING"/>
//            </intent-filter>
//        </receiver>

type
  TTaskerPlugin = class
  {strict} private
    const
      TAG = 'TaskerPlugin';
      BASE_KEY = 'net.dinglisch.android.tasker';
      EXTRAS_PREFIX = BASE_KEY + '.extras.';
      FIRST_ON_FIRE_VARIABLES_TASKER_VERSION: Integer = 80;

      // when generating non-repeating integers, look this far back for repeats
      // see getPositiveNonRepeatingRandomInteger()
	    RANDOM_HISTORY_SIZE: Integer = 100;

      VARIABLE_NAME_START_EXPRESSION = '[\\w&&[^_]]';
      VARIABLE_NAME_MID_EXPRESSION = '[\\w0-9]+';
      VARIABLE_NAME_END_EXPRESSION = '[\\w0-9&&[^_]]';

      // VARIABLE_NAME_MATCH_PATTERN: Pattern = null;

      // see #addVariableBundle(Bundle, Bundle)
      // see Host#getVariablesBundle(Bundle)
      EXTRA_VARIABLES_BUNDLE = EXTRAS_PREFIX + 'VARIABLES';

      // Host capabilities, passed to plugin with edit intents
      EXTRA_HOST_CAPABILITIES = EXTRAS_PREFIX + 'HOST_CAPABILITIES';

      //see Setting#hostSupportsVariableReturn(Bundle)
      EXTRA_HOST_CAPABILITY_RELEVANT_VARIABLES: Integer = 16;

      // Possible encodings of text in bundle values
      // see #setKeyEncoding(Bundle,String[],Encoding)
      BUNDLE_KEY_ENCODING_JSON_KEYS = BASE_KEY + '.JSON_ENCODED_KEYS';


      // Miscellaneous operational hints going one way or the other
      // see Setting#hostSupportsVariableReturn(Bundle)
      EXTRA_HINTS_BUNDLE = EXTRAS_PREFIX + 'HINTS';

      BUNDLE_KEY_HINT_PREFIX = '.hints.';

      BUNDLE_KEY_HINT_TIMEOUT_MS = BUNDLE_KEY_HINT_PREFIX + 'TIMEOUT';

     	// see #hostSupportsRelevantVariables(Bundle)
      // see #addRelevantVariableList(Intent, String[])
      // see #getRelevantVariableList(Bundle)
	    BUNDLE_KEY_RELEVANT_VARIABLES = BASE_KEY + '.RELEVANT_VARIABLES';

  public
    type
      TEncoding = (JSON);
  public
    const
      VARIABLE_PREFIX = '%';

	    // Action that the EditActivity for an event plugin should be launched by
      ACTION_EDIT_EVENT = BASE_KEY + '.ACTION_EDIT_EVENT';

      VARIABLE_NAME_MAIN_PART_MATCH_EXPRESSION =
        VARIABLE_NAME_START_EXPRESSION + VARIABLE_NAME_MID_EXPRESSION +
        VARIABLE_NAME_END_EXPRESSION;

      VARIABLE_NAME_MATCH_EXPRESSION =  VARIABLE_PREFIX + '+' +
        VARIABLE_NAME_MAIN_PART_MATCH_EXPRESSION;

      // see Setting#hostSupportsVariableReturn(Bundle)
      EXTRA_HOST_CAPABILITY_SETTING_RETURN_VARIABLES: Integer = 2;

      // see Condition#hostSupportsVariableReturn(Bundle)
      EXTRA_HOST_CAPABILITY_CONDITION_RETURN_VARIABLES: Integer = 4;

      // see Setting#hostSupportsOnFireVariableReplacement(Bundle)
      EXTRA_HOST_CAPABILITY_SETTING_FIRE_VARIABLE_REPLACEMENT: Integer = 8;

      EXTRA_HOST_CAPABILITY_SETTING_SYNCHRONOUS_EXECUTION: Integer = 32;

      EXTRA_HOST_CAPABILITY_REQUEST_QUERY_DATA_PASS_THROUGH: Integer = 64;

      EXTRA_HOST_CAPABILITY_ENCODING_JSON: Integer = 128;

//      EXTRA_HOST_CAPABILITY_ALL: Integer =
//        EXTRA_HOST_CAPABILITY_SETTING_RETURN_VARIABLES or
//        EXTRA_HOST_CAPABILITY_CONDITION_RETURN_VARIABLES or
//        EXTRA_HOST_CAPABILITY_SETTING_FIRE_VARIABLE_REPLACEMENT or
//        EXTRA_HOST_CAPABILITY_RELEVANT_VARIABLES or
//        EXTRA_HOST_CAPABILITY_SETTING_SYNCHRONOUS_EXECUTION or
//        EXTRA_HOST_CAPABILITY_REQUEST_QUERY_DATA_PASS_THROUGH or
//        EXTRA_HOST_CAPABILITY_ENCODING_JSON;

//      function hostSupportsKeyEncoding({extrasFromHost: Bundle;} Encoding: TEncoding): Boolean; static;
//public static boolean hostSupportsRelevantVariables( Bundle extrasFromHost ) {
//		return hostSupports( extrasFromHost,  EXTRA_HOST_CAPABILITY_RELEVANT_VARIABLES );

// 	* Specifies to host which variables might be used by the plugin.
// 	* Used in EditActivity, before setResult().
// 	* @param  intentToHost the intent being returned to the host
// 	* @param  variableNames array of relevant variable names
//	public static void addRelevantVariableList( Intent intentToHost, String [] variableNames ) {
//		intentToHost.putExtra( BUNDLE_KEY_RELEVANT_VARIABLES, variableNames );

// 	* Validate a variable name.
// 	* The basic requirement for variables from a plugin is that they must be all lower-case.
// 	* @param  varName name to check
//    public static boolean variableNameValid( String varName ) {
//
//    	boolean validFlag = false;
//
//    	if ( varName == null )
//    		Log.d( TAG, "variableNameValid: null name" );
//    	else {
//    		if ( VARIABLE_NAME_MATCH_PATTERN == null )
//    			VARIABLE_NAME_MATCH_PATTERN = Pattern.compile( VARIABLE_NAME_MATCH_EXPRESSION, 0 );
//
//    		if ( VARIABLE_NAME_MATCH_PATTERN.matcher( varName ).matches() ) {
//
//    			if ( variableNameIsLocal( varName ) )
//    				validFlag = true;
//    			else
//    				Log.d( TAG, "variableNameValid: name not local: " + varName );
//    		}
//    		else
//    			Log.d( TAG, "variableNameValid: invalid name: " + varName );
//    	}
//
//    	return validFlag;
//    }

//	 * Allows the plugin/host to indicate to each other a set of variables which they are referencing.
//	 * The host may use this to e.g. show a variable selection list in it's UI.
//	 * The host should use this if it previously indicated to the plugin that it supports relevant vars
//	 *
//	 * @param  fromHostIntentExtras usually from getIntent().getExtras()
//	 * @return variableNames an array of relevant variable names
//	public static String [] getRelevantVariableList( Bundle fromHostIntentExtras ) {
//
//		String [] relevantVars = (String []) getBundleValueSafe( fromHostIntentExtras, BUNDLE_KEY_RELEVANT_VARIABLES, String [].class, "getRelevantVariableList" );
//
//		if ( relevantVars == null )
//			relevantVars = new String [0];
//
//		return relevantVars;
//	}


//	 * Used by: plugin QueryReceiver, FireReceiver
//	 * Add a bundle of variable name/value pairs.
//	 * Names must be valid Tasker local variable names.
//	 * Values must be String, String [] or ArrayList<String>
//	 * Null values cause deletion of possible already-existing variables.
//	 * @param resultExtras the result extras from the receiver onReceive (from a call to getResultExtras())
//	 * @param variables the variables to send
//	 * @see Setting#hostSupportsVariableReturn(Bundle)
//	 * @see #variableNameValid(String)
//	*/
//	public static void addVariableBundle( Bundle resultExtras, Bundle variables ) {
//		resultExtras.putBundle( EXTRA_VARIABLES_BUNDLE, variables );
//	}

//	 * Used by: plugin EditActivity
//	 * Specify the encoding for a set of bundle keys.
//	 * This is completely optional and currently only necessary if using Setting#setVariableReplaceKeys
//	 * where the corresponding values of some of the keys specified are JSON encoded.
//	 * @param  resultBundleToHost the bundle being returned to the host
//	 * @param keys the keys being returned to the host which are encoded in some way
//	 * @param encoding the encoding of the values corresponding to the specified keys
//	 * @see #setVariableReplaceKeys(Bundle,String[])
//	 * @see #hostSupportsKeyEncoding(Bundle, Encoding)
//	*/
//	public static void setKeyEncoding( Bundle resultBundleToHost, String [] keys, Encoding encoding ) {
//		if ( Encoding.JSON.equals( encoding ) )
//			addStringArrayToBundleAsString(
//					keys, resultBundleToHost, BUNDLE_KEY_ENCODING_JSON_KEYS, "setValueEncoding"
//			);
//		else
//			Log.e( TAG, "unknown encoding: " + encoding );
//	}

  end;



//function TTaskerPlugin.hostSupportsKeyEncoding(extrasFromHost: Bundle; Encoding: TEncoding): Boolean;
//begin
//  case Encoding of
//    TEncoding.JSON:
//      Result := hostSupports( extrasFromHost, EXTRA_HOST_CAPABILITY_ENCODING_JSON );
//  else
//    Result := False;
//
//  end;
//end;

end.
