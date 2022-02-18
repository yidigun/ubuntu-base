#!/bin/sh

basedir=$HOME/IdeaProjects/yidigun.com
builder=oldbuilder

TAG=$1; shift
EXTRA_TAGS="$*"

(cd $basedir/ubuntu-base; make TAG=$TAG EXTRA_TAGS="$EXTRA_TAGS" BUILDER=$builder) && \
(cd $basedir/ubuntu-build; make TAG=$TAG EXTRA_TAGS="$EXTRA_TAGS" BUILDER=$builder)
