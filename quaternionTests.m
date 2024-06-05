classdef quaternionTests < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)

        function qMultTest(testCase)
            p = [1 0 0 0]; q = [1 0 0 0];
            funcSolution = qMult(p, q);
            trueSolution = [1 0 0 0];
            testCase.verifyEqual(funcSolution, trueSolution);
        end
   
        function qNormTest(testCase)
            q = [1 0 0 0];
            funcSolution = qNorm(q);
            trueSolution = 1;
            testCase.verifyEqual(funcSolution, trueSolution);
        end
        
        function qInverseTest(testCase)
            q = [1 0 0 0];
            funcSolution = qInverse(q);
            trueSolution = q;
            testCase.verifyEqual(funcSolution, trueSolution);
        end
        
        function qConjTest(testCase)
            q = [1 0 0 0];
            funcSolution = qConj(q);
            trueSolution = q;
            testCase.verifyEqual(funcSolution, trueSolution);
        end
        
        function q2EulTest(testCase)
            att = [pi/5 pi/3 pi/6];
            q = eul2q(att);
            funcSolution = q2Eul(q);
            trueSolution = att';
            testCase.verifyEqual(funcSolution, trueSolution, AbsTol=sqrt(eps));
        end
        
        function q2DCM(testCase)
            att = [pi/5 pi/3 pi/6];
            q = eul2q(att);
            DCMEul = eul2rotm(att);
            DCMQ = q2DCM(q);
            testCase.verifyEqual(det(DCMEul - DCMQ), 0, AbsTol=sqrt(eps));
        end
    end

end