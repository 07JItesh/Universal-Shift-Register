module UniversalShiftReg(
    input [3:0] in,
    input SLI,
    input SRI,
    input reset,
    input clk,
    input [1:0] sel,
    output reg [3:0] out,
    output SLO,
    output SRO
);

assign SLO = out[3];
assign SRO = out[0];

always@(posedge clk) begin
    if (reset)
        out = 4'b0;
    else begin

    case(sel)
        2'b00:out<= out; //Means No shift Operation Perform;
        2'b01:out <= {SRI,out[3:1]}; //
        2'b10:out <= {out[2:0],SLI};
        2'b11:out <= in;
    endcase
    end
end
endmodule