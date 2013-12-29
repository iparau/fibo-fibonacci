// CTCFibonacci.cpp : Defines the entry point for the console application.
//
	
#include "stdafx.h"

#include <xercesc/util/PlatformUtils.hpp>
// Other include files, declarations, and non-Xerces-C++ initializations.

#include "InputData.h"
#include "OutputData.h"

#include "AStr.h"

#if defined(XERCES_NEW_IOSTREAMS)
    #include <iostream>
#else
    #include <iostream.h>
#endif

#include "Trace.h"

XERCES_CPP_NAMESPACE_USE
using namespace std;
using namespace core::tools;

int _tmain(int argc, _TCHAR* argv[])
{
	SetTraceLevel( TraceDetail );

	try {
		XMLPlatformUtils::Initialize();
	}
	catch ( const XMLException& toCatch ) {
		// Do your failure processing here
        WriteTrace( TraceError, "Error Message: %s", 
			A(toCatch.getMessage()) );

		return 1;
	}
	catch ( ... ) {
		// Do your failure processing here
        WriteTrace( TraceError, "Error Message: Unknown Exception");

		return 1;
	}

	// Do your actual work with Xerces-C++ here.
	core::CInputData* inputData = new core::CInputData();

	//double check for allocation errors
	if ( 0 != inputData ) {
		if ( true == inputData->Initialize( "input.xml" ) )  {
	
			//Input data is loaded succesfully
			core::COutputData outputData( inputData->getFibonacciID() );

			outputData.buildOutputXml( "output.xml" );
		}
	
		//finished processing, so we delete inputData in order to release the parser a
		//and call Teminate, below
		delete inputData;
	}

	XMLPlatformUtils::Terminate();

	// Other terminations and cleanup.

	return 0;
}

