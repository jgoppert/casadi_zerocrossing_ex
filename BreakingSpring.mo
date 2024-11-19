model BreakingSpring
    input Real m(start = 1) "PARAMETER:Mass";
    output Real v(start = -5, fixed = true) "velocity";
    output Real x(start = -1, fixed = true) "displacement";
    input Real k(start = 2) "PARAMETER:spring constant";
    input Real c(start = 0.1) "PARAMETER:damping constant";
    input Real d(start = 0) "disturbance";
    Real f "spring force";
    Boolean b "Is the spring broken?";
initial equation
  b = false;
equation
    der(x) = v;
    f = if not b then -k * x + d else 0;
    m * der(v) + c * v = f;
    when x>2 then
      b = true;
    end when;
end BreakingSpring;