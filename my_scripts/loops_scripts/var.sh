#!/bin/bash

echo "what is the total sales?"
read sales

echo "what is the total COS"
read cos

grosmargin=$(( $sales - $cos ))

echo "what are the total expenses"
read expenses

ebit=$(( $grosmargin - $expenses ))

echo "Total sales is $ $sales" | tee -a accounts.txt
echo "Cost of Sales is $ $cos" | tee -a accounts.txt
echo "Grossmargin is $ $grosmargin" | tee -a accounts.txt
echo "Total expenses is $ $expenses" | tee -a accounts.txt
echo -e "EBIT is $ $ebit" | tee -a accounts.txt
echo -e "End of current cycle\n\n" | tee -a accounts.txt


