FFTW_LIB ?= /opt/homebrew/Cellar/fftw/3.3.10_1/lib
FFTW_INCLUDE ?= /opt/homebrew/Cellar/fftw/3.3.10_1/include
FFTWPM_INCLUDE ?= include

FFTWPM_BUILD_DIR ?= build
FFTWPM_LIB_DIR ?= lib

FFTWPM_AR ?= $(FFTWPM_LIB_DIR)/libfftwpm.a

FFTWPM_CXX ?= g++

SOURCEDIR ?= src
SOURCES := $(shell find $(SOURCEDIR) -name '*.cpp')
OBJECTS := $(SOURCES:%.cpp=%.o)
OUTPUTS := $(OBJECTS:src%=lib%)

$(FFTWPM_BUILD_DIR)/test: test/test.cpp | $(FFTWPM_AR) $(FFTWPM_BUILD_DIR)
	$(FFTWPM_CXX) -I$(FFTW_INCLUDE) -I$(FFTWPM_INCLUDE) -lfftwpm -lfftw3 -lfftw3f -L$(FFTW_LIB) -L$(FFTWPM_LIB_DIR)  $< -o $@

$(FFTWPM_AR): $(OUTPUTS) | $(FFTWPM_LIB_DIR)
	ar cr $@ $^

$(FFTWPM_LIB_DIR)/%.o: src/%.cpp | $(FFTWPM_LIB_DIR)
	$(FFTWPM_CXX) -I$(FFTW_INCLUDE) -I$(FFTWPM_INCLUDE) -c -o $@ $<

.PHONY: clean
clean:
	rm -rf $(FFTWPM_BUILD_DIR)
	rm -rf $(FFTWPM_LIB_DIR)

$(FFTWPM_LIB_DIR):
	mkdir -p $(FFTWPM_LIB_DIR)

$(FFTWPM_BUILD_DIR):
	mkdir -p $(FFTWPM_BUILD_DIR)

