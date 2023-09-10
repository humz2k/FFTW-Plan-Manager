# FFTW-Plan-Manager

Simple plan manager for FFTW to remove the need to make plans. Link with `-lfftwpm`, `-lfftw3` and `-lfftw3f`.

To use, include `fftw_plan_manager.hpp` and:

Instantiate an `FFTWPlanManager` object:

`FFTWPlanManager my_plan_manager`.

Then do a forward/backward transform using:

```
//T = fftw_complex | fftwf_complex

//Forward transform, src is source array, dst is destination array, ng is the size of the transform and nFFTs is how many batched transforms to do (with no stride).
my_plan_manager.forward(T* src, T* dst, int ng, int nFFTs);

//Backward transform, src is source array, dst is destination array, ng is the size of the transform and nFFTs is how many batched transforms to do (with no stride).
my_plan_manager.backward(T* src, T* dst, int ng, int nFFTs);
```
