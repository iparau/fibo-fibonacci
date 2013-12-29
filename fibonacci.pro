! exists ( ../common.pri ) {
	error( "Could not find the common.pri file!" )
}

include( ../common.pri )

TEMPLATE = app

CONFIG  *= link_prl xml

CONFIG -= qt

TARGET = Fibonacci

win32 {
	DEFINES *= UNICODE
}

INCLUDEPATH += $$LIB_CPPUNIT_DIR_INC
INCLUDEPATH += $$LIB_XERCES_DIR_INC
INCLUDEPATH += $$LIB_CORE_DIR_INC
INCLUDEPATH += $$APP_FIBO_DIR_INC
INCLUDEPATH += $$LIB_XERCES_DIR_INC/xercesc/dom
INCLUDEPATH += $$LIB_XERCES_DIR_INC/xercesc/dom/impl
INCLUDEPATH += $$LIB_XERCES_DIR_INC/xercesc/sax
INCLUDEPATH += $$LIB_XERCES_DIR_INC/xercesc/util
INCLUDEPATH += $$LIB_XERCES_DIR_INC/xercesc/util/MsgLoaders/InMemory
INCLUDEPATH += $$LIB_XERCES_DIR_INC/xercesc/validators/schema/identity

CONFIG(debug,debug|release) {
	LIBS *= -L"$$LIB_CPPUNIT_DIR_DBG"
	LIBS *= -L"$$LIB_XERCES_DIR_DBG"
	LIBS *= -L"$$LIB_CORE_DIR_DBG"
	
	win32 {
		PRE_TARGETDEPS *= $$LIB_CPPUNIT_DIR_DBG/cppunit.lib
		PRE_TARGETDEPS *= $$LIB_XERCES_DIR_DBG/xerces.lib
		PRE_TARGETDEPS *= $$LIB_CORE_DIR_DBG/core.lib
	}
	
	unix {
		PRE_TARGETDEPS *= $$LIB_CPPUNIT_DIR_DBG/libcppunit.a
		PRE_TARGETDEPS *= $$LIB_XERCES_DIR_DBG/libxerces.a
		PRE_TARGETDEPS *= $$LIB_CORE_DIR_DBG/libcore.a
	}
} else {

	LIBS *= -L"$$LIB_CPPUNIT_DIR_RLS"
	LIBS *= -L"$$LIB_XERCES_DIR_RLS"
	LIBS *= -L"$$LIB_CORE_DIR_RLS"
	
	win32 {	
		PRE_TARGETDEPS *= $$LIB_CPPUNIT_DIR_RLS/cppunit.lib
		PRE_TARGETDEPS *= $$LIB_XERCES_DIR_RLS/xerces.lib
		PRE_TARGETDEPS *= $$LIB_CORE_DIR_RLS/core.lib
	}
	
	unix {    		
		PRE_TARGETDEPS *= $$LIB_CPPUNIT_DIR_RLS/libcppunit.a
		PRE_TARGETDEPS *= $$LIB_XERCES_DIR_RLS/libxerces.a
		PRE_TARGETDEPS *= $$LIB_CORE_DIR_RLS/libcore.a
	}
}

LIBS *= -lcppunit
LIBS *= -lxerces
LIBS *= -lcore

#Include file(s)
include(fibonacci.pri)
