unit Tasker.Plugin.Helper;

interface

type
  THelper = class
    {strict} private

//// ---------------------------------- HELPER FUNCTIONS -------------------------------- //
//
//	private static Object getBundleValueSafe( Bundle b, String key, Class<?> expectedClass, String funcName ) {
//		Object value = null;
//
//		if ( b != null ) {
//			if ( b.containsKey( key ) ) {
//				Object obj = b.get( key );
//				if ( obj == null )
//					Log.w( TAG, funcName + ": " + key + ": null value" );
//				else if ( obj.getClass() != expectedClass )
//					Log.w( TAG, funcName + ": " + key + ": expected " + expectedClass.getClass().getName() + ", got " + obj.getClass().getName() );
//				else
//					value = obj;
//			}
//		}
//		return value;
//	}
//
//	private static Object getExtraValueSafe( Intent i, String key, Class<?> expectedClass, String funcName ) {
//		return ( i.hasExtra( key ) ) ?
//                 getBundleValueSafe( i.getExtras(), key, expectedClass, funcName ) :
//                 null;
//	}
//

//      function hostSupports({extrasFromHost: Bundle;} capabilityFlag: Integer): Boolean; static;
//      function variableNameIsLocal(varName: string): Boolean; static;

    public

//    public static int getPackageVersionCode( PackageManager pm, String packageName ) {
//
//    	int code = -1;
//
//    	if ( pm != null ) {
//    		try {
//    			PackageInfo pi = pm.getPackageInfo( packageName, 0 );
//    			if ( pi != null )
//    				code = pi.versionCode;
//    		}
//    		catch ( Exception e ) {
//    			Log.e( TAG, "getPackageVersionCode: exception getting package info" );
//    		}
//    	}
//
//    	return code;
//    }

//
//    private static String [] getStringArrayFromBundleString( Bundle bundle, String key, String funcName ) {
//
//		String spec = (String) getBundleValueSafe( bundle, key, String.class, funcName );
//
//		String [] toReturn = null;
//
//		if ( spec != null )
//			toReturn = spec.split( " " );
//
//		return toReturn;
//	}
//
//	private static void addStringArrayToBundleAsString( String [] toAdd, Bundle bundle, String key, String callerName ) {
//
//		StringBuilder builder = new StringBuilder();
//
//		if ( toAdd != null ) {
//
//			for ( String keyName : toAdd ) {
//
//				if ( keyName.contains( " " ) )
//					Log.w( TAG, callerName + ": ignoring bad keyName containing space: " + keyName );
//				else {
//					if ( builder.length() > 0 )
//						builder.append( ' ' );
//
//					builder.append( keyName );
//				}
//
//				if ( builder.length() > 0 )
//					bundle.putString( key, builder.toString() );
//			}
//		}
//	}
//
//    // state tracking for random number sequence
//    private static int [] 		lastRandomsSeen = null;
//	private static int 			randomInsertPointer = 0;
//	private static SecureRandom sr = null;
//

//	 * Generate a sequence of secure random positive integers which is guaranteed not to repeat
//	 * in the last 100 calls to this function.
//	 *
//	 * @return a random positive integer
//	*/
//    public static int getPositiveNonRepeatingRandomInteger() {
//
//    	// initialize on first call
//		if ( sr == null ) {
//			sr = new SecureRandom();
//			lastRandomsSeen = new int[RANDOM_HISTORY_SIZE];
//
//			for ( int x = 0; x < lastRandomsSeen.length; x++ )
//				lastRandomsSeen[x] = -1;
//		}
//
//		int toReturn;
//		do {
//			// pick a number
//			toReturn = sr.nextInt( Integer.MAX_VALUE );
//
//			// check we havn't see it recently
//			for ( int seen : lastRandomsSeen ) {
//				if ( seen == toReturn ) {
//					toReturn = -1;
//					break;
//				}
//			}
//		}
//		while ( toReturn == -1 );
//
//		// update history
//		lastRandomsSeen[randomInsertPointer] = toReturn;
//		randomInsertPointer = ( randomInsertPointer + 1 ) % lastRandomsSeen.length;
//
//		return toReturn;
//    }

  end;

implementation

{ THelper }

uses
  System.SysUtils;

//function THelper.hostSupports(capabilityFlag: Integer): Boolean;
//var
//  Flags: Integer;
//begin
////  flags := Integer( getBundleValueSafe( extrasFromHost, EXTRA_HOST_CAPABILITIES, Integer.class, "hostSupports" ));
////  Result := (Flags != null) and ((flags and capabilityFlag) > 0);
//end;
//
//function THelper.variableNameIsLocal(varName: string): Boolean;
//var
//  digitCount, length: Integer;
//begin
//  digitCount := 0;
//  length := varName.Length;
//
//  Result := True;
//
////    	for ( int x = 0; x < length; x++ ) {
////    		char ch = varName.charAt( x );
////
////    		if ( Character.isUpperCase( ch ) )
////    			return false;
////    		else if ( Character.isDigit( ch ) )
////    			digitCount++;
////    	}
//
//  if digitCount = (varName.Length - 1) then
//    Result := False;
//end;

end.
