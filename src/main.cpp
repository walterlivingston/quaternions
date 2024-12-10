#include <iostream>
#include "quaternions.h"

#define PI 3.14159265

int main(){
    Eigen::Vector3d eul(PI/3,PI/5,PI/2);
    Eigen::Vector4d p(1.0,0.0,0.0,0.0);
    Eigen::Vector4d q(1.0,0.0,0.0,0.0);

    Eigen::Vector4d q_eul = eul2q(eul);
    Eigen::Vector3d eul_q_eul = q2eul(q_eul);
    Eigen::Matrix3d DCM_q_eul = q2DCM(q_eul);
    Eigen::Vector4d q_DCM = DCM2q(DCM_q_eul);

    std::cout << "qMult(p,q): \n" << qMult(p,q) << "\n" << std::endl;
    std::cout << "qNorm(p): \n" << qNorm(p) << "\n" << std::endl;
    std::cout << "qNormalize(p): \n" << qNormalize(p) << "\n" << std::endl;
    std::cout << "qConj(p): \n" << qConj(p) << "\n" << std::endl;
    std::cout << "qInverse(p): \n" << qInverse(p) << "\n" << std::endl;
    std::cout << "eul2q(eul): \n" << q_eul << "\n" << std::endl;
    std::cout << "q2eul(q_eul): \n" << eul_q_eul << "\n" << std::endl;
    std::cout << "q2DCM(q_eul): \n" << DCM_q_eul << "\n" << std::endl;
    std::cout << "DCM2q(DCM_q_eul): \n" << q_DCM << "\n" << std::endl;

    return 0;
}