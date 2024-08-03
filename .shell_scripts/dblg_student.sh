#!/bin/bash


dblg_student(){
	username=$1
	eval "mariadb -h db.luddy.indiana.edu -u i308u24_$username --password=my+sql=i308u24_$username -D i308u24_$username"
}
