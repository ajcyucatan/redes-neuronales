# Redes Neuronales Artificiales Desde Cero

[![License](https://img.shields.io/github/license/ajcyucatan/redes-neuronales?style=popout-square)](https://github.com/ajcyucatan/redes-neuronales/blob/master/LICENSE "License")
[![Repo Size](https://img.shields.io/github/repo-size/ajcyucatan/redes-neuronales?style=popout-square)](https://github.com/ajcyucatan/redes-neuronales.git "Repo Size")
[![Slideshow](https://img.shields.io/badge/view-slides-00d88e?style=popout-square)](https://github.com/ajcyucatan/redes-neuronales/blob/master/notes/slides.pdf "Slideshow")
[![Binder](https://img.shields.io/badge/launch-binder-ff69b4?style=popout-square)](https://mybinder.org/v2/gh/ajcyucatan/redes-neuronales/master "Binder")

> © 2019, [Rodolfo E. Escobar U.](https://github.com/rescurib)

Este taller consiste en estudiar brevemente, desde cero, teoría y práctica sobre Redes Neuronales Artificiales. Contenido estrenado durante el DevDayAI Mérida, celebrado en Noviembre 2019.


## Ambiente

Puedes ejecutar el material del taller en la nube o en tu misma computadora:

### En la nube

¡Haz clic en la insignia de Binder! Luego ejecuta la siguiente celda para que se instalen las dependencias *out-of-the-box*:
```python
# Installing dependencies
!git clone https://github.com/ajcyucatan/redes-neuronales.git
!find / -name requirements.txt -exec cat '{}' ';'
!cat `find / -name requirements.txt` | xargs -n 1 pip install
```

### En tu computadora

Para sistemas basados en UNIX, las dependencias del taller pueden ser instaladas por dos maneras:

| Opciones       | Comando       |
|:--------------:|:-------------:|
| Usando [`pip`](https://pypi.org/project/pip) | `pip install -r requirements.txt` |
| Usando [`conda`](https://docs.conda.io/en/latest/) | `conda env create -f env.yml python=3.7` |


## Licencia

El contenido de este repositorio está publicado bajo la licencia [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0), y el código es libre y abierto, bajo los términos de [The MIT License](https://mit-license.org).
