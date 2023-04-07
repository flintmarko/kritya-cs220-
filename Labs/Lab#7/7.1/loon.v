`include "valkyrie.v"
module golem(clk);
    input wire clk;
    reg [31:0] zero,t0,t1,t2,t3,t4,t5,t6,t7,s0,s1,s2,s3,s4,s5,s6,s7,a0,a1,a2,a3,v0,v1,sp,ra;
    wire [31:0] instruction;
    reg [7:0] CP,dm_add;
    reg dm_reset,dm_we,dm_md,im_we,im_md;
    reg [31:0] dm_di,im_di;
    wire [31:0] dm_do;
    integer i;
    Dragonfangs #(.N(8)) instance1(.clk(clk),.reset(1'b0),.write_enable(im_we),.address(CP),.data_in(im_di),.mode(im_md),.data_out(instruction));
    Dragonfangs #(.N(8)) instance2(.clk(clk),.reset(dm_reset),.write_enable(dm_we),.address(dm_add),.data_in(dm_di),.mode(dm_md),.data_out(dm_do));
    initial 
    begin
        dm_md=1'b1;
        CP=0;
        sp=32'd255;
        zero=1'b0;
        im_we=1'b1;
        im_md=1'b0;
        im_di = {6'd0,5'd0,5'd1,5'd2,5'd0,6'd32};
        #10 CP=1;
        im_di={6'd8,5'd0,5'd29,16'd69};
        // #10 CP=2;
        // im_di= {6'd0,5'd0,5'd1,5'd2,5'd0,6'd32};
        // #10 CP=2;
        // im_di= {6'd42,5'd0,5'd1,5'd2,5'd0,6'd0};
        #100 im_md=1'b1;
        dm_we = 1'b0;
        CP=0;
    end
    always@(posedge clk)
    begin
        //CP<=CP+1;
        // if(CP=0)
        // begin
        //     $display("lkl")
        // end
        
        case(instruction[31:26])
        6'd0:
            //implement add,sub,addu,subu,and,or,sll,slt,srl, ***jr***
            case(instruction[5:0])
            6'b000000:
                //implement sll
                case(instruction[15:11])
                6'd1:t0=f(instruction[20:16])<<instruction[10:6];
                6'd2:t1=f(instruction[20:16])<<instruction[10:6];
                6'd3:t2=f(instruction[20:16])<<instruction[10:6];
                6'd4:t3=f(instruction[20:16])<<instruction[10:6];
                6'd5:t4=f(instruction[20:16])<<instruction[10:6];
                6'd6:t5=f(instruction[20:16])<<instruction[10:6];
                6'd7:t6=f(instruction[20:16])<<instruction[10:6];
                6'd8:t7=f(instruction[20:16])<<instruction[10:6];
                6'd9:s0=f(instruction[20:16])<<instruction[10:6];
                6'd10:s1=f(instruction[20:16])<<instruction[10:6];
                6'd11:s2=f(instruction[20:16])<<instruction[10:6];
                6'd12:s3=f(instruction[20:16])<<instruction[10:6];
                6'd13:s4=f(instruction[20:16])<<instruction[10:6];
                6'd14:s5=f(instruction[20:16])<<instruction[10:6];
                6'd15:s6=f(instruction[20:16])<<instruction[10:6];
                6'd16:s7=f(instruction[20:16])<<instruction[10:6];
                6'd17:a0=f(instruction[20:16])<<instruction[10:6];
                6'd18:a1=f(instruction[20:16])<<instruction[10:6];
                6'd19:a2=f(instruction[20:16])<<instruction[10:6];
                6'd20:a3=f(instruction[20:16])<<instruction[10:6];
                6'd21:v0=f(instruction[20:16])<<instruction[10:6];
                6'd22:v1=f(instruction[20:16])<<instruction[10:6];
                
                endcase
            6'b100000:
                //implement add
                case(instruction[15:11])
                6'd1:t0=f(instruction[20:16])+f(instruction[25:21]);
                6'd2:t1=f(instruction[20:16])+f(instruction[25:21]);
                6'd3:t2=f(instruction[20:16])+f(instruction[25:21]);
                6'd4:t3=f(instruction[20:16])+f(instruction[25:21]);
                6'd5:t4=f(instruction[20:16])+f(instruction[25:21]);
                6'd6:t5=f(instruction[20:16])+f(instruction[25:21]);
                6'd7:t6=f(instruction[20:16])+f(instruction[25:21]);
                6'd8:t7=f(instruction[20:16])+f(instruction[25:21]);
                6'd9:s0=f(instruction[20:16])+f(instruction[25:21]);
                6'd10:s1=f(instruction[20:16])+f(instruction[25:21]);
                6'd11:s2=f(instruction[20:16])+f(instruction[25:21]);
                6'd12:s3=f(instruction[20:16])+f(instruction[25:21]);
                6'd13:s4=f(instruction[20:16])+f(instruction[25:21]);
                6'd14:s5=f(instruction[20:16])+f(instruction[25:21]);
                6'd15:s6=f(instruction[20:16])+f(instruction[25:21]);
                6'd16:s7=f(instruction[20:16])+f(instruction[25:21]);
                6'd17:a0=f(instruction[20:16])+f(instruction[25:21]);
                6'd18:a1=f(instruction[20:16])+f(instruction[25:21]);
                6'd19:a2=f(instruction[20:16])+f(instruction[25:21]);
                6'd20:a3=f(instruction[20:16])+f(instruction[25:21]);
                6'd21:v0=f(instruction[20:16])+f(instruction[25:21]);
                6'd22:v1=f(instruction[20:16])+f(instruction[25:21]);
                default:
                    $display("jkjk");
                endcase
            6'b100001:
                //implement addu
                case(instruction[15:11])
                6'd1:t0=f(instruction[20:16])+f(instruction[25:21]);
                6'd2:t1=f(instruction[20:16])+f(instruction[25:21]);
                6'd3:t2=f(instruction[20:16])+f(instruction[25:21]);
                6'd4:t3=f(instruction[20:16])+f(instruction[25:21]);
                6'd5:t4=f(instruction[20:16])+f(instruction[25:21]);
                6'd6:t5=f(instruction[20:16])+f(instruction[25:21]);
                6'd7:t6=f(instruction[20:16])+f(instruction[25:21]);
                6'd8:t7=f(instruction[20:16])+f(instruction[25:21]);
                6'd9:s0=f(instruction[20:16])+f(instruction[25:21]);
                6'd10:s1=f(instruction[20:16])+f(instruction[25:21]);
                6'd11:s2=f(instruction[20:16])+f(instruction[25:21]);
                6'd12:s3=f(instruction[20:16])+f(instruction[25:21]);
                6'd13:s4=f(instruction[20:16])+f(instruction[25:21]);
                6'd14:s5=f(instruction[20:16])+f(instruction[25:21]);
                6'd15:s6=f(instruction[20:16])+f(instruction[25:21]);
                6'd16:s7=f(instruction[20:16])+f(instruction[25:21]);
                6'd17:a0=f(instruction[20:16])+f(instruction[25:21]);
                6'd18:a1=f(instruction[20:16])+f(instruction[25:21]);
                6'd19:a2=f(instruction[20:16])+f(instruction[25:21]);
                6'd20:a3=f(instruction[20:16])+f(instruction[25:21]);
                6'd21:v0=f(instruction[20:16])+f(instruction[25:21]);
                6'd22:v1=f(instruction[20:16])+f(instruction[25:21]);
                endcase
            6'b100010:
                //implement sub
                // for(i=0;i<32;i=i+1)
                // begin
                //     temp[i]=f(instruction[20:16])[i]?1'b0:1'b1;
                // end
                //temp=temp+1;
                //temp = ~f(instruction[20:16])+1;
                case(instruction[15:11])
                6'd1:t0=f(instruction[20:16])+~f(instruction[20:16])+1;
                6'd2:t1=f(instruction[20:16])+~f(instruction[20:16])+1;
                6'd3:t2=f(instruction[20:16])+~f(instruction[20:16])+1;
                6'd4:t3=f(instruction[20:16])+~f(instruction[20:16])+1;
                6'd5:t4=f(instruction[20:16])+~f(instruction[20:16])+1;
                6'd6:t5=f(instruction[20:16])+~f(instruction[20:16])+1;
                6'd7:t6=f(instruction[20:16])+~f(instruction[20:16])+1;
                6'd8:t7=f(instruction[20:16])+~f(instruction[20:16])+1;
                6'd9:s0=f(instruction[20:16])+~f(instruction[20:16])+1;
                6'd10:s1=f(instruction[20:16])+~f(instruction[20:16])+1;
                6'd11:s2=f(instruction[20:16])+~f(instruction[20:16])+1;
                6'd12:s3=f(instruction[20:16])+~f(instruction[20:16])+1;
                6'd13:s4=f(instruction[20:16])+~f(instruction[20:16])+1;
                6'd14:s5=f(instruction[20:16])+~f(instruction[20:16])+1;
                6'd15:s6=f(instruction[20:16])+~f(instruction[20:16])+1;
                6'd16:s7=f(instruction[20:16])+~f(instruction[20:16])+1;
                6'd17:a0=f(instruction[20:16])+~f(instruction[20:16])+1;
                6'd18:a1=f(instruction[20:16])+~f(instruction[20:16])+1;
                6'd19:a2=f(instruction[20:16])+~f(instruction[20:16])+1;
                6'd20:a3=f(instruction[20:16])+~f(instruction[20:16])+1;
                6'd21:v0=f(instruction[20:16])+~f(instruction[20:16])+1;
                6'd22:v1=f(instruction[20:16])+~f(instruction[20:16])+1;
                endcase

            6'b100011:
                //implement subu
                case(instruction[15:11])
                6'd1:t0=f(instruction[25:21])-f(instruction[20:16]);
                6'd2:t1=f(instruction[25:21])-f(instruction[20:16]);
                6'd3:t2=f(instruction[25:21])-f(instruction[20:16]);
                6'd4:t3=f(instruction[25:21])-f(instruction[20:16]);
                6'd5:t4=f(instruction[25:21])-f(instruction[20:16]);
                6'd6:t5=f(instruction[25:21])-f(instruction[20:16]);
                6'd7:t6=f(instruction[25:21])-f(instruction[20:16]);
                6'd8:t7=f(instruction[25:21])-f(instruction[20:16]);
                6'd9:s0=f(instruction[25:21])-f(instruction[20:16]);
                6'd10:s1=f(instruction[25:21])-f(instruction[20:16]);
                6'd11:s2=f(instruction[25:21])-f(instruction[20:16]);
                6'd12:s3=f(instruction[25:21])-f(instruction[20:16]);
                6'd13:s4=f(instruction[25:21])-f(instruction[20:16]);
                6'd14:s5=f(instruction[25:21])-f(instruction[20:16]);
                6'd15:s6=f(instruction[25:21])-f(instruction[20:16]);
                6'd16:s7=f(instruction[25:21])-f(instruction[20:16]);
                6'd17:a0=f(instruction[25:21])-f(instruction[20:16]);
                6'd18:a1=f(instruction[25:21])-f(instruction[20:16]);
                6'd19:a2=f(instruction[25:21])-f(instruction[20:16]);
                6'd20:a3=f(instruction[25:21])-f(instruction[20:16]);
                6'd21:v0=f(instruction[25:21])-f(instruction[20:16]);
                6'd22:v1=f(instruction[25:21])-f(instruction[20:16]);
                endcase
            6'b100100:
                //implement and
                case(instruction[15:11])
                6'd1:t0=f(instruction[25:21])&f(instruction[20:16]);
                6'd2:t1=f(instruction[25:21])&f(instruction[20:16]);
                6'd3:t2=f(instruction[25:21])&f(instruction[20:16]);
                6'd4:t3=f(instruction[25:21])&f(instruction[20:16]);
                6'd5:t4=f(instruction[25:21])&f(instruction[20:16]);
                6'd6:t5=f(instruction[25:21])&f(instruction[20:16]);
                6'd7:t6=f(instruction[25:21])&f(instruction[20:16]);
                6'd8:t7=f(instruction[25:21])&f(instruction[20:16]);
                6'd9:s0=f(instruction[25:21])&f(instruction[20:16]);
                6'd10:s1=f(instruction[25:21])&f(instruction[20:16]);
                6'd11:s2=f(instruction[25:21])&f(instruction[20:16]);
                6'd12:s3=f(instruction[25:21])&f(instruction[20:16]);
                6'd13:s4=f(instruction[25:21])&f(instruction[20:16]);
                6'd14:s5=f(instruction[25:21])&f(instruction[20:16]);
                6'd15:s6=f(instruction[25:21])&f(instruction[20:16]);
                6'd16:s7=f(instruction[25:21])&f(instruction[20:16]);
                6'd17:a0=f(instruction[25:21])&f(instruction[20:16]);
                6'd18:a1=f(instruction[25:21])&f(instruction[20:16]);
                6'd19:a2=f(instruction[25:21])&f(instruction[20:16]);
                6'd20:a3=f(instruction[25:21])&f(instruction[20:16]);
                6'd21:v0=f(instruction[25:21])&f(instruction[20:16]);
                6'd22:v1=f(instruction[25:21])&f(instruction[20:16]);
                endcase
            6'b100101:
                //implement or
                case(instruction[15:11])
                6'd1:t0=f(instruction[25:21])|f(instruction[20:16]);
                6'd2:t1=f(instruction[25:21])|f(instruction[20:16]);
                6'd3:t2=f(instruction[25:21])|f(instruction[20:16]);
                6'd4:t3=f(instruction[25:21])|f(instruction[20:16]);
                6'd5:t4=f(instruction[25:21])|f(instruction[20:16]);
                6'd6:t5=f(instruction[25:21])|f(instruction[20:16]);
                6'd7:t6=f(instruction[25:21])|f(instruction[20:16]);
                6'd8:t7=f(instruction[25:21])|f(instruction[20:16]);
                6'd9:s0=f(instruction[25:21])|f(instruction[20:16]);
                6'd10:s1=f(instruction[25:21])|f(instruction[20:16]);
                6'd11:s2=f(instruction[25:21])|f(instruction[20:16]);
                6'd12:s3=f(instruction[25:21])|f(instruction[20:16]);
                6'd13:s4=f(instruction[25:21])|f(instruction[20:16]);
                6'd14:s5=f(instruction[25:21])|f(instruction[20:16]);
                6'd15:s6=f(instruction[25:21])|f(instruction[20:16]);
                6'd16:s7=f(instruction[25:21])|f(instruction[20:16]);
                6'd17:a0=f(instruction[25:21])|f(instruction[20:16]);
                6'd18:a1=f(instruction[25:21])|f(instruction[20:16]);
                6'd19:a2=f(instruction[25:21])|f(instruction[20:16]);
                6'd20:a3=f(instruction[25:21])|f(instruction[20:16]);
                6'd21:v0=f(instruction[25:21])|f(instruction[20:16]);
                6'd22:v1=f(instruction[25:21])|f(instruction[20:16]);
                endcase
            6'd24:
                //implement slt
                //temp = f(instruction[25:21])<f(instruction[20:16])?1:0;
                case(instruction[15:11])
                6'd1:t0=f(instruction[25:21])<f(instruction[20:16])?1:0;
                6'd2:t1=f(instruction[25:21])<f(instruction[20:16])?1:0;
                6'd3:t2=f(instruction[25:21])<f(instruction[20:16])?1:0;
                6'd4:t3=f(instruction[25:21])<f(instruction[20:16])?1:0;
                6'd5:t4=f(instruction[25:21])<f(instruction[20:16])?1:0;
                6'd6:t5=f(instruction[25:21])<f(instruction[20:16])?1:0;
                6'd7:t6=f(instruction[25:21])<f(instruction[20:16])?1:0;
                6'd8:t7=f(instruction[25:21])<f(instruction[20:16])?1:0;
                6'd9:s0=f(instruction[25:21])<f(instruction[20:16])?1:0;
                6'd10:s1=f(instruction[25:21])<f(instruction[20:16])?1:0;
                6'd11:s2=f(instruction[25:21])<f(instruction[20:16])?1:0;
                6'd12:s3=f(instruction[25:21])<f(instruction[20:16])?1:0;
                6'd13:s4=f(instruction[25:21])<f(instruction[20:16])?1:0;
                6'd14:s5=f(instruction[25:21])<f(instruction[20:16])?1:0;
                6'd15:s6=f(instruction[25:21])<f(instruction[20:16])?1:0;
                6'd16:s7=f(instruction[25:21])<f(instruction[20:16])?1:0;
                6'd17:a0=f(instruction[25:21])<f(instruction[20:16])?1:0;
                6'd18:a1=f(instruction[25:21])<f(instruction[20:16])?1:0;
                6'd19:a2=f(instruction[25:21])<f(instruction[20:16])?1:0;
                6'd20:a3=f(instruction[25:21])<f(instruction[20:16])?1:0;
                6'd21:v0=f(instruction[25:21])<f(instruction[20:16])?1:0;
                6'd22:v1=f(instruction[25:21])<f(instruction[20:16])?1:0;
                endcase
            6'd2:
                //implement srl
                case(instruction[15:11])
                6'd1:t0=f(instruction[20:16])>>instruction[10:6];
                6'd2:t1=f(instruction[20:16])>>instruction[10:6];
                6'd3:t2=f(instruction[20:16])>>instruction[10:6];
                6'd4:t3=f(instruction[20:16])>>instruction[10:6];
                6'd5:t4=f(instruction[20:16])>>instruction[10:6];
                6'd6:t5=f(instruction[20:16])>>instruction[10:6];
                6'd7:t6=f(instruction[20:16])>>instruction[10:6];
                6'd8:t7=f(instruction[20:16])>>instruction[10:6];
                6'd9:s0=f(instruction[20:16])>>instruction[10:6];
                6'd10:s1=f(instruction[20:16])>>instruction[10:6];
                6'd11:s2=f(instruction[20:16])>>instruction[10:6];
                6'd12:s3=f(instruction[20:16])>>instruction[10:6];
                6'd13:s4=f(instruction[20:16])>>instruction[10:6];
                6'd14:s5=f(instruction[20:16])>>instruction[10:6];
                6'd15:s6=f(instruction[20:16])>>instruction[10:6];
                6'd16:s7=f(instruction[20:16])>>instruction[10:6];
                6'd17:a0=f(instruction[20:16])>>instruction[10:6];
                6'd18:a1=f(instruction[20:16])>>instruction[10:6];
                6'd19:a2=f(instruction[20:16])>>instruction[10:6];
                6'd20:a3=f(instruction[20:16])>>instruction[10:6];
                6'd21:v0=f(instruction[20:16])>>instruction[10:6];
                6'd22:v1=f(instruction[20:16])>>instruction[10:6];
                endcase
            6'b001000:
                //implement jr
                CP=f(instruction[25:21]);    
            endcase
        //$display("Hey look ! we are doing Rtype");
        6'd8:
        //implement addi
            //$display("Hey look ! we are doing addi ");
            case(instruction[20:16])
            6'd1:t0=f(instruction[25:21])+instruction[15:0];
            6'd2:t1=f(instruction[25:21])+instruction[15:0];
            6'd3:t2=f(instruction[25:21])+instruction[15:0];
            6'd4:t3=f(instruction[25:21])+instruction[15:0];
            6'd5:t4=f(instruction[25:21])+instruction[15:0];
            6'd6:t5=f(instruction[25:21])+instruction[15:0];
            6'd7:t6=f(instruction[25:21])+instruction[15:0];
            6'd8:t7=f(instruction[25:21])+instruction[15:0];
            6'd9:s0=f(instruction[25:21])+instruction[15:0];
            6'd10:s1=f(instruction[25:21])+instruction[15:0];
            6'd11:s2=f(instruction[25:21])+instruction[15:0];
            6'd12:s3=f(instruction[25:21])+instruction[15:0];
            6'd13:s4=f(instruction[25:21])+instruction[15:0];
            6'd14:s5=f(instruction[25:21])+instruction[15:0];
            6'd15:s6=f(instruction[25:21])+instruction[15:0];
            6'd16:s7=f(instruction[25:21])+instruction[15:0];
            6'd17:a0=f(instruction[25:21])+instruction[15:0];
            6'd18:a1=f(instruction[25:21])+instruction[15:0];
            6'd19:a2=f(instruction[25:21])+instruction[15:0];
            6'd20:a3=f(instruction[25:21])+instruction[15:0];
            6'd21:v0=f(instruction[25:21])+instruction[15:0];
            6'd22:v1=f(instruction[25:21])+instruction[15:0];
            default:
                    $display("lkl");
            endcase
            
        6'd9:
            //implement addiu
            case(instruction[20:16])
            6'd1:t0=f(instruction[25:21])+instruction[15:0];
            6'd2:t1=f(instruction[25:21])+instruction[15:0];
            6'd3:t2=f(instruction[25:21])+instruction[15:0];
            6'd4:t3=f(instruction[25:21])+instruction[15:0];
            6'd5:t4=f(instruction[25:21])+instruction[15:0];
            6'd6:t5=f(instruction[25:21])+instruction[15:0];
            6'd7:t6=f(instruction[25:21])+instruction[15:0];
            6'd8:t7=f(instruction[25:21])+instruction[15:0];
            6'd9:s0=f(instruction[25:21])+instruction[15:0];
            6'd10:s1=f(instruction[25:21])+instruction[15:0];
            6'd11:s2=f(instruction[25:21])+instruction[15:0];
            6'd12:s3=f(instruction[25:21])+instruction[15:0];
            6'd13:s4=f(instruction[25:21])+instruction[15:0];
            6'd14:s5=f(instruction[25:21])+instruction[15:0];
            6'd15:s6=f(instruction[25:21])+instruction[15:0];
            6'd16:s7=f(instruction[25:21])+instruction[15:0];
            6'd17:a0=f(instruction[25:21])+instruction[15:0];
            6'd18:a1=f(instruction[25:21])+instruction[15:0];
            6'd19:a2=f(instruction[25:21])+instruction[15:0];
            6'd20:a3=f(instruction[25:21])+instruction[15:0];
            6'd21:v0=f(instruction[25:21])+instruction[15:0];
            6'd22:v1=f(instruction[25:21])+instruction[15:0];
            endcase
            //$display("Hey look ! we are doing addiu");
        6'd12:
        //implement andi
            case(instruction[20:16])
            6'd1:t0=f(instruction[25:21])&instruction[15:0];
            6'd2:t1=f(instruction[25:21])&instruction[15:0];
            6'd3:t2=f(instruction[25:21])&instruction[15:0];
            6'd4:t3=f(instruction[25:21])&instruction[15:0];
            6'd5:t4=f(instruction[25:21])&instruction[15:0];
            6'd6:t5=f(instruction[25:21])&instruction[15:0];
            6'd7:t6=f(instruction[25:21])&instruction[15:0];
            6'd8:t7=f(instruction[25:21])&instruction[15:0];
            6'd9:s0=f(instruction[25:21])&instruction[15:0];
            6'd10:s1=f(instruction[25:21])&instruction[15:0];
            6'd11:s2=f(instruction[25:21])&instruction[15:0];
            6'd12:s3=f(instruction[25:21])&instruction[15:0];
            6'd13:s4=f(instruction[25:21])&instruction[15:0];
            6'd14:s5=f(instruction[25:21])&instruction[15:0];
            6'd15:s6=f(instruction[25:21])&instruction[15:0];
            6'd16:s7=f(instruction[25:21])&instruction[15:0];
            6'd17:a0=f(instruction[25:21])&instruction[15:0];
            6'd18:a1=f(instruction[25:21])&instruction[15:0];
            6'd19:a2=f(instruction[25:21])&instruction[15:0];
            6'd20:a3=f(instruction[25:21])&instruction[15:0];
            6'd21:v0=f(instruction[25:21])&instruction[15:0];
            6'd22:v1=f(instruction[25:21])&instruction[15:0];
            endcase
            //$display("Hey look ! we are doing andi ");
        6'd13:
        //implement ori
            case(instruction[20:16])
            6'd1:t0=f(instruction[25:21])|instruction[15:0];
            6'd2:t1=f(instruction[25:21])|instruction[15:0];
            6'd3:t2=f(instruction[25:21])|instruction[15:0];
            6'd4:t3=f(instruction[25:21])|instruction[15:0];
            6'd5:t4=f(instruction[25:21])|instruction[15:0];
            6'd6:t5=f(instruction[25:21])|instruction[15:0];
            6'd7:t6=f(instruction[25:21])|instruction[15:0];
            6'd8:t7=f(instruction[25:21])|instruction[15:0];
            6'd9:s0=f(instruction[25:21])|instruction[15:0];
            6'd10:s1=f(instruction[25:21])|instruction[15:0];
            6'd11:s2=f(instruction[25:21])|instruction[15:0];
            6'd12:s3=f(instruction[25:21])|instruction[15:0];
            6'd13:s4=f(instruction[25:21])|instruction[15:0];
            6'd14:s5=f(instruction[25:21])|instruction[15:0];
            6'd15:s6=f(instruction[25:21])|instruction[15:0];
            6'd16:s7=f(instruction[25:21])|instruction[15:0];
            6'd17:a0=f(instruction[25:21])|instruction[15:0];
            6'd18:a1=f(instruction[25:21])|instruction[15:0];
            6'd19:a2=f(instruction[25:21])|instruction[15:0];
            6'd20:a3=f(instruction[25:21])|instruction[15:0];
            6'd21:v0=f(instruction[25:21])|instruction[15:0];
            6'd22:v1=f(instruction[25:21])|instruction[15:0];
            endcase
            //$display(" ori --> Solved // bang");
        6'd35:
            //implement lw
            // temp = f(instruction[25:21]) + instruction[15:0];
            // dm_we=1'b0;
            // dm_add=temp;
            // dm_di=1'b1;
            // enable = 1'b1;
            // temp = f(instruction[20:16]);
            $display("Hey look ! we are doing lw ");
        6'b101010:
            //implement sw
            // temp = f(instruction[25:21]) + instruction[15:0];
            // dm_we=1'b1;
            // dm_add=temp;
            // dm_di=1'b0;
            // dm_di = f(instruction[20:16]);
            $display(t0);
        6'd4:
            //implement beq
            if(f(instruction[25:21]) == f(instruction[20:16]))
            begin
                CP = CP + instruction[15:0];
            end
            else
            begin
                CP = CP; 
            end
            //$display("Hey look ! we are doing beq ");
        6'd5:
            //implement bne
            if(f(instruction[25:21]) != f(instruction[20:16]))
            begin
                CP = CP + instruction[15:0];
            end
            else
            begin
                CP = CP;
            end
            //$display("Hey look ! we are doing bne ");
        6'd23:
            //implement bgt
            if(f(instruction[25:21]) > f(instruction[20:16]))
            begin
                CP = CP + instruction[15:0];
            end
            else
            begin
                CP = CP;
            end
            //$display("Hey look ! we are doing bgt ");
        6'd29:
            //implement bgte
            if(f(instruction[25:21]) >= f(instruction[20:16]))
            begin
                CP = CP + instruction[15:0];
            end
            else
            begin
                CP = CP;
            end
            //$display("Hey look ! we are doing bgte ");
        6'd41:
            //implement ble
            if(f(instruction[25:21]) < f(instruction[20:16]))
            begin
                CP = CP + instruction[15:0];
            end
            else
            begin
                CP = CP;
            end
            //$display("Hey look ! we are doing ble ");
        6'd43:
            //implement bleq
            if(f(instruction[25:21]) <= f(instruction[20:16]))
            begin
                CP = CP + instruction[15:0];
            end
            else
            begin
                CP = CP;
            end
            //$display("Hey look ! we are doing bleq ");
        6'b000010:
            //implement j
            CP = instruction[25:0];
            //$display("Hey look ! we are doing j ");
        6'd3:
            //implement jal
            // ra<=CP;
            CP <= instruction[25:0];
            //$display("Hey look ! we are doing jal ");
        6'd10:
            //implement slti
            // if(f(instruction[25:21]) < instruction[15:0])
            // begin
            //     temp = 1'b1;
            // end
            // else
            // begin
            //     temp = 1'b0;
            // end
            case(instruction[20:16])
            6'd1:t0=f(instruction[25:21]) < instruction[15:0]?1'b1:1'b0;
            6'd2:t1=f(instruction[25:21]) < instruction[15:0]?1'b1:1'b0;
            6'd3:t2=f(instruction[25:21]) < instruction[15:0]?1'b1:1'b0;
            6'd4:t3=f(instruction[25:21]) < instruction[15:0]?1'b1:1'b0;
            6'd5:t4=f(instruction[25:21]) < instruction[15:0]?1'b1:1'b0;
            6'd6:t5=f(instruction[25:21]) < instruction[15:0]?1'b1:1'b0;
            6'd7:t6=f(instruction[25:21]) < instruction[15:0]?1'b1:1'b0;
            6'd8:t7=f(instruction[25:21]) < instruction[15:0]?1'b1:1'b0;
            6'd9:s0=f(instruction[25:21]) < instruction[15:0]?1'b1:1'b0;
            6'd10:s1=f(instruction[25:21]) < instruction[15:0]?1'b1:1'b0;
            6'd11:s2=f(instruction[25:21]) < instruction[15:0]?1'b1:1'b0;
            6'd12:s3=f(instruction[25:21]) < instruction[15:0]?1'b1:1'b0;
            6'd13:s4=f(instruction[25:21]) < instruction[15:0]?1'b1:1'b0;
            6'd14:s5=f(instruction[25:21]) < instruction[15:0]?1'b1:1'b0;
            6'd15:s6=f(instruction[25:21]) < instruction[15:0]?1'b1:1'b0;
            6'd16:s7=f(instruction[25:21]) < instruction[15:0]?1'b1:1'b0;
            6'd17:a0=f(instruction[25:21]) < instruction[15:0]?1'b1:1'b0;
            6'd18:a1=f(instruction[25:21]) < instruction[15:0]?1'b1:1'b0;
            6'd19:a2=f(instruction[25:21]) < instruction[15:0]?1'b1:1'b0;
            6'd20:a3=f(instruction[25:21]) < instruction[15:0]?1'b1:1'b0;
            6'd21:v0=f(instruction[25:21]) < instruction[15:0]?1'b1:1'b0;
            6'd22:v1=f(instruction[25:21]) < instruction[15:0]?1'b1:1'b0;
            
            endcase
            //$display("Hey look ! we are doing sltt ");
        endcase
        CP=CP+1;
    end
    // always(@ (posedge clk))
    // begin
    //     if(enable==1'b1)
    //     begin
    //         case(temp)
    //         6'd1:t0=dm_dout;
    //         6'd2:t1=dm_dout;
    //         6'd3:t2=dm_dout;
    //         6'd4:t3=dm_dout;
    //         6'd5:t4=dm_dout;
    //         6'd6:t5=dm_dout;
    //         6'd7:t6=dm_dout;
    //         6'd8:t7=dm_dout;
    //         6'd9:s0=dm_dout;
    //         6'd10:s1=dm_dout;
    //         6'd11:s2=dm_dout;
    //         6'd12:s3=dm_dout;
    //         6'd13:s4=dm_dout;
    //         6'd14:s5=dm_dout;
    //         6'd15:s6=dm_dout;
    //         6'd16:s7=dm_dout;
    //         6'd17:a0=dm_dout;
    //         6'd18:a1=dm_dout;
    //         6'd19:a2=dm_dout;
    //         6'd20:a3=dm_dout;
    //         6'd21:v0=dm_dout;
    //         6'd22:v1=dm_dout;
    //         endcase
    //     end
    // end
    
    function [31:0]f(input [5:0]x);
    begin
        case(x)
        6'd0:f = 0;
        6'd1:f=t0;
        6'd2:f = t1;
        6'd3:f = t2;
        6'd4:f = t3;
        6'd5:f = t4;
        6'd6:f = t5;
        6'd7:f = t6;
        6'd8:f = t7;
        6'd9:f = s0;
        6'd10:f = s1;
        6'd11:f = s2;
        6'd12:f = s3;
        6'd13:f = s4;
        6'd14:f = s5;
        6'd15:f = s6;
        6'd16:f = s7;
        6'd17:f = a0;
        6'd18:f = a1;
        6'd19:f = a2;
        6'd20:f = a3;
        6'd21:f = v0;
        6'd22:f = v1;
        6'd23:f = ra;
        6'd24:f = sp;
        endcase
    end
    endfunction
endmodule