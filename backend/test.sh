#!/bin/bash

echo "<code>" > tests.html
coverage run --branch tests.py >> tests.html 2>&1
coverage report -m tests.py models.py db.py >> tests.html
sed -i "s/$/<br>/g" tests.html
echo "</code>" >> tests.html
