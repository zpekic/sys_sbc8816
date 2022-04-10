# sys_sbc8816

Full description: https://hackaday.io/project/184782-cross-bar-switch-serial-cpu-and-rpn-calculator

Bit-serial CPUs were not a rarity in early days of computing, and especially not for calculators in the discrete or SSI/MSI era (before mid-70ies). Their biggest problem was of course speed.

But what if more than 1 bit-serial operation could be done simultaneously? If the number of simultaneous serial operations approaches the length of processing word, then the serial CPU could come close to speed to a parallel computer with same word length!

In this project the parallelization is achieved using a matrix of cross-bar switches that can connect any and all shift registers to any and all 1-bit processing units.

To move from theory to practice, a stack-based integer calculator is implemented to illustrate the concept. The implementation is done partially in hardware (2 MT8816 cross-bar switch ICs on breadboard) and partially in software (microcode-driven custom processor).





