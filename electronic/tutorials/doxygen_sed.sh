#!/bin/bash

export DOXYCONF=${1}

# warnings related
sed -i "s#QUIET                  = YES#QUIET                  = NO#g" $DOXYCONF
sed -i "s#WARNINGS               = YES#WARNINGS               = NO#g" $DOXYCONF
sed -i "s#WARN_IF_UNDOCUMENTED   = YES#WARN_IF_UNDOCUMENTED   = NO#g" $DOXYCONF
sed -i "s#WARN_IF_DOC_ERROR      = YES#WARN_IF_DOC_ERROR      = NO#g" $DOXYCONF
sed -i "s#WARN_NO_PARAMDOC       = YES#WARN_NO_PARAMDOC       = NO#g" $DOXYCONF
sed -i "s#WARN_AS_ERROR          = YES#WARN_AS_ERROR          = NO#g" $DOXYCONF

# source scope related
sed -i "s#ALWAYS_DETAILED_SEC    = NO#ALWAYS_DETAILED_SEC    = YES#g" $DOXYCONF
sed -i "s#VERBATIM_HEADERS       = NO#VERBATIM_HEADERS       = YES#g" $DOXYCONF
sed -i "s#RECURSIVE              = NO#RECURSIVE              = YES#g" $DOXYCONF
sed -i "s#EXTRACT_ALL            = NO#EXTRACT_ALL            = YES#g" $DOXYCONF
sed -i "s#EXTRACT_STATIC         = NO#EXTRACT_STATIC         = YES#g" $DOXYCONF
sed -i "s#EXTRACT_PACKAGE        = NO#EXTRACT_PACKAGE        = YES#g" $DOXYCONF
sed -i "s#EXTRACT_PRIVATE        = NO#EXTRACT_PRIVATE        = YES#g" $DOXYCONF
sed -i "s#EXTRACT_PRIV_VIRTUAL   = NO#EXTRACT_PRIV_VIRTUAL   = YES#g" $DOXYCONF
sed -i "s#EXTRACT_LOCAL_METHODS  = NO#EXTRACT_LOCAL_METHODS  = YES#g" $DOXYCONF
sed -i "s#EXTRACT_LOCAL_CLASSES  = NO#EXTRACT_LOCAL_CLASSES  = YES#g" $DOXYCONF
sed -i "s#SKIP_FUNCTION_MACROS   = YES#SKIP_FUNCTION_MACROS   = NO#g" $DOXYCONF
sed -i "s#HIDE_UNDOC_MEMBERS     = YES#HIDE_UNDOC_MEMBERS     = NO#g" $DOXYCONF
sed -i "s#HIDE_UNDOC_CLASSES     = YES#HIDE_UNDOC_CLASSES     = NO#g" $DOXYCONF
sed -i "s#FULL_PATH_NAMES        = YES#FULL_PATH_NAMES        = NO#g" $DOXYCONF

# graph and diagram related
sed -i "s#HAVE_DOT               = NO#HAVE_DOT               = YES#g" $DOXYCONF
sed -i "s#UML_LOOK               = NO#UML_LOOK               = YES#g" $DOXYCONF
sed -i "s#CALL_GRAPH             = NO#CALL_GRAPH             = YES#g" $DOXYCONF
sed -i "s#CALLER_GRAPH           = NO#CALLER_GRAPH           = YES#g" $DOXYCONF
sed -i "s#CLASS_DIAGRAMS         = NO#CLASS_DIAGRAMS         = YES#g" $DOXYCONF
sed -i "s#DOT_MULTI_TARGETS      = NO#DOT_MULTI_TARGETS      = YES#g" $DOXYCONF
sed -i "s#INCLUDE_GRAPH          = NO#INCLUDE_GRAPH          = YES#g" $DOXYCONF
sed -i "s#INCLUDED_BY_GRAPH      = NO#INCLUDED_BY_GRAPH      = YES#g" $DOXYCONF
sed -i "s#DIRECTORY_GRAPH        = NO#DIRECTORY_GRAPH        = YES#g" $DOXYCONF
sed -i "s#DOT_TRANSPARENT        = NO#DOT_TRANSPARENT        = YES#g" $DOXYCONF
sed -i "s#GRAPHICAL_HIERARCHY    = NO#GRAPHICAL_HIERARCHY    = YES#g" $DOXYCONF
sed -i "s#HIDE_UNDOC_RELATIONS   = YES#HIDE_UNDOC_RELATIONS   = NO#g" $DOXYCONF

