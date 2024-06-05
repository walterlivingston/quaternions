<h3 align="center"><i><b>quaternions</i></b></h3>

<div align="center">

![GitHub Repo stars](https://img.shields.io/github/stars/walterlivingston/quaternions)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

</div>

---

<p align="center"> A collection of quaternion libraries for various languages.
    <br> 
</p>

## Table of Contents

- [Quaternion Conventions](#quaternion-conventions)
- [Supported Languages](#supported-languages)
- [Installation](#installation)
- [References](#references)

## Quaternion Conventions <a name = "quaternion-conventions"></a>

The chosen conventions for the quaternions were chosen as to match Hamilton's description of a quaternion.  All notation and definition is defined as in Joan Solà[[1]](#1).

<div align="center">
  
| Convention | Choice | Example |
|---|---|---|
| Components Order | Scalar First |($q_w$ , **$q_v$**) |
| Handedness | Right-Handed | $ij=k$ |
| Rotation Function | Passive | $x_{\mathcal{B}}=q_{passive}\otimes x_{\mathcal{A}}\otimes q^*_{passive}$ |
| Rotation Direction | Local-to-Global | $x_{\mathcal{G}}=q\otimes x_{\mathcal{L}}\otimes q^*$ |

</div>

## Supported Languages <a name = "supported-languages"></a>

<img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/matlab/matlab-original.svg?sanitize=true" title="MATLAB" alt="MATLAB" width="40" height="40"/>&nbsp;

## Installation <a name = "installation"></a>

1. Clone ***quaternions***.

```shell
git clone https://github.com/walterlivingston/quaternion.git
```

2. Add folder to MATLAB path

```
addpath('./quaternion')
```

## References <a name = "references"></a>

<a id="1">[1]</a> [Solà, J. (2017). Quaternion Kinematics for the error-state Kalman filter](https://arxiv.org/pdf/1711.02508)
