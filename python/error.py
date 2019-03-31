import matplotlib.pyplot as plt
import numpy as np

it_vals = {50000:3.1415758, 100000:3.1415858, 250000:3.141592,
500000:3.141594, 1000000:3.1415954, 3000000:3.1415963, 4000000:3.1415966,
5000000:3.1415966}

target = 3.141592

errors = np.abs(np.array(list(it_vals.values())) - target)
it = np.array(list(it_vals.keys()))

plt.plot(it, errors)
plt.ticklabel_format(style='sci', axis='x', scilimits=(0,0), useMathText = True)
plt.ticklabel_format(style='sci', axis='y', scilimits=(0,0), useMathText = True)
plt.title('Error al arpoximar $\pi$', usetex=True)
plt.xlabel('iteraciones')
plt.ylabel('error')
plt.savefig('error.png')