/*
 * This file acts as the C++ implementation of the *quaternions* library.
 *
 * For more information on the quaternion conventions used, check the github README.
 * 
 * Github: https://github.com/walterlivingston/quaternions
 * Author: Walter Livingston
 * Date: December 2024
 */
#pragma once

#include <Eigen/Dense>

/**
 * Multiplication of two quaternions.
 *
 * This multiplies two quaternions resulting in a quaternion product based on Hamilton's quaternion conventions.
 *
 * @param p 4-dimension vector representing a quaternion.
 * @param q 4-dimension vector representing a quaternion.
 * @return 4-dimension vector representing the quaternion product of p*q.
 */
Eigen::Vector4d qMult(Eigen::Vector4d p, Eigen::Vector4d q){
    Eigen::Vector4d q_ret = {p(0)*q(0) - p(1)*q(1) - p(2)*q(2) - p(3)*q(3),
                             p(0)*q(1) + p(1)*q(0) + p(2)*q(3) - p(3)*q(2),
                             p(0)*q(2) - p(1)*q(3) + p(2)*q(0) + p(3)*q(1),
                             p(0)*q(3) + p(1)*q(2) - p(2)*q(1) + p(3)*q(0)};
    return q_ret;
}

/**
 * Quaternion norm of the quaternion q.
 *
 * This calculates the norm of the provided Hamilton quaternion. This takes the sum of the squares of the quaternion coefficients and then takes the square root of that sum.
 *
 * @param q 4-dimension vector representing a quaternion.
 * @return norm of the quaternion q.
 */
double qNorm(Eigen::Vector4d q){
    double squared_sum = q(0)*q(0) + q(1)*q(1) + q(2)*q(2) + q(3)*q(3);
    double ret = sqrt(squared_sum);
    return ret;
}

/**
 * Normalize the quaternion q.
 *
 * This normalizes the Hamilton quaternion q to ensure a norm of 1.
 *
 * @param q 4-dimension vector representing a quaternion.
 * @return 4-dimension vector representing a normalized version of the quaternion q.
 */
Eigen::Vector4d qNormalize(Eigen::Vector4d q){
    double quat_norm = qNorm(q);
    Eigen::Vector4d q_ret = q / quat_norm;
    return q_ret;
}

/**
 * Conjugates the quaternion q.
 *
 * This calculates the conjugate of the Hamilton quaternion q.
 *
 * @param q 4-dimension vector representing a quaternion.
 * @return 4-dimension vector representing the conjugate of the quaternion q.
 */
Eigen::Vector4d qConj(Eigen::Vector4d q){
    Eigen::Vector4d q_ret = {q(0), -q(1), -q(2), -q(3)};
    return q_ret;
}

/**
 * Inverts the quaternion q.
 *
 * This calculates the inverse of the Hamilton quaternion q.
 *
 * @param q 4-dimension vector representing a quaternion.
 * @return 4-dimension vector representing the inverse of the quaternion q.
 */
Eigen::Vector4d qInverse(Eigen::Vector4d q){
    double q_norm = qNorm(q);
    Eigen::Vector4d q_conj = qConj(q);
    Eigen::Vector4d q_ret = q_conj/(q_norm*q_norm);
    return q_ret;
}

/**
 * Converts a quaternion to an euler angle attitude representation.
 *
 * Takes a Hamilton quaternion q and converts it to a 3-2-1 euler angle attitude.
 *
 * @param q 4-dimension vector representing a quaternion.
 * @return 3-dimension vector representing an euler angle attitude.
 */
Eigen::Vector3d q2eul(Eigen::Vector4d q){
    Eigen::Vector3d eul = {atan2(2*(q(0)*q(1) + q(2)*q(3)), 1 - 2*(q(1)*q(1) + q(2)*q(2))),
                           asin(2*(q(0)*q(2) - q(1)*q(3))),
                           atan2(2*(q(0)*q(3) + q(1)*q(2)), 1 - 2*(q(2)*q(2) + q(3)*q(3)))};
    
    return eul;
}

/**
 * Converts an euler angle attitude to a quaternion.
 * 
 * Takes a 3-2-1 euler angle attitude and converts it to Hamilton quaternion
 *
 * @param eul 3-dimension vector representing an euler angle attitude.
 * @return 4-dimension vector representing a quaternion.
 */
Eigen::Vector4d eul2q(Eigen::Vector3d eul){
    double ss1 = sin(eul(0)/2);
    double ss2 = sin(eul(1)/2);
    double ss3 = sin(eul(2)/2);
    double cc1 = cos(eul(0)/2);
    double cc2 = cos(eul(1)/2);
    double cc3 = cos(eul(2)/2);
    
    Eigen::Vector4d q_ret = {cc1*cc2*cc3 + ss1*ss2*ss3,
                             ss1*cc2*cc3 - cc1*ss2*ss3,
                             cc1*ss2*cc3 + ss1*cc2*ss3,
                             cc1*cc2*ss3 - ss1*ss2*cc3};
    
    return q_ret;
}

/**
 * Converts an quaternion to a DCM.
 * 
 * Takes a Hamilton quaternion and converts it into a direction cosine matrix.
 *
 * @param q 4-dimension vector representing a quaternion.
 * @return 3x3 DCM.
 */
Eigen::Matrix3d q2DCM(Eigen::Vector4d q){
    Eigen::Matrix3d DCM_ret;
    DCM_ret << (q(0)*q(0) + q(1)*q(1) - q(2)*q(2) - q(3)*q(3)),                       2*(q(1)*q(2) - q(0)*q(3)),                       2*(q(1)*q(3) + q(0)*q(2)),
                                     2*(q(1)*q(2) + q(0)*q(3)), (q(0)*q(0) - q(1)*q(1) + q(2)*q(2) - q(3)*q(3)),                       2*(q(2)*q(3) - q(0)*q(1)),
                                     2*(q(1)*q(3) - q(0)*q(2)),                       2*(q(2)*q(3) + q(0)*q(1)), (q(0)*q(0) - q(1)*q(1) - q(2)*q(2) + q(3)*q(3));
    return DCM_ret;
}

/**
 * Converts an DCM to a quaternion.
 * 
 * Takes a direction cosine matrix and converts it into a Hamilton quaternion.
 *
 * @param DCM 3x3 DCM.
 * @return 4-dimension vector representing a quaternion.
 */
Eigen::Vector4d DCM2q(Eigen::MatrixXd DCM){
    Eigen::Vector4d q_ret = {sqrt(0.25*(1 + DCM(0,0) + DCM(1,1) + DCM(2,2))),
                             sqrt(0.25*(1 + DCM(0,0) - DCM(1,1) - DCM(2,2))),
                             sqrt(0.25*(1 - DCM(0,0) + DCM(1,1) - DCM(2,2))),
                             sqrt(0.25*(1 - DCM(0,0) - DCM(1,1) + DCM(2,2)))};
    return q_ret;
}