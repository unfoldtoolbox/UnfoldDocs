# Unfold Ecosystem

The Unfold family is a set of time-series analysis, visualization, and simulation toolboxes built around the regression ERP (rERP) framework. That is, the application of multiple regression models to time series data. While all packages have a focus on EEG data, they can typically be easily applied to pupil dilation, skin conductance, or even fMRI data.

```@raw html
<head>
<style type="text/css">
td {
    text-align: right !important;
    vertical-align: inherit !important;
}
</style></head>

<div>
<table style="margin: 0px auto;">
<thead>

</thead>
<tbody>
<tr><td>Analysis of regression ERPs </td><td><a href="https://github.com/unfoldtoolbox/Unfold.jl/tree/main"><picture>
 <source
srcset="assets/300w/logo_Unfold.jl-dark.png",alt="Unfold.jl Logo dark"
   media="(prefers-color-scheme: dark)"
   class="h-[45vh] object-cover"
   />
  <img
 src="assets/300w/logo_Unfold.jl.png""
   alt="Unfold.jl Logo bright"
   class="h-[45vh] object-cover"          
 />
</picture></a></td></tr> 
<tr><td>Mass Univariate Linear Mixed Models</td><td><a href="https://github.com/unfoldtoolbox/UnfoldMixedModels.jl"><picture>
 <source
srcset="assets/300w/logo_UnfoldMixedModels.jl-dark.png",alt="UnfoldMixedModels.jl Logo dark"
   media="(prefers-color-scheme: dark)"
   class="h-[45vh] object-cover"
   />
  <img
 src="assets/300w/logo_UnfoldMixedModels.jl.png""
   alt="Unfold.jl Logo bright"
   class="h-[45vh] object-cover"          
 />
</picture></a></td></tr>
<tr><td>Visualization of ERP/EEG data and Unfold models</td><td><a href="https://github.com/unfoldtoolbox/UnfoldMakie.jl"><picture>
 <source
srcset="assets/300w/logo_UnfoldMakie.jl-dark.png",alt="UnfoldMakie.jl Logo dark"
   media="(prefers-color-scheme: dark)"
   class="h-[45vh] object-cover"
   />
  <img
 src="assets/300w/logo_UnfoldMakie.jl.png""
   alt="UnfoldMakie.jl Logo bright"
   class="h-[45vh] object-cover"          
 />
</picture></a></td></tr>
<tr><td>Simulation of event-based EEG</td><td><a href="https://github.com/unfoldtoolbox/UnfoldSim.jl"><picture>
 <source
srcset="assets/300w/logo_UnfoldSim.jl-dark.png",alt="UnfoldSim.jl Logo dark"
   media="(prefers-color-scheme: dark)"
   class="h-[45vh] object-cover"
   />
  <img
 src="assets/300w/logo_UnfoldSim.jl.png""
   alt="UnfoldSim.jl Logo bright"
   class="h-[45vh] object-cover"          
 />
</picture></a></td></tr>
<tr><td>BIDS-pipeline support for Unfold.jl</td><td><a href="https://github.com/unfoldtoolbox/UnfoldBIDS.jl"><picture>
 <source
srcset="assets/300w/logo_UnfoldBIDS.jl-dark.png",alt="UnfoldBIDS.jl Logo dark"
   media="(prefers-color-scheme: dark)"
   class="h-[45vh] object-cover"
   />
  <img
 src="assets/300w/logo_UnfoldBIDS.jl.png""
   alt="UnfoldBIDS.jl Logo bright"
   class="h-[45vh] object-cover"          
 />
</picture></a></td></tr>
<tr><td>Decoding with overlap/covariate correction</td><td><a href="https://github.com/unfoldtoolbox/UnfoldDecode.jl"><picture>
 <source
srcset="assets/300w/logo_UnfoldDecode.jl-dark.png",alt="UnfoldDecode.jl Logo dark"
   media="(prefers-color-scheme: dark)"
   class="h-[45vh] object-cover"
   />
  <img
 src="assets/300w/logo_UnfoldDecode.jl.png""
   alt="UnfoldDecode.jl Logo bright"
   class="h-[45vh] object-cover"          
 />
</picture></a></td></tr>
<tr><td>Statistics for Unfold models</td><td><a href="https://github.com/unfoldtoolbox/UnfoldStats.jl"><picture>
 <source
srcset="assets/300w/logo_UnfoldStats.jl-dark.png",alt="UnfoldStats.jl Logo dark"
   media="(prefers-color-scheme: dark)"
   class="h-[45vh] object-cover"
   />
  <img
 src="assets/300w/logo_UnfoldStats.jl.png""
   alt="UnfoldStats.jl Logo bright"
   class="h-[45vh] object-cover"          
 />
</picture></a></td></tr>

</tr>
</tbody>

</table>
</div>


```
!!! tipp
    The different packages can often be used independently from each other. Choose the functionality you require and have fun with one of the `Getting Started` tutorials!


## Citing
Writing this software is an ongoing effort by many people. Please cite our tools when using them so that we can continue developing tools for the community!

In general, please cite the current Zenodo version of the toolbox (to give credit to the current contributors and maintainers) **and** the published paper (to acknowledge the initial effort to start a tool).

**Unfold.jl**: [Zenodo DOI](https://doi.org/10.5281/zenodo.5759066) and [published paper](https://doi.org/10.7717/peerj.7838)

**UnfoldMakie.jl**: [Zenodo DOI](https://zenodo.org/records/14192333) and [published paper](https://doi.org/10.21105/joss.07560)

**UnfoldSim.jl**: [Zenodo DOI](https://doi.org/10.5281/zenodo.7738651)

**UnfoldBIDS.jl**: [Zenodo DOI](https://doi.org/10.5281/zenodo.5759066)

**UnfoldStats.jl**: [Zenodo DOI](https://doi.org/10.5281/zenodo.14946964)

**UnfoldDecode.jl**: no DOI yet
