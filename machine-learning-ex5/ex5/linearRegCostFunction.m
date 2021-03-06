function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

prediction = X * theta;

error = prediction - y;

costWithoutRegularization = ( 1/(2 * m) ) * sum (error.^2);

thetaWithout0Term = theta(2:size(theta), :);

regularizationTerm = ( lambda / (2 * m) ) * sum (thetaWithout0Term.^2);

J =  (costWithoutRegularization + regularizationTerm);

summationPartOfGrad = 1 / m * X' * error;

regularizedGradTerm = (lambda / m) * theta(2:size(theta), :);

summationTermExcludingTheta0 = summationPartOfGrad (2: size(summationPartOfGrad), :);

summationPartOfGrad (2: size(summationPartOfGrad), :) = summationTermExcludingTheta0 + regularizedGradTerm;

grad = summationPartOfGrad;





% =========================================================================

grad = grad(:);

end