# source browsing related
sed -i "s#SOURCE_BROWSER         = NO#SOURCE_BROWSER         = YES#g" $DOXYCONF
sed -i "s#MARKDOWN_SUPPORT       = NO#MARKDOWN_SUPPORT       = YES#g" $DOXYCONF
sed -i "s#STRIP_CODE_COMMENTS    = NO#STRIP_CODE_COMMENTS    = YES#g" $DOXYCONF
sed -i "s#CASE_SENSE_NAMES       = NO#CASE_SENSE_NAMES       = YES#g" $DOXYCONF
sed -i "s#WARN_NO_PARAMDOC       = NO#WARN_NO_PARAMDOC       = YES#g" $DOXYCONF
sed -i "s#REFERENCED_BY_RELATION = NO#REFERENCED_BY_RELATION = YES#g" $DOXYCONF
sed -i "s#REFERENCES_RELATION    = NO#REFERENCES_RELATION    = YES#g" $DOXYCONF
sed -i "s#ENABLE_PREPROCESSING   = NO#ENABLE_PREPROCESSING   = YES#g" $DOXYCONF
sed -i "s#MACRO_EXPANSION        = NO#MACRO_EXPANSION        = YES#g" $DOXYCONF
sed -i "s#EXPAND_ONLY_PREDEF     = NO#EXPAND_ONLY_PREDEF     = YES#g" $DOXYCONF
sed -i "s#SEARCHENGINE           = NO#SEARCHENGINE           = YES#g" $DOXYCONF
sed -i "s#DOCBOOK_PROGRAMLISTING = NO#DOCBOOK_PROGRAMLISTING = YES#g" $DOXYCONF
sed -i "s#ALPHABETICAL_INDEX     = YES#ALPHABETICAL_INDEX     = NO#g" $DOXYCONF
sed -i "s#INHERIT_DOCS           = YES#INHERIT_DOCS           = NO#g" $DOXYCONF
sed -i "s#SORT_MEMBER_DOCS       = YES#SORT_MEMBER_DOCS       = NO#g" $DOXYCONF
sed -i "s#REFERENCES_LINK_SOURCE = YES#REFERENCES_LINK_SOURCE = NO#g" $DOXYCONF
sed -i "s#USE_MATHJAX            = YES#USE_MATHJAX            = NO#g" $DOXYCONF
sed -i "s#DISABLE_INDEX          = YES#DISABLE_INDEX          = NO#g" $DOXYCONF # Safer Treeview replacement
sed -i "s#GENERATE_TREEVIEW      = YES#GENERATE_TREEVIEW      = NO#g" $DOXYCONF # if YES, memory crash at big project

# use html output only
sed -i "s#GENERATE_HTML          = NO#GENERATE_HTML          = YES#g" $DOXYCONF
sed -i "s#GENERATE_DOCBOOK       = YES#GENERATE_DOCBOOK       = NO#g" $DOXYCONF
sed -i "s#GENERATE_LATEX         = YES#GENERATE_LATEX         = NO#g" $DOXYCONF
sed -i "s#GENERATE_HTMLHELP      = YES#GENERATE_HTMLHELP      = NO#g" $DOXYCONF
sed -i "s#GENERATE_RTF           = YES#GENERATE_RTF           = NO#g" $DOXYCONF
sed -i "s#GENERATE_MAN           = YES#GENERATE_MAN           = NO#g" $DOXYCONF
sed -i "s#GENERATE_XML           = YES#GENERATE_XML           = NO#g" $DOXYCONF
sed -i "s#GENERATE_AUTOGEN_DEF   = YES#GENERATE_AUTOGEN_DEF   = NO#g" $DOXYCONF
sed -i "s#GENERATE_PERLMOD       = YES#GENERATE_PERLMOD       = NO#g" $DOXYCONF