module traffic_light_controller(
    input clk,
    input rst,
    input emergency,
    output reg [2:0] highway,
    output reg [2:0] side_road,
    output reg [1:0] state,
    output reg [3:0] count
);

// LIGHT ENCODING
parameter RED    = 3'b100;
parameter YELLOW = 3'b010;
parameter GREEN  = 3'b001;

// STATES
parameter S0 = 2'b00, // Highway GREEN
          S1 = 2'b01, // Highway YELLOW
          S2 = 2'b10, // Side GREEN
          S3 = 2'b11; // Side YELLOW

// STATE TRANSITION LOGIC
always @(posedge clk or posedge rst) begin
    // RESET
    if(rst) begin
        state <= S0;
        count <= 0;
    end
    // EMERGENCY CONDITION
    else if(emergency) begin
        state <= S0;
        count <= 0;
    end
    // NORMAL OPERATION
    else begin
        count <= count + 1;
        case(state)
            // HIGHWAY GREEN
            S0: begin
                if(count == 4) begin
                    state <= S1;
                    count <= 0;
                end
            end
            // HIGHWAY YELLOW
            S1: begin
                if(count == 2) begin
                    state <= S2;
                    count <= 0;
                end
            end
            // SIDE ROAD GREEN
            S2: begin
                if(count == 4) begin
                    state <= S3;
                    count <= 0;
                end
            end
            // SIDE ROAD YELLOW
            S3: begin
                if(count == 2) begin
                    state <= S0;
                    count <= 0;
                end
            end
            default: begin
                state <= S0;
                count <= 0;
            end
        endcase
    end
end

always @(*) begin
    case(state)
        // S0 : HIGHWAY GREEN
        S0: begin
            highway   = GREEN;
            side_road = RED;
        end
        // S1 : HIGHWAY YELLOW
        S1: begin
            highway   = YELLOW;
            side_road = RED;
        end
        // S2 : SIDE ROAD GREEN
        S2: begin
            highway   = RED;
            side_road = GREEN;
        end
        // S3 : SIDE ROAD YELLOW
        S3: begin
            highway   = RED;
            side_road = YELLOW;
        end
        default: begin
            highway   = RED;
            side_road = RED;
        end
    endcase
end

endmodule
