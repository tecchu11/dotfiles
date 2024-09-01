#!/bin/bash

shellcheck --shell=bash --external-sources \
	deploy.*.sh helper/*

shfmt --language-dialect bash --diff \
	./**/*
