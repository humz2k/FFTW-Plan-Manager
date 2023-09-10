#ifndef FFTW_PLAN_MANAGER_INCLUDED
#define FFTW_PLAN_MANAGER_INCLUDED

#define N_CACHE 100

#include <fftw3.h>
#include <map>

template<class T, class plan_t>
class FFTWPlanWrapper{
    public:
        int nFFTs;
        T* data;
        T* scratch;
        plan_t plan;
        int direction;
        int ng;
        bool valid;
};

class FFTWPlanManager{
    public:
        FFTWPlanWrapper<fftw_complex,fftw_plan> double_plans[N_CACHE];
        FFTWPlanWrapper<fftwf_complex,fftwf_plan> float_plans[N_CACHE];
        
        FFTWPlanManager();
        ~FFTWPlanManager();

        fftw_plan find_plan(fftw_complex* data, fftw_complex* scratch, int ng, int nFFTs, int direction);
        fftwf_plan find_plan(fftwf_complex* data, fftwf_complex* scratch, int ng, int nFFTs, int direction);

        void forward(fftw_complex* data, fftw_complex* scratch, int ng, int nFFTs);
        void forward(fftwf_complex* data, fftwf_complex* scratch, int ng, int nFFTs);

        void backward(fftw_complex* data, fftw_complex* scratch, int ng, int nFFTs);
        void backward(fftwf_complex* data, fftwf_complex* scratch, int ng, int nFFTs);
        
};

#endif