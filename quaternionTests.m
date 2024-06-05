classdef quaternionTests < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)

        function qMultSingleIdentityInput(testCase)
            [p, q, trueSolution] = deal([1 0 0 0]);
            funcSolution = qMult(p, q);
            testCase.verifyEqual(funcSolution, trueSolution);
        end

        function qMultMultipleIdentityInput(testCase)
            [p, q, trueSolution] = deal([ones(1,10); zeros(3,10)]);
            funcSolution = qMult(p, q);
            testCase.verifyEqual(funcSolution, trueSolution);
        end
   
        function qNormSingleIdentityInput(testCase)
            q = [1 0 0 0];
            funcSolution = qNorm(q);
            trueSolution = 1;
            testCase.verifyEqual(funcSolution, trueSolution);
        end

        function qNormMultipleIdentityInput(testCase)
            q = [ones(1,10); zeros(3,10)];
            funcSolution = qNorm(q);
            trueSolution = ones(1,10);
            testCase.verifyEqual(funcSolution, trueSolution);
        end

        function qInverseSingleIdentityInput(testCase)
            [q, trueSolution] = deal([1 0 0 0]);
            funcSolution = qInverse(q);
            testCase.verifyEqual(funcSolution, trueSolution);
        end
        
        function qInverseMultipleIdentityInput(testCase)
            [q, trueSolution] = deal([ones(1,10); zeros(3,10)]);
            funcSolution = qInverse(q);
            testCase.verifyEqual(funcSolution, trueSolution);
        end

        function qConjSingleIdentityInput(testCase)
            [q, trueSolution] = deal([1 0 0 0]);
            funcSolution = qConj(q);
            testCase.verifyEqual(funcSolution, trueSolution);
        end

        function qConjMultipleIdentityInput(testCase)
            [q, trueSolution] = deal([ones(1,10); zeros(3,10)]);
            funcSolution = qConj(q);
            testCase.verifyEqual(funcSolution, trueSolution);
        end
        
        function q2EulSingleInput(testCase)
            [att, trueSolution] = deal((pi/5)*ones(3,1));
            q = eul2q(att);
            funcSolution = q2Eul(q);
            testCase.verifyEqual(funcSolution, trueSolution, AbsTol=sqrt(eps));
        end

        function q2EulMultipleInput(testCase)
            [att, trueSolution] = deal((pi/5)*ones(3,10));
            q = eul2q(att);
            funcSolution = q2Eul(q);
            testCase.verifyEqual(funcSolution, trueSolution, AbsTol=sqrt(eps));
        end
        
        function q2DCMSingleInput(testCase)
            att = (pi/5)*ones(3,1);
            q = eul2q(att);
            DCMEul = eul2rotm(att');
            DCMQ = q2DCM(q);
            testCase.verifyEqual(det(DCMEul - DCMQ), 0, AbsTol=sqrt(eps));
        end
        
        function q2DCMMultipleInput(testCase)
            N = 10;
            att = (pi/5)*ones(3,N);
            q = eul2q(att);
            DCMEul = eul2rotm(att');
            DCMQ = q2DCM(q);
            diffDCM = reshape(DCMEul - DCMQ, [1,N*9,1]);
            testCase.verifyEqual(diffDCM, zeros(1,N*9), AbsTol=sqrt(eps));
        end
    end

end