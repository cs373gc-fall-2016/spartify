.DEFAULT_GOAL := test

FILES :=                                   \
    backend.html                           \
    models.html                            \
    db.html                                \
    OpenSourcery.log                       \
    backend.py                             \
    models.py                              \
    TestOpenSourcery.out                   \
    tests.py 							   \
    OpenSourcery.pdf

ifeq ($(shell uname), Darwin)          # Apple
    PYTHON   := python
    PIP      := pip
    PYLINT   := pylint
    COVERAGE := coverage
    PYDOC    := pydoc
    AUTOPEP8 := autopep8
else ifeq ($(CI), true)                # Travis CI
    PYTHON   := python3
    PIP      := pip3
    PYLINT   := pylint
    COVERAGE := coverage
    PYDOC    := pydoc
    AUTOPEP8 := autopep8
else ifeq ($(shell uname -p), unknown) # Docker
    PYTHON   := python
    PIP      := pip
    PYLINT   := pylint
    COVERAGE := coverage
    PYDOC    := pydoc
    AUTOPEP8 := autopep8
else                                   # UTCS
    PYTHON   := python3
    PIP      := pip3
    PYLINT   := pylint
    COVERAGE := coverage
    PYDOC    := pydoc
    AUTOPEP8 := autopep8
endif

.pylintrc:
	$(PYLINT) --disable=locally-disabled --reports=no --generate-rcfile > $@

backend.html: models.py
	$(PYDOC) -w backend

models.html: models.py
	$(PYDOC) -w models

db.html: models.py
	$(PYDOC) -w db

OpenSourcery.log:
	git log > OpenSourcery.log

TestOpenSourcery.tmp: backend.py models.py tests.py .pylintrc
	$(PYLINT) tests.py
	$(COVERAGE) run    --branch tests.py >  TestOpenSourcery.tmp 2>&1
	$(COVERAGE) report -m tests.py models.py db.py >> TestOpenSourcery.tmp
	cat TestOpenSourcery.tmp

check:
	@not_found=0;                                 \
    for i in $(FILES);                            \
    do                                            \
        if [ -e $$i ];                            \
        then                                      \
            echo "$$i found";                     \
        else                                      \
            echo "$$i NOT FOUND";                 \
            not_found=`expr "$$not_found" + "1"`; \
        fi                                        \
    done;                                         \
    if [ $$not_found -ne 0 ];                     \
    then                                          \
        echo "$$not_found failures";              \
        exit 1;                                   \
    fi;                                           \
    echo "success";

clean:
	rm -f  .coverage
	rm -f  .pylintrc
	rm -f  *.pyc
	rm -f  backend.html
	rm -f  models.html
	rm -f  db.html
	rm -f  OpenSourcery.log
	rm -rf __pycache__

config:
	git config -l

format:
	$(AUTOPEP8) -i backend.py
	$(AUTOPEP8) -i models.py
	$(AUTOPEP8) -i tests.py

status:
	make clean
	@echo
	git branch
	git remote -v
	git status

test: backend.html models.html db.html OpenSourcery.log TestOpenSourcery.tmp check

versions:
	which make
	make --version
	@echo
	which git
	git --version
	@echo
	which $(PYTHON)
	$(PYTHON) --version
	@echo
	which $(PIP)
	$(PIP) --version
	@echo
	which $(PYLINT)
	$(PYLINT) --version
	@echo
	which $(COVERAGE)
	$(COVERAGE) --version
	@echo
	which $(PYDOC)
	$(PYDOC) --version
	@echo
	which $(AUTOPEP8)
	$(AUTOPEP8) --version
	@echo
	$(PIP) list

