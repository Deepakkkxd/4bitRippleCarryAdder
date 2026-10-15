module tb_rippleAdder4bit;
  reg [3:0] a;
  reg [3:0] b;
  reg cin;
  wire [3:0] sum;
  wire carry;
  
  rippleAdder4bit dut(
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .carry(carry)
  );
  
  integer i;
  initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars(0,tb_rippleAdder4bit);
    
    $display("Time\t | a + b + cin | cout | sum");
    $monitor("%0t\t | %b + %b + %b | %b | %b", $time, a, b, cin, carry, sum);
    
    a = 4'd0;  b = 4'd0;  cin = 0; #10;
    // Test Case 2: 5 + 3
    a = 4'd5;  b = 4'd3;  cin = 0; #10;
    // Test Case 3: 7 + 8
    a = 4'd7;  b = 4'd8;  cin = 0; #10;
    // Test Case 4: 10 + 5 with carry-in 1 (10 + 5 + 1 = 16 [Overflow!])
    a = 4'd10; b = 4'd5;  cin = 1; #10;
    // Test Case 5: Max values (15 + 15)
    a = 4'd15; b = 4'd15; cin = 0; #10;
    
    $finish;
  end
endmodule
