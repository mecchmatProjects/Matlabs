
function pl6_1(varargin)    % основна функція pl6_1 (файл pl6_1.m)
   n = length(varargin);
   if n == 1
      e = varargin{1};
   elseif n == 2
      e = f1(varargin{2});
   elseif n == 3
      e = f2(varargin{3});
   else
      [e, es] = f(varargin{4:n});
      es
   end
   e
end      % кінець опису pl6_1 (необов'язковий, якщо відсутні вкладені функції)

function [rf, varargout] = f(varargin) % підфункція f
   rf = [varargin{:}];
   varargout = {rf};
   rf = sum(rf);
end      % кінець опису f (необов'язковий, якщо відсутні вкладені функції)
   
function rf1 = f1(a)                   % підфункція  f1
   rf1 = a;
end      % кінець опису f1 (необов'язковий, якщо відсутні вкладені функції)
   
function rf2 = f2(a)                   % підфункція  f2
   rf2 = a;
end      % кінець опису f2 (необов'язковий, якщо відсутні вкладені функції)
