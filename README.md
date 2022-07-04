# MOEA-with-robustness-enhancement-MOEA-RE

This repository provides implementations for the [paper](https://ieeexplore.ieee.org/document/8789665):

> Z. He, G. G. Yen, and J. Lv, "Evolutionary Multiobjective Optimization With Robustness Enhancement," in IEEE Transactions on Evolutionary Computation, vol. 24, no. 3, pp. 494-507, June 2020, doi: 10.1109/TEVC.2019.2933444.

## Abstract

Uncertainty is an important feature abstracted from real-world applications. Multiobjective optimization problems (MOPs) with uncertainty can always be characterized as robust MOPs (RMOPs). Over recent years, multiobjective optimization evolutionary algorithms (EAs) have demonstrated the success in solving MOPs. However, most of them do not consider disturbance in the design. In order to handling the uncertainty in the optimization problem, we first give a thorough analysis of three important issues on robust optimization. Then, a novel EA called multiobjective optimization EA with robustness enhancement is developed, where the seamless integration of robustness and optimality is achieved by a proposed novel archive updating mechanism applied on the evolutionary process as well as the new robust optimal front building strategy designed to construct the final robust optimal front. Furthermore, the new designed archive updating mechanism makes the robust optimization process free of the enormous computational workload induced from sampling. The experimental results on a set of benchmark functions show the superiority of the proposed design in terms of both solutions' quality under the disturbance and computational efficiency in solving RMOPs.

## Parameter Setting

For Matlab Version: The parameter setting is in the `MOEA_RE.m` program.

```matlab
M;    % NO.Objectives;
n;    % NO.Decision variables
N;    % The size of initial population
func; % Evaluate_function    
phi;  % Disturbance level 
num;  % The number of generations
mu;   % Distribution index of SBX  
mum;  % Distribution index of polynomial mutation
pool; % Size of the mating pool in tournament selection
tour; % No.solutions selected in each comparsion in tournament selection
a1;   % Parameter using in archive updating
%Notify: The benchmark problems should be written in a separate document.
```

## Citation

If you find our work and this repository useful. Please consider giving a star and citation.

Bibtex:

```
@ARTICLE{MOEA_RE,
		 author={He, Zhenan and Yen, Gary G. and Lv, Jiancheng},
		 journal={IEEE Transactions on Evolutionary Computation},
		 title={Evolutionary Multiobjective Optimization With Robustness Enhancement},
		 year={2020},
		 volume={24},
		 number={3},
		 pages={494-507},
		 doi={10.1109/TEVC.2019.2933444}}
```

