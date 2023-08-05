
module top_tb;

   // Parameters
   parameter CLK_PERIOD = 10;

   // Inputs
   reg a_clk = 0 ;
   reg b_clk = 0;
   reg c_clk = 0;
   reg [0:3] error_found = 0;
   reg [0:31] req1_data_in ;
   reg [0:31] req2_data_in ;
   reg [0:31] req3_data_in ;
   reg [0:31] req4_data_in ;
   reg [0:3] req1_cmd_in ;
   reg [0:3] req2_cmd_in ;
   reg [0:3] req3_cmd_in ;
   reg [0:3] req4_cmd_in ;
   reg [1:7] reset ;
   reg scan_in = 0;
   
   // Outputs
   wire [0:31] out_data1 ;
   wire [0:31] out_data2 ;
   wire [0:31] out_data3 ;
   wire [0:31] out_data4 ;
   wire [0:1] out_resp1 ;
   wire [0:1] out_resp2 ;
   wire [0:1] out_resp3 ;
   wire [0:1] out_resp4 ;
   wire scan_out = 0;

   // Instantiate the DUT
   calc1_top dut (
      .a_clk(a_clk),
      .b_clk(b_clk),
      .c_clk(c_clk),
      .error_found(error_found),
      .req1_cmd_in(req1_cmd_in),
      .req1_data_in(req1_data_in),
      .req2_cmd_in(req2_cmd_in),
      .req2_data_in(req2_data_in),
      .req3_cmd_in(req3_cmd_in),
      .req3_data_in(req3_data_in),
      .req4_cmd_in(req4_cmd_in),
      .req4_data_in(req4_data_in),
      .reset(reset),
      .scan_in(scan_in),
      .out_data1(out_data1),
      .out_data2(out_data2),
      .out_data3(out_data3),
      .out_data4(out_data4),
      .out_resp1(out_resp1),
      .out_resp2(out_resp2),
      .out_resp3(out_resp3),
      .out_resp4(out_resp4),
      .scan_out(scan_out)
   );

   // Clock generation
   always #((CLK_PERIOD)/2) c_clk <= ~c_clk;
  
   // Test stimuli
   initial begin
      // Reset
      reset = 7'b1111111;
     req1_data_in = 32'h0000_0000;
     req2_data_in = 32'h0000_0000;
     req3_data_in = 32'h0000_0000;
     req4_data_in = 32'h0000_0000;
     req1_cmd_in = 4'b0000;
     req2_cmd_in = 4'b0000;
     req3_cmd_in = 4'b0000;
     req4_cmd_in = 4'b0000;
      #70 ; 
      reset = 7'b0000000;
      #30;

      // Send requests
      req1_cmd_in = 4'b0001;
      req1_data_in = 32'h8000_2345;
      #10;
      req1_cmd_in = 4'b0000;
      req1_data_in = 32'h0001_0000;
      #60;
  end
  
endmodule