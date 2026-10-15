module halfAdder(input a, input b, output sum, output carry);
  assign sum = a ^ b;
  assign carry = a & b;
endmodule

module fullAdder(input a, input b, input cin, output sum, output cout);
  wire s1, c1, c2;
  
  halfAdder HA1(
    .a(a),
    .b(b),
    .sum(s1),
    .carry(c1)
  );
  
  halfAdder HA2(
    .a(s1),
    .b(cin),
    .sum(sum),
    .carry(cout)
  );
  
  assign cout = c1 | c2;
endmodule

module rippleAdder4bit(input [3:0] a, input [3:0] b,input cin, output [3:0] sum, output carry);
  
  wire c1, c2, c3;
  
  fullAdder FA1(
    .a(a[0]),
    .b(b[0]),
    .cin(cin),
    .sum(sum[0]),
    .cout(c1)
  );
  
  fullAdder FA2(
    .a(a[1]),
    .b(b[1]),
    .cin(cin),
    .sum(sum[1]),
    .cout(c2)
  );
  
  fullAdder FA3(
    .a(a[2]),
    .b(b[2]),
    .cin(cin),
    .sum(sum[2]),
    .cout(c3)
  );
  
  fullAdder FA4(
    .a(a[3]),
    .b(b[3]),
    .cin(cin),
    .sum(sum[3]),
    .cout(carry)
  );
  
endmodule
