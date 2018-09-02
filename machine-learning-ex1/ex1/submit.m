function submit()
  addpath('./lib');

  conf.assignmentSlug = 'linear-regression';
  conf.itemName = 'Linear Regression with Multiple Variables';
  conf.partArrays = { ...
    { ...eiman
      '1', ...
      { 'warmUpExercise.m' }, ...
      'Warm-up Exercise', ...
    }, ...
    { ...
      '2', ...
      { 'computeCost.m' }, ...
      'Computing Cost (for One Variable)', ...
    }, ...
    { ...
      '3', ...
      { 'gradientDescent.m' }, ...
      'Gradient Descent (for One Variable)', ...
    }, ...
    { ...
      '4', ...
      { 'featureNormalize.m' }, ...
      'Feature Normalization', ...
    }, ...
    { ...
      '5', ...
      { 'computeCostMulti.m' }, ...
      'Computing Cost (for Multiple Variables)', ...
    }, ...
    { ...
      '6', ...
      { 'gradientDescentMulti.m' }, ...
      'Gradient Descent (for Multiple Variables)', ...
    }, ...
    { ...
      '7', ...
      { 'normalEqn.m' }, ...
      'Normal Equations', ...
    }, ...
  };
  conf.output = @output;

  submitWithConfiguration(conf);
end

function out = output(partId)
  % Random Test Cases
  X1 = [ones(20,1) (exp(1) + exp(2) * (0.1:0.1:2))'];
  Y1 = X1(:,2) + sin(X1(:,1)) + cos(X1(:,2));
  X2 = [X1 X1(:,2).^0.5 X1(:,2).^0.25];
  Y2 = Y1.^0.5 + Y1;
  if partId == '1'
    out = sprintf('%0.5f ', warmUpExercise());
  elseif partId == '2'
    out = sprintf('%0.5f ', computeCost(X1, Y1, [0.5 -0.5]'));
  elseif partId == '3'
    out = sprintf('%0.5f ', gradientDescent(X1, Y1, [0.5 -0.5]', 0.01, 10));
  elseif partId == '4'
    out = sprintf('%0.5f ', featureNormalize(X2(:,2:4)));
  elseif partId == '5'
    out = sprintf('%0.5f ', computeCostMulti(X2, Y2, [0.1 0.2 0.3 0.4]'));
  elseif partId == '6'
    out = sprintf('%0.5f ', gradientDescentMulti(X2, Y2, [-0.1 -0.2 -0.3 -0.4]', 0.01, 10));
  elseif partId == '7'
    out = sprintf('%0.5f ', normalEqn(X2, Y2));
  end 
end
