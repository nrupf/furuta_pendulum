// Generator : SpinalHDL v1.4.0    git head : ecb5a80b713566f417ea3ea061f9969e73770a7f
// Date      : 30/04/2021, 00:07:19
// Component : System


`define SdramCtrlBackendTask_defaultEncoding_type [2:0]
`define SdramCtrlBackendTask_defaultEncoding_MODE 3'b000
`define SdramCtrlBackendTask_defaultEncoding_PRECHARGE_ALL 3'b001
`define SdramCtrlBackendTask_defaultEncoding_PRECHARGE_SINGLE 3'b010
`define SdramCtrlBackendTask_defaultEncoding_REFRESH 3'b011
`define SdramCtrlBackendTask_defaultEncoding_ACTIVE 3'b100
`define SdramCtrlBackendTask_defaultEncoding_READ 3'b101
`define SdramCtrlBackendTask_defaultEncoding_WRITE 3'b110

`define SdramCtrlFrontendState_defaultEncoding_type [1:0]
`define SdramCtrlFrontendState_defaultEncoding_BOOT_PRECHARGE 2'b00
`define SdramCtrlFrontendState_defaultEncoding_BOOT_REFRESH 2'b01
`define SdramCtrlFrontendState_defaultEncoding_BOOT_MODE 2'b10
`define SdramCtrlFrontendState_defaultEncoding_RUN 2'b11

`define Axi4ToApb3BridgePhase_defaultEncoding_type [1:0]
`define Axi4ToApb3BridgePhase_defaultEncoding_SETUP 2'b00
`define Axi4ToApb3BridgePhase_defaultEncoding_ACCESS_1 2'b01
`define Axi4ToApb3BridgePhase_defaultEncoding_RESPONSE 2'b10

`define UartStopType_defaultEncoding_type [0:0]
`define UartStopType_defaultEncoding_ONE 1'b0
`define UartStopType_defaultEncoding_TWO 1'b1

`define UartParityType_defaultEncoding_type [1:0]
`define UartParityType_defaultEncoding_NONE 2'b00
`define UartParityType_defaultEncoding_EVEN 2'b01
`define UartParityType_defaultEncoding_ODD 2'b10

`define UartCtrlTxState_defaultEncoding_type [2:0]
`define UartCtrlTxState_defaultEncoding_IDLE 3'b000
`define UartCtrlTxState_defaultEncoding_START 3'b001
`define UartCtrlTxState_defaultEncoding_DATA 3'b010
`define UartCtrlTxState_defaultEncoding_PARITY 3'b011
`define UartCtrlTxState_defaultEncoding_STOP 3'b100

`define UartCtrlRxState_defaultEncoding_type [2:0]
`define UartCtrlRxState_defaultEncoding_IDLE 3'b000
`define UartCtrlRxState_defaultEncoding_START 3'b001
`define UartCtrlRxState_defaultEncoding_DATA 3'b010
`define UartCtrlRxState_defaultEncoding_PARITY 3'b011
`define UartCtrlRxState_defaultEncoding_STOP 3'b100

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define EnvCtrlEnum_defaultEncoding_type [0:0]
`define EnvCtrlEnum_defaultEncoding_NONE 1'b0
`define EnvCtrlEnum_defaultEncoding_XRET 1'b1

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11

`define JtagState_defaultEncoding_type [3:0]
`define JtagState_defaultEncoding_RESET 4'b0000
`define JtagState_defaultEncoding_IDLE 4'b0001
`define JtagState_defaultEncoding_IR_SELECT 4'b0010
`define JtagState_defaultEncoding_IR_CAPTURE 4'b0011
`define JtagState_defaultEncoding_IR_SHIFT 4'b0100
`define JtagState_defaultEncoding_IR_EXIT1 4'b0101
`define JtagState_defaultEncoding_IR_PAUSE 4'b0110
`define JtagState_defaultEncoding_IR_EXIT2 4'b0111
`define JtagState_defaultEncoding_IR_UPDATE 4'b1000
`define JtagState_defaultEncoding_DR_SELECT 4'b1001
`define JtagState_defaultEncoding_DR_CAPTURE 4'b1010
`define JtagState_defaultEncoding_DR_SHIFT 4'b1011
`define JtagState_defaultEncoding_DR_EXIT1 4'b1100
`define JtagState_defaultEncoding_DR_PAUSE 4'b1101
`define JtagState_defaultEncoding_DR_EXIT2 4'b1110
`define JtagState_defaultEncoding_DR_UPDATE 4'b1111


module BufferCC (
  input               io_initial,
  input               io_dataIn,
  output              io_dataOut,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  reg                 buffers_0;
  reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      buffers_0 <= io_initial;
      buffers_1 <= io_initial;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module StreamFifoLowLatency (
  input               io_push_valid,
  output              io_push_ready,
  input      [15:0]   io_push_payload_data,
  input      [3:0]    io_push_payload_context_id,
  input               io_push_payload_context_last,
  output reg          io_pop_valid,
  input               io_pop_ready,
  output reg [15:0]   io_pop_payload_data,
  output reg [3:0]    io_pop_payload_context_id,
  output reg          io_pop_payload_context_last,
  input               io_flush,
  output     [1:0]    io_occupancy,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  wire       [20:0]   _zz_4_;
  wire                _zz_5_;
  wire       [0:0]    _zz_6_;
  wire       [20:0]   _zz_7_;
  reg                 _zz_1_;
  reg                 pushPtr_willIncrement;
  reg                 pushPtr_willClear;
  reg        [0:0]    pushPtr_valueNext;
  reg        [0:0]    pushPtr_value;
  wire                pushPtr_willOverflowIfInc;
  wire                pushPtr_willOverflow;
  reg                 popPtr_willIncrement;
  reg                 popPtr_willClear;
  reg        [0:0]    popPtr_valueNext;
  reg        [0:0]    popPtr_value;
  wire                popPtr_willOverflowIfInc;
  wire                popPtr_willOverflow;
  wire                ptrMatch;
  reg                 risingOccupancy;
  wire                empty;
  wire                full;
  wire                pushing;
  wire                popping;
  wire       [20:0]   _zz_2_;
  wire       [4:0]    _zz_3_;
  wire       [0:0]    ptrDif;
  reg [20:0] ram [0:1];

  assign _zz_5_ = (! empty);
  assign _zz_6_ = _zz_3_[4 : 4];
  assign _zz_7_ = {{io_push_payload_context_last,io_push_payload_context_id},io_push_payload_data};
  assign _zz_4_ = ram[popPtr_value];
  always @ (posedge io_mainClk) begin
    if(_zz_1_) begin
      ram[pushPtr_value] <= _zz_7_;
    end
  end

  always @ (*) begin
    _zz_1_ = 1'b0;
    if(pushing)begin
      _zz_1_ = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing)begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willClear = 1'b0;
    if(io_flush)begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = (pushPtr_value == (1'b1));
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @ (*) begin
    pushPtr_valueNext = (pushPtr_value + pushPtr_willIncrement);
    if(pushPtr_willClear)begin
      pushPtr_valueNext = (1'b0);
    end
  end

  always @ (*) begin
    popPtr_willIncrement = 1'b0;
    if(popping)begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    popPtr_willClear = 1'b0;
    if(io_flush)begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = (popPtr_value == (1'b1));
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  always @ (*) begin
    popPtr_valueNext = (popPtr_value + popPtr_willIncrement);
    if(popPtr_willClear)begin
      popPtr_valueNext = (1'b0);
    end
  end

  assign ptrMatch = (pushPtr_value == popPtr_value);
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  always @ (*) begin
    if(_zz_5_)begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  assign _zz_2_ = _zz_4_;
  assign _zz_3_ = _zz_2_[20 : 16];
  always @ (*) begin
    if(_zz_5_)begin
      io_pop_payload_data = _zz_2_[15 : 0];
    end else begin
      io_pop_payload_data = io_push_payload_data;
    end
  end

  always @ (*) begin
    if(_zz_5_)begin
      io_pop_payload_context_id = _zz_3_[3 : 0];
    end else begin
      io_pop_payload_context_id = io_push_payload_context_id;
    end
  end

  always @ (*) begin
    if(_zz_5_)begin
      io_pop_payload_context_last = _zz_6_[0];
    end else begin
      io_pop_payload_context_last = io_push_payload_context_last;
    end
  end

  assign ptrDif = (pushPtr_value - popPtr_value);
  assign io_occupancy = {(risingOccupancy && ptrMatch),ptrDif};
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      pushPtr_value <= (1'b0);
      popPtr_value <= (1'b0);
      risingOccupancy <= 1'b0;
    end else begin
      pushPtr_value <= pushPtr_valueNext;
      popPtr_value <= popPtr_valueNext;
      if((pushing != popping))begin
        risingOccupancy <= pushing;
      end
      if(io_flush)begin
        risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module UartCtrlTx (
  input      [2:0]    io_configFrame_dataLength,
  input      `UartStopType_defaultEncoding_type io_configFrame_stop,
  input      `UartParityType_defaultEncoding_type io_configFrame_parity,
  input               io_samplingTick,
  input               io_write_valid,
  output reg          io_write_ready,
  input      [7:0]    io_write_payload,
  input               io_cts,
  output              io_txd,
  input               io_break,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  wire                _zz_2_;
  wire       [0:0]    _zz_3_;
  wire       [2:0]    _zz_4_;
  wire       [0:0]    _zz_5_;
  wire       [2:0]    _zz_6_;
  reg                 clockDivider_counter_willIncrement;
  wire                clockDivider_counter_willClear;
  reg        [2:0]    clockDivider_counter_valueNext;
  reg        [2:0]    clockDivider_counter_value;
  wire                clockDivider_counter_willOverflowIfInc;
  wire                clockDivider_counter_willOverflow;
  reg        [2:0]    tickCounter_value;
  reg        `UartCtrlTxState_defaultEncoding_type stateMachine_state;
  reg                 stateMachine_parity;
  reg                 stateMachine_txd;
  reg                 _zz_1_;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_2_ = (tickCounter_value == io_configFrame_dataLength);
  assign _zz_3_ = clockDivider_counter_willIncrement;
  assign _zz_4_ = {2'd0, _zz_3_};
  assign _zz_5_ = ((io_configFrame_stop == `UartStopType_defaultEncoding_ONE) ? (1'b0) : (1'b1));
  assign _zz_6_ = {2'd0, _zz_5_};
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      `UartStopType_defaultEncoding_ONE : io_configFrame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      `UartParityType_defaultEncoding_NONE : io_configFrame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_configFrame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : stateMachine_state_string = "IDLE  ";
      `UartCtrlTxState_defaultEncoding_START : stateMachine_state_string = "START ";
      `UartCtrlTxState_defaultEncoding_DATA : stateMachine_state_string = "DATA  ";
      `UartCtrlTxState_defaultEncoding_PARITY : stateMachine_state_string = "PARITY";
      `UartCtrlTxState_defaultEncoding_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @ (*) begin
    clockDivider_counter_willIncrement = 1'b0;
    if(io_samplingTick)begin
      clockDivider_counter_willIncrement = 1'b1;
    end
  end

  assign clockDivider_counter_willClear = 1'b0;
  assign clockDivider_counter_willOverflowIfInc = (clockDivider_counter_value == (3'b111));
  assign clockDivider_counter_willOverflow = (clockDivider_counter_willOverflowIfInc && clockDivider_counter_willIncrement);
  always @ (*) begin
    clockDivider_counter_valueNext = (clockDivider_counter_value + _zz_4_);
    if(clockDivider_counter_willClear)begin
      clockDivider_counter_valueNext = (3'b000);
    end
  end

  always @ (*) begin
    stateMachine_txd = 1'b1;
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
        stateMachine_txd = 1'b0;
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        stateMachine_txd = io_write_payload[tickCounter_value];
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
        stateMachine_txd = stateMachine_parity;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    io_write_ready = io_break;
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        if(clockDivider_counter_willOverflow)begin
          if(_zz_2_)begin
            io_write_ready = 1'b1;
          end
        end
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
      end
      default : begin
      end
    endcase
  end

  assign io_txd = _zz_1_;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      clockDivider_counter_value <= (3'b000);
      stateMachine_state <= `UartCtrlTxState_defaultEncoding_IDLE;
      _zz_1_ <= 1'b1;
    end else begin
      clockDivider_counter_value <= clockDivider_counter_valueNext;
      case(stateMachine_state)
        `UartCtrlTxState_defaultEncoding_IDLE : begin
          if(((io_write_valid && (! io_cts)) && clockDivider_counter_willOverflow))begin
            stateMachine_state <= `UartCtrlTxState_defaultEncoding_START;
          end
        end
        `UartCtrlTxState_defaultEncoding_START : begin
          if(clockDivider_counter_willOverflow)begin
            stateMachine_state <= `UartCtrlTxState_defaultEncoding_DATA;
          end
        end
        `UartCtrlTxState_defaultEncoding_DATA : begin
          if(clockDivider_counter_willOverflow)begin
            if(_zz_2_)begin
              if((io_configFrame_parity == `UartParityType_defaultEncoding_NONE))begin
                stateMachine_state <= `UartCtrlTxState_defaultEncoding_STOP;
              end else begin
                stateMachine_state <= `UartCtrlTxState_defaultEncoding_PARITY;
              end
            end
          end
        end
        `UartCtrlTxState_defaultEncoding_PARITY : begin
          if(clockDivider_counter_willOverflow)begin
            stateMachine_state <= `UartCtrlTxState_defaultEncoding_STOP;
          end
        end
        default : begin
          if(clockDivider_counter_willOverflow)begin
            if((tickCounter_value == _zz_6_))begin
              stateMachine_state <= (io_write_valid ? `UartCtrlTxState_defaultEncoding_START : `UartCtrlTxState_defaultEncoding_IDLE);
            end
          end
        end
      endcase
      _zz_1_ <= (stateMachine_txd && (! io_break));
    end
  end

  always @ (posedge io_mainClk) begin
    if(clockDivider_counter_willOverflow)begin
      tickCounter_value <= (tickCounter_value + (3'b001));
    end
    if(clockDivider_counter_willOverflow)begin
      stateMachine_parity <= (stateMachine_parity ^ stateMachine_txd);
    end
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
        if(clockDivider_counter_willOverflow)begin
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_defaultEncoding_ODD);
          tickCounter_value <= (3'b000);
        end
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        if(clockDivider_counter_willOverflow)begin
          if(_zz_2_)begin
            tickCounter_value <= (3'b000);
          end
        end
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
        if(clockDivider_counter_willOverflow)begin
          tickCounter_value <= (3'b000);
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module UartCtrlRx (
  input      [2:0]    io_configFrame_dataLength,
  input      `UartStopType_defaultEncoding_type io_configFrame_stop,
  input      `UartParityType_defaultEncoding_type io_configFrame_parity,
  input               io_samplingTick,
  output              io_read_valid,
  input               io_read_ready,
  output     [7:0]    io_read_payload,
  input               io_rxd,
  output              io_rts,
  output reg          io_error,
  output              io_break,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  wire                _zz_2_;
  wire                io_rxd_buffercc_io_dataOut;
  wire                _zz_3_;
  wire                _zz_4_;
  wire                _zz_5_;
  wire                _zz_6_;
  wire       [0:0]    _zz_7_;
  wire       [2:0]    _zz_8_;
  wire                _zz_9_;
  wire                _zz_10_;
  wire                _zz_11_;
  wire                _zz_12_;
  wire                _zz_13_;
  wire                _zz_14_;
  wire                _zz_15_;
  reg                 _zz_1_;
  wire                sampler_synchroniser;
  wire                sampler_samples_0;
  reg                 sampler_samples_1;
  reg                 sampler_samples_2;
  reg                 sampler_samples_3;
  reg                 sampler_samples_4;
  reg                 sampler_value;
  reg                 sampler_tick;
  reg        [2:0]    bitTimer_counter;
  reg                 bitTimer_tick;
  reg        [2:0]    bitCounter_value;
  reg        [6:0]    break_counter;
  wire                break_valid;
  reg        `UartCtrlRxState_defaultEncoding_type stateMachine_state;
  reg                 stateMachine_parity;
  reg        [7:0]    stateMachine_shifter;
  reg                 stateMachine_validReg;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_3_ = (stateMachine_parity == sampler_value);
  assign _zz_4_ = (! sampler_value);
  assign _zz_5_ = ((sampler_tick && (! sampler_value)) && (! break_valid));
  assign _zz_6_ = (bitCounter_value == io_configFrame_dataLength);
  assign _zz_7_ = ((io_configFrame_stop == `UartStopType_defaultEncoding_ONE) ? (1'b0) : (1'b1));
  assign _zz_8_ = {2'd0, _zz_7_};
  assign _zz_9_ = ((((1'b0 || ((_zz_14_ && sampler_samples_1) && sampler_samples_2)) || (((_zz_15_ && sampler_samples_0) && sampler_samples_1) && sampler_samples_3)) || (((1'b1 && sampler_samples_0) && sampler_samples_2) && sampler_samples_3)) || (((1'b1 && sampler_samples_1) && sampler_samples_2) && sampler_samples_3));
  assign _zz_10_ = (((1'b1 && sampler_samples_0) && sampler_samples_1) && sampler_samples_4);
  assign _zz_11_ = ((1'b1 && sampler_samples_0) && sampler_samples_2);
  assign _zz_12_ = (1'b1 && sampler_samples_1);
  assign _zz_13_ = 1'b1;
  assign _zz_14_ = (1'b1 && sampler_samples_0);
  assign _zz_15_ = 1'b1;
  BufferCC io_rxd_buffercc ( 
    .io_initial            (_zz_2_                      ), //i
    .io_dataIn             (io_rxd                      ), //i
    .io_dataOut            (io_rxd_buffercc_io_dataOut  ), //o
    .io_mainClk            (io_mainClk                  ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset          )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      `UartStopType_defaultEncoding_ONE : io_configFrame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      `UartParityType_defaultEncoding_NONE : io_configFrame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_configFrame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : stateMachine_state_string = "IDLE  ";
      `UartCtrlRxState_defaultEncoding_START : stateMachine_state_string = "START ";
      `UartCtrlRxState_defaultEncoding_DATA : stateMachine_state_string = "DATA  ";
      `UartCtrlRxState_defaultEncoding_PARITY : stateMachine_state_string = "PARITY";
      `UartCtrlRxState_defaultEncoding_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @ (*) begin
    io_error = 1'b0;
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlRxState_defaultEncoding_START : begin
      end
      `UartCtrlRxState_defaultEncoding_DATA : begin
      end
      `UartCtrlRxState_defaultEncoding_PARITY : begin
        if(bitTimer_tick)begin
          if(! _zz_3_) begin
            io_error = 1'b1;
          end
        end
      end
      default : begin
        if(bitTimer_tick)begin
          if(_zz_4_)begin
            io_error = 1'b1;
          end
        end
      end
    endcase
  end

  assign io_rts = _zz_1_;
  assign _zz_2_ = 1'b0;
  assign sampler_synchroniser = io_rxd_buffercc_io_dataOut;
  assign sampler_samples_0 = sampler_synchroniser;
  always @ (*) begin
    bitTimer_tick = 1'b0;
    if(sampler_tick)begin
      if((bitTimer_counter == (3'b000)))begin
        bitTimer_tick = 1'b1;
      end
    end
  end

  assign break_valid = (break_counter == 7'h68);
  assign io_break = break_valid;
  assign io_read_valid = stateMachine_validReg;
  assign io_read_payload = stateMachine_shifter;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      _zz_1_ <= 1'b0;
      sampler_samples_1 <= 1'b1;
      sampler_samples_2 <= 1'b1;
      sampler_samples_3 <= 1'b1;
      sampler_samples_4 <= 1'b1;
      sampler_value <= 1'b1;
      sampler_tick <= 1'b0;
      break_counter <= 7'h0;
      stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
      stateMachine_validReg <= 1'b0;
    end else begin
      _zz_1_ <= (! io_read_ready);
      if(io_samplingTick)begin
        sampler_samples_1 <= sampler_samples_0;
      end
      if(io_samplingTick)begin
        sampler_samples_2 <= sampler_samples_1;
      end
      if(io_samplingTick)begin
        sampler_samples_3 <= sampler_samples_2;
      end
      if(io_samplingTick)begin
        sampler_samples_4 <= sampler_samples_3;
      end
      sampler_value <= ((((((_zz_9_ || _zz_10_) || (_zz_11_ && sampler_samples_4)) || ((_zz_12_ && sampler_samples_2) && sampler_samples_4)) || (((_zz_13_ && sampler_samples_0) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_1) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_2) && sampler_samples_3) && sampler_samples_4));
      sampler_tick <= io_samplingTick;
      if(sampler_value)begin
        break_counter <= 7'h0;
      end else begin
        if((io_samplingTick && (! break_valid)))begin
          break_counter <= (break_counter + 7'h01);
        end
      end
      stateMachine_validReg <= 1'b0;
      case(stateMachine_state)
        `UartCtrlRxState_defaultEncoding_IDLE : begin
          if(_zz_5_)begin
            stateMachine_state <= `UartCtrlRxState_defaultEncoding_START;
          end
        end
        `UartCtrlRxState_defaultEncoding_START : begin
          if(bitTimer_tick)begin
            stateMachine_state <= `UartCtrlRxState_defaultEncoding_DATA;
            if((sampler_value == 1'b1))begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
            end
          end
        end
        `UartCtrlRxState_defaultEncoding_DATA : begin
          if(bitTimer_tick)begin
            if(_zz_6_)begin
              if((io_configFrame_parity == `UartParityType_defaultEncoding_NONE))begin
                stateMachine_state <= `UartCtrlRxState_defaultEncoding_STOP;
                stateMachine_validReg <= 1'b1;
              end else begin
                stateMachine_state <= `UartCtrlRxState_defaultEncoding_PARITY;
              end
            end
          end
        end
        `UartCtrlRxState_defaultEncoding_PARITY : begin
          if(bitTimer_tick)begin
            if(_zz_3_)begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_STOP;
              stateMachine_validReg <= 1'b1;
            end else begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
            end
          end
        end
        default : begin
          if(bitTimer_tick)begin
            if(_zz_4_)begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
            end else begin
              if((bitCounter_value == _zz_8_))begin
                stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
              end
            end
          end
        end
      endcase
    end
  end

  always @ (posedge io_mainClk) begin
    if(sampler_tick)begin
      bitTimer_counter <= (bitTimer_counter - (3'b001));
    end
    if(bitTimer_tick)begin
      bitCounter_value <= (bitCounter_value + (3'b001));
    end
    if(bitTimer_tick)begin
      stateMachine_parity <= (stateMachine_parity ^ sampler_value);
    end
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : begin
        if(_zz_5_)begin
          bitTimer_counter <= (3'b010);
        end
      end
      `UartCtrlRxState_defaultEncoding_START : begin
        if(bitTimer_tick)begin
          bitCounter_value <= (3'b000);
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_defaultEncoding_ODD);
        end
      end
      `UartCtrlRxState_defaultEncoding_DATA : begin
        if(bitTimer_tick)begin
          stateMachine_shifter[bitCounter_value] <= sampler_value;
          if(_zz_6_)begin
            bitCounter_value <= (3'b000);
          end
        end
      end
      `UartCtrlRxState_defaultEncoding_PARITY : begin
        if(bitTimer_tick)begin
          bitCounter_value <= (3'b000);
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module BufferCC_1_ (
  input               io_dataIn,
  output              io_dataOut,
  input               io_mainClk,
  input               resetCtrl_systemReset 
);
  reg                 buffers_0;
  reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @ (posedge io_mainClk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module SdramCtrl (
  input               io_bus_cmd_valid,
  output reg          io_bus_cmd_ready,
  input      [24:0]   io_bus_cmd_payload_address,
  input               io_bus_cmd_payload_write,
  input      [15:0]   io_bus_cmd_payload_data,
  input      [1:0]    io_bus_cmd_payload_mask,
  input      [3:0]    io_bus_cmd_payload_context_id,
  input               io_bus_cmd_payload_context_last,
  output              io_bus_rsp_valid,
  input               io_bus_rsp_ready,
  output     [15:0]   io_bus_rsp_payload_data,
  output     [3:0]    io_bus_rsp_payload_context_id,
  output              io_bus_rsp_payload_context_last,
  output     [12:0]   io_sdram_ADDR,
  output     [1:0]    io_sdram_BA,
  input      [15:0]   io_sdram_DQ_read,
  output     [15:0]   io_sdram_DQ_write,
  output     [15:0]   io_sdram_DQ_writeEnable,
  output     [1:0]    io_sdram_DQM,
  output              io_sdram_CASn,
  output              io_sdram_CKE,
  output              io_sdram_CSn,
  output              io_sdram_RASn,
  output              io_sdram_WEn,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  wire                _zz_18_;
  reg                 _zz_19_;
  reg        [12:0]   _zz_20_;
  reg                 _zz_21_;
  reg                 _zz_22_;
  wire                chip_backupIn_fifo_io_push_ready;
  wire                chip_backupIn_fifo_io_pop_valid;
  wire       [15:0]   chip_backupIn_fifo_io_pop_payload_data;
  wire       [3:0]    chip_backupIn_fifo_io_pop_payload_context_id;
  wire                chip_backupIn_fifo_io_pop_payload_context_last;
  wire       [1:0]    chip_backupIn_fifo_io_occupancy;
  wire                _zz_23_;
  wire                _zz_24_;
  wire                _zz_25_;
  wire       [0:0]    _zz_26_;
  wire       [8:0]    _zz_27_;
  wire       [0:0]    _zz_28_;
  wire       [2:0]    _zz_29_;
  wire                refresh_counter_willIncrement;
  wire                refresh_counter_willClear;
  reg        [8:0]    refresh_counter_valueNext;
  reg        [8:0]    refresh_counter_value;
  wire                refresh_counter_willOverflowIfInc;
  wire                refresh_counter_willOverflow;
  reg                 refresh_pending;
  reg        [12:0]   powerup_counter;
  reg                 powerup_done;
  wire       [12:0]   _zz_1_;
  reg                 frontend_banks_0_active;
  reg        [12:0]   frontend_banks_0_row;
  reg                 frontend_banks_1_active;
  reg        [12:0]   frontend_banks_1_row;
  reg                 frontend_banks_2_active;
  reg        [12:0]   frontend_banks_2_row;
  reg                 frontend_banks_3_active;
  reg        [12:0]   frontend_banks_3_row;
  wire       [9:0]    frontend_address_column;
  wire       [1:0]    frontend_address_bank;
  wire       [12:0]   frontend_address_row;
  wire       [24:0]   _zz_2_;
  reg                 frontend_rsp_valid;
  wire                frontend_rsp_ready;
  reg        `SdramCtrlBackendTask_defaultEncoding_type frontend_rsp_payload_task;
  wire       [1:0]    frontend_rsp_payload_bank;
  reg        [12:0]   frontend_rsp_payload_rowColumn;
  wire       [15:0]   frontend_rsp_payload_data;
  wire       [1:0]    frontend_rsp_payload_mask;
  wire       [3:0]    frontend_rsp_payload_context_id;
  wire                frontend_rsp_payload_context_last;
  reg        `SdramCtrlFrontendState_defaultEncoding_type frontend_state;
  reg                 frontend_bootRefreshCounter_willIncrement;
  wire                frontend_bootRefreshCounter_willClear;
  reg        [2:0]    frontend_bootRefreshCounter_valueNext;
  reg        [2:0]    frontend_bootRefreshCounter_value;
  wire                frontend_bootRefreshCounter_willOverflowIfInc;
  wire                frontend_bootRefreshCounter_willOverflow;
  wire                _zz_3_;
  wire       [3:0]    _zz_4_;
  wire                _zz_5_;
  wire                _zz_6_;
  wire                _zz_7_;
  wire                _zz_8_;
  wire                bubbleInserter_cmd_valid;
  wire                bubbleInserter_cmd_ready;
  wire       `SdramCtrlBackendTask_defaultEncoding_type bubbleInserter_cmd_payload_task;
  wire       [1:0]    bubbleInserter_cmd_payload_bank;
  wire       [12:0]   bubbleInserter_cmd_payload_rowColumn;
  wire       [15:0]   bubbleInserter_cmd_payload_data;
  wire       [1:0]    bubbleInserter_cmd_payload_mask;
  wire       [3:0]    bubbleInserter_cmd_payload_context_id;
  wire                bubbleInserter_cmd_payload_context_last;
  reg                 frontend_rsp_m2sPipe_rValid;
  reg        `SdramCtrlBackendTask_defaultEncoding_type frontend_rsp_m2sPipe_rData_task;
  reg        [1:0]    frontend_rsp_m2sPipe_rData_bank;
  reg        [12:0]   frontend_rsp_m2sPipe_rData_rowColumn;
  reg        [15:0]   frontend_rsp_m2sPipe_rData_data;
  reg        [1:0]    frontend_rsp_m2sPipe_rData_mask;
  reg        [3:0]    frontend_rsp_m2sPipe_rData_context_id;
  reg                 frontend_rsp_m2sPipe_rData_context_last;
  wire                bubbleInserter_rsp_valid;
  wire                bubbleInserter_rsp_ready;
  wire       `SdramCtrlBackendTask_defaultEncoding_type bubbleInserter_rsp_payload_task;
  wire       [1:0]    bubbleInserter_rsp_payload_bank;
  wire       [12:0]   bubbleInserter_rsp_payload_rowColumn;
  wire       [15:0]   bubbleInserter_rsp_payload_data;
  wire       [1:0]    bubbleInserter_rsp_payload_mask;
  wire       [3:0]    bubbleInserter_rsp_payload_context_id;
  wire                bubbleInserter_rsp_payload_context_last;
  reg                 bubbleInserter_insertBubble;
  wire                _zz_9_;
  wire       `SdramCtrlBackendTask_defaultEncoding_type _zz_10_;
  wire                bubbleInserter_timings_read_busy;
  reg        [2:0]    bubbleInserter_timings_write_counter;
  wire                bubbleInserter_timings_write_busy;
  reg        [1:0]    bubbleInserter_timings_banks_0_precharge_counter;
  wire                bubbleInserter_timings_banks_0_precharge_busy;
  reg        [1:0]    bubbleInserter_timings_banks_0_active_counter;
  wire                bubbleInserter_timings_banks_0_active_busy;
  reg        [1:0]    bubbleInserter_timings_banks_1_precharge_counter;
  wire                bubbleInserter_timings_banks_1_precharge_busy;
  reg        [1:0]    bubbleInserter_timings_banks_1_active_counter;
  wire                bubbleInserter_timings_banks_1_active_busy;
  reg        [1:0]    bubbleInserter_timings_banks_2_precharge_counter;
  wire                bubbleInserter_timings_banks_2_precharge_busy;
  reg        [1:0]    bubbleInserter_timings_banks_2_active_counter;
  wire                bubbleInserter_timings_banks_2_active_busy;
  reg        [1:0]    bubbleInserter_timings_banks_3_precharge_counter;
  wire                bubbleInserter_timings_banks_3_precharge_busy;
  reg        [1:0]    bubbleInserter_timings_banks_3_active_counter;
  wire                bubbleInserter_timings_banks_3_active_busy;
  wire                chip_cmd_valid;
  wire                chip_cmd_ready;
  wire       `SdramCtrlBackendTask_defaultEncoding_type chip_cmd_payload_task;
  wire       [1:0]    chip_cmd_payload_bank;
  wire       [12:0]   chip_cmd_payload_rowColumn;
  wire       [15:0]   chip_cmd_payload_data;
  wire       [1:0]    chip_cmd_payload_mask;
  wire       [3:0]    chip_cmd_payload_context_id;
  wire                chip_cmd_payload_context_last;
  reg        [12:0]   chip_sdram_ADDR;
  reg        [1:0]    chip_sdram_BA;
  reg        [15:0]   chip_sdram_DQ_read;
  reg        [15:0]   chip_sdram_DQ_write;
  reg        [15:0]   chip_sdram_DQ_writeEnable;
  reg        [1:0]    chip_sdram_DQM;
  reg                 chip_sdram_CASn;
  reg                 chip_sdram_CKE;
  reg                 chip_sdram_CSn;
  reg                 chip_sdram_RASn;
  reg                 chip_sdram_WEn;
  wire                chip_remoteCke;
  wire                chip_readHistory_0;
  wire                chip_readHistory_1;
  wire                chip_readHistory_2;
  wire                chip_readHistory_3;
  wire                chip_readHistory_4;
  wire                chip_readHistory_5;
  wire                _zz_11_;
  reg                 _zz_12_;
  reg                 _zz_13_;
  reg                 _zz_14_;
  reg                 _zz_15_;
  reg                 _zz_16_;
  reg        [3:0]    chip_cmd_payload_context_delay_1_id;
  reg                 chip_cmd_payload_context_delay_1_last;
  reg        [3:0]    chip_cmd_payload_context_delay_2_id;
  reg                 chip_cmd_payload_context_delay_2_last;
  reg        [3:0]    chip_cmd_payload_context_delay_3_id;
  reg                 chip_cmd_payload_context_delay_3_last;
  reg        [3:0]    chip_cmd_payload_context_delay_4_id;
  reg                 chip_cmd_payload_context_delay_4_last;
  reg        [3:0]    chip_contextDelayed_id;
  reg                 chip_contextDelayed_last;
  wire                chip_sdramCkeNext;
  reg                 chip_sdramCkeInternal;
  reg                 chip_sdramCkeInternal_regNext;
  wire                _zz_17_;
  wire                chip_backupIn_valid;
  wire                chip_backupIn_ready;
  wire       [15:0]   chip_backupIn_payload_data;
  wire       [3:0]    chip_backupIn_payload_context_id;
  wire                chip_backupIn_payload_context_last;
  `ifndef SYNTHESIS
  reg [127:0] frontend_rsp_payload_task_string;
  reg [111:0] frontend_state_string;
  reg [127:0] bubbleInserter_cmd_payload_task_string;
  reg [127:0] frontend_rsp_m2sPipe_rData_task_string;
  reg [127:0] bubbleInserter_rsp_payload_task_string;
  reg [127:0] _zz_10__string;
  reg [127:0] chip_cmd_payload_task_string;
  `endif


  assign _zz_23_ = (((frontend_banks_0_active || frontend_banks_1_active) || frontend_banks_2_active) || frontend_banks_3_active);
  assign _zz_24_ = (_zz_3_ && (_zz_20_ != frontend_address_row));
  assign _zz_25_ = (! _zz_3_);
  assign _zz_26_ = refresh_counter_willIncrement;
  assign _zz_27_ = {8'd0, _zz_26_};
  assign _zz_28_ = frontend_bootRefreshCounter_willIncrement;
  assign _zz_29_ = {2'd0, _zz_28_};
  StreamFifoLowLatency chip_backupIn_fifo ( 
    .io_push_valid                   (chip_backupIn_valid                                ), //i
    .io_push_ready                   (chip_backupIn_fifo_io_push_ready                   ), //o
    .io_push_payload_data            (chip_backupIn_payload_data[15:0]                   ), //i
    .io_push_payload_context_id      (chip_backupIn_payload_context_id[3:0]              ), //i
    .io_push_payload_context_last    (chip_backupIn_payload_context_last                 ), //i
    .io_pop_valid                    (chip_backupIn_fifo_io_pop_valid                    ), //o
    .io_pop_ready                    (io_bus_rsp_ready                                   ), //i
    .io_pop_payload_data             (chip_backupIn_fifo_io_pop_payload_data[15:0]       ), //o
    .io_pop_payload_context_id       (chip_backupIn_fifo_io_pop_payload_context_id[3:0]  ), //o
    .io_pop_payload_context_last     (chip_backupIn_fifo_io_pop_payload_context_last     ), //o
    .io_flush                        (_zz_18_                                            ), //i
    .io_occupancy                    (chip_backupIn_fifo_io_occupancy[1:0]               ), //o
    .io_mainClk                      (io_mainClk                                         ), //i
    .resetCtrl_axiReset              (resetCtrl_axiReset                                 )  //i
  );
  always @(*) begin
    case(frontend_address_bank)
      2'b00 : begin
        _zz_19_ = frontend_banks_0_active;
        _zz_20_ = frontend_banks_0_row;
      end
      2'b01 : begin
        _zz_19_ = frontend_banks_1_active;
        _zz_20_ = frontend_banks_1_row;
      end
      2'b10 : begin
        _zz_19_ = frontend_banks_2_active;
        _zz_20_ = frontend_banks_2_row;
      end
      default : begin
        _zz_19_ = frontend_banks_3_active;
        _zz_20_ = frontend_banks_3_row;
      end
    endcase
  end

  always @(*) begin
    case(bubbleInserter_cmd_payload_bank)
      2'b00 : begin
        _zz_21_ = bubbleInserter_timings_banks_0_precharge_busy;
        _zz_22_ = bubbleInserter_timings_banks_0_active_busy;
      end
      2'b01 : begin
        _zz_21_ = bubbleInserter_timings_banks_1_precharge_busy;
        _zz_22_ = bubbleInserter_timings_banks_1_active_busy;
      end
      2'b10 : begin
        _zz_21_ = bubbleInserter_timings_banks_2_precharge_busy;
        _zz_22_ = bubbleInserter_timings_banks_2_active_busy;
      end
      default : begin
        _zz_21_ = bubbleInserter_timings_banks_3_precharge_busy;
        _zz_22_ = bubbleInserter_timings_banks_3_active_busy;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(frontend_rsp_payload_task)
      `SdramCtrlBackendTask_defaultEncoding_MODE : frontend_rsp_payload_task_string = "MODE            ";
      `SdramCtrlBackendTask_defaultEncoding_PRECHARGE_ALL : frontend_rsp_payload_task_string = "PRECHARGE_ALL   ";
      `SdramCtrlBackendTask_defaultEncoding_PRECHARGE_SINGLE : frontend_rsp_payload_task_string = "PRECHARGE_SINGLE";
      `SdramCtrlBackendTask_defaultEncoding_REFRESH : frontend_rsp_payload_task_string = "REFRESH         ";
      `SdramCtrlBackendTask_defaultEncoding_ACTIVE : frontend_rsp_payload_task_string = "ACTIVE          ";
      `SdramCtrlBackendTask_defaultEncoding_READ : frontend_rsp_payload_task_string = "READ            ";
      `SdramCtrlBackendTask_defaultEncoding_WRITE : frontend_rsp_payload_task_string = "WRITE           ";
      default : frontend_rsp_payload_task_string = "????????????????";
    endcase
  end
  always @(*) begin
    case(frontend_state)
      `SdramCtrlFrontendState_defaultEncoding_BOOT_PRECHARGE : frontend_state_string = "BOOT_PRECHARGE";
      `SdramCtrlFrontendState_defaultEncoding_BOOT_REFRESH : frontend_state_string = "BOOT_REFRESH  ";
      `SdramCtrlFrontendState_defaultEncoding_BOOT_MODE : frontend_state_string = "BOOT_MODE     ";
      `SdramCtrlFrontendState_defaultEncoding_RUN : frontend_state_string = "RUN           ";
      default : frontend_state_string = "??????????????";
    endcase
  end
  always @(*) begin
    case(bubbleInserter_cmd_payload_task)
      `SdramCtrlBackendTask_defaultEncoding_MODE : bubbleInserter_cmd_payload_task_string = "MODE            ";
      `SdramCtrlBackendTask_defaultEncoding_PRECHARGE_ALL : bubbleInserter_cmd_payload_task_string = "PRECHARGE_ALL   ";
      `SdramCtrlBackendTask_defaultEncoding_PRECHARGE_SINGLE : bubbleInserter_cmd_payload_task_string = "PRECHARGE_SINGLE";
      `SdramCtrlBackendTask_defaultEncoding_REFRESH : bubbleInserter_cmd_payload_task_string = "REFRESH         ";
      `SdramCtrlBackendTask_defaultEncoding_ACTIVE : bubbleInserter_cmd_payload_task_string = "ACTIVE          ";
      `SdramCtrlBackendTask_defaultEncoding_READ : bubbleInserter_cmd_payload_task_string = "READ            ";
      `SdramCtrlBackendTask_defaultEncoding_WRITE : bubbleInserter_cmd_payload_task_string = "WRITE           ";
      default : bubbleInserter_cmd_payload_task_string = "????????????????";
    endcase
  end
  always @(*) begin
    case(frontend_rsp_m2sPipe_rData_task)
      `SdramCtrlBackendTask_defaultEncoding_MODE : frontend_rsp_m2sPipe_rData_task_string = "MODE            ";
      `SdramCtrlBackendTask_defaultEncoding_PRECHARGE_ALL : frontend_rsp_m2sPipe_rData_task_string = "PRECHARGE_ALL   ";
      `SdramCtrlBackendTask_defaultEncoding_PRECHARGE_SINGLE : frontend_rsp_m2sPipe_rData_task_string = "PRECHARGE_SINGLE";
      `SdramCtrlBackendTask_defaultEncoding_REFRESH : frontend_rsp_m2sPipe_rData_task_string = "REFRESH         ";
      `SdramCtrlBackendTask_defaultEncoding_ACTIVE : frontend_rsp_m2sPipe_rData_task_string = "ACTIVE          ";
      `SdramCtrlBackendTask_defaultEncoding_READ : frontend_rsp_m2sPipe_rData_task_string = "READ            ";
      `SdramCtrlBackendTask_defaultEncoding_WRITE : frontend_rsp_m2sPipe_rData_task_string = "WRITE           ";
      default : frontend_rsp_m2sPipe_rData_task_string = "????????????????";
    endcase
  end
  always @(*) begin
    case(bubbleInserter_rsp_payload_task)
      `SdramCtrlBackendTask_defaultEncoding_MODE : bubbleInserter_rsp_payload_task_string = "MODE            ";
      `SdramCtrlBackendTask_defaultEncoding_PRECHARGE_ALL : bubbleInserter_rsp_payload_task_string = "PRECHARGE_ALL   ";
      `SdramCtrlBackendTask_defaultEncoding_PRECHARGE_SINGLE : bubbleInserter_rsp_payload_task_string = "PRECHARGE_SINGLE";
      `SdramCtrlBackendTask_defaultEncoding_REFRESH : bubbleInserter_rsp_payload_task_string = "REFRESH         ";
      `SdramCtrlBackendTask_defaultEncoding_ACTIVE : bubbleInserter_rsp_payload_task_string = "ACTIVE          ";
      `SdramCtrlBackendTask_defaultEncoding_READ : bubbleInserter_rsp_payload_task_string = "READ            ";
      `SdramCtrlBackendTask_defaultEncoding_WRITE : bubbleInserter_rsp_payload_task_string = "WRITE           ";
      default : bubbleInserter_rsp_payload_task_string = "????????????????";
    endcase
  end
  always @(*) begin
    case(_zz_10_)
      `SdramCtrlBackendTask_defaultEncoding_MODE : _zz_10__string = "MODE            ";
      `SdramCtrlBackendTask_defaultEncoding_PRECHARGE_ALL : _zz_10__string = "PRECHARGE_ALL   ";
      `SdramCtrlBackendTask_defaultEncoding_PRECHARGE_SINGLE : _zz_10__string = "PRECHARGE_SINGLE";
      `SdramCtrlBackendTask_defaultEncoding_REFRESH : _zz_10__string = "REFRESH         ";
      `SdramCtrlBackendTask_defaultEncoding_ACTIVE : _zz_10__string = "ACTIVE          ";
      `SdramCtrlBackendTask_defaultEncoding_READ : _zz_10__string = "READ            ";
      `SdramCtrlBackendTask_defaultEncoding_WRITE : _zz_10__string = "WRITE           ";
      default : _zz_10__string = "????????????????";
    endcase
  end
  always @(*) begin
    case(chip_cmd_payload_task)
      `SdramCtrlBackendTask_defaultEncoding_MODE : chip_cmd_payload_task_string = "MODE            ";
      `SdramCtrlBackendTask_defaultEncoding_PRECHARGE_ALL : chip_cmd_payload_task_string = "PRECHARGE_ALL   ";
      `SdramCtrlBackendTask_defaultEncoding_PRECHARGE_SINGLE : chip_cmd_payload_task_string = "PRECHARGE_SINGLE";
      `SdramCtrlBackendTask_defaultEncoding_REFRESH : chip_cmd_payload_task_string = "REFRESH         ";
      `SdramCtrlBackendTask_defaultEncoding_ACTIVE : chip_cmd_payload_task_string = "ACTIVE          ";
      `SdramCtrlBackendTask_defaultEncoding_READ : chip_cmd_payload_task_string = "READ            ";
      `SdramCtrlBackendTask_defaultEncoding_WRITE : chip_cmd_payload_task_string = "WRITE           ";
      default : chip_cmd_payload_task_string = "????????????????";
    endcase
  end
  `endif

  assign refresh_counter_willClear = 1'b0;
  assign refresh_counter_willOverflowIfInc = (refresh_counter_value == 9'h186);
  assign refresh_counter_willOverflow = (refresh_counter_willOverflowIfInc && refresh_counter_willIncrement);
  always @ (*) begin
    if(refresh_counter_willOverflow)begin
      refresh_counter_valueNext = 9'h0;
    end else begin
      refresh_counter_valueNext = (refresh_counter_value + _zz_27_);
    end
    if(refresh_counter_willClear)begin
      refresh_counter_valueNext = 9'h0;
    end
  end

  assign refresh_counter_willIncrement = 1'b1;
  assign _zz_1_[12 : 0] = 13'h1fff;
  assign _zz_2_ = io_bus_cmd_payload_address;
  assign frontend_address_column = _zz_2_[9 : 0];
  assign frontend_address_bank = _zz_2_[11 : 10];
  assign frontend_address_row = _zz_2_[24 : 12];
  always @ (*) begin
    frontend_rsp_valid = 1'b0;
    case(frontend_state)
      `SdramCtrlFrontendState_defaultEncoding_BOOT_PRECHARGE : begin
        if(powerup_done)begin
          frontend_rsp_valid = 1'b1;
        end
      end
      `SdramCtrlFrontendState_defaultEncoding_BOOT_REFRESH : begin
        frontend_rsp_valid = 1'b1;
      end
      `SdramCtrlFrontendState_defaultEncoding_BOOT_MODE : begin
        frontend_rsp_valid = 1'b1;
      end
      default : begin
        if(refresh_pending)begin
          frontend_rsp_valid = 1'b1;
        end else begin
          if(io_bus_cmd_valid)begin
            frontend_rsp_valid = 1'b1;
          end
        end
      end
    endcase
  end

  always @ (*) begin
    frontend_rsp_payload_task = `SdramCtrlBackendTask_defaultEncoding_REFRESH;
    case(frontend_state)
      `SdramCtrlFrontendState_defaultEncoding_BOOT_PRECHARGE : begin
        frontend_rsp_payload_task = `SdramCtrlBackendTask_defaultEncoding_PRECHARGE_ALL;
      end
      `SdramCtrlFrontendState_defaultEncoding_BOOT_REFRESH : begin
        frontend_rsp_payload_task = `SdramCtrlBackendTask_defaultEncoding_REFRESH;
      end
      `SdramCtrlFrontendState_defaultEncoding_BOOT_MODE : begin
        frontend_rsp_payload_task = `SdramCtrlBackendTask_defaultEncoding_MODE;
      end
      default : begin
        if(refresh_pending)begin
          if(_zz_23_)begin
            frontend_rsp_payload_task = `SdramCtrlBackendTask_defaultEncoding_PRECHARGE_ALL;
          end else begin
            frontend_rsp_payload_task = `SdramCtrlBackendTask_defaultEncoding_REFRESH;
          end
        end else begin
          if(io_bus_cmd_valid)begin
            if(_zz_24_)begin
              frontend_rsp_payload_task = `SdramCtrlBackendTask_defaultEncoding_PRECHARGE_SINGLE;
            end else begin
              if(_zz_25_)begin
                frontend_rsp_payload_task = `SdramCtrlBackendTask_defaultEncoding_ACTIVE;
              end else begin
                frontend_rsp_payload_task = (io_bus_cmd_payload_write ? `SdramCtrlBackendTask_defaultEncoding_WRITE : `SdramCtrlBackendTask_defaultEncoding_READ);
              end
            end
          end
        end
      end
    endcase
  end

  assign frontend_rsp_payload_bank = frontend_address_bank;
  always @ (*) begin
    frontend_rsp_payload_rowColumn = frontend_address_row;
    case(frontend_state)
      `SdramCtrlFrontendState_defaultEncoding_BOOT_PRECHARGE : begin
      end
      `SdramCtrlFrontendState_defaultEncoding_BOOT_REFRESH : begin
      end
      `SdramCtrlFrontendState_defaultEncoding_BOOT_MODE : begin
      end
      default : begin
        if(! refresh_pending) begin
          if(io_bus_cmd_valid)begin
            if(! _zz_24_) begin
              if(! _zz_25_) begin
                frontend_rsp_payload_rowColumn = {3'd0, frontend_address_column};
              end
            end
          end
        end
      end
    endcase
  end

  assign frontend_rsp_payload_data = io_bus_cmd_payload_data;
  assign frontend_rsp_payload_mask = io_bus_cmd_payload_mask;
  assign frontend_rsp_payload_context_id = io_bus_cmd_payload_context_id;
  assign frontend_rsp_payload_context_last = io_bus_cmd_payload_context_last;
  always @ (*) begin
    io_bus_cmd_ready = 1'b0;
    case(frontend_state)
      `SdramCtrlFrontendState_defaultEncoding_BOOT_PRECHARGE : begin
      end
      `SdramCtrlFrontendState_defaultEncoding_BOOT_REFRESH : begin
      end
      `SdramCtrlFrontendState_defaultEncoding_BOOT_MODE : begin
      end
      default : begin
        if(! refresh_pending) begin
          if(io_bus_cmd_valid)begin
            if(! _zz_24_) begin
              if(! _zz_25_) begin
                io_bus_cmd_ready = frontend_rsp_ready;
              end
            end
          end
        end
      end
    endcase
  end

  always @ (*) begin
    frontend_bootRefreshCounter_willIncrement = 1'b0;
    case(frontend_state)
      `SdramCtrlFrontendState_defaultEncoding_BOOT_PRECHARGE : begin
      end
      `SdramCtrlFrontendState_defaultEncoding_BOOT_REFRESH : begin
        if(frontend_rsp_ready)begin
          frontend_bootRefreshCounter_willIncrement = 1'b1;
        end
      end
      `SdramCtrlFrontendState_defaultEncoding_BOOT_MODE : begin
      end
      default : begin
      end
    endcase
  end

  assign frontend_bootRefreshCounter_willClear = 1'b0;
  assign frontend_bootRefreshCounter_willOverflowIfInc = (frontend_bootRefreshCounter_value == (3'b111));
  assign frontend_bootRefreshCounter_willOverflow = (frontend_bootRefreshCounter_willOverflowIfInc && frontend_bootRefreshCounter_willIncrement);
  always @ (*) begin
    frontend_bootRefreshCounter_valueNext = (frontend_bootRefreshCounter_value + _zz_29_);
    if(frontend_bootRefreshCounter_willClear)begin
      frontend_bootRefreshCounter_valueNext = (3'b000);
    end
  end

  assign _zz_3_ = _zz_19_;
  assign _zz_4_ = ({3'd0,(1'b1)} <<< frontend_address_bank);
  assign _zz_5_ = _zz_4_[0];
  assign _zz_6_ = _zz_4_[1];
  assign _zz_7_ = _zz_4_[2];
  assign _zz_8_ = _zz_4_[3];
  assign frontend_rsp_ready = ((1'b1 && (! bubbleInserter_cmd_valid)) || bubbleInserter_cmd_ready);
  assign bubbleInserter_cmd_valid = frontend_rsp_m2sPipe_rValid;
  assign bubbleInserter_cmd_payload_task = frontend_rsp_m2sPipe_rData_task;
  assign bubbleInserter_cmd_payload_bank = frontend_rsp_m2sPipe_rData_bank;
  assign bubbleInserter_cmd_payload_rowColumn = frontend_rsp_m2sPipe_rData_rowColumn;
  assign bubbleInserter_cmd_payload_data = frontend_rsp_m2sPipe_rData_data;
  assign bubbleInserter_cmd_payload_mask = frontend_rsp_m2sPipe_rData_mask;
  assign bubbleInserter_cmd_payload_context_id = frontend_rsp_m2sPipe_rData_context_id;
  assign bubbleInserter_cmd_payload_context_last = frontend_rsp_m2sPipe_rData_context_last;
  always @ (*) begin
    bubbleInserter_insertBubble = 1'b0;
    if(bubbleInserter_cmd_valid)begin
      case(bubbleInserter_cmd_payload_task)
        `SdramCtrlBackendTask_defaultEncoding_MODE : begin
          bubbleInserter_insertBubble = bubbleInserter_timings_banks_0_active_busy;
        end
        `SdramCtrlBackendTask_defaultEncoding_PRECHARGE_ALL : begin
          bubbleInserter_insertBubble = ({bubbleInserter_timings_banks_3_precharge_busy,{bubbleInserter_timings_banks_2_precharge_busy,{bubbleInserter_timings_banks_1_precharge_busy,bubbleInserter_timings_banks_0_precharge_busy}}} != (4'b0000));
        end
        `SdramCtrlBackendTask_defaultEncoding_PRECHARGE_SINGLE : begin
          bubbleInserter_insertBubble = _zz_21_;
        end
        `SdramCtrlBackendTask_defaultEncoding_REFRESH : begin
          bubbleInserter_insertBubble = ({bubbleInserter_timings_banks_3_active_busy,{bubbleInserter_timings_banks_2_active_busy,{bubbleInserter_timings_banks_1_active_busy,bubbleInserter_timings_banks_0_active_busy}}} != (4'b0000));
        end
        `SdramCtrlBackendTask_defaultEncoding_ACTIVE : begin
          bubbleInserter_insertBubble = _zz_22_;
        end
        `SdramCtrlBackendTask_defaultEncoding_READ : begin
          bubbleInserter_insertBubble = bubbleInserter_timings_read_busy;
        end
        default : begin
          bubbleInserter_insertBubble = bubbleInserter_timings_write_busy;
        end
      endcase
    end
  end

  assign _zz_9_ = (! bubbleInserter_insertBubble);
  assign bubbleInserter_cmd_ready = (bubbleInserter_rsp_ready && _zz_9_);
  assign _zz_10_ = bubbleInserter_cmd_payload_task;
  assign bubbleInserter_rsp_valid = (bubbleInserter_cmd_valid && _zz_9_);
  assign bubbleInserter_rsp_payload_task = _zz_10_;
  assign bubbleInserter_rsp_payload_bank = bubbleInserter_cmd_payload_bank;
  assign bubbleInserter_rsp_payload_rowColumn = bubbleInserter_cmd_payload_rowColumn;
  assign bubbleInserter_rsp_payload_data = bubbleInserter_cmd_payload_data;
  assign bubbleInserter_rsp_payload_mask = bubbleInserter_cmd_payload_mask;
  assign bubbleInserter_rsp_payload_context_id = bubbleInserter_cmd_payload_context_id;
  assign bubbleInserter_rsp_payload_context_last = bubbleInserter_cmd_payload_context_last;
  assign bubbleInserter_timings_read_busy = 1'b0;
  assign bubbleInserter_timings_write_busy = (bubbleInserter_timings_write_counter != (3'b000));
  assign bubbleInserter_timings_banks_0_precharge_busy = (bubbleInserter_timings_banks_0_precharge_counter != (2'b00));
  assign bubbleInserter_timings_banks_0_active_busy = (bubbleInserter_timings_banks_0_active_counter != (2'b00));
  assign bubbleInserter_timings_banks_1_precharge_busy = (bubbleInserter_timings_banks_1_precharge_counter != (2'b00));
  assign bubbleInserter_timings_banks_1_active_busy = (bubbleInserter_timings_banks_1_active_counter != (2'b00));
  assign bubbleInserter_timings_banks_2_precharge_busy = (bubbleInserter_timings_banks_2_precharge_counter != (2'b00));
  assign bubbleInserter_timings_banks_2_active_busy = (bubbleInserter_timings_banks_2_active_counter != (2'b00));
  assign bubbleInserter_timings_banks_3_precharge_busy = (bubbleInserter_timings_banks_3_precharge_counter != (2'b00));
  assign bubbleInserter_timings_banks_3_active_busy = (bubbleInserter_timings_banks_3_active_counter != (2'b00));
  assign chip_cmd_valid = bubbleInserter_rsp_valid;
  assign bubbleInserter_rsp_ready = chip_cmd_ready;
  assign chip_cmd_payload_task = bubbleInserter_rsp_payload_task;
  assign chip_cmd_payload_bank = bubbleInserter_rsp_payload_bank;
  assign chip_cmd_payload_rowColumn = bubbleInserter_rsp_payload_rowColumn;
  assign chip_cmd_payload_data = bubbleInserter_rsp_payload_data;
  assign chip_cmd_payload_mask = bubbleInserter_rsp_payload_mask;
  assign chip_cmd_payload_context_id = bubbleInserter_rsp_payload_context_id;
  assign chip_cmd_payload_context_last = bubbleInserter_rsp_payload_context_last;
  assign io_sdram_ADDR = chip_sdram_ADDR;
  assign io_sdram_BA = chip_sdram_BA;
  assign io_sdram_DQ_write = chip_sdram_DQ_write;
  assign io_sdram_DQ_writeEnable = chip_sdram_DQ_writeEnable;
  assign io_sdram_DQM = chip_sdram_DQM;
  assign io_sdram_CASn = chip_sdram_CASn;
  assign io_sdram_CKE = chip_sdram_CKE;
  assign io_sdram_CSn = chip_sdram_CSn;
  assign io_sdram_RASn = chip_sdram_RASn;
  assign io_sdram_WEn = chip_sdram_WEn;
  assign _zz_11_ = (chip_cmd_valid && ((chip_cmd_payload_task == `SdramCtrlBackendTask_defaultEncoding_READ) || 1'b0));
  assign chip_readHistory_0 = _zz_11_;
  assign chip_readHistory_1 = _zz_12_;
  assign chip_readHistory_2 = _zz_13_;
  assign chip_readHistory_3 = _zz_14_;
  assign chip_readHistory_4 = _zz_15_;
  assign chip_readHistory_5 = _zz_16_;
  assign chip_sdramCkeNext = (! (({chip_readHistory_5,{chip_readHistory_4,{chip_readHistory_3,{chip_readHistory_2,{chip_readHistory_1,chip_readHistory_0}}}}} != 6'h0) && (! io_bus_rsp_ready)));
  assign chip_remoteCke = chip_sdramCkeInternal_regNext;
  assign _zz_17_ = (! chip_readHistory_1);
  assign chip_backupIn_valid = (chip_readHistory_5 && chip_remoteCke);
  assign chip_backupIn_payload_data = chip_sdram_DQ_read;
  assign chip_backupIn_payload_context_id = chip_contextDelayed_id;
  assign chip_backupIn_payload_context_last = chip_contextDelayed_last;
  assign chip_backupIn_ready = chip_backupIn_fifo_io_push_ready;
  assign io_bus_rsp_valid = chip_backupIn_fifo_io_pop_valid;
  assign io_bus_rsp_payload_data = chip_backupIn_fifo_io_pop_payload_data;
  assign io_bus_rsp_payload_context_id = chip_backupIn_fifo_io_pop_payload_context_id;
  assign io_bus_rsp_payload_context_last = chip_backupIn_fifo_io_pop_payload_context_last;
  assign chip_cmd_ready = chip_remoteCke;
  assign _zz_18_ = 1'b0;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      refresh_counter_value <= 9'h0;
      refresh_pending <= 1'b0;
      powerup_counter <= 13'h0;
      powerup_done <= 1'b0;
      frontend_banks_0_active <= 1'b0;
      frontend_banks_1_active <= 1'b0;
      frontend_banks_2_active <= 1'b0;
      frontend_banks_3_active <= 1'b0;
      frontend_state <= `SdramCtrlFrontendState_defaultEncoding_BOOT_PRECHARGE;
      frontend_bootRefreshCounter_value <= (3'b000);
      frontend_rsp_m2sPipe_rValid <= 1'b0;
      bubbleInserter_timings_write_counter <= (3'b000);
      bubbleInserter_timings_banks_0_precharge_counter <= (2'b00);
      bubbleInserter_timings_banks_0_active_counter <= (2'b00);
      bubbleInserter_timings_banks_1_precharge_counter <= (2'b00);
      bubbleInserter_timings_banks_1_active_counter <= (2'b00);
      bubbleInserter_timings_banks_2_precharge_counter <= (2'b00);
      bubbleInserter_timings_banks_2_active_counter <= (2'b00);
      bubbleInserter_timings_banks_3_precharge_counter <= (2'b00);
      bubbleInserter_timings_banks_3_active_counter <= (2'b00);
      _zz_12_ <= 1'b0;
      _zz_13_ <= 1'b0;
      _zz_14_ <= 1'b0;
      _zz_15_ <= 1'b0;
      _zz_16_ <= 1'b0;
      chip_sdramCkeInternal <= 1'b1;
      chip_sdramCkeInternal_regNext <= 1'b1;
    end else begin
      refresh_counter_value <= refresh_counter_valueNext;
      if(refresh_counter_willOverflow)begin
        refresh_pending <= 1'b1;
      end
      if((! powerup_done))begin
        powerup_counter <= (powerup_counter + 13'h0001);
        if((powerup_counter == _zz_1_))begin
          powerup_done <= 1'b1;
        end
      end
      frontend_bootRefreshCounter_value <= frontend_bootRefreshCounter_valueNext;
      case(frontend_state)
        `SdramCtrlFrontendState_defaultEncoding_BOOT_PRECHARGE : begin
          if(powerup_done)begin
            if(frontend_rsp_ready)begin
              frontend_state <= `SdramCtrlFrontendState_defaultEncoding_BOOT_REFRESH;
            end
          end
        end
        `SdramCtrlFrontendState_defaultEncoding_BOOT_REFRESH : begin
          if(frontend_rsp_ready)begin
            if(frontend_bootRefreshCounter_willOverflowIfInc)begin
              frontend_state <= `SdramCtrlFrontendState_defaultEncoding_BOOT_MODE;
            end
          end
        end
        `SdramCtrlFrontendState_defaultEncoding_BOOT_MODE : begin
          if(frontend_rsp_ready)begin
            frontend_state <= `SdramCtrlFrontendState_defaultEncoding_RUN;
          end
        end
        default : begin
          if(refresh_pending)begin
            if(_zz_23_)begin
              if(frontend_rsp_ready)begin
                frontend_banks_0_active <= 1'b0;
                frontend_banks_1_active <= 1'b0;
                frontend_banks_2_active <= 1'b0;
                frontend_banks_3_active <= 1'b0;
              end
            end else begin
              if(frontend_rsp_ready)begin
                refresh_pending <= 1'b0;
              end
            end
          end else begin
            if(io_bus_cmd_valid)begin
              if(_zz_24_)begin
                if(frontend_rsp_ready)begin
                  if(_zz_5_)begin
                    frontend_banks_0_active <= 1'b0;
                  end
                  if(_zz_6_)begin
                    frontend_banks_1_active <= 1'b0;
                  end
                  if(_zz_7_)begin
                    frontend_banks_2_active <= 1'b0;
                  end
                  if(_zz_8_)begin
                    frontend_banks_3_active <= 1'b0;
                  end
                end
              end else begin
                if(_zz_25_)begin
                  if(frontend_rsp_ready)begin
                    if(_zz_5_)begin
                      frontend_banks_0_active <= 1'b1;
                    end
                    if(_zz_6_)begin
                      frontend_banks_1_active <= 1'b1;
                    end
                    if(_zz_7_)begin
                      frontend_banks_2_active <= 1'b1;
                    end
                    if(_zz_8_)begin
                      frontend_banks_3_active <= 1'b1;
                    end
                  end
                end
              end
            end
          end
        end
      endcase
      if(frontend_rsp_ready)begin
        frontend_rsp_m2sPipe_rValid <= frontend_rsp_valid;
      end
      if((bubbleInserter_timings_write_busy && bubbleInserter_rsp_ready))begin
        bubbleInserter_timings_write_counter <= (bubbleInserter_timings_write_counter - (3'b001));
      end
      if((bubbleInserter_timings_banks_0_precharge_busy && bubbleInserter_rsp_ready))begin
        bubbleInserter_timings_banks_0_precharge_counter <= (bubbleInserter_timings_banks_0_precharge_counter - (2'b01));
      end
      if((bubbleInserter_timings_banks_0_active_busy && bubbleInserter_rsp_ready))begin
        bubbleInserter_timings_banks_0_active_counter <= (bubbleInserter_timings_banks_0_active_counter - (2'b01));
      end
      if((bubbleInserter_timings_banks_1_precharge_busy && bubbleInserter_rsp_ready))begin
        bubbleInserter_timings_banks_1_precharge_counter <= (bubbleInserter_timings_banks_1_precharge_counter - (2'b01));
      end
      if((bubbleInserter_timings_banks_1_active_busy && bubbleInserter_rsp_ready))begin
        bubbleInserter_timings_banks_1_active_counter <= (bubbleInserter_timings_banks_1_active_counter - (2'b01));
      end
      if((bubbleInserter_timings_banks_2_precharge_busy && bubbleInserter_rsp_ready))begin
        bubbleInserter_timings_banks_2_precharge_counter <= (bubbleInserter_timings_banks_2_precharge_counter - (2'b01));
      end
      if((bubbleInserter_timings_banks_2_active_busy && bubbleInserter_rsp_ready))begin
        bubbleInserter_timings_banks_2_active_counter <= (bubbleInserter_timings_banks_2_active_counter - (2'b01));
      end
      if((bubbleInserter_timings_banks_3_precharge_busy && bubbleInserter_rsp_ready))begin
        bubbleInserter_timings_banks_3_precharge_counter <= (bubbleInserter_timings_banks_3_precharge_counter - (2'b01));
      end
      if((bubbleInserter_timings_banks_3_active_busy && bubbleInserter_rsp_ready))begin
        bubbleInserter_timings_banks_3_active_counter <= (bubbleInserter_timings_banks_3_active_counter - (2'b01));
      end
      if(bubbleInserter_cmd_valid)begin
        case(bubbleInserter_cmd_payload_task)
          `SdramCtrlBackendTask_defaultEncoding_MODE : begin
            if(bubbleInserter_cmd_ready)begin
              if((bubbleInserter_timings_banks_0_active_counter <= (2'b01)))begin
                bubbleInserter_timings_banks_0_active_counter <= (2'b01);
              end
              if((bubbleInserter_timings_banks_1_active_counter <= (2'b01)))begin
                bubbleInserter_timings_banks_1_active_counter <= (2'b01);
              end
              if((bubbleInserter_timings_banks_2_active_counter <= (2'b01)))begin
                bubbleInserter_timings_banks_2_active_counter <= (2'b01);
              end
              if((bubbleInserter_timings_banks_3_active_counter <= (2'b01)))begin
                bubbleInserter_timings_banks_3_active_counter <= (2'b01);
              end
            end
          end
          `SdramCtrlBackendTask_defaultEncoding_PRECHARGE_ALL : begin
            if(bubbleInserter_cmd_ready)begin
              if((bubbleInserter_timings_banks_0_active_counter <= (2'b00)))begin
                bubbleInserter_timings_banks_0_active_counter <= (2'b00);
              end
            end
          end
          `SdramCtrlBackendTask_defaultEncoding_PRECHARGE_SINGLE : begin
            if(bubbleInserter_cmd_ready)begin
              if((bubbleInserter_cmd_payload_bank == (2'b00)))begin
                if((bubbleInserter_timings_banks_0_active_counter <= (2'b00)))begin
                  bubbleInserter_timings_banks_0_active_counter <= (2'b00);
                end
              end
              if((bubbleInserter_cmd_payload_bank == (2'b01)))begin
                if((bubbleInserter_timings_banks_1_active_counter <= (2'b00)))begin
                  bubbleInserter_timings_banks_1_active_counter <= (2'b00);
                end
              end
              if((bubbleInserter_cmd_payload_bank == (2'b10)))begin
                if((bubbleInserter_timings_banks_2_active_counter <= (2'b00)))begin
                  bubbleInserter_timings_banks_2_active_counter <= (2'b00);
                end
              end
              if((bubbleInserter_cmd_payload_bank == (2'b11)))begin
                if((bubbleInserter_timings_banks_3_active_counter <= (2'b00)))begin
                  bubbleInserter_timings_banks_3_active_counter <= (2'b00);
                end
              end
            end
          end
          `SdramCtrlBackendTask_defaultEncoding_REFRESH : begin
            if(bubbleInserter_cmd_ready)begin
              if((bubbleInserter_timings_banks_0_active_counter <= (2'b11)))begin
                bubbleInserter_timings_banks_0_active_counter <= (2'b11);
              end
              if((bubbleInserter_timings_banks_1_active_counter <= (2'b11)))begin
                bubbleInserter_timings_banks_1_active_counter <= (2'b11);
              end
              if((bubbleInserter_timings_banks_2_active_counter <= (2'b11)))begin
                bubbleInserter_timings_banks_2_active_counter <= (2'b11);
              end
              if((bubbleInserter_timings_banks_3_active_counter <= (2'b11)))begin
                bubbleInserter_timings_banks_3_active_counter <= (2'b11);
              end
            end
          end
          `SdramCtrlBackendTask_defaultEncoding_ACTIVE : begin
            if(bubbleInserter_cmd_ready)begin
              if((bubbleInserter_timings_write_counter <= (3'b000)))begin
                bubbleInserter_timings_write_counter <= (3'b000);
              end
              if((bubbleInserter_cmd_payload_bank == (2'b00)))begin
                if((bubbleInserter_timings_banks_0_precharge_counter <= (2'b01)))begin
                  bubbleInserter_timings_banks_0_precharge_counter <= (2'b01);
                end
              end
              if((bubbleInserter_cmd_payload_bank == (2'b01)))begin
                if((bubbleInserter_timings_banks_1_precharge_counter <= (2'b01)))begin
                  bubbleInserter_timings_banks_1_precharge_counter <= (2'b01);
                end
              end
              if((bubbleInserter_cmd_payload_bank == (2'b10)))begin
                if((bubbleInserter_timings_banks_2_precharge_counter <= (2'b01)))begin
                  bubbleInserter_timings_banks_2_precharge_counter <= (2'b01);
                end
              end
              if((bubbleInserter_cmd_payload_bank == (2'b11)))begin
                if((bubbleInserter_timings_banks_3_precharge_counter <= (2'b01)))begin
                  bubbleInserter_timings_banks_3_precharge_counter <= (2'b01);
                end
              end
              if((bubbleInserter_cmd_payload_bank == (2'b00)))begin
                if((bubbleInserter_timings_banks_0_active_counter <= (2'b10)))begin
                  bubbleInserter_timings_banks_0_active_counter <= (2'b10);
                end
              end
              if((bubbleInserter_cmd_payload_bank == (2'b01)))begin
                if((bubbleInserter_timings_banks_1_active_counter <= (2'b10)))begin
                  bubbleInserter_timings_banks_1_active_counter <= (2'b10);
                end
              end
              if((bubbleInserter_cmd_payload_bank == (2'b10)))begin
                if((bubbleInserter_timings_banks_2_active_counter <= (2'b10)))begin
                  bubbleInserter_timings_banks_2_active_counter <= (2'b10);
                end
              end
              if((bubbleInserter_cmd_payload_bank == (2'b11)))begin
                if((bubbleInserter_timings_banks_3_active_counter <= (2'b10)))begin
                  bubbleInserter_timings_banks_3_active_counter <= (2'b10);
                end
              end
            end
          end
          `SdramCtrlBackendTask_defaultEncoding_READ : begin
            if(bubbleInserter_cmd_ready)begin
              if((bubbleInserter_timings_write_counter <= (3'b100)))begin
                bubbleInserter_timings_write_counter <= (3'b100);
              end
            end
          end
          default : begin
            if(bubbleInserter_cmd_ready)begin
              if((bubbleInserter_cmd_payload_bank == (2'b00)))begin
                if((bubbleInserter_timings_banks_0_precharge_counter <= (2'b01)))begin
                  bubbleInserter_timings_banks_0_precharge_counter <= (2'b01);
                end
              end
              if((bubbleInserter_cmd_payload_bank == (2'b01)))begin
                if((bubbleInserter_timings_banks_1_precharge_counter <= (2'b01)))begin
                  bubbleInserter_timings_banks_1_precharge_counter <= (2'b01);
                end
              end
              if((bubbleInserter_cmd_payload_bank == (2'b10)))begin
                if((bubbleInserter_timings_banks_2_precharge_counter <= (2'b01)))begin
                  bubbleInserter_timings_banks_2_precharge_counter <= (2'b01);
                end
              end
              if((bubbleInserter_cmd_payload_bank == (2'b11)))begin
                if((bubbleInserter_timings_banks_3_precharge_counter <= (2'b01)))begin
                  bubbleInserter_timings_banks_3_precharge_counter <= (2'b01);
                end
              end
            end
          end
        endcase
      end
      if(chip_remoteCke)begin
        _zz_12_ <= _zz_11_;
      end
      if(chip_remoteCke)begin
        _zz_13_ <= _zz_12_;
      end
      if(chip_remoteCke)begin
        _zz_14_ <= _zz_13_;
      end
      if(chip_remoteCke)begin
        _zz_15_ <= _zz_14_;
      end
      if(chip_remoteCke)begin
        _zz_16_ <= _zz_15_;
      end
      chip_sdramCkeInternal <= chip_sdramCkeNext;
      chip_sdramCkeInternal_regNext <= chip_sdramCkeInternal;
    end
  end

  always @ (posedge io_mainClk) begin
    case(frontend_state)
      `SdramCtrlFrontendState_defaultEncoding_BOOT_PRECHARGE : begin
      end
      `SdramCtrlFrontendState_defaultEncoding_BOOT_REFRESH : begin
      end
      `SdramCtrlFrontendState_defaultEncoding_BOOT_MODE : begin
      end
      default : begin
        if(! refresh_pending) begin
          if(io_bus_cmd_valid)begin
            if(! _zz_24_) begin
              if(_zz_25_)begin
                if(_zz_5_)begin
                  frontend_banks_0_row <= frontend_address_row;
                end
                if(_zz_6_)begin
                  frontend_banks_1_row <= frontend_address_row;
                end
                if(_zz_7_)begin
                  frontend_banks_2_row <= frontend_address_row;
                end
                if(_zz_8_)begin
                  frontend_banks_3_row <= frontend_address_row;
                end
              end
            end
          end
        end
      end
    endcase
    if(frontend_rsp_ready)begin
      frontend_rsp_m2sPipe_rData_task <= frontend_rsp_payload_task;
      frontend_rsp_m2sPipe_rData_bank <= frontend_rsp_payload_bank;
      frontend_rsp_m2sPipe_rData_rowColumn <= frontend_rsp_payload_rowColumn;
      frontend_rsp_m2sPipe_rData_data <= frontend_rsp_payload_data;
      frontend_rsp_m2sPipe_rData_mask <= frontend_rsp_payload_mask;
      frontend_rsp_m2sPipe_rData_context_id <= frontend_rsp_payload_context_id;
      frontend_rsp_m2sPipe_rData_context_last <= frontend_rsp_payload_context_last;
    end
    if(chip_remoteCke)begin
      chip_cmd_payload_context_delay_1_id <= chip_cmd_payload_context_id;
      chip_cmd_payload_context_delay_1_last <= chip_cmd_payload_context_last;
    end
    if(chip_remoteCke)begin
      chip_cmd_payload_context_delay_2_id <= chip_cmd_payload_context_delay_1_id;
      chip_cmd_payload_context_delay_2_last <= chip_cmd_payload_context_delay_1_last;
    end
    if(chip_remoteCke)begin
      chip_cmd_payload_context_delay_3_id <= chip_cmd_payload_context_delay_2_id;
      chip_cmd_payload_context_delay_3_last <= chip_cmd_payload_context_delay_2_last;
    end
    if(chip_remoteCke)begin
      chip_cmd_payload_context_delay_4_id <= chip_cmd_payload_context_delay_3_id;
      chip_cmd_payload_context_delay_4_last <= chip_cmd_payload_context_delay_3_last;
    end
    if(chip_remoteCke)begin
      chip_contextDelayed_id <= chip_cmd_payload_context_delay_4_id;
      chip_contextDelayed_last <= chip_cmd_payload_context_delay_4_last;
    end
    chip_sdram_CKE <= chip_sdramCkeNext;
    if(chip_remoteCke)begin
      chip_sdram_DQ_read <= io_sdram_DQ_read;
      chip_sdram_CSn <= 1'b0;
      chip_sdram_RASn <= 1'b1;
      chip_sdram_CASn <= 1'b1;
      chip_sdram_WEn <= 1'b1;
      chip_sdram_DQ_write <= chip_cmd_payload_data;
      chip_sdram_DQ_writeEnable <= 16'h0;
      chip_sdram_DQM[0] <= _zz_17_;
      chip_sdram_DQM[1] <= _zz_17_;
      if(chip_cmd_valid)begin
        case(chip_cmd_payload_task)
          `SdramCtrlBackendTask_defaultEncoding_PRECHARGE_ALL : begin
            chip_sdram_ADDR[10] <= 1'b1;
            chip_sdram_CSn <= 1'b0;
            chip_sdram_RASn <= 1'b0;
            chip_sdram_CASn <= 1'b1;
            chip_sdram_WEn <= 1'b0;
          end
          `SdramCtrlBackendTask_defaultEncoding_REFRESH : begin
            chip_sdram_CSn <= 1'b0;
            chip_sdram_RASn <= 1'b0;
            chip_sdram_CASn <= 1'b0;
            chip_sdram_WEn <= 1'b1;
          end
          `SdramCtrlBackendTask_defaultEncoding_MODE : begin
            chip_sdram_ADDR <= 13'h0;
            chip_sdram_ADDR[2 : 0] <= (3'b000);
            chip_sdram_ADDR[3] <= 1'b0;
            chip_sdram_ADDR[6 : 4] <= (3'b011);
            chip_sdram_ADDR[8 : 7] <= (2'b00);
            chip_sdram_ADDR[9] <= 1'b0;
            chip_sdram_BA <= (2'b00);
            chip_sdram_CSn <= 1'b0;
            chip_sdram_RASn <= 1'b0;
            chip_sdram_CASn <= 1'b0;
            chip_sdram_WEn <= 1'b0;
          end
          `SdramCtrlBackendTask_defaultEncoding_ACTIVE : begin
            chip_sdram_ADDR <= chip_cmd_payload_rowColumn;
            chip_sdram_BA <= chip_cmd_payload_bank;
            chip_sdram_CSn <= 1'b0;
            chip_sdram_RASn <= 1'b0;
            chip_sdram_CASn <= 1'b1;
            chip_sdram_WEn <= 1'b1;
          end
          `SdramCtrlBackendTask_defaultEncoding_WRITE : begin
            chip_sdram_ADDR <= chip_cmd_payload_rowColumn;
            chip_sdram_ADDR[10] <= 1'b0;
            chip_sdram_DQ_writeEnable <= 16'hffff;
            chip_sdram_DQ_write <= chip_cmd_payload_data;
            chip_sdram_DQM <= (~ chip_cmd_payload_mask);
            chip_sdram_BA <= chip_cmd_payload_bank;
            chip_sdram_CSn <= 1'b0;
            chip_sdram_RASn <= 1'b1;
            chip_sdram_CASn <= 1'b0;
            chip_sdram_WEn <= 1'b0;
          end
          `SdramCtrlBackendTask_defaultEncoding_READ : begin
            chip_sdram_ADDR <= chip_cmd_payload_rowColumn;
            chip_sdram_ADDR[10] <= 1'b0;
            chip_sdram_BA <= chip_cmd_payload_bank;
            chip_sdram_CSn <= 1'b0;
            chip_sdram_RASn <= 1'b1;
            chip_sdram_CASn <= 1'b0;
            chip_sdram_WEn <= 1'b1;
          end
          default : begin
            chip_sdram_BA <= chip_cmd_payload_bank;
            chip_sdram_ADDR[10] <= 1'b0;
            chip_sdram_CSn <= 1'b0;
            chip_sdram_RASn <= 1'b0;
            chip_sdram_CASn <= 1'b1;
            chip_sdram_WEn <= 1'b0;
          end
        endcase
      end
    end
  end


endmodule

module BufferCC_2_ (
  input               io_dataIn_clear,
  input               io_dataIn_tick,
  output              io_dataOut_clear,
  output              io_dataOut_tick,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  reg                 buffers_0_clear;
  reg                 buffers_0_tick;
  reg                 buffers_1_clear;
  reg                 buffers_1_tick;

  assign io_dataOut_clear = buffers_1_clear;
  assign io_dataOut_tick = buffers_1_tick;
  always @ (posedge io_mainClk) begin
    buffers_0_clear <= io_dataIn_clear;
    buffers_0_tick <= io_dataIn_tick;
    buffers_1_clear <= buffers_0_clear;
    buffers_1_tick <= buffers_0_tick;
  end


endmodule

module Prescaler (
  input               io_clear,
  input      [15:0]   io_limit,
  output              io_overflow,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  reg        [15:0]   counter;

  assign io_overflow = (counter == io_limit);
  always @ (posedge io_mainClk) begin
    counter <= (counter + 16'h0001);
    if((io_clear || io_overflow))begin
      counter <= 16'h0;
    end
  end


endmodule

module Timer (
  input               io_tick,
  input               io_clear,
  input      [31:0]   io_limit,
  output              io_full,
  output     [31:0]   io_value,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  wire       [0:0]    _zz_1_;
  wire       [31:0]   _zz_2_;
  reg        [31:0]   counter;
  wire                limitHit;
  reg                 inhibitFull;

  assign _zz_1_ = (! limitHit);
  assign _zz_2_ = {31'd0, _zz_1_};
  assign limitHit = (counter == io_limit);
  assign io_full = ((limitHit && io_tick) && (! inhibitFull));
  assign io_value = counter;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      inhibitFull <= 1'b0;
    end else begin
      if(io_tick)begin
        inhibitFull <= limitHit;
      end
      if(io_clear)begin
        inhibitFull <= 1'b0;
      end
    end
  end

  always @ (posedge io_mainClk) begin
    if(io_tick)begin
      counter <= (counter + _zz_2_);
    end
    if(io_clear)begin
      counter <= 32'h0;
    end
  end


endmodule

module Timer_1_ (
  input               io_tick,
  input               io_clear,
  input      [15:0]   io_limit,
  output              io_full,
  output     [15:0]   io_value,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  wire       [0:0]    _zz_1_;
  wire       [15:0]   _zz_2_;
  reg        [15:0]   counter;
  wire                limitHit;
  reg                 inhibitFull;

  assign _zz_1_ = (! limitHit);
  assign _zz_2_ = {15'd0, _zz_1_};
  assign limitHit = (counter == io_limit);
  assign io_full = ((limitHit && io_tick) && (! inhibitFull));
  assign io_value = counter;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      inhibitFull <= 1'b0;
    end else begin
      if(io_tick)begin
        inhibitFull <= limitHit;
      end
      if(io_clear)begin
        inhibitFull <= 1'b0;
      end
    end
  end

  always @ (posedge io_mainClk) begin
    if(io_tick)begin
      counter <= (counter + _zz_2_);
    end
    if(io_clear)begin
      counter <= 16'h0;
    end
  end


endmodule
//Timer_2_ replaced by Timer_1_
//Timer_3_ replaced by Timer_1_

module InterruptCtrl (
  input      [3:0]    io_inputs,
  input      [3:0]    io_clears,
  input      [3:0]    io_masks,
  output     [3:0]    io_pendings,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  reg        [3:0]    pendings;

  assign io_pendings = (pendings & io_masks);
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      pendings <= (4'b0000);
    end else begin
      pendings <= ((pendings & (~ io_clears)) | io_inputs);
    end
  end


endmodule

module UartCtrl (
  input      [2:0]    io_config_frame_dataLength,
  input      `UartStopType_defaultEncoding_type io_config_frame_stop,
  input      `UartParityType_defaultEncoding_type io_config_frame_parity,
  input      [19:0]   io_config_clockDivider,
  input               io_write_valid,
  output reg          io_write_ready,
  input      [7:0]    io_write_payload,
  output              io_read_valid,
  input               io_read_ready,
  output     [7:0]    io_read_payload,
  output              io_uart_txd,
  input               io_uart_rxd,
  output              io_readError,
  input               io_writeBreak,
  output              io_readBreak,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  wire                _zz_1_;
  wire                tx_io_write_ready;
  wire                tx_io_txd;
  wire                rx_io_read_valid;
  wire       [7:0]    rx_io_read_payload;
  wire                rx_io_rts;
  wire                rx_io_error;
  wire                rx_io_break;
  reg        [19:0]   clockDivider_counter;
  wire                clockDivider_tick;
  reg                 io_write_thrown_valid;
  wire                io_write_thrown_ready;
  wire       [7:0]    io_write_thrown_payload;
  `ifndef SYNTHESIS
  reg [23:0] io_config_frame_stop_string;
  reg [31:0] io_config_frame_parity_string;
  `endif


  UartCtrlTx tx ( 
    .io_configFrame_dataLength    (io_config_frame_dataLength[2:0]  ), //i
    .io_configFrame_stop          (io_config_frame_stop             ), //i
    .io_configFrame_parity        (io_config_frame_parity[1:0]      ), //i
    .io_samplingTick              (clockDivider_tick                ), //i
    .io_write_valid               (io_write_thrown_valid            ), //i
    .io_write_ready               (tx_io_write_ready                ), //o
    .io_write_payload             (io_write_thrown_payload[7:0]     ), //i
    .io_cts                       (_zz_1_                           ), //i
    .io_txd                       (tx_io_txd                        ), //o
    .io_break                     (io_writeBreak                    ), //i
    .io_mainClk                   (io_mainClk                       ), //i
    .resetCtrl_axiReset           (resetCtrl_axiReset               )  //i
  );
  UartCtrlRx rx ( 
    .io_configFrame_dataLength    (io_config_frame_dataLength[2:0]  ), //i
    .io_configFrame_stop          (io_config_frame_stop             ), //i
    .io_configFrame_parity        (io_config_frame_parity[1:0]      ), //i
    .io_samplingTick              (clockDivider_tick                ), //i
    .io_read_valid                (rx_io_read_valid                 ), //o
    .io_read_ready                (io_read_ready                    ), //i
    .io_read_payload              (rx_io_read_payload[7:0]          ), //o
    .io_rxd                       (io_uart_rxd                      ), //i
    .io_rts                       (rx_io_rts                        ), //o
    .io_error                     (rx_io_error                      ), //o
    .io_break                     (rx_io_break                      ), //o
    .io_mainClk                   (io_mainClk                       ), //i
    .resetCtrl_axiReset           (resetCtrl_axiReset               )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_config_frame_stop)
      `UartStopType_defaultEncoding_ONE : io_config_frame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_config_frame_stop_string = "TWO";
      default : io_config_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_config_frame_parity)
      `UartParityType_defaultEncoding_NONE : io_config_frame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_config_frame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_config_frame_parity_string = "ODD ";
      default : io_config_frame_parity_string = "????";
    endcase
  end
  `endif

  assign clockDivider_tick = (clockDivider_counter == 20'h0);
  always @ (*) begin
    io_write_thrown_valid = io_write_valid;
    if(rx_io_break)begin
      io_write_thrown_valid = 1'b0;
    end
  end

  always @ (*) begin
    io_write_ready = io_write_thrown_ready;
    if(rx_io_break)begin
      io_write_ready = 1'b1;
    end
  end

  assign io_write_thrown_payload = io_write_payload;
  assign io_write_thrown_ready = tx_io_write_ready;
  assign io_read_valid = rx_io_read_valid;
  assign io_read_payload = rx_io_read_payload;
  assign io_uart_txd = tx_io_txd;
  assign io_readError = rx_io_error;
  assign _zz_1_ = 1'b0;
  assign io_readBreak = rx_io_break;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      clockDivider_counter <= 20'h0;
    end else begin
      clockDivider_counter <= (clockDivider_counter - 20'h00001);
      if(clockDivider_tick)begin
        clockDivider_counter <= io_config_clockDivider;
      end
    end
  end


endmodule

module StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [7:0]    io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [7:0]    io_pop_payload,
  input               io_flush,
  output     [4:0]    io_occupancy,
  output     [4:0]    io_availability,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  reg        [7:0]    _zz_3_;
  wire       [0:0]    _zz_4_;
  wire       [3:0]    _zz_5_;
  wire       [0:0]    _zz_6_;
  wire       [3:0]    _zz_7_;
  wire       [3:0]    _zz_8_;
  wire                _zz_9_;
  reg                 _zz_1_;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [3:0]    logic_pushPtr_valueNext;
  reg        [3:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [3:0]    logic_popPtr_valueNext;
  reg        [3:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_2_;
  wire       [3:0]    logic_ptrDif;
  reg [7:0] logic_ram [0:15];

  assign _zz_4_ = logic_pushPtr_willIncrement;
  assign _zz_5_ = {3'd0, _zz_4_};
  assign _zz_6_ = logic_popPtr_willIncrement;
  assign _zz_7_ = {3'd0, _zz_6_};
  assign _zz_8_ = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_9_ = 1'b1;
  always @ (posedge io_mainClk) begin
    if(_zz_9_) begin
      _zz_3_ <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @ (posedge io_mainClk) begin
    if(_zz_1_) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload;
    end
  end

  always @ (*) begin
    _zz_1_ = 1'b0;
    if(logic_pushing)begin
      _zz_1_ = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing)begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == (4'b1111));
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @ (*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_5_);
    if(logic_pushPtr_willClear)begin
      logic_pushPtr_valueNext = (4'b0000);
    end
  end

  always @ (*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping)begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == (4'b1111));
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @ (*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_7_);
    if(logic_popPtr_willClear)begin
      logic_popPtr_valueNext = (4'b0000);
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_2_ && (! logic_full))));
  assign io_pop_payload = _zz_3_;
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_8_};
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      logic_pushPtr_value <= (4'b0000);
      logic_popPtr_value <= (4'b0000);
      logic_risingOccupancy <= 1'b0;
      _zz_2_ <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_2_ <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if((logic_pushing != logic_popping))begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush)begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule
//StreamFifo_1_ replaced by StreamFifo

module StreamFifoLowLatency_1_ (
  input               io_push_valid,
  output              io_push_ready,
  input               io_push_payload_error,
  input      [31:0]   io_push_payload_inst,
  output reg          io_pop_valid,
  input               io_pop_ready,
  output reg          io_pop_payload_error,
  output reg [31:0]   io_pop_payload_inst,
  input               io_flush,
  output     [0:0]    io_occupancy,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  wire                _zz_4_;
  wire       [0:0]    _zz_5_;
  reg                 _zz_1_;
  reg                 pushPtr_willIncrement;
  reg                 pushPtr_willClear;
  wire                pushPtr_willOverflowIfInc;
  wire                pushPtr_willOverflow;
  reg                 popPtr_willIncrement;
  reg                 popPtr_willClear;
  wire                popPtr_willOverflowIfInc;
  wire                popPtr_willOverflow;
  wire                ptrMatch;
  reg                 risingOccupancy;
  wire                empty;
  wire                full;
  wire                pushing;
  wire                popping;
  wire       [32:0]   _zz_2_;
  reg        [32:0]   _zz_3_;

  assign _zz_4_ = (! empty);
  assign _zz_5_ = _zz_2_[0 : 0];
  always @ (*) begin
    _zz_1_ = 1'b0;
    if(pushing)begin
      _zz_1_ = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing)begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willClear = 1'b0;
    if(io_flush)begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = 1'b1;
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @ (*) begin
    popPtr_willIncrement = 1'b0;
    if(popping)begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    popPtr_willClear = 1'b0;
    if(io_flush)begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = 1'b1;
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  assign ptrMatch = 1'b1;
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  always @ (*) begin
    if(_zz_4_)begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  assign _zz_2_ = _zz_3_;
  always @ (*) begin
    if(_zz_4_)begin
      io_pop_payload_error = _zz_5_[0];
    end else begin
      io_pop_payload_error = io_push_payload_error;
    end
  end

  always @ (*) begin
    if(_zz_4_)begin
      io_pop_payload_inst = _zz_2_[32 : 1];
    end else begin
      io_pop_payload_inst = io_push_payload_inst;
    end
  end

  assign io_occupancy = (risingOccupancy && ptrMatch);
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      risingOccupancy <= 1'b0;
    end else begin
      if((pushing != popping))begin
        risingOccupancy <= pushing;
      end
      if(io_flush)begin
        risingOccupancy <= 1'b0;
      end
    end
  end

  always @ (posedge io_mainClk) begin
    if(_zz_1_)begin
      _zz_3_ <= {io_push_payload_inst,io_push_payload_error};
    end
  end


endmodule

module FlowCCByToggle (
  input               io_input_valid,
  input               io_input_payload_last,
  input      [0:0]    io_input_payload_fragment,
  output              io_output_valid,
  output              io_output_payload_last,
  output     [0:0]    io_output_payload_fragment,
  input               io_jtag_tck,
  input               io_mainClk,
  input               resetCtrl_systemReset 
);
  wire                inputArea_target_buffercc_io_dataOut;
  wire                outHitSignal;
  reg                 inputArea_target = 0;
  reg                 inputArea_data_last;
  reg        [0:0]    inputArea_data_fragment;
  wire                outputArea_target;
  reg                 outputArea_hit;
  wire                outputArea_flow_valid;
  wire                outputArea_flow_payload_last;
  wire       [0:0]    outputArea_flow_payload_fragment;
  reg                 outputArea_flow_regNext_valid;
  reg                 outputArea_flow_regNext_payload_last;
  reg        [0:0]    outputArea_flow_regNext_payload_fragment;

  BufferCC_1_ inputArea_target_buffercc ( 
    .io_dataIn                (inputArea_target                      ), //i
    .io_dataOut               (inputArea_target_buffercc_io_dataOut  ), //o
    .io_mainClk               (io_mainClk                            ), //i
    .resetCtrl_systemReset    (resetCtrl_systemReset                 )  //i
  );
  assign outputArea_target = inputArea_target_buffercc_io_dataOut;
  assign outputArea_flow_valid = (outputArea_target != outputArea_hit);
  assign outputArea_flow_payload_last = inputArea_data_last;
  assign outputArea_flow_payload_fragment = inputArea_data_fragment;
  assign io_output_valid = outputArea_flow_regNext_valid;
  assign io_output_payload_last = outputArea_flow_regNext_payload_last;
  assign io_output_payload_fragment = outputArea_flow_regNext_payload_fragment;
  always @ (posedge io_jtag_tck) begin
    if(io_input_valid)begin
      inputArea_target <= (! inputArea_target);
      inputArea_data_last <= io_input_payload_last;
      inputArea_data_fragment <= io_input_payload_fragment;
    end
  end

  always @ (posedge io_mainClk) begin
    outputArea_hit <= outputArea_target;
    outputArea_flow_regNext_payload_last <= outputArea_flow_payload_last;
    outputArea_flow_regNext_payload_fragment <= outputArea_flow_payload_fragment;
  end

  always @ (posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if (resetCtrl_systemReset) begin
      outputArea_flow_regNext_valid <= 1'b0;
    end else begin
      outputArea_flow_regNext_valid <= outputArea_flow_valid;
    end
  end


endmodule

module Axi4ReadOnlyErrorSlave (
  input               io_axi_ar_valid,
  output              io_axi_ar_ready,
  input      [31:0]   io_axi_ar_payload_addr,
  input      [3:0]    io_axi_ar_payload_cache,
  input      [2:0]    io_axi_ar_payload_prot,
  output              io_axi_r_valid,
  input               io_axi_r_ready,
  output     [31:0]   io_axi_r_payload_data,
  output     [1:0]    io_axi_r_payload_resp,
  output              io_axi_r_payload_last,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  wire                _zz_1_;
  reg                 sendRsp;
  reg        [7:0]    remaining;
  wire                remainingZero;

  assign _zz_1_ = (io_axi_ar_valid && io_axi_ar_ready);
  assign remainingZero = (remaining == 8'h0);
  assign io_axi_ar_ready = (! sendRsp);
  assign io_axi_r_valid = sendRsp;
  assign io_axi_r_payload_resp = (2'b11);
  assign io_axi_r_payload_last = remainingZero;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      sendRsp <= 1'b0;
    end else begin
      if(_zz_1_)begin
        sendRsp <= 1'b1;
      end
      if(sendRsp)begin
        if(io_axi_r_ready)begin
          if(remainingZero)begin
            sendRsp <= 1'b0;
          end
        end
      end
    end
  end

  always @ (posedge io_mainClk) begin
    if(_zz_1_)begin
      remaining <= 8'h0;
    end
    if(sendRsp)begin
      if(io_axi_r_ready)begin
        remaining <= (remaining - 8'h01);
      end
    end
  end


endmodule

module Axi4SharedErrorSlave (
  input               io_axi_arw_valid,
  output              io_axi_arw_ready,
  input      [31:0]   io_axi_arw_payload_addr,
  input      [2:0]    io_axi_arw_payload_size,
  input      [3:0]    io_axi_arw_payload_cache,
  input      [2:0]    io_axi_arw_payload_prot,
  input               io_axi_arw_payload_write,
  input               io_axi_w_valid,
  output              io_axi_w_ready,
  input      [31:0]   io_axi_w_payload_data,
  input      [3:0]    io_axi_w_payload_strb,
  input               io_axi_w_payload_last,
  output              io_axi_b_valid,
  input               io_axi_b_ready,
  output     [1:0]    io_axi_b_payload_resp,
  output              io_axi_r_valid,
  input               io_axi_r_ready,
  output     [31:0]   io_axi_r_payload_data,
  output     [1:0]    io_axi_r_payload_resp,
  output              io_axi_r_payload_last,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  wire                _zz_1_;
  reg                 consumeData;
  reg                 sendReadRsp;
  reg                 sendWriteRsp;
  reg        [7:0]    remaining;
  wire                remainingZero;

  assign _zz_1_ = (io_axi_arw_valid && io_axi_arw_ready);
  assign remainingZero = (remaining == 8'h0);
  assign io_axi_arw_ready = (! ((consumeData || sendWriteRsp) || sendReadRsp));
  assign io_axi_w_ready = consumeData;
  assign io_axi_b_valid = sendWriteRsp;
  assign io_axi_b_payload_resp = (2'b11);
  assign io_axi_r_valid = sendReadRsp;
  assign io_axi_r_payload_resp = (2'b11);
  assign io_axi_r_payload_last = remainingZero;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      consumeData <= 1'b0;
      sendReadRsp <= 1'b0;
      sendWriteRsp <= 1'b0;
    end else begin
      if(_zz_1_)begin
        consumeData <= io_axi_arw_payload_write;
        sendReadRsp <= (! io_axi_arw_payload_write);
      end
      if(((io_axi_w_valid && io_axi_w_ready) && io_axi_w_payload_last))begin
        consumeData <= 1'b0;
        sendWriteRsp <= 1'b1;
      end
      if((io_axi_b_valid && io_axi_b_ready))begin
        sendWriteRsp <= 1'b0;
      end
      if(sendReadRsp)begin
        if(io_axi_r_ready)begin
          if(remainingZero)begin
            sendReadRsp <= 1'b0;
          end
        end
      end
    end
  end

  always @ (posedge io_mainClk) begin
    if(_zz_1_)begin
      remaining <= 8'h0;
    end
    if(sendReadRsp)begin
      if(io_axi_r_ready)begin
        remaining <= (remaining - 8'h01);
      end
    end
  end


endmodule

module StreamArbiter (
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input      [17:0]   io_inputs_0_payload_addr,
  input      [2:0]    io_inputs_0_payload_id,
  input      [7:0]    io_inputs_0_payload_len,
  input      [2:0]    io_inputs_0_payload_size,
  input      [1:0]    io_inputs_0_payload_burst,
  input               io_inputs_0_payload_write,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input      [17:0]   io_inputs_1_payload_addr,
  input      [2:0]    io_inputs_1_payload_id,
  input      [7:0]    io_inputs_1_payload_len,
  input      [2:0]    io_inputs_1_payload_size,
  input      [1:0]    io_inputs_1_payload_burst,
  input               io_inputs_1_payload_write,
  output              io_output_valid,
  input               io_output_ready,
  output     [17:0]   io_output_payload_addr,
  output     [2:0]    io_output_payload_id,
  output     [7:0]    io_output_payload_len,
  output     [2:0]    io_output_payload_size,
  output     [1:0]    io_output_payload_burst,
  output              io_output_payload_write,
  output     [0:0]    io_chosen,
  output     [1:0]    io_chosenOH,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  wire       [3:0]    _zz_6_;
  wire       [1:0]    _zz_7_;
  wire       [3:0]    _zz_8_;
  wire       [0:0]    _zz_9_;
  wire       [0:0]    _zz_10_;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire       [1:0]    _zz_1_;
  wire       [3:0]    _zz_2_;
  wire       [3:0]    _zz_3_;
  wire       [1:0]    _zz_4_;
  wire                _zz_5_;

  assign _zz_6_ = (_zz_2_ - _zz_8_);
  assign _zz_7_ = {maskLocked_0,maskLocked_1};
  assign _zz_8_ = {2'd0, _zz_7_};
  assign _zz_9_ = _zz_4_[0 : 0];
  assign _zz_10_ = _zz_4_[1 : 1];
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_1_ = {io_inputs_1_valid,io_inputs_0_valid};
  assign _zz_2_ = {_zz_1_,_zz_1_};
  assign _zz_3_ = (_zz_2_ & (~ _zz_6_));
  assign _zz_4_ = (_zz_3_[3 : 2] | _zz_3_[1 : 0]);
  assign maskProposal_0 = _zz_9_[0];
  assign maskProposal_1 = _zz_10_[0];
  assign io_output_valid = ((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1));
  assign io_output_payload_addr = (maskRouted_0 ? io_inputs_0_payload_addr : io_inputs_1_payload_addr);
  assign io_output_payload_id = (maskRouted_0 ? io_inputs_0_payload_id : io_inputs_1_payload_id);
  assign io_output_payload_len = (maskRouted_0 ? io_inputs_0_payload_len : io_inputs_1_payload_len);
  assign io_output_payload_size = (maskRouted_0 ? io_inputs_0_payload_size : io_inputs_1_payload_size);
  assign io_output_payload_burst = (maskRouted_0 ? io_inputs_0_payload_burst : io_inputs_1_payload_burst);
  assign io_output_payload_write = (maskRouted_0 ? io_inputs_0_payload_write : io_inputs_1_payload_write);
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_5_ = io_chosenOH[1];
  assign io_chosen = _zz_5_;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b0;
      maskLocked_1 <= 1'b1;
    end else begin
      if(io_output_valid)begin
        maskLocked_0 <= maskRouted_0;
        maskLocked_1 <= maskRouted_1;
      end
      if(io_output_valid)begin
        locked <= 1'b1;
      end
      if((io_output_valid && io_output_ready))begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module StreamFork (
  input               io_input_valid,
  output reg          io_input_ready,
  input      [17:0]   io_input_payload_addr,
  input      [2:0]    io_input_payload_id,
  input      [7:0]    io_input_payload_len,
  input      [2:0]    io_input_payload_size,
  input      [1:0]    io_input_payload_burst,
  input               io_input_payload_write,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [17:0]   io_outputs_0_payload_addr,
  output     [2:0]    io_outputs_0_payload_id,
  output     [7:0]    io_outputs_0_payload_len,
  output     [2:0]    io_outputs_0_payload_size,
  output     [1:0]    io_outputs_0_payload_burst,
  output              io_outputs_0_payload_write,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [17:0]   io_outputs_1_payload_addr,
  output     [2:0]    io_outputs_1_payload_id,
  output     [7:0]    io_outputs_1_payload_len,
  output     [2:0]    io_outputs_1_payload_size,
  output     [1:0]    io_outputs_1_payload_burst,
  output              io_outputs_1_payload_write,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  reg                 _zz_1_;
  reg                 _zz_2_;

  always @ (*) begin
    io_input_ready = 1'b1;
    if(((! io_outputs_0_ready) && _zz_1_))begin
      io_input_ready = 1'b0;
    end
    if(((! io_outputs_1_ready) && _zz_2_))begin
      io_input_ready = 1'b0;
    end
  end

  assign io_outputs_0_valid = (io_input_valid && _zz_1_);
  assign io_outputs_0_payload_addr = io_input_payload_addr;
  assign io_outputs_0_payload_id = io_input_payload_id;
  assign io_outputs_0_payload_len = io_input_payload_len;
  assign io_outputs_0_payload_size = io_input_payload_size;
  assign io_outputs_0_payload_burst = io_input_payload_burst;
  assign io_outputs_0_payload_write = io_input_payload_write;
  assign io_outputs_1_valid = (io_input_valid && _zz_2_);
  assign io_outputs_1_payload_addr = io_input_payload_addr;
  assign io_outputs_1_payload_id = io_input_payload_id;
  assign io_outputs_1_payload_len = io_input_payload_len;
  assign io_outputs_1_payload_size = io_input_payload_size;
  assign io_outputs_1_payload_burst = io_input_payload_burst;
  assign io_outputs_1_payload_write = io_input_payload_write;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      _zz_1_ <= 1'b1;
      _zz_2_ <= 1'b1;
    end else begin
      if((io_outputs_0_valid && io_outputs_0_ready))begin
        _zz_1_ <= 1'b0;
      end
      if((io_outputs_1_valid && io_outputs_1_ready))begin
        _zz_2_ <= 1'b0;
      end
      if(io_input_ready)begin
        _zz_1_ <= 1'b1;
        _zz_2_ <= 1'b1;
      end
    end
  end


endmodule

module StreamFifoLowLatency_2_ (
  input               io_push_valid,
  output              io_push_ready,
  output reg          io_pop_valid,
  input               io_pop_ready,
  input               io_flush,
  output     [2:0]    io_occupancy,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  wire       [0:0]    _zz_1_;
  wire       [1:0]    _zz_2_;
  wire       [0:0]    _zz_3_;
  wire       [1:0]    _zz_4_;
  reg                 pushPtr_willIncrement;
  reg                 pushPtr_willClear;
  reg        [1:0]    pushPtr_valueNext;
  reg        [1:0]    pushPtr_value;
  wire                pushPtr_willOverflowIfInc;
  wire                pushPtr_willOverflow;
  reg                 popPtr_willIncrement;
  reg                 popPtr_willClear;
  reg        [1:0]    popPtr_valueNext;
  reg        [1:0]    popPtr_value;
  wire                popPtr_willOverflowIfInc;
  wire                popPtr_willOverflow;
  wire                ptrMatch;
  reg                 risingOccupancy;
  wire                empty;
  wire                full;
  wire                pushing;
  wire                popping;
  wire       [1:0]    ptrDif;

  assign _zz_1_ = pushPtr_willIncrement;
  assign _zz_2_ = {1'd0, _zz_1_};
  assign _zz_3_ = popPtr_willIncrement;
  assign _zz_4_ = {1'd0, _zz_3_};
  always @ (*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing)begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willClear = 1'b0;
    if(io_flush)begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = (pushPtr_value == (2'b11));
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @ (*) begin
    pushPtr_valueNext = (pushPtr_value + _zz_2_);
    if(pushPtr_willClear)begin
      pushPtr_valueNext = (2'b00);
    end
  end

  always @ (*) begin
    popPtr_willIncrement = 1'b0;
    if(popping)begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    popPtr_willClear = 1'b0;
    if(io_flush)begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = (popPtr_value == (2'b11));
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  always @ (*) begin
    popPtr_valueNext = (popPtr_value + _zz_4_);
    if(popPtr_willClear)begin
      popPtr_valueNext = (2'b00);
    end
  end

  assign ptrMatch = (pushPtr_value == popPtr_value);
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  always @ (*) begin
    if((! empty))begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  assign ptrDif = (pushPtr_value - popPtr_value);
  assign io_occupancy = {(risingOccupancy && ptrMatch),ptrDif};
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      pushPtr_value <= (2'b00);
      popPtr_value <= (2'b00);
      risingOccupancy <= 1'b0;
    end else begin
      pushPtr_value <= pushPtr_valueNext;
      popPtr_value <= popPtr_valueNext;
      if((pushing != popping))begin
        risingOccupancy <= pushing;
      end
      if(io_flush)begin
        risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module StreamArbiter_1_ (
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input      [25:0]   io_inputs_0_payload_addr,
  input      [2:0]    io_inputs_0_payload_id,
  input      [7:0]    io_inputs_0_payload_len,
  input      [2:0]    io_inputs_0_payload_size,
  input      [1:0]    io_inputs_0_payload_burst,
  input               io_inputs_0_payload_write,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input      [25:0]   io_inputs_1_payload_addr,
  input      [2:0]    io_inputs_1_payload_id,
  input      [7:0]    io_inputs_1_payload_len,
  input      [2:0]    io_inputs_1_payload_size,
  input      [1:0]    io_inputs_1_payload_burst,
  input               io_inputs_1_payload_write,
  output              io_output_valid,
  input               io_output_ready,
  output     [25:0]   io_output_payload_addr,
  output     [2:0]    io_output_payload_id,
  output     [7:0]    io_output_payload_len,
  output     [2:0]    io_output_payload_size,
  output     [1:0]    io_output_payload_burst,
  output              io_output_payload_write,
  output     [0:0]    io_chosen,
  output     [1:0]    io_chosenOH,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  wire       [3:0]    _zz_6_;
  wire       [1:0]    _zz_7_;
  wire       [3:0]    _zz_8_;
  wire       [0:0]    _zz_9_;
  wire       [0:0]    _zz_10_;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire       [1:0]    _zz_1_;
  wire       [3:0]    _zz_2_;
  wire       [3:0]    _zz_3_;
  wire       [1:0]    _zz_4_;
  wire                _zz_5_;

  assign _zz_6_ = (_zz_2_ - _zz_8_);
  assign _zz_7_ = {maskLocked_0,maskLocked_1};
  assign _zz_8_ = {2'd0, _zz_7_};
  assign _zz_9_ = _zz_4_[0 : 0];
  assign _zz_10_ = _zz_4_[1 : 1];
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_1_ = {io_inputs_1_valid,io_inputs_0_valid};
  assign _zz_2_ = {_zz_1_,_zz_1_};
  assign _zz_3_ = (_zz_2_ & (~ _zz_6_));
  assign _zz_4_ = (_zz_3_[3 : 2] | _zz_3_[1 : 0]);
  assign maskProposal_0 = _zz_9_[0];
  assign maskProposal_1 = _zz_10_[0];
  assign io_output_valid = ((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1));
  assign io_output_payload_addr = (maskRouted_0 ? io_inputs_0_payload_addr : io_inputs_1_payload_addr);
  assign io_output_payload_id = (maskRouted_0 ? io_inputs_0_payload_id : io_inputs_1_payload_id);
  assign io_output_payload_len = (maskRouted_0 ? io_inputs_0_payload_len : io_inputs_1_payload_len);
  assign io_output_payload_size = (maskRouted_0 ? io_inputs_0_payload_size : io_inputs_1_payload_size);
  assign io_output_payload_burst = (maskRouted_0 ? io_inputs_0_payload_burst : io_inputs_1_payload_burst);
  assign io_output_payload_write = (maskRouted_0 ? io_inputs_0_payload_write : io_inputs_1_payload_write);
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_5_ = io_chosenOH[1];
  assign io_chosen = _zz_5_;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b0;
      maskLocked_1 <= 1'b1;
    end else begin
      if(io_output_valid)begin
        maskLocked_0 <= maskRouted_0;
        maskLocked_1 <= maskRouted_1;
      end
      if(io_output_valid)begin
        locked <= 1'b1;
      end
      if((io_output_valid && io_output_ready))begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module StreamFork_1_ (
  input               io_input_valid,
  output reg          io_input_ready,
  input      [25:0]   io_input_payload_addr,
  input      [2:0]    io_input_payload_id,
  input      [7:0]    io_input_payload_len,
  input      [2:0]    io_input_payload_size,
  input      [1:0]    io_input_payload_burst,
  input               io_input_payload_write,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [25:0]   io_outputs_0_payload_addr,
  output     [2:0]    io_outputs_0_payload_id,
  output     [7:0]    io_outputs_0_payload_len,
  output     [2:0]    io_outputs_0_payload_size,
  output     [1:0]    io_outputs_0_payload_burst,
  output              io_outputs_0_payload_write,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [25:0]   io_outputs_1_payload_addr,
  output     [2:0]    io_outputs_1_payload_id,
  output     [7:0]    io_outputs_1_payload_len,
  output     [2:0]    io_outputs_1_payload_size,
  output     [1:0]    io_outputs_1_payload_burst,
  output              io_outputs_1_payload_write,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  reg                 _zz_1_;
  reg                 _zz_2_;

  always @ (*) begin
    io_input_ready = 1'b1;
    if(((! io_outputs_0_ready) && _zz_1_))begin
      io_input_ready = 1'b0;
    end
    if(((! io_outputs_1_ready) && _zz_2_))begin
      io_input_ready = 1'b0;
    end
  end

  assign io_outputs_0_valid = (io_input_valid && _zz_1_);
  assign io_outputs_0_payload_addr = io_input_payload_addr;
  assign io_outputs_0_payload_id = io_input_payload_id;
  assign io_outputs_0_payload_len = io_input_payload_len;
  assign io_outputs_0_payload_size = io_input_payload_size;
  assign io_outputs_0_payload_burst = io_input_payload_burst;
  assign io_outputs_0_payload_write = io_input_payload_write;
  assign io_outputs_1_valid = (io_input_valid && _zz_2_);
  assign io_outputs_1_payload_addr = io_input_payload_addr;
  assign io_outputs_1_payload_id = io_input_payload_id;
  assign io_outputs_1_payload_len = io_input_payload_len;
  assign io_outputs_1_payload_size = io_input_payload_size;
  assign io_outputs_1_payload_burst = io_input_payload_burst;
  assign io_outputs_1_payload_write = io_input_payload_write;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      _zz_1_ <= 1'b1;
      _zz_2_ <= 1'b1;
    end else begin
      if((io_outputs_0_valid && io_outputs_0_ready))begin
        _zz_1_ <= 1'b0;
      end
      if((io_outputs_1_valid && io_outputs_1_ready))begin
        _zz_2_ <= 1'b0;
      end
      if(io_input_ready)begin
        _zz_1_ <= 1'b1;
        _zz_2_ <= 1'b1;
      end
    end
  end


endmodule
//StreamFifoLowLatency_3_ replaced by StreamFifoLowLatency_2_

module StreamArbiter_2_ (
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input      [19:0]   io_inputs_0_payload_addr,
  input      [3:0]    io_inputs_0_payload_id,
  input      [7:0]    io_inputs_0_payload_len,
  input      [2:0]    io_inputs_0_payload_size,
  input      [1:0]    io_inputs_0_payload_burst,
  input               io_inputs_0_payload_write,
  output              io_output_valid,
  input               io_output_ready,
  output     [19:0]   io_output_payload_addr,
  output     [3:0]    io_output_payload_id,
  output     [7:0]    io_output_payload_len,
  output     [2:0]    io_output_payload_size,
  output     [1:0]    io_output_payload_burst,
  output              io_output_payload_write,
  output     [0:0]    io_chosenOH,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  wire       [1:0]    _zz_4_;
  wire       [0:0]    _zz_5_;
  wire       [1:0]    _zz_6_;
  wire       [0:0]    _zz_7_;
  wire       [0:0]    _zz_8_;
  reg                 locked;
  wire                maskProposal_0;
  reg                 maskLocked_0;
  wire                maskRouted_0;
  wire       [0:0]    _zz_1_;
  wire       [1:0]    _zz_2_;
  wire       [1:0]    _zz_3_;

  assign _zz_4_ = (_zz_2_ - _zz_6_);
  assign _zz_5_ = maskLocked_0;
  assign _zz_6_ = {1'd0, _zz_5_};
  assign _zz_7_ = _zz_8_[0 : 0];
  assign _zz_8_ = (_zz_3_[1 : 1] | _zz_3_[0 : 0]);
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign _zz_1_ = io_inputs_0_valid;
  assign _zz_2_ = {_zz_1_,_zz_1_};
  assign _zz_3_ = (_zz_2_ & (~ _zz_4_));
  assign maskProposal_0 = _zz_7_[0];
  assign io_output_valid = (io_inputs_0_valid && maskRouted_0);
  assign io_output_payload_addr = io_inputs_0_payload_addr;
  assign io_output_payload_id = io_inputs_0_payload_id;
  assign io_output_payload_len = io_inputs_0_payload_len;
  assign io_output_payload_size = io_inputs_0_payload_size;
  assign io_output_payload_burst = io_inputs_0_payload_burst;
  assign io_output_payload_write = io_inputs_0_payload_write;
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_chosenOH = maskRouted_0;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b1;
    end else begin
      if(io_output_valid)begin
        maskLocked_0 <= maskRouted_0;
      end
      if(io_output_valid)begin
        locked <= 1'b1;
      end
      if((io_output_valid && io_output_ready))begin
        locked <= 1'b0;
      end
    end
  end


endmodule

module StreamFork_2_ (
  input               io_input_valid,
  output reg          io_input_ready,
  input      [19:0]   io_input_payload_addr,
  input      [3:0]    io_input_payload_id,
  input      [7:0]    io_input_payload_len,
  input      [2:0]    io_input_payload_size,
  input      [1:0]    io_input_payload_burst,
  input               io_input_payload_write,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [19:0]   io_outputs_0_payload_addr,
  output     [3:0]    io_outputs_0_payload_id,
  output     [7:0]    io_outputs_0_payload_len,
  output     [2:0]    io_outputs_0_payload_size,
  output     [1:0]    io_outputs_0_payload_burst,
  output              io_outputs_0_payload_write,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [19:0]   io_outputs_1_payload_addr,
  output     [3:0]    io_outputs_1_payload_id,
  output     [7:0]    io_outputs_1_payload_len,
  output     [2:0]    io_outputs_1_payload_size,
  output     [1:0]    io_outputs_1_payload_burst,
  output              io_outputs_1_payload_write,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  reg                 _zz_1_;
  reg                 _zz_2_;

  always @ (*) begin
    io_input_ready = 1'b1;
    if(((! io_outputs_0_ready) && _zz_1_))begin
      io_input_ready = 1'b0;
    end
    if(((! io_outputs_1_ready) && _zz_2_))begin
      io_input_ready = 1'b0;
    end
  end

  assign io_outputs_0_valid = (io_input_valid && _zz_1_);
  assign io_outputs_0_payload_addr = io_input_payload_addr;
  assign io_outputs_0_payload_id = io_input_payload_id;
  assign io_outputs_0_payload_len = io_input_payload_len;
  assign io_outputs_0_payload_size = io_input_payload_size;
  assign io_outputs_0_payload_burst = io_input_payload_burst;
  assign io_outputs_0_payload_write = io_input_payload_write;
  assign io_outputs_1_valid = (io_input_valid && _zz_2_);
  assign io_outputs_1_payload_addr = io_input_payload_addr;
  assign io_outputs_1_payload_id = io_input_payload_id;
  assign io_outputs_1_payload_len = io_input_payload_len;
  assign io_outputs_1_payload_size = io_input_payload_size;
  assign io_outputs_1_payload_burst = io_input_payload_burst;
  assign io_outputs_1_payload_write = io_input_payload_write;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      _zz_1_ <= 1'b1;
      _zz_2_ <= 1'b1;
    end else begin
      if((io_outputs_0_valid && io_outputs_0_ready))begin
        _zz_1_ <= 1'b0;
      end
      if((io_outputs_1_valid && io_outputs_1_ready))begin
        _zz_2_ <= 1'b0;
      end
      if(io_input_ready)begin
        _zz_1_ <= 1'b1;
        _zz_2_ <= 1'b1;
      end
    end
  end


endmodule
//StreamFifoLowLatency_4_ replaced by StreamFifoLowLatency_2_

module BufferCC_3_ (
  input               io_dataIn,
  output              io_dataOut,
  input               io_mainClk 
);
  reg                 buffers_0;
  reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @ (posedge io_mainClk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module Axi4SharedOnChipRam (
  input               io_axi_arw_valid,
  output reg          io_axi_arw_ready,
  input      [17:0]   io_axi_arw_payload_addr,
  input      [3:0]    io_axi_arw_payload_id,
  input      [7:0]    io_axi_arw_payload_len,
  input      [2:0]    io_axi_arw_payload_size,
  input      [1:0]    io_axi_arw_payload_burst,
  input               io_axi_arw_payload_write,
  input               io_axi_w_valid,
  output              io_axi_w_ready,
  input      [31:0]   io_axi_w_payload_data,
  input      [3:0]    io_axi_w_payload_strb,
  input               io_axi_w_payload_last,
  output              io_axi_b_valid,
  input               io_axi_b_ready,
  output     [3:0]    io_axi_b_payload_id,
  output     [1:0]    io_axi_b_payload_resp,
  output              io_axi_r_valid,
  input               io_axi_r_ready,
  output     [31:0]   io_axi_r_payload_data,
  output     [3:0]    io_axi_r_payload_id,
  output     [1:0]    io_axi_r_payload_resp,
  output              io_axi_r_payload_last,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  reg        [31:0]   _zz_6_;
  reg        [11:0]   _zz_7_;
  wire                _zz_8_;
  wire       [1:0]    _zz_9_;
  wire       [11:0]   _zz_10_;
  wire       [11:0]   _zz_11_;
  wire       [11:0]   _zz_12_;
  wire       [2:0]    _zz_13_;
  wire       [2:0]    _zz_14_;
  reg                 unburstify_result_valid;
  wire                unburstify_result_ready;
  reg                 unburstify_result_payload_last;
  reg        [17:0]   unburstify_result_payload_fragment_addr;
  reg        [3:0]    unburstify_result_payload_fragment_id;
  reg        [2:0]    unburstify_result_payload_fragment_size;
  reg        [1:0]    unburstify_result_payload_fragment_burst;
  reg                 unburstify_result_payload_fragment_write;
  wire                unburstify_doResult;
  reg                 unburstify_buffer_valid;
  reg        [7:0]    unburstify_buffer_len;
  reg        [7:0]    unburstify_buffer_beat;
  reg        [17:0]   unburstify_buffer_transaction_addr;
  reg        [3:0]    unburstify_buffer_transaction_id;
  reg        [2:0]    unburstify_buffer_transaction_size;
  reg        [1:0]    unburstify_buffer_transaction_burst;
  reg                 unburstify_buffer_transaction_write;
  wire                unburstify_buffer_last;
  wire       [1:0]    Axi4Incr_validSize;
  reg        [17:0]   Axi4Incr_result;
  wire       [5:0]    Axi4Incr_highCat;
  wire       [2:0]    Axi4Incr_sizeValue;
  wire       [11:0]   Axi4Incr_alignMask;
  wire       [11:0]   Axi4Incr_base;
  wire       [11:0]   Axi4Incr_baseIncr;
  reg        [1:0]    _zz_1_;
  wire       [2:0]    Axi4Incr_wrapCase;
  wire                _zz_2_;
  wire                stage0_valid;
  wire                stage0_ready;
  wire                stage0_payload_last;
  wire       [17:0]   stage0_payload_fragment_addr;
  wire       [3:0]    stage0_payload_fragment_id;
  wire       [2:0]    stage0_payload_fragment_size;
  wire       [1:0]    stage0_payload_fragment_burst;
  wire                stage0_payload_fragment_write;
  wire       [15:0]   _zz_3_;
  wire                _zz_4_;
  wire       [31:0]   _zz_5_;
  wire                stage1_valid;
  wire                stage1_ready;
  wire                stage1_payload_last;
  wire       [17:0]   stage1_payload_fragment_addr;
  wire       [3:0]    stage1_payload_fragment_id;
  wire       [2:0]    stage1_payload_fragment_size;
  wire       [1:0]    stage1_payload_fragment_burst;
  wire                stage1_payload_fragment_write;
  reg                 stage0_m2sPipe_rValid;
  reg                 stage0_m2sPipe_rData_last;
  reg        [17:0]   stage0_m2sPipe_rData_fragment_addr;
  reg        [3:0]    stage0_m2sPipe_rData_fragment_id;
  reg        [2:0]    stage0_m2sPipe_rData_fragment_size;
  reg        [1:0]    stage0_m2sPipe_rData_fragment_burst;
  reg                 stage0_m2sPipe_rData_fragment_write;
  reg [7:0] ram_symbol0 [0:45055];
  reg [7:0] ram_symbol1 [0:45055];
  reg [7:0] ram_symbol2 [0:45055];
  reg [7:0] ram_symbol3 [0:45055];
  reg [7:0] _zz_15_;
  reg [7:0] _zz_16_;
  reg [7:0] _zz_17_;
  reg [7:0] _zz_18_;

  assign _zz_8_ = (io_axi_arw_payload_len == 8'h0);
  assign _zz_9_ = {((2'b01) < Axi4Incr_validSize),((2'b00) < Axi4Incr_validSize)};
  assign _zz_10_ = unburstify_buffer_transaction_addr[11 : 0];
  assign _zz_11_ = _zz_10_;
  assign _zz_12_ = {9'd0, Axi4Incr_sizeValue};
  assign _zz_13_ = {1'd0, Axi4Incr_validSize};
  assign _zz_14_ = {1'd0, _zz_1_};
  always @ (*) begin
    _zz_6_ = {_zz_18_, _zz_17_, _zz_16_, _zz_15_};
  end
  always @ (posedge io_mainClk) begin
    if(_zz_4_) begin
      _zz_15_ <= ram_symbol0[_zz_3_];
      _zz_16_ <= ram_symbol1[_zz_3_];
      _zz_17_ <= ram_symbol2[_zz_3_];
      _zz_18_ <= ram_symbol3[_zz_3_];
    end
  end

  always @ (posedge io_mainClk) begin
    if(io_axi_w_payload_strb[0] && _zz_4_ && stage0_payload_fragment_write ) begin
      ram_symbol0[_zz_3_] <= _zz_5_[7 : 0];
    end
    if(io_axi_w_payload_strb[1] && _zz_4_ && stage0_payload_fragment_write ) begin
      ram_symbol1[_zz_3_] <= _zz_5_[15 : 8];
    end
    if(io_axi_w_payload_strb[2] && _zz_4_ && stage0_payload_fragment_write ) begin
      ram_symbol2[_zz_3_] <= _zz_5_[23 : 16];
    end
    if(io_axi_w_payload_strb[3] && _zz_4_ && stage0_payload_fragment_write ) begin
      ram_symbol3[_zz_3_] <= _zz_5_[31 : 24];
    end
  end

  always @(*) begin
    case(Axi4Incr_wrapCase)
      3'b000 : begin
        _zz_7_ = {Axi4Incr_base[11 : 1],Axi4Incr_baseIncr[0 : 0]};
      end
      3'b001 : begin
        _zz_7_ = {Axi4Incr_base[11 : 2],Axi4Incr_baseIncr[1 : 0]};
      end
      3'b010 : begin
        _zz_7_ = {Axi4Incr_base[11 : 3],Axi4Incr_baseIncr[2 : 0]};
      end
      3'b011 : begin
        _zz_7_ = {Axi4Incr_base[11 : 4],Axi4Incr_baseIncr[3 : 0]};
      end
      3'b100 : begin
        _zz_7_ = {Axi4Incr_base[11 : 5],Axi4Incr_baseIncr[4 : 0]};
      end
      default : begin
        _zz_7_ = {Axi4Incr_base[11 : 6],Axi4Incr_baseIncr[5 : 0]};
      end
    endcase
  end

  assign unburstify_buffer_last = (unburstify_buffer_beat == 8'h01);
  assign Axi4Incr_validSize = unburstify_buffer_transaction_size[1 : 0];
  assign Axi4Incr_highCat = unburstify_buffer_transaction_addr[17 : 12];
  assign Axi4Incr_sizeValue = {((2'b10) == Axi4Incr_validSize),{((2'b01) == Axi4Incr_validSize),((2'b00) == Axi4Incr_validSize)}};
  assign Axi4Incr_alignMask = {10'd0, _zz_9_};
  assign Axi4Incr_base = (_zz_11_ & (~ Axi4Incr_alignMask));
  assign Axi4Incr_baseIncr = (Axi4Incr_base + _zz_12_);
  always @ (*) begin
    if((((unburstify_buffer_len & 8'h08) == 8'h08))) begin
        _zz_1_ = (2'b11);
    end else if((((unburstify_buffer_len & 8'h04) == 8'h04))) begin
        _zz_1_ = (2'b10);
    end else if((((unburstify_buffer_len & 8'h02) == 8'h02))) begin
        _zz_1_ = (2'b01);
    end else begin
        _zz_1_ = (2'b00);
    end
  end

  assign Axi4Incr_wrapCase = (_zz_13_ + _zz_14_);
  always @ (*) begin
    case(unburstify_buffer_transaction_burst)
      2'b00 : begin
        Axi4Incr_result = unburstify_buffer_transaction_addr;
      end
      2'b10 : begin
        Axi4Incr_result = {Axi4Incr_highCat,_zz_7_};
      end
      default : begin
        Axi4Incr_result = {Axi4Incr_highCat,Axi4Incr_baseIncr};
      end
    endcase
  end

  always @ (*) begin
    io_axi_arw_ready = 1'b0;
    if(! unburstify_buffer_valid) begin
      io_axi_arw_ready = unburstify_result_ready;
    end
  end

  always @ (*) begin
    if(unburstify_buffer_valid)begin
      unburstify_result_valid = 1'b1;
    end else begin
      unburstify_result_valid = io_axi_arw_valid;
    end
  end

  always @ (*) begin
    if(unburstify_buffer_valid)begin
      unburstify_result_payload_last = unburstify_buffer_last;
    end else begin
      if(_zz_8_)begin
        unburstify_result_payload_last = 1'b1;
      end else begin
        unburstify_result_payload_last = 1'b0;
      end
    end
  end

  always @ (*) begin
    if(unburstify_buffer_valid)begin
      unburstify_result_payload_fragment_id = unburstify_buffer_transaction_id;
    end else begin
      unburstify_result_payload_fragment_id = io_axi_arw_payload_id;
    end
  end

  always @ (*) begin
    if(unburstify_buffer_valid)begin
      unburstify_result_payload_fragment_size = unburstify_buffer_transaction_size;
    end else begin
      unburstify_result_payload_fragment_size = io_axi_arw_payload_size;
    end
  end

  always @ (*) begin
    if(unburstify_buffer_valid)begin
      unburstify_result_payload_fragment_burst = unburstify_buffer_transaction_burst;
    end else begin
      unburstify_result_payload_fragment_burst = io_axi_arw_payload_burst;
    end
  end

  always @ (*) begin
    if(unburstify_buffer_valid)begin
      unburstify_result_payload_fragment_write = unburstify_buffer_transaction_write;
    end else begin
      unburstify_result_payload_fragment_write = io_axi_arw_payload_write;
    end
  end

  always @ (*) begin
    if(unburstify_buffer_valid)begin
      unburstify_result_payload_fragment_addr = Axi4Incr_result;
    end else begin
      unburstify_result_payload_fragment_addr = io_axi_arw_payload_addr;
    end
  end

  assign _zz_2_ = (! (unburstify_result_payload_fragment_write && (! io_axi_w_valid)));
  assign stage0_valid = (unburstify_result_valid && _zz_2_);
  assign unburstify_result_ready = (stage0_ready && _zz_2_);
  assign stage0_payload_last = unburstify_result_payload_last;
  assign stage0_payload_fragment_addr = unburstify_result_payload_fragment_addr;
  assign stage0_payload_fragment_id = unburstify_result_payload_fragment_id;
  assign stage0_payload_fragment_size = unburstify_result_payload_fragment_size;
  assign stage0_payload_fragment_burst = unburstify_result_payload_fragment_burst;
  assign stage0_payload_fragment_write = unburstify_result_payload_fragment_write;
  assign _zz_3_ = stage0_payload_fragment_addr[17 : 2];
  assign _zz_4_ = (stage0_valid && stage0_ready);
  assign _zz_5_ = io_axi_w_payload_data;
  assign io_axi_r_payload_data = _zz_6_;
  assign io_axi_w_ready = ((unburstify_result_valid && unburstify_result_payload_fragment_write) && stage0_ready);
  assign stage0_ready = ((1'b1 && (! stage1_valid)) || stage1_ready);
  assign stage1_valid = stage0_m2sPipe_rValid;
  assign stage1_payload_last = stage0_m2sPipe_rData_last;
  assign stage1_payload_fragment_addr = stage0_m2sPipe_rData_fragment_addr;
  assign stage1_payload_fragment_id = stage0_m2sPipe_rData_fragment_id;
  assign stage1_payload_fragment_size = stage0_m2sPipe_rData_fragment_size;
  assign stage1_payload_fragment_burst = stage0_m2sPipe_rData_fragment_burst;
  assign stage1_payload_fragment_write = stage0_m2sPipe_rData_fragment_write;
  assign stage1_ready = ((io_axi_r_ready && (! stage1_payload_fragment_write)) || ((io_axi_b_ready || (! stage1_payload_last)) && stage1_payload_fragment_write));
  assign io_axi_r_valid = (stage1_valid && (! stage1_payload_fragment_write));
  assign io_axi_r_payload_id = stage1_payload_fragment_id;
  assign io_axi_r_payload_last = stage1_payload_last;
  assign io_axi_r_payload_resp = (2'b00);
  assign io_axi_b_valid = ((stage1_valid && stage1_payload_fragment_write) && stage1_payload_last);
  assign io_axi_b_payload_resp = (2'b00);
  assign io_axi_b_payload_id = stage1_payload_fragment_id;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      unburstify_buffer_valid <= 1'b0;
      stage0_m2sPipe_rValid <= 1'b0;
    end else begin
      if(unburstify_result_ready)begin
        if(unburstify_buffer_last)begin
          unburstify_buffer_valid <= 1'b0;
        end
      end
      if(! unburstify_buffer_valid) begin
        if(! _zz_8_) begin
          if(unburstify_result_ready)begin
            unburstify_buffer_valid <= io_axi_arw_valid;
          end
        end
      end
      if(stage0_ready)begin
        stage0_m2sPipe_rValid <= stage0_valid;
      end
    end
  end

  always @ (posedge io_mainClk) begin
    if(unburstify_result_ready)begin
      unburstify_buffer_beat <= (unburstify_buffer_beat - 8'h01);
      unburstify_buffer_transaction_addr[11 : 0] <= Axi4Incr_result[11 : 0];
    end
    if(! unburstify_buffer_valid) begin
      if(! _zz_8_) begin
        if(unburstify_result_ready)begin
          unburstify_buffer_transaction_addr <= io_axi_arw_payload_addr;
          unburstify_buffer_transaction_id <= io_axi_arw_payload_id;
          unburstify_buffer_transaction_size <= io_axi_arw_payload_size;
          unburstify_buffer_transaction_burst <= io_axi_arw_payload_burst;
          unburstify_buffer_transaction_write <= io_axi_arw_payload_write;
          unburstify_buffer_beat <= io_axi_arw_payload_len;
          unburstify_buffer_len <= io_axi_arw_payload_len;
        end
      end
    end
    if(stage0_ready)begin
      stage0_m2sPipe_rData_last <= stage0_payload_last;
      stage0_m2sPipe_rData_fragment_addr <= stage0_payload_fragment_addr;
      stage0_m2sPipe_rData_fragment_id <= stage0_payload_fragment_id;
      stage0_m2sPipe_rData_fragment_size <= stage0_payload_fragment_size;
      stage0_m2sPipe_rData_fragment_burst <= stage0_payload_fragment_burst;
      stage0_m2sPipe_rData_fragment_write <= stage0_payload_fragment_write;
    end
  end


endmodule

module Axi4SharedSdramCtrl (
  input               io_axi_arw_valid,
  output reg          io_axi_arw_ready,
  input      [25:0]   io_axi_arw_payload_addr,
  input      [3:0]    io_axi_arw_payload_id,
  input      [7:0]    io_axi_arw_payload_len,
  input      [2:0]    io_axi_arw_payload_size,
  input      [1:0]    io_axi_arw_payload_burst,
  input               io_axi_arw_payload_write,
  input               io_axi_w_valid,
  output              io_axi_w_ready,
  input      [31:0]   io_axi_w_payload_data,
  input      [3:0]    io_axi_w_payload_strb,
  input               io_axi_w_payload_last,
  output              io_axi_b_valid,
  input               io_axi_b_ready,
  output     [3:0]    io_axi_b_payload_id,
  output     [1:0]    io_axi_b_payload_resp,
  output              io_axi_r_valid,
  input               io_axi_r_ready,
  output     [31:0]   io_axi_r_payload_data,
  output     [3:0]    io_axi_r_payload_id,
  output     [1:0]    io_axi_r_payload_resp,
  output              io_axi_r_payload_last,
  output     [12:0]   io_sdram_ADDR,
  output     [1:0]    io_sdram_BA,
  input      [15:0]   io_sdram_DQ_read,
  output     [15:0]   io_sdram_DQ_write,
  output     [15:0]   io_sdram_DQ_writeEnable,
  output     [1:0]    io_sdram_DQM,
  output              io_sdram_CASn,
  output              io_sdram_CKE,
  output              io_sdram_CSn,
  output              io_sdram_RASn,
  output              io_sdram_WEn,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  wire       [24:0]   _zz_11_;
  wire       [15:0]   _zz_12_;
  wire       [1:0]    _zz_13_;
  wire                _zz_14_;
  reg        [15:0]   _zz_15_;
  reg        [1:0]    _zz_16_;
  reg        [11:0]   _zz_17_;
  wire                ctrl_io_bus_cmd_ready;
  wire                ctrl_io_bus_rsp_valid;
  wire       [15:0]   ctrl_io_bus_rsp_payload_data;
  wire       [3:0]    ctrl_io_bus_rsp_payload_context_id;
  wire                ctrl_io_bus_rsp_payload_context_last;
  wire       [12:0]   ctrl_io_sdram_ADDR;
  wire       [1:0]    ctrl_io_sdram_BA;
  wire                ctrl_io_sdram_CASn;
  wire                ctrl_io_sdram_CKE;
  wire                ctrl_io_sdram_CSn;
  wire       [1:0]    ctrl_io_sdram_DQM;
  wire                ctrl_io_sdram_RASn;
  wire                ctrl_io_sdram_WEn;
  wire       [15:0]   ctrl_io_sdram_DQ_write;
  wire       [15:0]   ctrl_io_sdram_DQ_writeEnable;
  wire                _zz_18_;
  wire       [1:0]    _zz_19_;
  wire       [11:0]   _zz_20_;
  wire       [11:0]   _zz_21_;
  wire       [11:0]   _zz_22_;
  wire       [2:0]    _zz_23_;
  wire       [2:0]    _zz_24_;
  wire                ctrlBusAdapted_cmd_valid;
  wire                ctrlBusAdapted_cmd_ready;
  wire       [23:0]   ctrlBusAdapted_cmd_payload_address;
  wire                ctrlBusAdapted_cmd_payload_write;
  wire       [31:0]   ctrlBusAdapted_cmd_payload_data;
  wire       [3:0]    ctrlBusAdapted_cmd_payload_mask;
  wire       [3:0]    ctrlBusAdapted_cmd_payload_context_id;
  wire                ctrlBusAdapted_cmd_payload_context_last;
  wire                ctrlBusAdapted_rsp_valid;
  wire                ctrlBusAdapted_rsp_ready;
  wire       [31:0]   ctrlBusAdapted_rsp_payload_data;
  wire       [3:0]    ctrlBusAdapted_rsp_payload_context_id;
  wire                ctrlBusAdapted_rsp_payload_context_last;
  reg                 _zz_1_;
  reg        [0:0]    _zz_2_;
  reg        [0:0]    _zz_3_;
  wire                _zz_4_;
  reg                 _zz_5_;
  reg        [0:0]    _zz_6_;
  reg        [0:0]    _zz_7_;
  wire                _zz_8_;
  reg        [15:0]   ctrl_io_bus_rsp_payload_data_regNextWhen;
  reg                 unburstify_result_valid;
  wire                unburstify_result_ready;
  reg                 unburstify_result_payload_last;
  reg        [25:0]   unburstify_result_payload_fragment_addr;
  reg        [3:0]    unburstify_result_payload_fragment_id;
  reg        [2:0]    unburstify_result_payload_fragment_size;
  reg        [1:0]    unburstify_result_payload_fragment_burst;
  reg                 unburstify_result_payload_fragment_write;
  wire                unburstify_doResult;
  reg                 unburstify_buffer_valid;
  reg        [7:0]    unburstify_buffer_len;
  reg        [7:0]    unburstify_buffer_beat;
  reg        [25:0]   unburstify_buffer_transaction_addr;
  reg        [3:0]    unburstify_buffer_transaction_id;
  reg        [2:0]    unburstify_buffer_transaction_size;
  reg        [1:0]    unburstify_buffer_transaction_burst;
  reg                 unburstify_buffer_transaction_write;
  wire                unburstify_buffer_last;
  wire       [1:0]    Axi4Incr_validSize;
  reg        [25:0]   Axi4Incr_result;
  wire       [13:0]   Axi4Incr_highCat;
  wire       [2:0]    Axi4Incr_sizeValue;
  wire       [11:0]   Axi4Incr_alignMask;
  wire       [11:0]   Axi4Incr_base;
  wire       [11:0]   Axi4Incr_baseIncr;
  reg        [1:0]    _zz_9_;
  wire       [2:0]    Axi4Incr_wrapCase;
  wire                _zz_10_;
  wire                bridge_axiCmd_valid;
  wire                bridge_axiCmd_ready;
  wire                bridge_axiCmd_payload_last;
  wire       [25:0]   bridge_axiCmd_payload_fragment_addr;
  wire       [3:0]    bridge_axiCmd_payload_fragment_id;
  wire       [2:0]    bridge_axiCmd_payload_fragment_size;
  wire       [1:0]    bridge_axiCmd_payload_fragment_burst;
  wire                bridge_axiCmd_payload_fragment_write;
  wire                bridge_writeRsp_valid;
  wire                bridge_writeRsp_ready;
  wire       [3:0]    bridge_writeRsp_payload_id;
  wire       [1:0]    bridge_writeRsp_payload_resp;
  wire                bridge_writeRsp_m2sPipe_valid;
  wire                bridge_writeRsp_m2sPipe_ready;
  wire       [3:0]    bridge_writeRsp_m2sPipe_payload_id;
  wire       [1:0]    bridge_writeRsp_m2sPipe_payload_resp;
  reg                 bridge_writeRsp_m2sPipe_rValid;
  reg        [3:0]    bridge_writeRsp_m2sPipe_rData_id;
  reg        [1:0]    bridge_writeRsp_m2sPipe_rData_resp;

  assign _zz_18_ = (io_axi_arw_payload_len == 8'h0);
  assign _zz_19_ = {((2'b01) < Axi4Incr_validSize),((2'b00) < Axi4Incr_validSize)};
  assign _zz_20_ = unburstify_buffer_transaction_addr[11 : 0];
  assign _zz_21_ = _zz_20_;
  assign _zz_22_ = {9'd0, Axi4Incr_sizeValue};
  assign _zz_23_ = {1'd0, Axi4Incr_validSize};
  assign _zz_24_ = {1'd0, _zz_9_};
  SdramCtrl ctrl ( 
    .io_bus_cmd_valid                   (ctrlBusAdapted_cmd_valid                    ), //i
    .io_bus_cmd_ready                   (ctrl_io_bus_cmd_ready                       ), //o
    .io_bus_cmd_payload_address         (_zz_11_[24:0]                               ), //i
    .io_bus_cmd_payload_write           (ctrlBusAdapted_cmd_payload_write            ), //i
    .io_bus_cmd_payload_data            (_zz_12_[15:0]                               ), //i
    .io_bus_cmd_payload_mask            (_zz_13_[1:0]                                ), //i
    .io_bus_cmd_payload_context_id      (ctrlBusAdapted_cmd_payload_context_id[3:0]  ), //i
    .io_bus_cmd_payload_context_last    (ctrlBusAdapted_cmd_payload_context_last     ), //i
    .io_bus_rsp_valid                   (ctrl_io_bus_rsp_valid                       ), //o
    .io_bus_rsp_ready                   (_zz_14_                                     ), //i
    .io_bus_rsp_payload_data            (ctrl_io_bus_rsp_payload_data[15:0]          ), //o
    .io_bus_rsp_payload_context_id      (ctrl_io_bus_rsp_payload_context_id[3:0]     ), //o
    .io_bus_rsp_payload_context_last    (ctrl_io_bus_rsp_payload_context_last        ), //o
    .io_sdram_ADDR                      (ctrl_io_sdram_ADDR[12:0]                    ), //o
    .io_sdram_BA                        (ctrl_io_sdram_BA[1:0]                       ), //o
    .io_sdram_DQ_read                   (io_sdram_DQ_read[15:0]                      ), //i
    .io_sdram_DQ_write                  (ctrl_io_sdram_DQ_write[15:0]                ), //o
    .io_sdram_DQ_writeEnable            (ctrl_io_sdram_DQ_writeEnable[15:0]          ), //o
    .io_sdram_DQM                       (ctrl_io_sdram_DQM[1:0]                      ), //o
    .io_sdram_CASn                      (ctrl_io_sdram_CASn                          ), //o
    .io_sdram_CKE                       (ctrl_io_sdram_CKE                           ), //o
    .io_sdram_CSn                       (ctrl_io_sdram_CSn                           ), //o
    .io_sdram_RASn                      (ctrl_io_sdram_RASn                          ), //o
    .io_sdram_WEn                       (ctrl_io_sdram_WEn                           ), //o
    .io_mainClk                         (io_mainClk                                  ), //i
    .resetCtrl_axiReset                 (resetCtrl_axiReset                          )  //i
  );
  always @(*) begin
    case(_zz_3_)
      1'b0 : begin
        _zz_15_ = ctrlBusAdapted_cmd_payload_data[15 : 0];
        _zz_16_ = ctrlBusAdapted_cmd_payload_mask[1 : 0];
      end
      default : begin
        _zz_15_ = ctrlBusAdapted_cmd_payload_data[31 : 16];
        _zz_16_ = ctrlBusAdapted_cmd_payload_mask[3 : 2];
      end
    endcase
  end

  always @(*) begin
    case(Axi4Incr_wrapCase)
      3'b000 : begin
        _zz_17_ = {Axi4Incr_base[11 : 1],Axi4Incr_baseIncr[0 : 0]};
      end
      3'b001 : begin
        _zz_17_ = {Axi4Incr_base[11 : 2],Axi4Incr_baseIncr[1 : 0]};
      end
      3'b010 : begin
        _zz_17_ = {Axi4Incr_base[11 : 3],Axi4Incr_baseIncr[2 : 0]};
      end
      3'b011 : begin
        _zz_17_ = {Axi4Incr_base[11 : 4],Axi4Incr_baseIncr[3 : 0]};
      end
      3'b100 : begin
        _zz_17_ = {Axi4Incr_base[11 : 5],Axi4Incr_baseIncr[4 : 0]};
      end
      default : begin
        _zz_17_ = {Axi4Incr_base[11 : 6],Axi4Incr_baseIncr[5 : 0]};
      end
    endcase
  end

  always @ (*) begin
    _zz_1_ = 1'b0;
    if((ctrlBusAdapted_cmd_valid && ctrl_io_bus_cmd_ready))begin
      _zz_1_ = 1'b1;
    end
  end

  assign _zz_4_ = (_zz_3_ == (1'b1));
  always @ (*) begin
    _zz_2_ = (_zz_3_ + _zz_1_);
    if(1'b0)begin
      _zz_2_ = (1'b0);
    end
  end

  assign _zz_11_ = {ctrlBusAdapted_cmd_payload_address,_zz_3_};
  assign _zz_12_ = _zz_15_;
  assign _zz_13_ = _zz_16_;
  assign ctrlBusAdapted_cmd_ready = (ctrl_io_bus_cmd_ready && _zz_4_);
  always @ (*) begin
    _zz_5_ = 1'b0;
    if((ctrl_io_bus_rsp_valid && _zz_14_))begin
      _zz_5_ = 1'b1;
    end
  end

  assign _zz_8_ = (_zz_7_ == (1'b1));
  always @ (*) begin
    _zz_6_ = (_zz_7_ + _zz_5_);
    if(1'b0)begin
      _zz_6_ = (1'b0);
    end
  end

  assign ctrlBusAdapted_rsp_valid = (ctrl_io_bus_rsp_valid && _zz_8_);
  assign ctrlBusAdapted_rsp_payload_data = {ctrl_io_bus_rsp_payload_data,ctrl_io_bus_rsp_payload_data_regNextWhen};
  assign ctrlBusAdapted_rsp_payload_context_id = ctrl_io_bus_rsp_payload_context_id;
  assign ctrlBusAdapted_rsp_payload_context_last = ctrl_io_bus_rsp_payload_context_last;
  assign _zz_14_ = (ctrlBusAdapted_rsp_ready || (! _zz_8_));
  assign unburstify_buffer_last = (unburstify_buffer_beat == 8'h01);
  assign Axi4Incr_validSize = unburstify_buffer_transaction_size[1 : 0];
  assign Axi4Incr_highCat = unburstify_buffer_transaction_addr[25 : 12];
  assign Axi4Incr_sizeValue = {((2'b10) == Axi4Incr_validSize),{((2'b01) == Axi4Incr_validSize),((2'b00) == Axi4Incr_validSize)}};
  assign Axi4Incr_alignMask = {10'd0, _zz_19_};
  assign Axi4Incr_base = (_zz_21_ & (~ Axi4Incr_alignMask));
  assign Axi4Incr_baseIncr = (Axi4Incr_base + _zz_22_);
  always @ (*) begin
    if((((unburstify_buffer_len & 8'h08) == 8'h08))) begin
        _zz_9_ = (2'b11);
    end else if((((unburstify_buffer_len & 8'h04) == 8'h04))) begin
        _zz_9_ = (2'b10);
    end else if((((unburstify_buffer_len & 8'h02) == 8'h02))) begin
        _zz_9_ = (2'b01);
    end else begin
        _zz_9_ = (2'b00);
    end
  end

  assign Axi4Incr_wrapCase = (_zz_23_ + _zz_24_);
  always @ (*) begin
    case(unburstify_buffer_transaction_burst)
      2'b00 : begin
        Axi4Incr_result = unburstify_buffer_transaction_addr;
      end
      2'b10 : begin
        Axi4Incr_result = {Axi4Incr_highCat,_zz_17_};
      end
      default : begin
        Axi4Incr_result = {Axi4Incr_highCat,Axi4Incr_baseIncr};
      end
    endcase
  end

  always @ (*) begin
    io_axi_arw_ready = 1'b0;
    if(! unburstify_buffer_valid) begin
      io_axi_arw_ready = unburstify_result_ready;
    end
  end

  always @ (*) begin
    if(unburstify_buffer_valid)begin
      unburstify_result_valid = 1'b1;
    end else begin
      unburstify_result_valid = io_axi_arw_valid;
    end
  end

  always @ (*) begin
    if(unburstify_buffer_valid)begin
      unburstify_result_payload_last = unburstify_buffer_last;
    end else begin
      if(_zz_18_)begin
        unburstify_result_payload_last = 1'b1;
      end else begin
        unburstify_result_payload_last = 1'b0;
      end
    end
  end

  always @ (*) begin
    if(unburstify_buffer_valid)begin
      unburstify_result_payload_fragment_id = unburstify_buffer_transaction_id;
    end else begin
      unburstify_result_payload_fragment_id = io_axi_arw_payload_id;
    end
  end

  always @ (*) begin
    if(unburstify_buffer_valid)begin
      unburstify_result_payload_fragment_size = unburstify_buffer_transaction_size;
    end else begin
      unburstify_result_payload_fragment_size = io_axi_arw_payload_size;
    end
  end

  always @ (*) begin
    if(unburstify_buffer_valid)begin
      unburstify_result_payload_fragment_burst = unburstify_buffer_transaction_burst;
    end else begin
      unburstify_result_payload_fragment_burst = io_axi_arw_payload_burst;
    end
  end

  always @ (*) begin
    if(unburstify_buffer_valid)begin
      unburstify_result_payload_fragment_write = unburstify_buffer_transaction_write;
    end else begin
      unburstify_result_payload_fragment_write = io_axi_arw_payload_write;
    end
  end

  always @ (*) begin
    if(unburstify_buffer_valid)begin
      unburstify_result_payload_fragment_addr = Axi4Incr_result;
    end else begin
      unburstify_result_payload_fragment_addr = io_axi_arw_payload_addr;
    end
  end

  assign _zz_10_ = (! (unburstify_result_payload_fragment_write && (! io_axi_w_valid)));
  assign bridge_axiCmd_valid = (unburstify_result_valid && _zz_10_);
  assign unburstify_result_ready = (bridge_axiCmd_ready && _zz_10_);
  assign bridge_axiCmd_payload_last = unburstify_result_payload_last;
  assign bridge_axiCmd_payload_fragment_addr = unburstify_result_payload_fragment_addr;
  assign bridge_axiCmd_payload_fragment_id = unburstify_result_payload_fragment_id;
  assign bridge_axiCmd_payload_fragment_size = unburstify_result_payload_fragment_size;
  assign bridge_axiCmd_payload_fragment_burst = unburstify_result_payload_fragment_burst;
  assign bridge_axiCmd_payload_fragment_write = unburstify_result_payload_fragment_write;
  assign ctrlBusAdapted_cmd_valid = bridge_axiCmd_valid;
  assign ctrlBusAdapted_cmd_payload_address = bridge_axiCmd_payload_fragment_addr[25 : 2];
  assign ctrlBusAdapted_cmd_payload_write = bridge_axiCmd_payload_fragment_write;
  assign ctrlBusAdapted_cmd_payload_data = io_axi_w_payload_data;
  assign ctrlBusAdapted_cmd_payload_mask = io_axi_w_payload_strb;
  assign ctrlBusAdapted_cmd_payload_context_id = bridge_axiCmd_payload_fragment_id;
  assign ctrlBusAdapted_cmd_payload_context_last = bridge_axiCmd_payload_last;
  assign bridge_writeRsp_valid = (((bridge_axiCmd_valid && bridge_axiCmd_ready) && bridge_axiCmd_payload_fragment_write) && bridge_axiCmd_payload_last);
  assign bridge_writeRsp_payload_resp = (2'b00);
  assign bridge_writeRsp_payload_id = bridge_axiCmd_payload_fragment_id;
  assign bridge_writeRsp_ready = ((1'b1 && (! bridge_writeRsp_m2sPipe_valid)) || bridge_writeRsp_m2sPipe_ready);
  assign bridge_writeRsp_m2sPipe_valid = bridge_writeRsp_m2sPipe_rValid;
  assign bridge_writeRsp_m2sPipe_payload_id = bridge_writeRsp_m2sPipe_rData_id;
  assign bridge_writeRsp_m2sPipe_payload_resp = bridge_writeRsp_m2sPipe_rData_resp;
  assign io_axi_b_valid = bridge_writeRsp_m2sPipe_valid;
  assign bridge_writeRsp_m2sPipe_ready = io_axi_b_ready;
  assign io_axi_b_payload_id = bridge_writeRsp_m2sPipe_payload_id;
  assign io_axi_b_payload_resp = bridge_writeRsp_m2sPipe_payload_resp;
  assign io_axi_r_valid = ctrlBusAdapted_rsp_valid;
  assign io_axi_r_payload_id = ctrlBusAdapted_rsp_payload_context_id;
  assign io_axi_r_payload_data = ctrlBusAdapted_rsp_payload_data;
  assign io_axi_r_payload_last = ctrlBusAdapted_rsp_payload_context_last;
  assign io_axi_r_payload_resp = (2'b00);
  assign io_axi_w_ready = ((unburstify_result_valid && unburstify_result_payload_fragment_write) && bridge_axiCmd_ready);
  assign ctrlBusAdapted_rsp_ready = io_axi_r_ready;
  assign bridge_axiCmd_ready = (ctrlBusAdapted_cmd_ready && (! (bridge_axiCmd_payload_fragment_write && (! bridge_writeRsp_ready))));
  assign io_sdram_ADDR = ctrl_io_sdram_ADDR;
  assign io_sdram_BA = ctrl_io_sdram_BA;
  assign io_sdram_DQ_write = ctrl_io_sdram_DQ_write;
  assign io_sdram_DQ_writeEnable = ctrl_io_sdram_DQ_writeEnable;
  assign io_sdram_DQM = ctrl_io_sdram_DQM;
  assign io_sdram_CASn = ctrl_io_sdram_CASn;
  assign io_sdram_CKE = ctrl_io_sdram_CKE;
  assign io_sdram_CSn = ctrl_io_sdram_CSn;
  assign io_sdram_RASn = ctrl_io_sdram_RASn;
  assign io_sdram_WEn = ctrl_io_sdram_WEn;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      _zz_3_ <= (1'b0);
      _zz_7_ <= (1'b0);
      unburstify_buffer_valid <= 1'b0;
      bridge_writeRsp_m2sPipe_rValid <= 1'b0;
    end else begin
      _zz_3_ <= _zz_2_;
      _zz_7_ <= _zz_6_;
      if(unburstify_result_ready)begin
        if(unburstify_buffer_last)begin
          unburstify_buffer_valid <= 1'b0;
        end
      end
      if(! unburstify_buffer_valid) begin
        if(! _zz_18_) begin
          if(unburstify_result_ready)begin
            unburstify_buffer_valid <= io_axi_arw_valid;
          end
        end
      end
      if(bridge_writeRsp_ready)begin
        bridge_writeRsp_m2sPipe_rValid <= bridge_writeRsp_valid;
      end
    end
  end

  always @ (posedge io_mainClk) begin
    if((ctrl_io_bus_rsp_valid && _zz_14_))begin
      ctrl_io_bus_rsp_payload_data_regNextWhen <= ctrl_io_bus_rsp_payload_data;
    end
    if(unburstify_result_ready)begin
      unburstify_buffer_beat <= (unburstify_buffer_beat - 8'h01);
      unburstify_buffer_transaction_addr[11 : 0] <= Axi4Incr_result[11 : 0];
    end
    if(! unburstify_buffer_valid) begin
      if(! _zz_18_) begin
        if(unburstify_result_ready)begin
          unburstify_buffer_transaction_addr <= io_axi_arw_payload_addr;
          unburstify_buffer_transaction_id <= io_axi_arw_payload_id;
          unburstify_buffer_transaction_size <= io_axi_arw_payload_size;
          unburstify_buffer_transaction_burst <= io_axi_arw_payload_burst;
          unburstify_buffer_transaction_write <= io_axi_arw_payload_write;
          unburstify_buffer_beat <= io_axi_arw_payload_len;
          unburstify_buffer_len <= io_axi_arw_payload_len;
        end
      end
    end
    if(bridge_writeRsp_ready)begin
      bridge_writeRsp_m2sPipe_rData_id <= bridge_writeRsp_payload_id;
      bridge_writeRsp_m2sPipe_rData_resp <= bridge_writeRsp_payload_resp;
    end
  end


endmodule

module Axi4SharedToApb3Bridge (
  input               io_axi_arw_valid,
  output reg          io_axi_arw_ready,
  input      [19:0]   io_axi_arw_payload_addr,
  input      [3:0]    io_axi_arw_payload_id,
  input      [7:0]    io_axi_arw_payload_len,
  input      [2:0]    io_axi_arw_payload_size,
  input      [1:0]    io_axi_arw_payload_burst,
  input               io_axi_arw_payload_write,
  input               io_axi_w_valid,
  output reg          io_axi_w_ready,
  input      [31:0]   io_axi_w_payload_data,
  input      [3:0]    io_axi_w_payload_strb,
  input               io_axi_w_payload_last,
  output reg          io_axi_b_valid,
  input               io_axi_b_ready,
  output     [3:0]    io_axi_b_payload_id,
  output     [1:0]    io_axi_b_payload_resp,
  output reg          io_axi_r_valid,
  input               io_axi_r_ready,
  output     [31:0]   io_axi_r_payload_data,
  output     [3:0]    io_axi_r_payload_id,
  output     [1:0]    io_axi_r_payload_resp,
  output              io_axi_r_payload_last,
  output     [19:0]   io_apb_PADDR,
  output reg [0:0]    io_apb_PSEL,
  output reg          io_apb_PENABLE,
  input               io_apb_PREADY,
  output              io_apb_PWRITE,
  output     [31:0]   io_apb_PWDATA,
  input      [31:0]   io_apb_PRDATA,
  input               io_apb_PSLVERROR,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  wire                _zz_1_;
  reg        `Axi4ToApb3BridgePhase_defaultEncoding_type phase;
  reg                 write;
  reg        [31:0]   readedData;
  reg        [3:0]    id;
  `ifndef SYNTHESIS
  reg [63:0] phase_string;
  `endif


  assign _zz_1_ = (io_axi_arw_valid && ((! io_axi_arw_payload_write) || io_axi_w_valid));
  `ifndef SYNTHESIS
  always @(*) begin
    case(phase)
      `Axi4ToApb3BridgePhase_defaultEncoding_SETUP : phase_string = "SETUP   ";
      `Axi4ToApb3BridgePhase_defaultEncoding_ACCESS_1 : phase_string = "ACCESS_1";
      `Axi4ToApb3BridgePhase_defaultEncoding_RESPONSE : phase_string = "RESPONSE";
      default : phase_string = "????????";
    endcase
  end
  `endif

  always @ (*) begin
    io_axi_arw_ready = 1'b0;
    case(phase)
      `Axi4ToApb3BridgePhase_defaultEncoding_SETUP : begin
      end
      `Axi4ToApb3BridgePhase_defaultEncoding_ACCESS_1 : begin
        if(io_apb_PREADY)begin
          io_axi_arw_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    io_axi_w_ready = 1'b0;
    case(phase)
      `Axi4ToApb3BridgePhase_defaultEncoding_SETUP : begin
      end
      `Axi4ToApb3BridgePhase_defaultEncoding_ACCESS_1 : begin
        if(io_apb_PREADY)begin
          io_axi_w_ready = write;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    io_axi_b_valid = 1'b0;
    case(phase)
      `Axi4ToApb3BridgePhase_defaultEncoding_SETUP : begin
      end
      `Axi4ToApb3BridgePhase_defaultEncoding_ACCESS_1 : begin
      end
      default : begin
        if(write)begin
          io_axi_b_valid = 1'b1;
        end
      end
    endcase
  end

  always @ (*) begin
    io_axi_r_valid = 1'b0;
    case(phase)
      `Axi4ToApb3BridgePhase_defaultEncoding_SETUP : begin
      end
      `Axi4ToApb3BridgePhase_defaultEncoding_ACCESS_1 : begin
      end
      default : begin
        if(! write) begin
          io_axi_r_valid = 1'b1;
        end
      end
    endcase
  end

  always @ (*) begin
    io_apb_PSEL[0] = 1'b0;
    case(phase)
      `Axi4ToApb3BridgePhase_defaultEncoding_SETUP : begin
        if(_zz_1_)begin
          io_apb_PSEL[0] = 1'b1;
        end
      end
      `Axi4ToApb3BridgePhase_defaultEncoding_ACCESS_1 : begin
        io_apb_PSEL[0] = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    io_apb_PENABLE = 1'b0;
    case(phase)
      `Axi4ToApb3BridgePhase_defaultEncoding_SETUP : begin
      end
      `Axi4ToApb3BridgePhase_defaultEncoding_ACCESS_1 : begin
        io_apb_PENABLE = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign io_apb_PADDR = io_axi_arw_payload_addr;
  assign io_apb_PWDATA = io_axi_w_payload_data;
  assign io_apb_PWRITE = io_axi_arw_payload_write;
  assign io_axi_r_payload_resp = {io_apb_PSLVERROR,(1'b0)};
  assign io_axi_b_payload_resp = {io_apb_PSLVERROR,(1'b0)};
  assign io_axi_r_payload_id = id;
  assign io_axi_b_payload_id = id;
  assign io_axi_r_payload_data = readedData;
  assign io_axi_r_payload_last = 1'b1;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      phase <= `Axi4ToApb3BridgePhase_defaultEncoding_SETUP;
    end else begin
      case(phase)
        `Axi4ToApb3BridgePhase_defaultEncoding_SETUP : begin
          if(_zz_1_)begin
            phase <= `Axi4ToApb3BridgePhase_defaultEncoding_ACCESS_1;
          end
        end
        `Axi4ToApb3BridgePhase_defaultEncoding_ACCESS_1 : begin
          if(io_apb_PREADY)begin
            phase <= `Axi4ToApb3BridgePhase_defaultEncoding_RESPONSE;
          end
        end
        default : begin
          if(write)begin
            if(io_axi_b_ready)begin
              phase <= `Axi4ToApb3BridgePhase_defaultEncoding_SETUP;
            end
          end else begin
            if(io_axi_r_ready)begin
              phase <= `Axi4ToApb3BridgePhase_defaultEncoding_SETUP;
            end
          end
        end
      endcase
    end
  end

  always @ (posedge io_mainClk) begin
    case(phase)
      `Axi4ToApb3BridgePhase_defaultEncoding_SETUP : begin
        write <= io_axi_arw_payload_write;
        id <= io_axi_arw_payload_id;
      end
      `Axi4ToApb3BridgePhase_defaultEncoding_ACCESS_1 : begin
        if(io_apb_PREADY)begin
          readedData <= io_apb_PRDATA;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module PinsecTimerCtrl (
  input      [7:0]    io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  output              io_apb_PSLVERROR,
  input               io_external_clear,
  input               io_external_tick,
  output              io_interrupt,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  wire                _zz_11_;
  wire                _zz_12_;
  wire                _zz_13_;
  wire                _zz_14_;
  wire                _zz_15_;
  wire                _zz_16_;
  wire                _zz_17_;
  wire                _zz_18_;
  reg        [3:0]    _zz_19_;
  reg        [3:0]    _zz_20_;
  wire                io_external_buffercc_io_dataOut_clear;
  wire                io_external_buffercc_io_dataOut_tick;
  wire                prescaler_1__io_overflow;
  wire                timerA_io_full;
  wire       [31:0]   timerA_io_value;
  wire                timerB_io_full;
  wire       [15:0]   timerB_io_value;
  wire                timerC_io_full;
  wire       [15:0]   timerC_io_value;
  wire                timerD_io_full;
  wire       [15:0]   timerD_io_value;
  wire       [3:0]    interruptCtrl_1__io_pendings;
  wire                external_clear;
  wire                external_tick;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg        [15:0]   _zz_1_;
  reg                 _zz_2_;
  reg        [1:0]    timerABridge_ticksEnable;
  reg        [0:0]    timerABridge_clearsEnable;
  reg                 timerABridge_busClearing;
  reg        [31:0]   timerA_io_limit_driver;
  reg                 _zz_3_;
  reg                 _zz_4_;
  reg        [2:0]    timerBBridge_ticksEnable;
  reg        [1:0]    timerBBridge_clearsEnable;
  reg                 timerBBridge_busClearing;
  reg        [15:0]   timerB_io_limit_driver;
  reg                 _zz_5_;
  reg                 _zz_6_;
  reg        [2:0]    timerCBridge_ticksEnable;
  reg        [1:0]    timerCBridge_clearsEnable;
  reg                 timerCBridge_busClearing;
  reg        [15:0]   timerC_io_limit_driver;
  reg                 _zz_7_;
  reg                 _zz_8_;
  reg        [2:0]    timerDBridge_ticksEnable;
  reg        [1:0]    timerDBridge_clearsEnable;
  reg                 timerDBridge_busClearing;
  reg        [15:0]   timerD_io_limit_driver;
  reg                 _zz_9_;
  reg                 _zz_10_;
  reg        [3:0]    interruptCtrl_1__io_masks_driver;

  BufferCC_2_ io_external_buffercc ( 
    .io_dataIn_clear       (io_external_clear                      ), //i
    .io_dataIn_tick        (io_external_tick                       ), //i
    .io_dataOut_clear      (io_external_buffercc_io_dataOut_clear  ), //o
    .io_dataOut_tick       (io_external_buffercc_io_dataOut_tick   ), //o
    .io_mainClk            (io_mainClk                             ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                     )  //i
  );
  Prescaler prescaler_1_ ( 
    .io_clear              (_zz_2_                    ), //i
    .io_limit              (_zz_1_[15:0]              ), //i
    .io_overflow           (prescaler_1__io_overflow  ), //o
    .io_mainClk            (io_mainClk                ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset        )  //i
  );
  Timer timerA ( 
    .io_tick               (_zz_11_                       ), //i
    .io_clear              (_zz_12_                       ), //i
    .io_limit              (timerA_io_limit_driver[31:0]  ), //i
    .io_full               (timerA_io_full                ), //o
    .io_value              (timerA_io_value[31:0]         ), //o
    .io_mainClk            (io_mainClk                    ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset            )  //i
  );
  Timer_1_ timerB ( 
    .io_tick               (_zz_13_                       ), //i
    .io_clear              (_zz_14_                       ), //i
    .io_limit              (timerB_io_limit_driver[15:0]  ), //i
    .io_full               (timerB_io_full                ), //o
    .io_value              (timerB_io_value[15:0]         ), //o
    .io_mainClk            (io_mainClk                    ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset            )  //i
  );
  Timer_1_ timerC ( 
    .io_tick               (_zz_15_                       ), //i
    .io_clear              (_zz_16_                       ), //i
    .io_limit              (timerC_io_limit_driver[15:0]  ), //i
    .io_full               (timerC_io_full                ), //o
    .io_value              (timerC_io_value[15:0]         ), //o
    .io_mainClk            (io_mainClk                    ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset            )  //i
  );
  Timer_1_ timerD ( 
    .io_tick               (_zz_17_                       ), //i
    .io_clear              (_zz_18_                       ), //i
    .io_limit              (timerD_io_limit_driver[15:0]  ), //i
    .io_full               (timerD_io_full                ), //o
    .io_value              (timerD_io_value[15:0]         ), //o
    .io_mainClk            (io_mainClk                    ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset            )  //i
  );
  InterruptCtrl interruptCtrl_1_ ( 
    .io_inputs             (_zz_19_[3:0]                           ), //i
    .io_clears             (_zz_20_[3:0]                           ), //i
    .io_masks              (interruptCtrl_1__io_masks_driver[3:0]  ), //i
    .io_pendings           (interruptCtrl_1__io_pendings[3:0]      ), //o
    .io_mainClk            (io_mainClk                             ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                     )  //i
  );
  assign external_clear = io_external_buffercc_io_dataOut_clear;
  assign external_tick = io_external_buffercc_io_dataOut_tick;
  assign io_apb_PREADY = 1'b1;
  always @ (*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      8'b00000000 : begin
        io_apb_PRDATA[15 : 0] = _zz_1_;
      end
      8'b01000000 : begin
        io_apb_PRDATA[1 : 0] = timerABridge_ticksEnable;
        io_apb_PRDATA[16 : 16] = timerABridge_clearsEnable;
      end
      8'b01000100 : begin
        io_apb_PRDATA[31 : 0] = timerA_io_limit_driver;
      end
      8'b01001000 : begin
        io_apb_PRDATA[31 : 0] = timerA_io_value;
      end
      8'b01010000 : begin
        io_apb_PRDATA[2 : 0] = timerBBridge_ticksEnable;
        io_apb_PRDATA[17 : 16] = timerBBridge_clearsEnable;
      end
      8'b01010100 : begin
        io_apb_PRDATA[15 : 0] = timerB_io_limit_driver;
      end
      8'b01011000 : begin
        io_apb_PRDATA[15 : 0] = timerB_io_value;
      end
      8'b01100000 : begin
        io_apb_PRDATA[2 : 0] = timerCBridge_ticksEnable;
        io_apb_PRDATA[17 : 16] = timerCBridge_clearsEnable;
      end
      8'b01100100 : begin
        io_apb_PRDATA[15 : 0] = timerC_io_limit_driver;
      end
      8'b01101000 : begin
        io_apb_PRDATA[15 : 0] = timerC_io_value;
      end
      8'b01110000 : begin
        io_apb_PRDATA[2 : 0] = timerDBridge_ticksEnable;
        io_apb_PRDATA[17 : 16] = timerDBridge_clearsEnable;
      end
      8'b01110100 : begin
        io_apb_PRDATA[15 : 0] = timerD_io_limit_driver;
      end
      8'b01111000 : begin
        io_apb_PRDATA[15 : 0] = timerD_io_value;
      end
      8'b00010000 : begin
        io_apb_PRDATA[3 : 0] = interruptCtrl_1__io_pendings;
      end
      8'b00010100 : begin
        io_apb_PRDATA[3 : 0] = interruptCtrl_1__io_masks_driver;
      end
      default : begin
      end
    endcase
  end

  assign io_apb_PSLVERROR = 1'b0;
  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  always @ (*) begin
    _zz_2_ = 1'b0;
    case(io_apb_PADDR)
      8'b00000000 : begin
        if(busCtrl_doWrite)begin
          _zz_2_ = 1'b1;
        end
      end
      8'b01000000 : begin
      end
      8'b01000100 : begin
      end
      8'b01001000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b01100000 : begin
      end
      8'b01100100 : begin
      end
      8'b01101000 : begin
      end
      8'b01110000 : begin
      end
      8'b01110100 : begin
      end
      8'b01111000 : begin
      end
      8'b00010000 : begin
      end
      8'b00010100 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    timerABridge_busClearing = 1'b0;
    if(_zz_3_)begin
      timerABridge_busClearing = 1'b1;
    end
    if(_zz_4_)begin
      timerABridge_busClearing = 1'b1;
    end
  end

  always @ (*) begin
    _zz_3_ = 1'b0;
    case(io_apb_PADDR)
      8'b00000000 : begin
      end
      8'b01000000 : begin
      end
      8'b01000100 : begin
        if(busCtrl_doWrite)begin
          _zz_3_ = 1'b1;
        end
      end
      8'b01001000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b01100000 : begin
      end
      8'b01100100 : begin
      end
      8'b01101000 : begin
      end
      8'b01110000 : begin
      end
      8'b01110100 : begin
      end
      8'b01111000 : begin
      end
      8'b00010000 : begin
      end
      8'b00010100 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_4_ = 1'b0;
    case(io_apb_PADDR)
      8'b00000000 : begin
      end
      8'b01000000 : begin
      end
      8'b01000100 : begin
      end
      8'b01001000 : begin
        if(busCtrl_doWrite)begin
          _zz_4_ = 1'b1;
        end
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b01100000 : begin
      end
      8'b01100100 : begin
      end
      8'b01101000 : begin
      end
      8'b01110000 : begin
      end
      8'b01110100 : begin
      end
      8'b01111000 : begin
      end
      8'b00010000 : begin
      end
      8'b00010100 : begin
      end
      default : begin
      end
    endcase
  end

  assign _zz_12_ = (((timerABridge_clearsEnable & timerA_io_full) != (1'b0)) || timerABridge_busClearing);
  assign _zz_11_ = ((timerABridge_ticksEnable & {prescaler_1__io_overflow,1'b1}) != (2'b00));
  always @ (*) begin
    timerBBridge_busClearing = 1'b0;
    if(_zz_5_)begin
      timerBBridge_busClearing = 1'b1;
    end
    if(_zz_6_)begin
      timerBBridge_busClearing = 1'b1;
    end
  end

  always @ (*) begin
    _zz_5_ = 1'b0;
    case(io_apb_PADDR)
      8'b00000000 : begin
      end
      8'b01000000 : begin
      end
      8'b01000100 : begin
      end
      8'b01001000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
        if(busCtrl_doWrite)begin
          _zz_5_ = 1'b1;
        end
      end
      8'b01011000 : begin
      end
      8'b01100000 : begin
      end
      8'b01100100 : begin
      end
      8'b01101000 : begin
      end
      8'b01110000 : begin
      end
      8'b01110100 : begin
      end
      8'b01111000 : begin
      end
      8'b00010000 : begin
      end
      8'b00010100 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_6_ = 1'b0;
    case(io_apb_PADDR)
      8'b00000000 : begin
      end
      8'b01000000 : begin
      end
      8'b01000100 : begin
      end
      8'b01001000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
        if(busCtrl_doWrite)begin
          _zz_6_ = 1'b1;
        end
      end
      8'b01100000 : begin
      end
      8'b01100100 : begin
      end
      8'b01101000 : begin
      end
      8'b01110000 : begin
      end
      8'b01110100 : begin
      end
      8'b01111000 : begin
      end
      8'b00010000 : begin
      end
      8'b00010100 : begin
      end
      default : begin
      end
    endcase
  end

  assign _zz_14_ = (((timerBBridge_clearsEnable & {external_clear,timerB_io_full}) != (2'b00)) || timerBBridge_busClearing);
  assign _zz_13_ = ((timerBBridge_ticksEnable & {external_tick,{prescaler_1__io_overflow,1'b1}}) != (3'b000));
  always @ (*) begin
    timerCBridge_busClearing = 1'b0;
    if(_zz_7_)begin
      timerCBridge_busClearing = 1'b1;
    end
    if(_zz_8_)begin
      timerCBridge_busClearing = 1'b1;
    end
  end

  always @ (*) begin
    _zz_7_ = 1'b0;
    case(io_apb_PADDR)
      8'b00000000 : begin
      end
      8'b01000000 : begin
      end
      8'b01000100 : begin
      end
      8'b01001000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b01100000 : begin
      end
      8'b01100100 : begin
        if(busCtrl_doWrite)begin
          _zz_7_ = 1'b1;
        end
      end
      8'b01101000 : begin
      end
      8'b01110000 : begin
      end
      8'b01110100 : begin
      end
      8'b01111000 : begin
      end
      8'b00010000 : begin
      end
      8'b00010100 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_8_ = 1'b0;
    case(io_apb_PADDR)
      8'b00000000 : begin
      end
      8'b01000000 : begin
      end
      8'b01000100 : begin
      end
      8'b01001000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b01100000 : begin
      end
      8'b01100100 : begin
      end
      8'b01101000 : begin
        if(busCtrl_doWrite)begin
          _zz_8_ = 1'b1;
        end
      end
      8'b01110000 : begin
      end
      8'b01110100 : begin
      end
      8'b01111000 : begin
      end
      8'b00010000 : begin
      end
      8'b00010100 : begin
      end
      default : begin
      end
    endcase
  end

  assign _zz_16_ = (((timerCBridge_clearsEnable & {external_clear,timerC_io_full}) != (2'b00)) || timerCBridge_busClearing);
  assign _zz_15_ = ((timerCBridge_ticksEnable & {external_tick,{prescaler_1__io_overflow,1'b1}}) != (3'b000));
  always @ (*) begin
    timerDBridge_busClearing = 1'b0;
    if(_zz_9_)begin
      timerDBridge_busClearing = 1'b1;
    end
    if(_zz_10_)begin
      timerDBridge_busClearing = 1'b1;
    end
  end

  always @ (*) begin
    _zz_9_ = 1'b0;
    case(io_apb_PADDR)
      8'b00000000 : begin
      end
      8'b01000000 : begin
      end
      8'b01000100 : begin
      end
      8'b01001000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b01100000 : begin
      end
      8'b01100100 : begin
      end
      8'b01101000 : begin
      end
      8'b01110000 : begin
      end
      8'b01110100 : begin
        if(busCtrl_doWrite)begin
          _zz_9_ = 1'b1;
        end
      end
      8'b01111000 : begin
      end
      8'b00010000 : begin
      end
      8'b00010100 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_10_ = 1'b0;
    case(io_apb_PADDR)
      8'b00000000 : begin
      end
      8'b01000000 : begin
      end
      8'b01000100 : begin
      end
      8'b01001000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b01100000 : begin
      end
      8'b01100100 : begin
      end
      8'b01101000 : begin
      end
      8'b01110000 : begin
      end
      8'b01110100 : begin
      end
      8'b01111000 : begin
        if(busCtrl_doWrite)begin
          _zz_10_ = 1'b1;
        end
      end
      8'b00010000 : begin
      end
      8'b00010100 : begin
      end
      default : begin
      end
    endcase
  end

  assign _zz_18_ = (((timerDBridge_clearsEnable & {external_clear,timerD_io_full}) != (2'b00)) || timerDBridge_busClearing);
  assign _zz_17_ = ((timerDBridge_ticksEnable & {external_tick,{prescaler_1__io_overflow,1'b1}}) != (3'b000));
  always @ (*) begin
    _zz_20_ = (4'b0000);
    case(io_apb_PADDR)
      8'b00000000 : begin
      end
      8'b01000000 : begin
      end
      8'b01000100 : begin
      end
      8'b01001000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b01100000 : begin
      end
      8'b01100100 : begin
      end
      8'b01101000 : begin
      end
      8'b01110000 : begin
      end
      8'b01110100 : begin
      end
      8'b01111000 : begin
      end
      8'b00010000 : begin
        if(busCtrl_doWrite)begin
          _zz_20_ = io_apb_PWDATA[3 : 0];
        end
      end
      8'b00010100 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_19_[0] = timerA_io_full;
    _zz_19_[1] = timerB_io_full;
    _zz_19_[2] = timerC_io_full;
    _zz_19_[3] = timerD_io_full;
  end

  assign io_interrupt = (interruptCtrl_1__io_pendings != (4'b0000));
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      timerABridge_ticksEnable <= (2'b00);
      timerABridge_clearsEnable <= (1'b0);
      timerBBridge_ticksEnable <= (3'b000);
      timerBBridge_clearsEnable <= (2'b00);
      timerCBridge_ticksEnable <= (3'b000);
      timerCBridge_clearsEnable <= (2'b00);
      timerDBridge_ticksEnable <= (3'b000);
      timerDBridge_clearsEnable <= (2'b00);
      interruptCtrl_1__io_masks_driver <= (4'b0000);
    end else begin
      case(io_apb_PADDR)
        8'b00000000 : begin
        end
        8'b01000000 : begin
          if(busCtrl_doWrite)begin
            timerABridge_ticksEnable <= io_apb_PWDATA[1 : 0];
            timerABridge_clearsEnable <= io_apb_PWDATA[16 : 16];
          end
        end
        8'b01000100 : begin
        end
        8'b01001000 : begin
        end
        8'b01010000 : begin
          if(busCtrl_doWrite)begin
            timerBBridge_ticksEnable <= io_apb_PWDATA[2 : 0];
            timerBBridge_clearsEnable <= io_apb_PWDATA[17 : 16];
          end
        end
        8'b01010100 : begin
        end
        8'b01011000 : begin
        end
        8'b01100000 : begin
          if(busCtrl_doWrite)begin
            timerCBridge_ticksEnable <= io_apb_PWDATA[2 : 0];
            timerCBridge_clearsEnable <= io_apb_PWDATA[17 : 16];
          end
        end
        8'b01100100 : begin
        end
        8'b01101000 : begin
        end
        8'b01110000 : begin
          if(busCtrl_doWrite)begin
            timerDBridge_ticksEnable <= io_apb_PWDATA[2 : 0];
            timerDBridge_clearsEnable <= io_apb_PWDATA[17 : 16];
          end
        end
        8'b01110100 : begin
        end
        8'b01111000 : begin
        end
        8'b00010000 : begin
        end
        8'b00010100 : begin
          if(busCtrl_doWrite)begin
            interruptCtrl_1__io_masks_driver <= io_apb_PWDATA[3 : 0];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @ (posedge io_mainClk) begin
    case(io_apb_PADDR)
      8'b00000000 : begin
        if(busCtrl_doWrite)begin
          _zz_1_ <= io_apb_PWDATA[15 : 0];
        end
      end
      8'b01000000 : begin
      end
      8'b01000100 : begin
        if(busCtrl_doWrite)begin
          timerA_io_limit_driver <= io_apb_PWDATA[31 : 0];
        end
      end
      8'b01001000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
        if(busCtrl_doWrite)begin
          timerB_io_limit_driver <= io_apb_PWDATA[15 : 0];
        end
      end
      8'b01011000 : begin
      end
      8'b01100000 : begin
      end
      8'b01100100 : begin
        if(busCtrl_doWrite)begin
          timerC_io_limit_driver <= io_apb_PWDATA[15 : 0];
        end
      end
      8'b01101000 : begin
      end
      8'b01110000 : begin
      end
      8'b01110100 : begin
        if(busCtrl_doWrite)begin
          timerD_io_limit_driver <= io_apb_PWDATA[15 : 0];
        end
      end
      8'b01111000 : begin
      end
      8'b00010000 : begin
      end
      8'b00010100 : begin
      end
      default : begin
      end
    endcase
  end


endmodule

module Apb3UartCtrl (
  input      [4:0]    io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  output              io_uart_txd,
  input               io_uart_rxd,
  output              io_interrupt,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  wire                _zz_9_;
  reg                 _zz_10_;
  wire                _zz_11_;
  wire                uartCtrl_1__io_write_ready;
  wire                uartCtrl_1__io_read_valid;
  wire       [7:0]    uartCtrl_1__io_read_payload;
  wire                uartCtrl_1__io_uart_txd;
  wire                uartCtrl_1__io_readError;
  wire                uartCtrl_1__io_readBreak;
  wire                bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready;
  wire                bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid;
  wire       [7:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload;
  wire       [4:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy;
  wire       [4:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_availability;
  wire                uartCtrl_1__io_read_queueWithOccupancy_io_push_ready;
  wire                uartCtrl_1__io_read_queueWithOccupancy_io_pop_valid;
  wire       [7:0]    uartCtrl_1__io_read_queueWithOccupancy_io_pop_payload;
  wire       [4:0]    uartCtrl_1__io_read_queueWithOccupancy_io_occupancy;
  wire       [4:0]    uartCtrl_1__io_read_queueWithOccupancy_io_availability;
  wire       [0:0]    _zz_12_;
  wire       [0:0]    _zz_13_;
  wire       [0:0]    _zz_14_;
  wire       [0:0]    _zz_15_;
  wire       [0:0]    _zz_16_;
  wire       [0:0]    _zz_17_;
  wire       [0:0]    _zz_18_;
  wire       [0:0]    _zz_19_;
  wire       [0:0]    _zz_20_;
  wire       [0:0]    _zz_21_;
  wire       [19:0]   _zz_22_;
  wire       [19:0]   _zz_23_;
  wire       [0:0]    _zz_24_;
  wire       [0:0]    _zz_25_;
  wire       [4:0]    _zz_26_;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg        [2:0]    bridge_uartConfigReg_frame_dataLength;
  reg        `UartStopType_defaultEncoding_type bridge_uartConfigReg_frame_stop;
  reg        `UartParityType_defaultEncoding_type bridge_uartConfigReg_frame_parity;
  reg        [19:0]   bridge_uartConfigReg_clockDivider;
  reg                 _zz_1_;
  wire                bridge_write_streamUnbuffered_valid;
  wire                bridge_write_streamUnbuffered_ready;
  wire       [7:0]    bridge_write_streamUnbuffered_payload;
  reg                 bridge_read_streamBreaked_valid;
  reg                 bridge_read_streamBreaked_ready;
  wire       [7:0]    bridge_read_streamBreaked_payload;
  reg                 bridge_interruptCtrl_writeIntEnable;
  reg                 bridge_interruptCtrl_readIntEnable;
  wire                bridge_interruptCtrl_readInt;
  wire                bridge_interruptCtrl_writeInt;
  wire                bridge_interruptCtrl_interrupt;
  reg                 bridge_misc_readError;
  reg                 _zz_2_;
  reg                 bridge_misc_readOverflowError;
  reg                 _zz_3_;
  reg                 bridge_misc_breakDetected;
  reg                 uartCtrl_1__io_readBreak_regNext;
  reg                 _zz_4_;
  reg                 bridge_misc_doBreak;
  reg                 _zz_5_;
  reg                 _zz_6_;
  wire       `UartParityType_defaultEncoding_type _zz_7_;
  wire       `UartStopType_defaultEncoding_type _zz_8_;
  `ifndef SYNTHESIS
  reg [23:0] bridge_uartConfigReg_frame_stop_string;
  reg [31:0] bridge_uartConfigReg_frame_parity_string;
  reg [31:0] _zz_7__string;
  reg [23:0] _zz_8__string;
  `endif


  assign _zz_12_ = io_apb_PWDATA[0 : 0];
  assign _zz_13_ = (1'b0);
  assign _zz_14_ = io_apb_PWDATA[1 : 1];
  assign _zz_15_ = (1'b0);
  assign _zz_16_ = io_apb_PWDATA[9 : 9];
  assign _zz_17_ = (1'b0);
  assign _zz_18_ = io_apb_PWDATA[10 : 10];
  assign _zz_19_ = (1'b1);
  assign _zz_20_ = io_apb_PWDATA[11 : 11];
  assign _zz_21_ = (1'b0);
  assign _zz_22_ = io_apb_PWDATA[19 : 0];
  assign _zz_23_ = _zz_22_;
  assign _zz_24_ = io_apb_PWDATA[0 : 0];
  assign _zz_25_ = io_apb_PWDATA[1 : 1];
  assign _zz_26_ = (5'h10 - bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy);
  UartCtrl uartCtrl_1_ ( 
    .io_config_frame_dataLength    (bridge_uartConfigReg_frame_dataLength[2:0]                            ), //i
    .io_config_frame_stop          (bridge_uartConfigReg_frame_stop                                       ), //i
    .io_config_frame_parity        (bridge_uartConfigReg_frame_parity[1:0]                                ), //i
    .io_config_clockDivider        (bridge_uartConfigReg_clockDivider[19:0]                               ), //i
    .io_write_valid                (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid         ), //i
    .io_write_ready                (uartCtrl_1__io_write_ready                                            ), //o
    .io_write_payload              (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload[7:0]  ), //i
    .io_read_valid                 (uartCtrl_1__io_read_valid                                             ), //o
    .io_read_ready                 (uartCtrl_1__io_read_queueWithOccupancy_io_push_ready                  ), //i
    .io_read_payload               (uartCtrl_1__io_read_payload[7:0]                                      ), //o
    .io_uart_txd                   (uartCtrl_1__io_uart_txd                                               ), //o
    .io_uart_rxd                   (io_uart_rxd                                                           ), //i
    .io_readError                  (uartCtrl_1__io_readError                                              ), //o
    .io_writeBreak                 (bridge_misc_doBreak                                                   ), //i
    .io_readBreak                  (uartCtrl_1__io_readBreak                                              ), //o
    .io_mainClk                    (io_mainClk                                                            ), //i
    .resetCtrl_axiReset            (resetCtrl_axiReset                                                    )  //i
  );
  StreamFifo bridge_write_streamUnbuffered_queueWithOccupancy ( 
    .io_push_valid         (bridge_write_streamUnbuffered_valid                                    ), //i
    .io_push_ready         (bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready         ), //o
    .io_push_payload       (bridge_write_streamUnbuffered_payload[7:0]                             ), //i
    .io_pop_valid          (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid          ), //o
    .io_pop_ready          (uartCtrl_1__io_write_ready                                             ), //i
    .io_pop_payload        (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload[7:0]   ), //o
    .io_flush              (_zz_9_                                                                 ), //i
    .io_occupancy          (bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy[4:0]     ), //o
    .io_availability       (bridge_write_streamUnbuffered_queueWithOccupancy_io_availability[4:0]  ), //o
    .io_mainClk            (io_mainClk                                                             ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                                                     )  //i
  );
  StreamFifo uartCtrl_1__io_read_queueWithOccupancy ( 
    .io_push_valid         (uartCtrl_1__io_read_valid                                    ), //i
    .io_push_ready         (uartCtrl_1__io_read_queueWithOccupancy_io_push_ready         ), //o
    .io_push_payload       (uartCtrl_1__io_read_payload[7:0]                             ), //i
    .io_pop_valid          (uartCtrl_1__io_read_queueWithOccupancy_io_pop_valid          ), //o
    .io_pop_ready          (_zz_10_                                                      ), //i
    .io_pop_payload        (uartCtrl_1__io_read_queueWithOccupancy_io_pop_payload[7:0]   ), //o
    .io_flush              (_zz_11_                                                      ), //i
    .io_occupancy          (uartCtrl_1__io_read_queueWithOccupancy_io_occupancy[4:0]     ), //o
    .io_availability       (uartCtrl_1__io_read_queueWithOccupancy_io_availability[4:0]  ), //o
    .io_mainClk            (io_mainClk                                                   ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                                           )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(bridge_uartConfigReg_frame_stop)
      `UartStopType_defaultEncoding_ONE : bridge_uartConfigReg_frame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : bridge_uartConfigReg_frame_stop_string = "TWO";
      default : bridge_uartConfigReg_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(bridge_uartConfigReg_frame_parity)
      `UartParityType_defaultEncoding_NONE : bridge_uartConfigReg_frame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : bridge_uartConfigReg_frame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : bridge_uartConfigReg_frame_parity_string = "ODD ";
      default : bridge_uartConfigReg_frame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_7_)
      `UartParityType_defaultEncoding_NONE : _zz_7__string = "NONE";
      `UartParityType_defaultEncoding_EVEN : _zz_7__string = "EVEN";
      `UartParityType_defaultEncoding_ODD : _zz_7__string = "ODD ";
      default : _zz_7__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_8_)
      `UartStopType_defaultEncoding_ONE : _zz_8__string = "ONE";
      `UartStopType_defaultEncoding_TWO : _zz_8__string = "TWO";
      default : _zz_8__string = "???";
    endcase
  end
  `endif

  assign io_uart_txd = uartCtrl_1__io_uart_txd;
  assign io_apb_PREADY = 1'b1;
  always @ (*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
        io_apb_PRDATA[16 : 16] = (bridge_read_streamBreaked_valid ^ 1'b0);
        io_apb_PRDATA[7 : 0] = bridge_read_streamBreaked_payload;
      end
      5'b00100 : begin
        io_apb_PRDATA[20 : 16] = _zz_26_;
        io_apb_PRDATA[15 : 15] = bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid;
        io_apb_PRDATA[28 : 24] = uartCtrl_1__io_read_queueWithOccupancy_io_occupancy;
        io_apb_PRDATA[0 : 0] = bridge_interruptCtrl_writeIntEnable;
        io_apb_PRDATA[1 : 1] = bridge_interruptCtrl_readIntEnable;
        io_apb_PRDATA[8 : 8] = bridge_interruptCtrl_writeInt;
        io_apb_PRDATA[9 : 9] = bridge_interruptCtrl_readInt;
      end
      5'b10000 : begin
        io_apb_PRDATA[0 : 0] = bridge_misc_readError;
        io_apb_PRDATA[1 : 1] = bridge_misc_readOverflowError;
        io_apb_PRDATA[8 : 8] = uartCtrl_1__io_readBreak;
        io_apb_PRDATA[9 : 9] = bridge_misc_breakDetected;
      end
      default : begin
      end
    endcase
  end

  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  always @ (*) begin
    _zz_1_ = 1'b0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
        if(busCtrl_doWrite)begin
          _zz_1_ = 1'b1;
        end
      end
      5'b00100 : begin
      end
      5'b10000 : begin
      end
      default : begin
      end
    endcase
  end

  assign bridge_write_streamUnbuffered_valid = _zz_1_;
  assign bridge_write_streamUnbuffered_payload = io_apb_PWDATA[7 : 0];
  assign bridge_write_streamUnbuffered_ready = bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready;
  always @ (*) begin
    bridge_read_streamBreaked_valid = uartCtrl_1__io_read_queueWithOccupancy_io_pop_valid;
    if(uartCtrl_1__io_readBreak)begin
      bridge_read_streamBreaked_valid = 1'b0;
    end
  end

  always @ (*) begin
    _zz_10_ = bridge_read_streamBreaked_ready;
    if(uartCtrl_1__io_readBreak)begin
      _zz_10_ = 1'b1;
    end
  end

  assign bridge_read_streamBreaked_payload = uartCtrl_1__io_read_queueWithOccupancy_io_pop_payload;
  always @ (*) begin
    bridge_read_streamBreaked_ready = 1'b0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
        if(busCtrl_doRead)begin
          bridge_read_streamBreaked_ready = 1'b1;
        end
      end
      5'b00100 : begin
      end
      5'b10000 : begin
      end
      default : begin
      end
    endcase
  end

  assign bridge_interruptCtrl_readInt = (bridge_interruptCtrl_readIntEnable && bridge_read_streamBreaked_valid);
  assign bridge_interruptCtrl_writeInt = (bridge_interruptCtrl_writeIntEnable && (! bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid));
  assign bridge_interruptCtrl_interrupt = (bridge_interruptCtrl_readInt || bridge_interruptCtrl_writeInt);
  always @ (*) begin
    _zz_2_ = 1'b0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
      end
      5'b00100 : begin
      end
      5'b10000 : begin
        if(busCtrl_doWrite)begin
          _zz_2_ = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_3_ = 1'b0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
      end
      5'b00100 : begin
      end
      5'b10000 : begin
        if(busCtrl_doWrite)begin
          _zz_3_ = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_4_ = 1'b0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
      end
      5'b00100 : begin
      end
      5'b10000 : begin
        if(busCtrl_doWrite)begin
          _zz_4_ = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_5_ = 1'b0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
      end
      5'b00100 : begin
      end
      5'b10000 : begin
        if(busCtrl_doWrite)begin
          _zz_5_ = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_6_ = 1'b0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
      end
      5'b00100 : begin
      end
      5'b10000 : begin
        if(busCtrl_doWrite)begin
          _zz_6_ = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign io_interrupt = bridge_interruptCtrl_interrupt;
  assign _zz_7_ = io_apb_PWDATA[9 : 8];
  assign _zz_8_ = io_apb_PWDATA[16 : 16];
  assign _zz_9_ = 1'b0;
  assign _zz_11_ = 1'b0;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      bridge_uartConfigReg_clockDivider <= 20'h0;
      bridge_interruptCtrl_writeIntEnable <= 1'b0;
      bridge_interruptCtrl_readIntEnable <= 1'b0;
      bridge_misc_readError <= 1'b0;
      bridge_misc_readOverflowError <= 1'b0;
      bridge_misc_breakDetected <= 1'b0;
      bridge_misc_doBreak <= 1'b0;
    end else begin
      if(_zz_2_)begin
        if(_zz_12_[0])begin
          bridge_misc_readError <= _zz_13_[0];
        end
      end
      if(uartCtrl_1__io_readError)begin
        bridge_misc_readError <= 1'b1;
      end
      if(_zz_3_)begin
        if(_zz_14_[0])begin
          bridge_misc_readOverflowError <= _zz_15_[0];
        end
      end
      if((uartCtrl_1__io_read_valid && (! uartCtrl_1__io_read_queueWithOccupancy_io_push_ready)))begin
        bridge_misc_readOverflowError <= 1'b1;
      end
      if((uartCtrl_1__io_readBreak && (! uartCtrl_1__io_readBreak_regNext)))begin
        bridge_misc_breakDetected <= 1'b1;
      end
      if(_zz_4_)begin
        if(_zz_16_[0])begin
          bridge_misc_breakDetected <= _zz_17_[0];
        end
      end
      if(_zz_5_)begin
        if(_zz_18_[0])begin
          bridge_misc_doBreak <= _zz_19_[0];
        end
      end
      if(_zz_6_)begin
        if(_zz_20_[0])begin
          bridge_misc_doBreak <= _zz_21_[0];
        end
      end
      case(io_apb_PADDR)
        5'b01000 : begin
          if(busCtrl_doWrite)begin
            bridge_uartConfigReg_clockDivider[19 : 0] <= _zz_23_;
          end
        end
        5'b01100 : begin
        end
        5'b00000 : begin
        end
        5'b00100 : begin
          if(busCtrl_doWrite)begin
            bridge_interruptCtrl_writeIntEnable <= _zz_24_[0];
            bridge_interruptCtrl_readIntEnable <= _zz_25_[0];
          end
        end
        5'b10000 : begin
        end
        default : begin
        end
      endcase
    end
  end

  always @ (posedge io_mainClk) begin
    uartCtrl_1__io_readBreak_regNext <= uartCtrl_1__io_readBreak;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
        if(busCtrl_doWrite)begin
          bridge_uartConfigReg_frame_dataLength <= io_apb_PWDATA[2 : 0];
          bridge_uartConfigReg_frame_parity <= _zz_7_;
          bridge_uartConfigReg_frame_stop <= _zz_8_;
        end
      end
      5'b00000 : begin
      end
      5'b00100 : begin
      end
      5'b10000 : begin
      end
      default : begin
      end
    endcase
  end


endmodule

module VexRiscv (
  output              iBus_cmd_valid,
  input               iBus_cmd_ready,
  output     [31:0]   iBus_cmd_payload_pc,
  input               iBus_rsp_valid,
  input               iBus_rsp_payload_error,
  input      [31:0]   iBus_rsp_payload_inst,
  input               timerInterrupt,
  input               externalInterrupt,
  input               softwareInterrupt,
  input               debug_bus_cmd_valid,
  output reg          debug_bus_cmd_ready,
  input               debug_bus_cmd_payload_wr,
  input      [7:0]    debug_bus_cmd_payload_address,
  input      [31:0]   debug_bus_cmd_payload_data,
  output reg [31:0]   debug_bus_rsp_data,
  output              debug_resetOut,
  output              dBus_cmd_valid,
  input               dBus_cmd_ready,
  output              dBus_cmd_payload_wr,
  output     [31:0]   dBus_cmd_payload_address,
  output     [31:0]   dBus_cmd_payload_data,
  output     [1:0]    dBus_cmd_payload_size,
  input               dBus_rsp_ready,
  input               dBus_rsp_error,
  input      [31:0]   dBus_rsp_data,
  input               io_mainClk,
  input               resetCtrl_axiReset,
  input               resetCtrl_systemReset 
);
  wire                _zz_119_;
  wire                _zz_120_;
  reg        [31:0]   _zz_121_;
  reg        [31:0]   _zz_122_;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  wire       [0:0]    IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy;
  wire                _zz_123_;
  wire                _zz_124_;
  wire                _zz_125_;
  wire                _zz_126_;
  wire                _zz_127_;
  wire                _zz_128_;
  wire                _zz_129_;
  wire                _zz_130_;
  wire                _zz_131_;
  wire       [1:0]    _zz_132_;
  wire       [1:0]    _zz_133_;
  wire                _zz_134_;
  wire                _zz_135_;
  wire                _zz_136_;
  wire                _zz_137_;
  wire                _zz_138_;
  wire                _zz_139_;
  wire                _zz_140_;
  wire                _zz_141_;
  wire                _zz_142_;
  wire       [5:0]    _zz_143_;
  wire                _zz_144_;
  wire                _zz_145_;
  wire                _zz_146_;
  wire                _zz_147_;
  wire                _zz_148_;
  wire       [1:0]    _zz_149_;
  wire       [1:0]    _zz_150_;
  wire                _zz_151_;
  wire       [0:0]    _zz_152_;
  wire       [0:0]    _zz_153_;
  wire       [0:0]    _zz_154_;
  wire       [0:0]    _zz_155_;
  wire       [0:0]    _zz_156_;
  wire       [0:0]    _zz_157_;
  wire       [0:0]    _zz_158_;
  wire       [30:0]   _zz_159_;
  wire       [30:0]   _zz_160_;
  wire       [30:0]   _zz_161_;
  wire       [30:0]   _zz_162_;
  wire       [51:0]   _zz_163_;
  wire       [51:0]   _zz_164_;
  wire       [51:0]   _zz_165_;
  wire       [32:0]   _zz_166_;
  wire       [51:0]   _zz_167_;
  wire       [49:0]   _zz_168_;
  wire       [51:0]   _zz_169_;
  wire       [49:0]   _zz_170_;
  wire       [51:0]   _zz_171_;
  wire       [0:0]    _zz_172_;
  wire       [0:0]    _zz_173_;
  wire       [0:0]    _zz_174_;
  wire       [0:0]    _zz_175_;
  wire       [0:0]    _zz_176_;
  wire       [0:0]    _zz_177_;
  wire       [0:0]    _zz_178_;
  wire       [0:0]    _zz_179_;
  wire       [0:0]    _zz_180_;
  wire       [1:0]    _zz_181_;
  wire       [1:0]    _zz_182_;
  wire       [2:0]    _zz_183_;
  wire       [31:0]   _zz_184_;
  wire       [2:0]    _zz_185_;
  wire       [0:0]    _zz_186_;
  wire       [2:0]    _zz_187_;
  wire       [0:0]    _zz_188_;
  wire       [2:0]    _zz_189_;
  wire       [0:0]    _zz_190_;
  wire       [2:0]    _zz_191_;
  wire       [0:0]    _zz_192_;
  wire       [2:0]    _zz_193_;
  wire       [0:0]    _zz_194_;
  wire       [65:0]   _zz_195_;
  wire       [65:0]   _zz_196_;
  wire       [31:0]   _zz_197_;
  wire       [31:0]   _zz_198_;
  wire       [0:0]    _zz_199_;
  wire       [5:0]    _zz_200_;
  wire       [32:0]   _zz_201_;
  wire       [31:0]   _zz_202_;
  wire       [31:0]   _zz_203_;
  wire       [32:0]   _zz_204_;
  wire       [32:0]   _zz_205_;
  wire       [32:0]   _zz_206_;
  wire       [32:0]   _zz_207_;
  wire       [0:0]    _zz_208_;
  wire       [32:0]   _zz_209_;
  wire       [0:0]    _zz_210_;
  wire       [32:0]   _zz_211_;
  wire       [0:0]    _zz_212_;
  wire       [31:0]   _zz_213_;
  wire       [2:0]    _zz_214_;
  wire       [4:0]    _zz_215_;
  wire       [11:0]   _zz_216_;
  wire       [11:0]   _zz_217_;
  wire       [31:0]   _zz_218_;
  wire       [31:0]   _zz_219_;
  wire       [31:0]   _zz_220_;
  wire       [31:0]   _zz_221_;
  wire       [31:0]   _zz_222_;
  wire       [31:0]   _zz_223_;
  wire       [31:0]   _zz_224_;
  wire       [31:0]   _zz_225_;
  wire       [32:0]   _zz_226_;
  wire       [19:0]   _zz_227_;
  wire       [11:0]   _zz_228_;
  wire       [11:0]   _zz_229_;
  wire       [0:0]    _zz_230_;
  wire       [0:0]    _zz_231_;
  wire       [0:0]    _zz_232_;
  wire       [0:0]    _zz_233_;
  wire       [0:0]    _zz_234_;
  wire       [0:0]    _zz_235_;
  wire       [0:0]    _zz_236_;
  wire       [0:0]    _zz_237_;
  wire       [0:0]    _zz_238_;
  wire       [0:0]    _zz_239_;
  wire                _zz_240_;
  wire                _zz_241_;
  wire                _zz_242_;
  wire       [0:0]    _zz_243_;
  wire       [2:0]    _zz_244_;
  wire                _zz_245_;
  wire                _zz_246_;
  wire       [0:0]    _zz_247_;
  wire       [1:0]    _zz_248_;
  wire       [1:0]    _zz_249_;
  wire       [1:0]    _zz_250_;
  wire                _zz_251_;
  wire       [0:0]    _zz_252_;
  wire       [23:0]   _zz_253_;
  wire       [31:0]   _zz_254_;
  wire       [31:0]   _zz_255_;
  wire       [31:0]   _zz_256_;
  wire                _zz_257_;
  wire       [0:0]    _zz_258_;
  wire       [0:0]    _zz_259_;
  wire       [31:0]   _zz_260_;
  wire       [31:0]   _zz_261_;
  wire       [31:0]   _zz_262_;
  wire       [31:0]   _zz_263_;
  wire                _zz_264_;
  wire                _zz_265_;
  wire                _zz_266_;
  wire       [0:0]    _zz_267_;
  wire       [0:0]    _zz_268_;
  wire       [0:0]    _zz_269_;
  wire       [0:0]    _zz_270_;
  wire                _zz_271_;
  wire       [0:0]    _zz_272_;
  wire       [21:0]   _zz_273_;
  wire       [31:0]   _zz_274_;
  wire       [31:0]   _zz_275_;
  wire       [31:0]   _zz_276_;
  wire       [31:0]   _zz_277_;
  wire       [31:0]   _zz_278_;
  wire       [31:0]   _zz_279_;
  wire       [31:0]   _zz_280_;
  wire       [31:0]   _zz_281_;
  wire       [31:0]   _zz_282_;
  wire       [31:0]   _zz_283_;
  wire       [31:0]   _zz_284_;
  wire       [31:0]   _zz_285_;
  wire                _zz_286_;
  wire       [0:0]    _zz_287_;
  wire       [0:0]    _zz_288_;
  wire                _zz_289_;
  wire       [0:0]    _zz_290_;
  wire       [19:0]   _zz_291_;
  wire       [31:0]   _zz_292_;
  wire       [31:0]   _zz_293_;
  wire                _zz_294_;
  wire       [2:0]    _zz_295_;
  wire       [2:0]    _zz_296_;
  wire                _zz_297_;
  wire       [0:0]    _zz_298_;
  wire       [15:0]   _zz_299_;
  wire       [31:0]   _zz_300_;
  wire       [31:0]   _zz_301_;
  wire                _zz_302_;
  wire                _zz_303_;
  wire       [0:0]    _zz_304_;
  wire       [0:0]    _zz_305_;
  wire       [0:0]    _zz_306_;
  wire       [0:0]    _zz_307_;
  wire       [1:0]    _zz_308_;
  wire       [1:0]    _zz_309_;
  wire                _zz_310_;
  wire       [0:0]    _zz_311_;
  wire       [12:0]   _zz_312_;
  wire       [31:0]   _zz_313_;
  wire       [31:0]   _zz_314_;
  wire       [31:0]   _zz_315_;
  wire       [31:0]   _zz_316_;
  wire                _zz_317_;
  wire                _zz_318_;
  wire       [0:0]    _zz_319_;
  wire       [0:0]    _zz_320_;
  wire                _zz_321_;
  wire       [0:0]    _zz_322_;
  wire       [9:0]    _zz_323_;
  wire       [31:0]   _zz_324_;
  wire                _zz_325_;
  wire                _zz_326_;
  wire       [0:0]    _zz_327_;
  wire       [0:0]    _zz_328_;
  wire       [1:0]    _zz_329_;
  wire       [1:0]    _zz_330_;
  wire                _zz_331_;
  wire       [0:0]    _zz_332_;
  wire       [6:0]    _zz_333_;
  wire       [31:0]   _zz_334_;
  wire       [31:0]   _zz_335_;
  wire       [31:0]   _zz_336_;
  wire       [31:0]   _zz_337_;
  wire       [31:0]   _zz_338_;
  wire       [31:0]   _zz_339_;
  wire                _zz_340_;
  wire                _zz_341_;
  wire       [0:0]    _zz_342_;
  wire       [0:0]    _zz_343_;
  wire                _zz_344_;
  wire       [0:0]    _zz_345_;
  wire       [3:0]    _zz_346_;
  wire       [31:0]   _zz_347_;
  wire                _zz_348_;
  wire                _zz_349_;
  wire                _zz_350_;
  wire       [0:0]    _zz_351_;
  wire       [0:0]    _zz_352_;
  wire                _zz_353_;
  wire       [0:0]    _zz_354_;
  wire       [0:0]    _zz_355_;
  wire       [31:0]   _zz_356_;
  wire       [31:0]   _zz_357_;
  wire                _zz_358_;
  wire                _zz_359_;
  wire                _zz_360_;
  wire       [0:0]    _zz_361_;
  wire       [1:0]    _zz_362_;
  wire                _zz_363_;
  wire       [0:0]    _zz_364_;
  wire       [2:0]    _zz_365_;
  wire       [31:0]   _zz_366_;
  wire       [31:0]   _zz_367_;
  wire       [31:0]   _zz_368_;
  wire       [31:0]   _zz_369_;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_IS_RS2_SIGNED;
  wire       [31:0]   decode_RS2;
  wire       [33:0]   memory_MUL_HH;
  wire       [33:0]   execute_MUL_HH;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire                memory_IS_MUL;
  wire                execute_IS_MUL;
  wire                decode_IS_MUL;
  wire                decode_CSR_WRITE_OPCODE;
  wire                decode_SRC2_FORCE_ZERO;
  wire                decode_IS_RS1_SIGNED;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_1_;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_2_;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_3_;
  wire                decode_MEMORY_ENABLE;
  wire       [31:0]   memory_MEMORY_READ_DATA;
  wire       [31:0]   decode_RS1;
  wire       `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_4_;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_5_;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_6_;
  wire                decode_MEMORY_STORE;
  wire                decode_IS_CSR;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire       [31:0]   execute_BRANCH_CALC;
  wire       [31:0]   decode_SRC2;
  wire                decode_DO_EBREAK;
  wire       [31:0]   decode_SRC1;
  wire       [51:0]   memory_MUL_LOW;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_7_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_8_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_9_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_10_;
  wire       `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_11_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_12_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_13_;
  wire       [31:0]   execute_MUL_LL;
  wire                execute_BRANCH_DO;
  wire       [31:0]   memory_PC;
  wire                decode_SRC_LESS_UNSIGNED;
  wire       `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_14_;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_15_;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_16_;
  wire                decode_IS_DIV;
  wire       `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_17_;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_18_;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_19_;
  wire       [33:0]   execute_MUL_LH;
  wire       [33:0]   execute_MUL_HL;
  wire                execute_DO_EBREAK;
  wire                decode_IS_EBREAK;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_20_;
  wire       `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_21_;
  wire       `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_22_;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire       `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_23_;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   _zz_24_;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire       `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_25_;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_26_;
  wire       [31:0]   _zz_27_;
  wire       `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_28_;
  wire       [31:0]   _zz_29_;
  wire       `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_30_;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire                execute_IS_RS1_SIGNED;
  wire                execute_IS_DIV;
  wire                execute_IS_RS2_SIGNED;
  reg        [31:0]   _zz_31_;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_IS_DIV;
  wire                writeBack_IS_MUL;
  wire       [33:0]   writeBack_MUL_HH;
  wire       [51:0]   writeBack_MUL_LOW;
  wire       [33:0]   memory_MUL_HL;
  wire       [33:0]   memory_MUL_LH;
  wire       [31:0]   memory_MUL_LL;
  (* keep , syn_keep *) wire       [31:0]   execute_RS1 /* synthesis syn_keep = 1 */ ;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_32_;
  wire       [31:0]   execute_SRC2;
  wire       [31:0]   execute_SRC1;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_33_;
  wire       [31:0]   _zz_34_;
  wire                _zz_35_;
  reg                 _zz_36_;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_37_;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_38_;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_39_;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_40_;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_41_;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_42_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_43_;
  wire                writeBack_MEMORY_STORE;
  reg        [31:0]   _zz_44_;
  wire                writeBack_MEMORY_ENABLE;
  wire       [1:0]    writeBack_MEMORY_ADDRESS_LOW;
  wire       [31:0]   writeBack_MEMORY_READ_DATA;
  wire                memory_MEMORY_STORE;
  wire                memory_MEMORY_ENABLE;
  wire       [31:0]   execute_SRC_ADD;
  (* keep , syn_keep *) wire       [31:0]   execute_RS2 /* synthesis syn_keep = 1 */ ;
  wire       [31:0]   execute_INSTRUCTION;
  wire                execute_MEMORY_STORE;
  wire                execute_MEMORY_ENABLE;
  wire                execute_ALIGNEMENT_FAULT;
  reg        [31:0]   _zz_45_;
  wire       [31:0]   decode_PC;
  wire       [31:0]   decode_INSTRUCTION;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  reg                 decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  wire                decode_arbitration_flushNext;
  reg                 decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  reg                 execute_arbitration_haltItself;
  reg                 execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  reg                 execute_arbitration_flushIt;
  reg                 execute_arbitration_flushNext;
  reg                 execute_arbitration_isValid;
  wire                execute_arbitration_isStuck;
  wire                execute_arbitration_isStuckByOthers;
  wire                execute_arbitration_isFlushed;
  wire                execute_arbitration_isMoving;
  wire                execute_arbitration_isFiring;
  reg                 memory_arbitration_haltItself;
  wire                memory_arbitration_haltByOther;
  reg                 memory_arbitration_removeIt;
  wire                memory_arbitration_flushIt;
  reg                 memory_arbitration_flushNext;
  reg                 memory_arbitration_isValid;
  wire                memory_arbitration_isStuck;
  wire                memory_arbitration_isStuckByOthers;
  wire                memory_arbitration_isFlushed;
  wire                memory_arbitration_isMoving;
  wire                memory_arbitration_isFiring;
  wire                writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  wire                writeBack_arbitration_flushIt;
  reg                 writeBack_arbitration_flushNext;
  reg                 writeBack_arbitration_isValid;
  wire                writeBack_arbitration_isStuck;
  wire                writeBack_arbitration_isStuckByOthers;
  wire                writeBack_arbitration_isFlushed;
  wire                writeBack_arbitration_isMoving;
  wire                writeBack_arbitration_isFiring;
  wire       [31:0]   lastStageInstruction /* verilator public */ ;
  wire       [31:0]   lastStagePc /* verilator public */ ;
  wire                lastStageIsValid /* verilator public */ ;
  wire                lastStageIsFiring /* verilator public */ ;
  reg                 IBusSimplePlugin_fetcherHalt;
  reg                 IBusSimplePlugin_incomingInstruction;
  wire                IBusSimplePlugin_pcValids_0;
  wire                IBusSimplePlugin_pcValids_1;
  wire                IBusSimplePlugin_pcValids_2;
  wire                IBusSimplePlugin_pcValids_3;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  wire                CsrPlugin_inWfi /* verilator public */ ;
  reg                 CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
  wire                contextSwitching;
  reg        [1:0]    CsrPlugin_privilege;
  reg                 CsrPlugin_forceMachineWire;
  reg                 CsrPlugin_allowInterrupts;
  reg                 CsrPlugin_allowException;
  reg                 IBusSimplePlugin_injectionPort_valid;
  reg                 IBusSimplePlugin_injectionPort_ready;
  wire       [31:0]   IBusSimplePlugin_injectionPort_payload;
  wire                IBusSimplePlugin_externalFlush;
  wire                IBusSimplePlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusSimplePlugin_jump_pcLoad_payload;
  wire       [1:0]    _zz_46_;
  wire                IBusSimplePlugin_fetchPc_output_valid;
  wire                IBusSimplePlugin_fetchPc_output_ready;
  wire       [31:0]   IBusSimplePlugin_fetchPc_output_payload;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusSimplePlugin_fetchPc_correction;
  reg                 IBusSimplePlugin_fetchPc_correctionReg;
  wire                IBusSimplePlugin_fetchPc_corrected;
  reg                 IBusSimplePlugin_fetchPc_pcRegPropagate;
  reg                 IBusSimplePlugin_fetchPc_booted;
  reg                 IBusSimplePlugin_fetchPc_inc;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pc;
  reg                 IBusSimplePlugin_fetchPc_flushed;
  wire                IBusSimplePlugin_iBusRsp_redoFetch;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_output_payload;
  reg                 IBusSimplePlugin_iBusRsp_stages_0_halt;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_halt;
  wire                _zz_47_;
  wire                _zz_48_;
  wire                IBusSimplePlugin_iBusRsp_flush;
  wire                _zz_49_;
  wire                _zz_50_;
  reg                 _zz_51_;
  reg                 IBusSimplePlugin_iBusRsp_readyForError;
  wire                IBusSimplePlugin_iBusRsp_output_valid;
  wire                IBusSimplePlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_pc;
  wire                IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  wire                IBusSimplePlugin_injector_decodeInput_valid;
  wire                IBusSimplePlugin_injector_decodeInput_ready;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_pc;
  wire                IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  wire                IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  reg                 _zz_52_;
  reg        [31:0]   _zz_53_;
  reg                 _zz_54_;
  reg        [31:0]   _zz_55_;
  reg                 _zz_56_;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_0;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_1;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_2;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_3;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_4;
  reg        [31:0]   IBusSimplePlugin_injector_formal_rawInDecode;
  wire                IBusSimplePlugin_cmd_valid;
  wire                IBusSimplePlugin_cmd_ready;
  wire       [31:0]   IBusSimplePlugin_cmd_payload_pc;
  wire                IBusSimplePlugin_cmd_s2mPipe_valid;
  wire                IBusSimplePlugin_cmd_s2mPipe_ready;
  wire       [31:0]   IBusSimplePlugin_cmd_s2mPipe_payload_pc;
  reg                 IBusSimplePlugin_cmd_s2mPipe_rValid;
  reg        [31:0]   IBusSimplePlugin_cmd_s2mPipe_rData_pc;
  wire                IBusSimplePlugin_pending_inc;
  wire                IBusSimplePlugin_pending_dec;
  reg        [2:0]    IBusSimplePlugin_pending_value;
  wire       [2:0]    IBusSimplePlugin_pending_next;
  wire                IBusSimplePlugin_cmdFork_canEmit;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  reg        [2:0]    IBusSimplePlugin_rspJoin_rspBuffer_discardCounter;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_flush;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_pc;
  reg                 IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  wire                IBusSimplePlugin_rspJoin_join_valid;
  wire                IBusSimplePlugin_rspJoin_join_ready;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_pc;
  wire                IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_join_payload_isRvc;
  wire                IBusSimplePlugin_rspJoin_exceptionDetected;
  wire                _zz_57_;
  wire                _zz_58_;
  reg                 execute_DBusSimplePlugin_skipCmd;
  reg        [31:0]   _zz_59_;
  reg        [3:0]    _zz_60_;
  wire       [3:0]    execute_DBusSimplePlugin_formalMask;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspShifted;
  wire                _zz_61_;
  reg        [31:0]   _zz_62_;
  wire                _zz_63_;
  reg        [31:0]   _zz_64_;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspFormated;
  wire       [29:0]   _zz_65_;
  wire                _zz_66_;
  wire                _zz_67_;
  wire                _zz_68_;
  wire                _zz_69_;
  wire                _zz_70_;
  wire                _zz_71_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_72_;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_73_;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_74_;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_75_;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_76_;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_77_;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_78_;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  wire       [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  wire       [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_79_;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_80_;
  reg                 execute_MulPlugin_aSigned;
  reg                 execute_MulPlugin_bSigned;
  wire       [31:0]   execute_MulPlugin_a;
  wire       [31:0]   execute_MulPlugin_b;
  wire       [15:0]   execute_MulPlugin_aULow;
  wire       [15:0]   execute_MulPlugin_bULow;
  wire       [16:0]   execute_MulPlugin_aSLow;
  wire       [16:0]   execute_MulPlugin_bSLow;
  wire       [16:0]   execute_MulPlugin_aHigh;
  wire       [16:0]   execute_MulPlugin_bHigh;
  wire       [65:0]   writeBack_MulPlugin_result;
  reg        [32:0]   memory_DivPlugin_rs1;
  reg        [31:0]   memory_DivPlugin_rs2;
  reg        [64:0]   memory_DivPlugin_accumulator;
  wire                memory_DivPlugin_frontendOk;
  reg                 memory_DivPlugin_div_needRevert;
  reg                 memory_DivPlugin_div_counter_willIncrement;
  reg                 memory_DivPlugin_div_counter_willClear;
  reg        [5:0]    memory_DivPlugin_div_counter_valueNext;
  reg        [5:0]    memory_DivPlugin_div_counter_value;
  wire                memory_DivPlugin_div_counter_willOverflowIfInc;
  wire                memory_DivPlugin_div_counter_willOverflow;
  reg                 memory_DivPlugin_div_done;
  reg        [31:0]   memory_DivPlugin_div_result;
  wire       [31:0]   _zz_81_;
  wire       [32:0]   memory_DivPlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_DivPlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   memory_DivPlugin_div_stage_0_outRemainder;
  wire       [31:0]   memory_DivPlugin_div_stage_0_outNumerator;
  wire       [31:0]   _zz_82_;
  wire                _zz_83_;
  wire                _zz_84_;
  reg        [32:0]   _zz_85_;
  reg        [31:0]   _zz_86_;
  wire                _zz_87_;
  reg        [19:0]   _zz_88_;
  wire                _zz_89_;
  reg        [19:0]   _zz_90_;
  reg        [31:0]   _zz_91_;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  reg                 execute_LightShifterPlugin_isActive;
  wire                execute_LightShifterPlugin_isShift;
  reg        [4:0]    execute_LightShifterPlugin_amplitudeReg;
  wire       [4:0]    execute_LightShifterPlugin_amplitude;
  wire       [31:0]   execute_LightShifterPlugin_shiftInput;
  wire                execute_LightShifterPlugin_done;
  reg        [31:0]   _zz_92_;
  reg                 _zz_93_;
  reg                 _zz_94_;
  reg                 _zz_95_;
  reg        [4:0]    _zz_96_;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    _zz_97_;
  reg                 _zz_98_;
  reg                 _zz_99_;
  wire       [31:0]   execute_BranchPlugin_branch_src1;
  wire                _zz_100_;
  reg        [10:0]   _zz_101_;
  wire                _zz_102_;
  reg        [19:0]   _zz_103_;
  wire                _zz_104_;
  reg        [18:0]   _zz_105_;
  reg        [31:0]   _zz_106_;
  wire       [31:0]   execute_BranchPlugin_branch_src2;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  wire       [1:0]    CsrPlugin_misa_base;
  wire       [25:0]   CsrPlugin_misa_extensions;
  reg        [1:0]    CsrPlugin_mtvec_mode;
  reg        [29:0]   CsrPlugin_mtvec_base;
  reg        [31:0]   CsrPlugin_mepc;
  reg                 CsrPlugin_mstatus_MIE;
  reg                 CsrPlugin_mstatus_MPIE;
  reg        [1:0]    CsrPlugin_mstatus_MPP;
  reg                 CsrPlugin_mip_MEIP;
  reg                 CsrPlugin_mip_MTIP;
  reg                 CsrPlugin_mip_MSIP;
  reg                 CsrPlugin_mie_MEIE;
  reg                 CsrPlugin_mie_MTIE;
  reg                 CsrPlugin_mie_MSIE;
  reg                 CsrPlugin_mcause_interrupt;
  reg        [3:0]    CsrPlugin_mcause_exceptionCode;
  reg        [31:0]   CsrPlugin_mtval;
  reg        [63:0]   CsrPlugin_mcycle = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg        [63:0]   CsrPlugin_minstret = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  wire                _zz_107_;
  wire                _zz_108_;
  wire                _zz_109_;
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                CsrPlugin_exception;
  wire                CsrPlugin_lastStageWasWfi;
  reg                 CsrPlugin_pipelineLiberator_pcValids_0;
  reg                 CsrPlugin_pipelineLiberator_pcValids_1;
  reg                 CsrPlugin_pipelineLiberator_pcValids_2;
  wire                CsrPlugin_pipelineLiberator_active;
  reg                 CsrPlugin_pipelineLiberator_done;
  wire                CsrPlugin_interruptJump /* verilator public */ ;
  reg                 CsrPlugin_hadException;
  wire       [1:0]    CsrPlugin_targetPrivilege;
  wire       [3:0]    CsrPlugin_trapCause;
  reg        [1:0]    CsrPlugin_xtvec_mode;
  reg        [29:0]   CsrPlugin_xtvec_base;
  reg                 execute_CsrPlugin_wfiWake;
  wire                execute_CsrPlugin_blockedBySideEffects;
  reg                 execute_CsrPlugin_illegalAccess;
  reg                 execute_CsrPlugin_illegalInstruction;
  wire       [31:0]   execute_CsrPlugin_readData;
  reg                 execute_CsrPlugin_writeInstruction;
  reg                 execute_CsrPlugin_readInstruction;
  wire                execute_CsrPlugin_writeEnable;
  wire                execute_CsrPlugin_readEnable;
  wire       [31:0]   execute_CsrPlugin_readToWriteData;
  reg        [31:0]   execute_CsrPlugin_writeData;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
  reg                 DebugPlugin_firstCycle;
  reg                 DebugPlugin_secondCycle;
  reg                 DebugPlugin_resetIt;
  reg                 DebugPlugin_haltIt;
  reg                 DebugPlugin_stepIt;
  reg                 DebugPlugin_isPipBusy;
  reg                 DebugPlugin_godmode;
  reg                 DebugPlugin_haltedByBreak;
  reg                 DebugPlugin_hardwareBreakpoints_0_valid;
  reg        [30:0]   DebugPlugin_hardwareBreakpoints_0_pc;
  reg                 DebugPlugin_hardwareBreakpoints_1_valid;
  reg        [30:0]   DebugPlugin_hardwareBreakpoints_1_pc;
  reg                 DebugPlugin_hardwareBreakpoints_2_valid;
  reg        [30:0]   DebugPlugin_hardwareBreakpoints_2_pc;
  reg                 DebugPlugin_hardwareBreakpoints_3_valid;
  reg        [30:0]   DebugPlugin_hardwareBreakpoints_3_pc;
  reg        [31:0]   DebugPlugin_busReadDataReg;
  reg                 _zz_110_;
  wire                DebugPlugin_allowEBreak;
  reg                 DebugPlugin_resetIt_regNext;
  reg        [33:0]   execute_to_memory_MUL_HL;
  reg        [33:0]   execute_to_memory_MUL_LH;
  reg        `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg                 decode_to_execute_IS_DIV;
  reg                 execute_to_memory_IS_DIV;
  reg        `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  reg        [31:0]   decode_to_execute_PC;
  reg        [31:0]   execute_to_memory_PC;
  reg        [31:0]   memory_to_writeBack_PC;
  reg                 execute_to_memory_BRANCH_DO;
  reg        [31:0]   execute_to_memory_MUL_LL;
  reg        `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  reg        [51:0]   memory_to_writeBack_MUL_LOW;
  reg        [31:0]   decode_to_execute_SRC1;
  reg                 decode_to_execute_DO_EBREAK;
  reg        [31:0]   decode_to_execute_SRC2;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  reg                 decode_to_execute_IS_CSR;
  reg                 decode_to_execute_MEMORY_STORE;
  reg                 execute_to_memory_MEMORY_STORE;
  reg                 memory_to_writeBack_MEMORY_STORE;
  reg        `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg        [31:0]   decode_to_execute_RS1;
  reg        [31:0]   memory_to_writeBack_MEMORY_READ_DATA;
  reg                 decode_to_execute_MEMORY_ENABLE;
  reg                 execute_to_memory_MEMORY_ENABLE;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  reg        `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  reg                 decode_to_execute_IS_MUL;
  reg                 execute_to_memory_IS_MUL;
  reg                 memory_to_writeBack_IS_MUL;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  reg        [33:0]   execute_to_memory_MUL_HH;
  reg        [33:0]   memory_to_writeBack_MUL_HH;
  reg        [31:0]   decode_to_execute_RS2;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  reg        [1:0]    memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg        [2:0]    _zz_111_;
  reg                 execute_CsrPlugin_csr_768;
  reg                 execute_CsrPlugin_csr_836;
  reg                 execute_CsrPlugin_csr_772;
  reg                 execute_CsrPlugin_csr_773;
  reg                 execute_CsrPlugin_csr_833;
  reg                 execute_CsrPlugin_csr_834;
  reg                 execute_CsrPlugin_csr_835;
  reg        [31:0]   _zz_112_;
  reg        [31:0]   _zz_113_;
  reg        [31:0]   _zz_114_;
  reg        [31:0]   _zz_115_;
  reg        [31:0]   _zz_116_;
  reg        [31:0]   _zz_117_;
  reg        [31:0]   _zz_118_;
  `ifndef SYNTHESIS
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_1__string;
  reg [39:0] _zz_2__string;
  reg [39:0] _zz_3__string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_4__string;
  reg [31:0] _zz_5__string;
  reg [31:0] _zz_6__string;
  reg [31:0] _zz_7__string;
  reg [31:0] _zz_8__string;
  reg [31:0] _zz_9__string;
  reg [31:0] _zz_10__string;
  reg [31:0] decode_ENV_CTRL_string;
  reg [31:0] _zz_11__string;
  reg [31:0] _zz_12__string;
  reg [31:0] _zz_13__string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_14__string;
  reg [63:0] _zz_15__string;
  reg [63:0] _zz_16__string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_17__string;
  reg [71:0] _zz_18__string;
  reg [71:0] _zz_19__string;
  reg [31:0] memory_ENV_CTRL_string;
  reg [31:0] _zz_20__string;
  reg [31:0] execute_ENV_CTRL_string;
  reg [31:0] _zz_21__string;
  reg [31:0] writeBack_ENV_CTRL_string;
  reg [31:0] _zz_22__string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_23__string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_25__string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_28__string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_30__string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_32__string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_33__string;
  reg [71:0] _zz_37__string;
  reg [95:0] _zz_38__string;
  reg [39:0] _zz_39__string;
  reg [23:0] _zz_40__string;
  reg [31:0] _zz_41__string;
  reg [63:0] _zz_42__string;
  reg [31:0] _zz_43__string;
  reg [31:0] _zz_72__string;
  reg [63:0] _zz_73__string;
  reg [31:0] _zz_74__string;
  reg [23:0] _zz_75__string;
  reg [39:0] _zz_76__string;
  reg [95:0] _zz_77__string;
  reg [71:0] _zz_78__string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [31:0] decode_to_execute_ENV_CTRL_string;
  reg [31:0] execute_to_memory_ENV_CTRL_string;
  reg [31:0] memory_to_writeBack_ENV_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_123_ = ((execute_arbitration_isValid && execute_LightShifterPlugin_isShift) && (execute_SRC2[4 : 0] != 5'h0));
  assign _zz_124_ = (execute_arbitration_isValid && execute_IS_CSR);
  assign _zz_125_ = (memory_arbitration_isValid && memory_IS_DIV);
  assign _zz_126_ = (! execute_arbitration_isStuckByOthers);
  assign _zz_127_ = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign _zz_128_ = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00)) == 1'b0);
  assign _zz_129_ = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_130_ = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_131_ = (DebugPlugin_stepIt && IBusSimplePlugin_incomingInstruction);
  assign _zz_132_ = writeBack_INSTRUCTION[29 : 28];
  assign _zz_133_ = execute_INSTRUCTION[13 : 12];
  assign _zz_134_ = (memory_DivPlugin_frontendOk && (! memory_DivPlugin_div_done));
  assign _zz_135_ = (! memory_arbitration_isStuck);
  assign _zz_136_ = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_137_ = (1'b1 || (! 1'b1));
  assign _zz_138_ = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_139_ = (1'b1 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign _zz_140_ = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_141_ = (1'b1 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign _zz_142_ = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign _zz_143_ = debug_bus_cmd_payload_address[7 : 2];
  assign _zz_144_ = (IBusSimplePlugin_cmd_ready && (! IBusSimplePlugin_cmd_s2mPipe_ready));
  assign _zz_145_ = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < (2'b11)));
  assign _zz_146_ = ((_zz_107_ && 1'b1) && (! 1'b0));
  assign _zz_147_ = ((_zz_108_ && 1'b1) && (! 1'b0));
  assign _zz_148_ = ((_zz_109_ && 1'b1) && (! 1'b0));
  assign _zz_149_ = writeBack_INSTRUCTION[13 : 12];
  assign _zz_150_ = writeBack_INSTRUCTION[13 : 12];
  assign _zz_151_ = execute_INSTRUCTION[13];
  assign _zz_152_ = _zz_65_[3 : 3];
  assign _zz_153_ = _zz_65_[6 : 6];
  assign _zz_154_ = _zz_65_[21 : 21];
  assign _zz_155_ = _zz_65_[24 : 24];
  assign _zz_156_ = _zz_65_[23 : 23];
  assign _zz_157_ = _zz_65_[10 : 10];
  assign _zz_158_ = _zz_65_[17 : 17];
  assign _zz_159_ = (decode_PC >>> 1);
  assign _zz_160_ = (decode_PC >>> 1);
  assign _zz_161_ = (decode_PC >>> 1);
  assign _zz_162_ = (decode_PC >>> 1);
  assign _zz_163_ = ($signed(_zz_164_) + $signed(_zz_169_));
  assign _zz_164_ = ($signed(_zz_165_) + $signed(_zz_167_));
  assign _zz_165_ = 52'h0;
  assign _zz_166_ = {1'b0,memory_MUL_LL};
  assign _zz_167_ = {{19{_zz_166_[32]}}, _zz_166_};
  assign _zz_168_ = ({16'd0,memory_MUL_LH} <<< 16);
  assign _zz_169_ = {{2{_zz_168_[49]}}, _zz_168_};
  assign _zz_170_ = ({16'd0,memory_MUL_HL} <<< 16);
  assign _zz_171_ = {{2{_zz_170_[49]}}, _zz_170_};
  assign _zz_172_ = _zz_65_[0 : 0];
  assign _zz_173_ = _zz_65_[11 : 11];
  assign _zz_174_ = _zz_65_[22 : 22];
  assign _zz_175_ = _zz_65_[12 : 12];
  assign _zz_176_ = _zz_65_[5 : 5];
  assign _zz_177_ = _zz_65_[1 : 1];
  assign _zz_178_ = _zz_65_[18 : 18];
  assign _zz_179_ = _zz_65_[2 : 2];
  assign _zz_180_ = _zz_65_[29 : 29];
  assign _zz_181_ = (_zz_46_ & (~ _zz_182_));
  assign _zz_182_ = (_zz_46_ - (2'b01));
  assign _zz_183_ = {IBusSimplePlugin_fetchPc_inc,(2'b00)};
  assign _zz_184_ = {29'd0, _zz_183_};
  assign _zz_185_ = (IBusSimplePlugin_pending_value + _zz_187_);
  assign _zz_186_ = IBusSimplePlugin_pending_inc;
  assign _zz_187_ = {2'd0, _zz_186_};
  assign _zz_188_ = IBusSimplePlugin_pending_dec;
  assign _zz_189_ = {2'd0, _zz_188_};
  assign _zz_190_ = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != (3'b000)));
  assign _zz_191_ = {2'd0, _zz_190_};
  assign _zz_192_ = IBusSimplePlugin_pending_dec;
  assign _zz_193_ = {2'd0, _zz_192_};
  assign _zz_194_ = execute_SRC_LESS;
  assign _zz_195_ = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign _zz_196_ = ({32'd0,writeBack_MUL_HH} <<< 32);
  assign _zz_197_ = writeBack_MUL_LOW[31 : 0];
  assign _zz_198_ = writeBack_MulPlugin_result[63 : 32];
  assign _zz_199_ = memory_DivPlugin_div_counter_willIncrement;
  assign _zz_200_ = {5'd0, _zz_199_};
  assign _zz_201_ = {1'd0, memory_DivPlugin_rs2};
  assign _zz_202_ = memory_DivPlugin_div_stage_0_remainderMinusDenominator[31:0];
  assign _zz_203_ = memory_DivPlugin_div_stage_0_remainderShifted[31:0];
  assign _zz_204_ = {_zz_81_,(! memory_DivPlugin_div_stage_0_remainderMinusDenominator[32])};
  assign _zz_205_ = _zz_206_;
  assign _zz_206_ = _zz_207_;
  assign _zz_207_ = ({1'b0,(memory_DivPlugin_div_needRevert ? (~ _zz_82_) : _zz_82_)} + _zz_209_);
  assign _zz_208_ = memory_DivPlugin_div_needRevert;
  assign _zz_209_ = {32'd0, _zz_208_};
  assign _zz_210_ = _zz_84_;
  assign _zz_211_ = {32'd0, _zz_210_};
  assign _zz_212_ = _zz_83_;
  assign _zz_213_ = {31'd0, _zz_212_};
  assign _zz_214_ = (3'b100);
  assign _zz_215_ = decode_INSTRUCTION[19 : 15];
  assign _zz_216_ = decode_INSTRUCTION[31 : 20];
  assign _zz_217_ = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign _zz_218_ = ($signed(_zz_219_) + $signed(_zz_222_));
  assign _zz_219_ = ($signed(_zz_220_) + $signed(_zz_221_));
  assign _zz_220_ = execute_SRC1;
  assign _zz_221_ = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_222_ = (execute_SRC_USE_SUB_LESS ? _zz_223_ : _zz_224_);
  assign _zz_223_ = 32'h00000001;
  assign _zz_224_ = 32'h0;
  assign _zz_225_ = (_zz_226_ >>> 1);
  assign _zz_226_ = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_LightShifterPlugin_shiftInput[31]),execute_LightShifterPlugin_shiftInput};
  assign _zz_227_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_228_ = execute_INSTRUCTION[31 : 20];
  assign _zz_229_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_230_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_231_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_232_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_233_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_234_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_235_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_236_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_237_ = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_238_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_239_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_240_ = 1'b1;
  assign _zz_241_ = 1'b1;
  assign _zz_242_ = ((decode_INSTRUCTION & _zz_254_) == 32'h00001010);
  assign _zz_243_ = (_zz_255_ == _zz_256_);
  assign _zz_244_ = {_zz_257_,{_zz_258_,_zz_259_}};
  assign _zz_245_ = ((decode_INSTRUCTION & _zz_260_) == 32'h00005010);
  assign _zz_246_ = ((decode_INSTRUCTION & _zz_261_) == 32'h00005020);
  assign _zz_247_ = (_zz_262_ == _zz_263_);
  assign _zz_248_ = {_zz_264_,_zz_265_};
  assign _zz_249_ = {_zz_266_,_zz_71_};
  assign _zz_250_ = (2'b00);
  assign _zz_251_ = ({_zz_267_,_zz_268_} != (2'b00));
  assign _zz_252_ = (_zz_269_ != _zz_270_);
  assign _zz_253_ = {_zz_271_,{_zz_272_,_zz_273_}};
  assign _zz_254_ = 32'h00001010;
  assign _zz_255_ = (decode_INSTRUCTION & 32'h00002010);
  assign _zz_256_ = 32'h00002010;
  assign _zz_257_ = ((decode_INSTRUCTION & _zz_274_) == 32'h00000010);
  assign _zz_258_ = (_zz_275_ == _zz_276_);
  assign _zz_259_ = (_zz_277_ == _zz_278_);
  assign _zz_260_ = 32'h00007034;
  assign _zz_261_ = 32'h02007064;
  assign _zz_262_ = (decode_INSTRUCTION & 32'h40003054);
  assign _zz_263_ = 32'h40001010;
  assign _zz_264_ = ((decode_INSTRUCTION & _zz_279_) == 32'h00001010);
  assign _zz_265_ = ((decode_INSTRUCTION & _zz_280_) == 32'h00001010);
  assign _zz_266_ = ((decode_INSTRUCTION & _zz_281_) == 32'h00000004);
  assign _zz_267_ = (_zz_282_ == _zz_283_);
  assign _zz_268_ = _zz_71_;
  assign _zz_269_ = (_zz_284_ == _zz_285_);
  assign _zz_270_ = (1'b0);
  assign _zz_271_ = (_zz_286_ != (1'b0));
  assign _zz_272_ = (_zz_287_ != _zz_288_);
  assign _zz_273_ = {_zz_289_,{_zz_290_,_zz_291_}};
  assign _zz_274_ = 32'h00000050;
  assign _zz_275_ = (decode_INSTRUCTION & 32'h0000000c);
  assign _zz_276_ = 32'h00000004;
  assign _zz_277_ = (decode_INSTRUCTION & 32'h00000028);
  assign _zz_278_ = 32'h0;
  assign _zz_279_ = 32'h00007034;
  assign _zz_280_ = 32'h02007054;
  assign _zz_281_ = 32'h00000014;
  assign _zz_282_ = (decode_INSTRUCTION & 32'h00000044);
  assign _zz_283_ = 32'h00000004;
  assign _zz_284_ = (decode_INSTRUCTION & 32'h00000058);
  assign _zz_285_ = 32'h0;
  assign _zz_286_ = ((decode_INSTRUCTION & 32'h00000020) == 32'h00000020);
  assign _zz_287_ = ((decode_INSTRUCTION & 32'h02004064) == 32'h02004020);
  assign _zz_288_ = (1'b0);
  assign _zz_289_ = (_zz_69_ != (1'b0));
  assign _zz_290_ = ((_zz_292_ == _zz_293_) != (1'b0));
  assign _zz_291_ = {(_zz_294_ != (1'b0)),{(_zz_295_ != _zz_296_),{_zz_297_,{_zz_298_,_zz_299_}}}};
  assign _zz_292_ = (decode_INSTRUCTION & 32'h00001000);
  assign _zz_293_ = 32'h00001000;
  assign _zz_294_ = ((decode_INSTRUCTION & 32'h00003000) == 32'h00002000);
  assign _zz_295_ = {(_zz_300_ == _zz_301_),{_zz_302_,_zz_303_}};
  assign _zz_296_ = (3'b000);
  assign _zz_297_ = ({_zz_67_,{_zz_304_,_zz_305_}} != (3'b000));
  assign _zz_298_ = ({_zz_306_,_zz_307_} != (2'b00));
  assign _zz_299_ = {(_zz_308_ != _zz_309_),{_zz_310_,{_zz_311_,_zz_312_}}};
  assign _zz_300_ = (decode_INSTRUCTION & 32'h00000044);
  assign _zz_301_ = 32'h00000040;
  assign _zz_302_ = ((decode_INSTRUCTION & 32'h00002014) == 32'h00002010);
  assign _zz_303_ = ((decode_INSTRUCTION & 32'h40004034) == 32'h40000030);
  assign _zz_304_ = _zz_66_;
  assign _zz_305_ = ((decode_INSTRUCTION & _zz_313_) == 32'h00000020);
  assign _zz_306_ = _zz_67_;
  assign _zz_307_ = ((decode_INSTRUCTION & _zz_314_) == 32'h00000020);
  assign _zz_308_ = {_zz_67_,(_zz_315_ == _zz_316_)};
  assign _zz_309_ = (2'b00);
  assign _zz_310_ = ({_zz_70_,_zz_317_} != (2'b00));
  assign _zz_311_ = (_zz_318_ != (1'b0));
  assign _zz_312_ = {(_zz_319_ != _zz_320_),{_zz_321_,{_zz_322_,_zz_323_}}};
  assign _zz_313_ = 32'h02000060;
  assign _zz_314_ = 32'h00000070;
  assign _zz_315_ = (decode_INSTRUCTION & 32'h00000020);
  assign _zz_316_ = 32'h0;
  assign _zz_317_ = ((decode_INSTRUCTION & 32'h0000001c) == 32'h00000004);
  assign _zz_318_ = ((decode_INSTRUCTION & 32'h00000058) == 32'h00000040);
  assign _zz_319_ = ((decode_INSTRUCTION & _zz_324_) == 32'h00000050);
  assign _zz_320_ = (1'b0);
  assign _zz_321_ = ({_zz_325_,_zz_326_} != (2'b00));
  assign _zz_322_ = ({_zz_327_,_zz_328_} != (2'b00));
  assign _zz_323_ = {(_zz_329_ != _zz_330_),{_zz_331_,{_zz_332_,_zz_333_}}};
  assign _zz_324_ = 32'h10003050;
  assign _zz_325_ = ((decode_INSTRUCTION & 32'h00002010) == 32'h00002000);
  assign _zz_326_ = ((decode_INSTRUCTION & 32'h00005000) == 32'h00001000);
  assign _zz_327_ = ((decode_INSTRUCTION & _zz_334_) == 32'h00001050);
  assign _zz_328_ = ((decode_INSTRUCTION & _zz_335_) == 32'h00002050);
  assign _zz_329_ = {(_zz_336_ == _zz_337_),(_zz_338_ == _zz_339_)};
  assign _zz_330_ = (2'b00);
  assign _zz_331_ = ({_zz_340_,_zz_341_} != (2'b00));
  assign _zz_332_ = (_zz_68_ != (1'b0));
  assign _zz_333_ = {(_zz_342_ != _zz_343_),{_zz_344_,{_zz_345_,_zz_346_}}};
  assign _zz_334_ = 32'h00001050;
  assign _zz_335_ = 32'h00002050;
  assign _zz_336_ = (decode_INSTRUCTION & 32'h00000050);
  assign _zz_337_ = 32'h00000040;
  assign _zz_338_ = (decode_INSTRUCTION & 32'h00103040);
  assign _zz_339_ = 32'h00000040;
  assign _zz_340_ = ((decode_INSTRUCTION & 32'h00006004) == 32'h00006000);
  assign _zz_341_ = ((decode_INSTRUCTION & 32'h00005004) == 32'h00004000);
  assign _zz_342_ = ((decode_INSTRUCTION & _zz_347_) == 32'h02000030);
  assign _zz_343_ = (1'b0);
  assign _zz_344_ = ({_zz_348_,_zz_349_} != (2'b00));
  assign _zz_345_ = (_zz_350_ != (1'b0));
  assign _zz_346_ = {(_zz_351_ != _zz_352_),{_zz_353_,{_zz_354_,_zz_355_}}};
  assign _zz_347_ = 32'h02004074;
  assign _zz_348_ = ((decode_INSTRUCTION & 32'h00000034) == 32'h00000020);
  assign _zz_349_ = ((decode_INSTRUCTION & 32'h00000064) == 32'h00000020);
  assign _zz_350_ = ((decode_INSTRUCTION & 32'h00103050) == 32'h00000050);
  assign _zz_351_ = _zz_69_;
  assign _zz_352_ = (1'b0);
  assign _zz_353_ = ({(_zz_356_ == _zz_357_),{_zz_358_,_zz_359_}} != (3'b000));
  assign _zz_354_ = ({_zz_360_,{_zz_361_,_zz_362_}} != (4'b0000));
  assign _zz_355_ = ({_zz_363_,{_zz_364_,_zz_365_}} != 5'h0);
  assign _zz_356_ = (decode_INSTRUCTION & 32'h00000064);
  assign _zz_357_ = 32'h00000024;
  assign _zz_358_ = ((decode_INSTRUCTION & 32'h00003034) == 32'h00001010);
  assign _zz_359_ = ((decode_INSTRUCTION & 32'h02003054) == 32'h00001010);
  assign _zz_360_ = ((decode_INSTRUCTION & 32'h00000044) == 32'h0);
  assign _zz_361_ = ((decode_INSTRUCTION & 32'h00000018) == 32'h0);
  assign _zz_362_ = {_zz_68_,((decode_INSTRUCTION & _zz_366_) == 32'h00001000)};
  assign _zz_363_ = ((decode_INSTRUCTION & 32'h00000040) == 32'h00000040);
  assign _zz_364_ = _zz_67_;
  assign _zz_365_ = {((decode_INSTRUCTION & _zz_367_) == 32'h00004020),{_zz_66_,(_zz_368_ == _zz_369_)}};
  assign _zz_366_ = 32'h00005004;
  assign _zz_367_ = 32'h00004020;
  assign _zz_368_ = (decode_INSTRUCTION & 32'h02000020);
  assign _zz_369_ = 32'h00000020;
  initial begin
    $readmemb("System.v_toplevel_core_axi_cpu_RegFilePlugin_regFile.bin",RegFilePlugin_regFile);
  end
  always @ (posedge io_mainClk) begin
    if(_zz_240_) begin
      _zz_121_ <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge io_mainClk) begin
    if(_zz_241_) begin
      _zz_122_ <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @ (posedge io_mainClk) begin
    if(_zz_36_) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  StreamFifoLowLatency_1_ IBusSimplePlugin_rspJoin_rspBuffer_c ( 
    .io_push_valid            (iBus_rsp_valid                                                  ), //i
    .io_push_ready            (IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready              ), //o
    .io_push_payload_error    (iBus_rsp_payload_error                                          ), //i
    .io_push_payload_inst     (iBus_rsp_payload_inst[31:0]                                     ), //i
    .io_pop_valid             (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid               ), //o
    .io_pop_ready             (_zz_119_                                                        ), //i
    .io_pop_payload_error     (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error       ), //o
    .io_pop_payload_inst      (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst[31:0]  ), //o
    .io_flush                 (_zz_120_                                                        ), //i
    .io_occupancy             (IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy               ), //o
    .io_mainClk               (io_mainClk                                                      ), //i
    .resetCtrl_axiReset       (resetCtrl_axiReset                                              )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_1_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_1__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_1__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_1__string = "AND_1";
      default : _zz_1__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_2_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_2__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_2__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_2__string = "AND_1";
      default : _zz_2__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_3_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_3__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_3__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_3__string = "AND_1";
      default : _zz_3__string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_4_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_4__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_4__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_4__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_4__string = "JALR";
      default : _zz_4__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_5_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_5__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_5__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_5__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_5__string = "JALR";
      default : _zz_5__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_6_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_6__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_6__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_6__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_6__string = "JALR";
      default : _zz_6__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_7_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_7__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_7__string = "XRET";
      default : _zz_7__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_8_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_8__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_8__string = "XRET";
      default : _zz_8__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_9_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_9__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_9__string = "XRET";
      default : _zz_9__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_10_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_10__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_10__string = "XRET";
      default : _zz_10__string = "????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_ENV_CTRL_string = "XRET";
      default : decode_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_11_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_11__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_11__string = "XRET";
      default : _zz_11__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_12_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_12__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_12__string = "XRET";
      default : _zz_12__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_13_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_13__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_13__string = "XRET";
      default : _zz_13__string = "????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_14_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_14__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_14__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_14__string = "BITWISE ";
      default : _zz_14__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_15_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_15__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_15__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_15__string = "BITWISE ";
      default : _zz_15__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_16_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_16__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_16__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_16__string = "BITWISE ";
      default : _zz_16__string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_17_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_17__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_17__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_17__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_17__string = "SRA_1    ";
      default : _zz_17__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_18_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_18__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_18__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_18__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_18__string = "SRA_1    ";
      default : _zz_18__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_19_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_19__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_19__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_19__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_19__string = "SRA_1    ";
      default : _zz_19__string = "?????????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_ENV_CTRL_string = "XRET";
      default : memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_20_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_20__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_20__string = "XRET";
      default : _zz_20__string = "????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_ENV_CTRL_string = "XRET";
      default : execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_21_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_21__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_21__string = "XRET";
      default : _zz_21__string = "????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : writeBack_ENV_CTRL_string = "XRET";
      default : writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_22_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_22__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_22__string = "XRET";
      default : _zz_22__string = "????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_23_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_23__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_23__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_23__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_23__string = "JALR";
      default : _zz_23__string = "????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_25_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_25__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_25__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_25__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_25__string = "SRA_1    ";
      default : _zz_25__string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_28_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_28__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_28__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_28__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_28__string = "PC ";
      default : _zz_28__string = "???";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_30_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_30__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_30__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_30__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_30__string = "URS1        ";
      default : _zz_30__string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_32_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_32__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_32__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_32__string = "BITWISE ";
      default : _zz_32__string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_33_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_33__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_33__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_33__string = "AND_1";
      default : _zz_33__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_37_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_37__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_37__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_37__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_37__string = "SRA_1    ";
      default : _zz_37__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_38_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_38__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_38__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_38__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_38__string = "URS1        ";
      default : _zz_38__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_39_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_39__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_39__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_39__string = "AND_1";
      default : _zz_39__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_40_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_40__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_40__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_40__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_40__string = "PC ";
      default : _zz_40__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_41_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_41__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_41__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_41__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_41__string = "JALR";
      default : _zz_41__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_42_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_42__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_42__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_42__string = "BITWISE ";
      default : _zz_42__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_43_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_43__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_43__string = "XRET";
      default : _zz_43__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_72_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_72__string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_72__string = "XRET";
      default : _zz_72__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_73_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_73__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_73__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_73__string = "BITWISE ";
      default : _zz_73__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_74_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_74__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_74__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_74__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_74__string = "JALR";
      default : _zz_74__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_75_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_75__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_75__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_75__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_75__string = "PC ";
      default : _zz_75__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_76_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_76__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_76__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_76__string = "AND_1";
      default : _zz_76__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_77_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_77__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_77__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_77__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_77__string = "URS1        ";
      default : _zz_77__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_78_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_78__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_78__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_78__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_78__string = "SRA_1    ";
      default : _zz_78__string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_to_execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_to_execute_ENV_CTRL_string = "XRET";
      default : decode_to_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_to_memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_to_memory_ENV_CTRL_string = "XRET";
      default : execute_to_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET";
      default : memory_to_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  `endif

  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = dBus_cmd_payload_address[1 : 0];
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_IS_RS2_SIGNED = _zz_152_[0];
  assign decode_RS2 = decode_RegFilePlugin_rs2Data;
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_80_;
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_153_[0];
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == (2'b01)) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == (2'b11)) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign decode_IS_RS1_SIGNED = _zz_154_[0];
  assign decode_ALU_BITWISE_CTRL = _zz_1_;
  assign _zz_2_ = _zz_3_;
  assign decode_MEMORY_ENABLE = _zz_155_[0];
  assign memory_MEMORY_READ_DATA = dBus_rsp_data;
  assign decode_RS1 = decode_RegFilePlugin_rs1Data;
  assign decode_BRANCH_CTRL = _zz_4_;
  assign _zz_5_ = _zz_6_;
  assign decode_MEMORY_STORE = _zz_156_[0];
  assign decode_IS_CSR = _zz_157_[0];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_158_[0];
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],(1'b0)};
  assign decode_SRC2 = _zz_91_;
  assign decode_DO_EBREAK = (((! DebugPlugin_haltIt) && (decode_IS_EBREAK || ((((1'b0 || (DebugPlugin_hardwareBreakpoints_0_valid && (DebugPlugin_hardwareBreakpoints_0_pc == _zz_159_))) || (DebugPlugin_hardwareBreakpoints_1_valid && (DebugPlugin_hardwareBreakpoints_1_pc == _zz_160_))) || (DebugPlugin_hardwareBreakpoints_2_valid && (DebugPlugin_hardwareBreakpoints_2_pc == _zz_161_))) || (DebugPlugin_hardwareBreakpoints_3_valid && (DebugPlugin_hardwareBreakpoints_3_pc == _zz_162_))))) && DebugPlugin_allowEBreak);
  assign decode_SRC1 = _zz_86_;
  assign memory_MUL_LOW = ($signed(_zz_163_) + $signed(_zz_171_));
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + 32'h00000004);
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_172_[0];
  assign _zz_7_ = _zz_8_;
  assign _zz_9_ = _zz_10_;
  assign decode_ENV_CTRL = _zz_11_;
  assign _zz_12_ = _zz_13_;
  assign execute_MUL_LL = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign execute_BRANCH_DO = _zz_99_;
  assign memory_PC = execute_to_memory_PC;
  assign decode_SRC_LESS_UNSIGNED = _zz_173_[0];
  assign decode_ALU_CTRL = _zz_14_;
  assign _zz_15_ = _zz_16_;
  assign decode_IS_DIV = _zz_174_[0];
  assign decode_SHIFT_CTRL = _zz_17_;
  assign _zz_18_ = _zz_19_;
  assign execute_MUL_LH = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_HL = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_175_[0];
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_20_;
  assign execute_ENV_CTRL = _zz_21_;
  assign writeBack_ENV_CTRL = _zz_22_;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PC = decode_to_execute_PC;
  assign execute_BRANCH_CTRL = _zz_23_;
  assign decode_RS2_USE = _zz_176_[0];
  assign decode_RS1_USE = _zz_177_[0];
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_24_ = execute_REGFILE_WRITE_DATA;
    if(_zz_123_)begin
      _zz_24_ = _zz_92_;
    end
    if(_zz_124_)begin
      _zz_24_ = execute_CsrPlugin_readData;
    end
  end

  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign execute_SHIFT_CTRL = _zz_25_;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_26_ = decode_PC;
  assign _zz_27_ = decode_RS2;
  assign decode_SRC2_CTRL = _zz_28_;
  assign _zz_29_ = decode_RS1;
  assign decode_SRC1_CTRL = _zz_30_;
  assign decode_SRC_USE_SUB_LESS = _zz_178_[0];
  assign decode_SRC_ADD_ZERO = _zz_179_[0];
  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  always @ (*) begin
    _zz_31_ = memory_REGFILE_WRITE_DATA;
    if(_zz_125_)begin
      _zz_31_ = memory_DivPlugin_div_result;
    end
  end

  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign writeBack_IS_MUL = memory_to_writeBack_IS_MUL;
  assign writeBack_MUL_HH = memory_to_writeBack_MUL_HH;
  assign writeBack_MUL_LOW = memory_to_writeBack_MUL_LOW;
  assign memory_MUL_HL = execute_to_memory_MUL_HL;
  assign memory_MUL_LH = execute_to_memory_MUL_LH;
  assign memory_MUL_LL = execute_to_memory_MUL_LL;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_32_;
  assign execute_SRC2 = decode_to_execute_SRC2;
  assign execute_SRC1 = decode_to_execute_SRC1;
  assign execute_ALU_BITWISE_CTRL = _zz_33_;
  assign _zz_34_ = writeBack_INSTRUCTION;
  assign _zz_35_ = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_36_ = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_36_ = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusSimplePlugin_iBusRsp_output_payload_rsp_inst);
  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_180_[0];
    if((decode_INSTRUCTION[11 : 7] == 5'h0))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign writeBack_MEMORY_STORE = memory_to_writeBack_MEMORY_STORE;
  always @ (*) begin
    _zz_44_ = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_44_ = writeBack_DBusSimplePlugin_rspFormated;
    end
    if((writeBack_arbitration_isValid && writeBack_IS_MUL))begin
      case(_zz_150_)
        2'b00 : begin
          _zz_44_ = _zz_197_;
        end
        default : begin
          _zz_44_ = _zz_198_;
        end
      endcase
    end
  end

  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_READ_DATA = memory_to_writeBack_MEMORY_READ_DATA;
  assign memory_MEMORY_STORE = execute_to_memory_MEMORY_STORE;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = 1'b0;
  always @ (*) begin
    _zz_45_ = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid)begin
      _zz_45_ = BranchPlugin_jumpInterface_payload;
    end
  end

  assign decode_PC = IBusSimplePlugin_injector_decodeInput_payload_pc;
  assign decode_INSTRUCTION = IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  always @ (*) begin
    decode_arbitration_haltItself = 1'b0;
    case(_zz_111_)
      3'b000 : begin
      end
      3'b001 : begin
      end
      3'b010 : begin
        decode_arbitration_haltItself = 1'b1;
      end
      3'b011 : begin
      end
      3'b100 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    if((decode_arbitration_isValid && (_zz_93_ || _zz_94_)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(CsrPlugin_pipelineLiberator_active)begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(({(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET))}} != (3'b000)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  assign decode_arbitration_flushNext = 1'b0;
  always @ (*) begin
    execute_arbitration_haltItself = 1'b0;
    if(((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_58_)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_123_)begin
      if(_zz_126_)begin
        if(! execute_LightShifterPlugin_done) begin
          execute_arbitration_haltItself = 1'b1;
        end
      end
    end
    if(_zz_124_)begin
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_arbitration_haltByOther = 1'b0;
    if(_zz_127_)begin
      execute_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_removeIt = 1'b0;
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_flushIt = 1'b0;
    if(_zz_127_)begin
      if(_zz_128_)begin
        execute_arbitration_flushIt = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_arbitration_flushNext = 1'b0;
    if(_zz_127_)begin
      if(_zz_128_)begin
        execute_arbitration_flushNext = 1'b1;
      end
    end
  end

  always @ (*) begin
    memory_arbitration_haltItself = 1'b0;
    if((((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_MEMORY_STORE)) && ((! dBus_rsp_ready) || 1'b0)))begin
      memory_arbitration_haltItself = 1'b1;
    end
    if(_zz_125_)begin
      if(((! memory_DivPlugin_frontendOk) || (! memory_DivPlugin_div_done)))begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @ (*) begin
    memory_arbitration_flushNext = 1'b0;
    if(BranchPlugin_jumpInterface_valid)begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_flushIt = 1'b0;
  always @ (*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(_zz_129_)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_130_)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @ (*) begin
    IBusSimplePlugin_fetcherHalt = 1'b0;
    if(_zz_129_)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_130_)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_127_)begin
      if(_zz_128_)begin
        IBusSimplePlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_131_)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_incomingInstruction = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_valid)begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
  end

  assign CsrPlugin_inWfi = 1'b0;
  always @ (*) begin
    CsrPlugin_thirdPartyWake = 1'b0;
    if(DebugPlugin_haltIt)begin
      CsrPlugin_thirdPartyWake = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(_zz_129_)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_130_)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_payload = 32'h0;
    if(_zz_129_)begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,(2'b00)};
    end
    if(_zz_130_)begin
      case(_zz_132_)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  always @ (*) begin
    CsrPlugin_forceMachineWire = 1'b0;
    if(DebugPlugin_godmode)begin
      CsrPlugin_forceMachineWire = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_allowInterrupts = 1'b1;
    if((DebugPlugin_haltIt || DebugPlugin_stepIt))begin
      CsrPlugin_allowInterrupts = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_allowException = 1'b1;
    if(DebugPlugin_godmode)begin
      CsrPlugin_allowException = 1'b0;
    end
  end

  assign IBusSimplePlugin_externalFlush = ({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != (4'b0000));
  assign IBusSimplePlugin_jump_pcLoad_valid = ({CsrPlugin_jumpInterface_valid,BranchPlugin_jumpInterface_valid} != (2'b00));
  assign _zz_46_ = {BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid};
  assign IBusSimplePlugin_jump_pcLoad_payload = (_zz_181_[0] ? CsrPlugin_jumpInterface_payload : BranchPlugin_jumpInterface_payload);
  always @ (*) begin
    IBusSimplePlugin_fetchPc_correction = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_corrected = (IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_correctionReg);
  always @ (*) begin
    IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_ready)begin
      IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_184_);
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
    IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_flushed = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_output_valid = ((! IBusSimplePlugin_fetcherHalt) && IBusSimplePlugin_fetchPc_booted);
  assign IBusSimplePlugin_fetchPc_output_payload = IBusSimplePlugin_fetchPc_pc;
  assign IBusSimplePlugin_iBusRsp_redoFetch = 1'b0;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_valid = IBusSimplePlugin_fetchPc_output_valid;
  assign IBusSimplePlugin_fetchPc_output_ready = IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_payload = IBusSimplePlugin_fetchPc_output_payload;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b0;
    if((IBusSimplePlugin_iBusRsp_stages_0_input_valid && ((! IBusSimplePlugin_cmdFork_canEmit) || (! IBusSimplePlugin_cmd_ready))))begin
      IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_47_ = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_47_);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_47_);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
  assign _zz_48_ = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_48_);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_48_);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_flush = (IBusSimplePlugin_externalFlush || IBusSimplePlugin_iBusRsp_redoFetch);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = _zz_49_;
  assign _zz_49_ = ((1'b0 && (! _zz_50_)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_50_ = _zz_51_;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_50_;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = IBusSimplePlugin_fetchPc_pcReg;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
    if((! IBusSimplePlugin_pcValids_0))begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusSimplePlugin_iBusRsp_output_ready = ((1'b0 && (! IBusSimplePlugin_injector_decodeInput_valid)) || IBusSimplePlugin_injector_decodeInput_ready);
  assign IBusSimplePlugin_injector_decodeInput_valid = _zz_52_;
  assign IBusSimplePlugin_injector_decodeInput_payload_pc = _zz_53_;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_error = _zz_54_;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_inst = _zz_55_;
  assign IBusSimplePlugin_injector_decodeInput_payload_isRvc = _zz_56_;
  assign IBusSimplePlugin_pcValids_0 = IBusSimplePlugin_injector_nextPcCalc_valids_1;
  assign IBusSimplePlugin_pcValids_1 = IBusSimplePlugin_injector_nextPcCalc_valids_2;
  assign IBusSimplePlugin_pcValids_2 = IBusSimplePlugin_injector_nextPcCalc_valids_3;
  assign IBusSimplePlugin_pcValids_3 = IBusSimplePlugin_injector_nextPcCalc_valids_4;
  assign IBusSimplePlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  always @ (*) begin
    decode_arbitration_isValid = IBusSimplePlugin_injector_decodeInput_valid;
    case(_zz_111_)
      3'b000 : begin
      end
      3'b001 : begin
      end
      3'b010 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b011 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b100 : begin
      end
      default : begin
      end
    endcase
  end

  assign IBusSimplePlugin_cmd_s2mPipe_valid = (IBusSimplePlugin_cmd_valid || IBusSimplePlugin_cmd_s2mPipe_rValid);
  assign IBusSimplePlugin_cmd_ready = (! IBusSimplePlugin_cmd_s2mPipe_rValid);
  assign IBusSimplePlugin_cmd_s2mPipe_payload_pc = (IBusSimplePlugin_cmd_s2mPipe_rValid ? IBusSimplePlugin_cmd_s2mPipe_rData_pc : IBusSimplePlugin_cmd_payload_pc);
  assign iBus_cmd_valid = IBusSimplePlugin_cmd_s2mPipe_valid;
  assign IBusSimplePlugin_cmd_s2mPipe_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_s2mPipe_payload_pc;
  assign IBusSimplePlugin_pending_next = (_zz_185_ - _zz_189_);
  assign IBusSimplePlugin_cmdFork_canEmit = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && (IBusSimplePlugin_pending_value != (3'b111)));
  assign IBusSimplePlugin_cmd_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && IBusSimplePlugin_cmdFork_canEmit);
  assign IBusSimplePlugin_pending_inc = (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready);
  assign IBusSimplePlugin_cmd_payload_pc = {IBusSimplePlugin_iBusRsp_stages_0_input_payload[31 : 2],(2'b00)};
  assign IBusSimplePlugin_rspJoin_rspBuffer_flush = ((IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != (3'b000)) || IBusSimplePlugin_iBusRsp_flush);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_valid = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter == (3'b000)));
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  assign _zz_119_ = (IBusSimplePlugin_rspJoin_rspBuffer_output_ready || IBusSimplePlugin_rspJoin_rspBuffer_flush);
  assign IBusSimplePlugin_pending_dec = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && _zz_119_);
  assign IBusSimplePlugin_rspJoin_fetchRsp_pc = IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  always @ (*) begin
    IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
    if((! IBusSimplePlugin_rspJoin_rspBuffer_output_valid))begin
      IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = 1'b0;
    end
  end

  assign IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  assign IBusSimplePlugin_rspJoin_exceptionDetected = 1'b0;
  assign IBusSimplePlugin_rspJoin_join_valid = (IBusSimplePlugin_iBusRsp_stages_1_output_valid && IBusSimplePlugin_rspJoin_rspBuffer_output_valid);
  assign IBusSimplePlugin_rspJoin_join_payload_pc = IBusSimplePlugin_rspJoin_fetchRsp_pc;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_error = IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_inst = IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  assign IBusSimplePlugin_rspJoin_join_payload_isRvc = IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_valid ? (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready) : IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_ready = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign _zz_57_ = (! IBusSimplePlugin_rspJoin_exceptionDetected);
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_output_ready && _zz_57_);
  assign IBusSimplePlugin_iBusRsp_output_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_57_);
  assign IBusSimplePlugin_iBusRsp_output_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_inst = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_output_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  assign _zz_58_ = 1'b0;
  always @ (*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT)begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_58_));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_59_ = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_59_ = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_59_ = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_59_;
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_60_ = (4'b0001);
      end
      2'b01 : begin
        _zz_60_ = (4'b0011);
      end
      default : begin
        _zz_60_ = (4'b1111);
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_60_ <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  always @ (*) begin
    writeBack_DBusSimplePlugin_rspShifted = writeBack_MEMORY_READ_DATA;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusSimplePlugin_rspShifted[15 : 0] = writeBack_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_61_ = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_62_[31] = _zz_61_;
    _zz_62_[30] = _zz_61_;
    _zz_62_[29] = _zz_61_;
    _zz_62_[28] = _zz_61_;
    _zz_62_[27] = _zz_61_;
    _zz_62_[26] = _zz_61_;
    _zz_62_[25] = _zz_61_;
    _zz_62_[24] = _zz_61_;
    _zz_62_[23] = _zz_61_;
    _zz_62_[22] = _zz_61_;
    _zz_62_[21] = _zz_61_;
    _zz_62_[20] = _zz_61_;
    _zz_62_[19] = _zz_61_;
    _zz_62_[18] = _zz_61_;
    _zz_62_[17] = _zz_61_;
    _zz_62_[16] = _zz_61_;
    _zz_62_[15] = _zz_61_;
    _zz_62_[14] = _zz_61_;
    _zz_62_[13] = _zz_61_;
    _zz_62_[12] = _zz_61_;
    _zz_62_[11] = _zz_61_;
    _zz_62_[10] = _zz_61_;
    _zz_62_[9] = _zz_61_;
    _zz_62_[8] = _zz_61_;
    _zz_62_[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_63_ = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_64_[31] = _zz_63_;
    _zz_64_[30] = _zz_63_;
    _zz_64_[29] = _zz_63_;
    _zz_64_[28] = _zz_63_;
    _zz_64_[27] = _zz_63_;
    _zz_64_[26] = _zz_63_;
    _zz_64_[25] = _zz_63_;
    _zz_64_[24] = _zz_63_;
    _zz_64_[23] = _zz_63_;
    _zz_64_[22] = _zz_63_;
    _zz_64_[21] = _zz_63_;
    _zz_64_[20] = _zz_63_;
    _zz_64_[19] = _zz_63_;
    _zz_64_[18] = _zz_63_;
    _zz_64_[17] = _zz_63_;
    _zz_64_[16] = _zz_63_;
    _zz_64_[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_149_)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_62_;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_64_;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign _zz_66_ = ((decode_INSTRUCTION & 32'h00000030) == 32'h00000010);
  assign _zz_67_ = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_68_ = ((decode_INSTRUCTION & 32'h00006004) == 32'h00002000);
  assign _zz_69_ = ((decode_INSTRUCTION & 32'h00001000) == 32'h0);
  assign _zz_70_ = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_71_ = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_65_ = {({_zz_70_,{_zz_242_,{_zz_243_,_zz_244_}}} != 6'h0),{({_zz_245_,_zz_246_} != (2'b00)),{({_zz_247_,_zz_248_} != (3'b000)),{(_zz_249_ != _zz_250_),{_zz_251_,{_zz_252_,_zz_253_}}}}}};
  assign _zz_72_ = _zz_65_[4 : 4];
  assign _zz_43_ = _zz_72_;
  assign _zz_73_ = _zz_65_[8 : 7];
  assign _zz_42_ = _zz_73_;
  assign _zz_74_ = _zz_65_[14 : 13];
  assign _zz_41_ = _zz_74_;
  assign _zz_75_ = _zz_65_[16 : 15];
  assign _zz_40_ = _zz_75_;
  assign _zz_76_ = _zz_65_[20 : 19];
  assign _zz_39_ = _zz_76_;
  assign _zz_77_ = _zz_65_[26 : 25];
  assign _zz_38_ = _zz_77_;
  assign _zz_78_ = _zz_65_[28 : 27];
  assign _zz_37_ = _zz_78_;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_121_;
  assign decode_RegFilePlugin_rs2Data = _zz_122_;
  always @ (*) begin
    lastStageRegFileWrite_valid = (_zz_35_ && writeBack_arbitration_isFiring);
    if(_zz_79_)begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  assign lastStageRegFileWrite_payload_address = _zz_34_[11 : 7];
  assign lastStageRegFileWrite_payload_data = _zz_44_;
  always @ (*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @ (*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_BITWISE : begin
        _zz_80_ = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_80_ = {31'd0, _zz_194_};
      end
      default : begin
        _zz_80_ = execute_SRC_ADD_SUB;
      end
    endcase
  end

  assign execute_MulPlugin_a = execute_RS1;
  assign execute_MulPlugin_b = execute_RS2;
  always @ (*) begin
    case(_zz_133_)
      2'b01 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      default : begin
        execute_MulPlugin_aSigned = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_133_)
      2'b01 : begin
        execute_MulPlugin_bSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
      default : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
    endcase
  end

  assign execute_MulPlugin_aULow = execute_MulPlugin_a[15 : 0];
  assign execute_MulPlugin_bULow = execute_MulPlugin_b[15 : 0];
  assign execute_MulPlugin_aSLow = {1'b0,execute_MulPlugin_a[15 : 0]};
  assign execute_MulPlugin_bSLow = {1'b0,execute_MulPlugin_b[15 : 0]};
  assign execute_MulPlugin_aHigh = {(execute_MulPlugin_aSigned && execute_MulPlugin_a[31]),execute_MulPlugin_a[31 : 16]};
  assign execute_MulPlugin_bHigh = {(execute_MulPlugin_bSigned && execute_MulPlugin_b[31]),execute_MulPlugin_b[31 : 16]};
  assign writeBack_MulPlugin_result = ($signed(_zz_195_) + $signed(_zz_196_));
  assign memory_DivPlugin_frontendOk = 1'b1;
  always @ (*) begin
    memory_DivPlugin_div_counter_willIncrement = 1'b0;
    if(_zz_125_)begin
      if(_zz_134_)begin
        memory_DivPlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @ (*) begin
    memory_DivPlugin_div_counter_willClear = 1'b0;
    if(_zz_135_)begin
      memory_DivPlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_DivPlugin_div_counter_willOverflowIfInc = (memory_DivPlugin_div_counter_value == 6'h21);
  assign memory_DivPlugin_div_counter_willOverflow = (memory_DivPlugin_div_counter_willOverflowIfInc && memory_DivPlugin_div_counter_willIncrement);
  always @ (*) begin
    if(memory_DivPlugin_div_counter_willOverflow)begin
      memory_DivPlugin_div_counter_valueNext = 6'h0;
    end else begin
      memory_DivPlugin_div_counter_valueNext = (memory_DivPlugin_div_counter_value + _zz_200_);
    end
    if(memory_DivPlugin_div_counter_willClear)begin
      memory_DivPlugin_div_counter_valueNext = 6'h0;
    end
  end

  assign _zz_81_ = memory_DivPlugin_rs1[31 : 0];
  assign memory_DivPlugin_div_stage_0_remainderShifted = {memory_DivPlugin_accumulator[31 : 0],_zz_81_[31]};
  assign memory_DivPlugin_div_stage_0_remainderMinusDenominator = (memory_DivPlugin_div_stage_0_remainderShifted - _zz_201_);
  assign memory_DivPlugin_div_stage_0_outRemainder = ((! memory_DivPlugin_div_stage_0_remainderMinusDenominator[32]) ? _zz_202_ : _zz_203_);
  assign memory_DivPlugin_div_stage_0_outNumerator = _zz_204_[31:0];
  assign _zz_82_ = (memory_INSTRUCTION[13] ? memory_DivPlugin_accumulator[31 : 0] : memory_DivPlugin_rs1[31 : 0]);
  assign _zz_83_ = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_84_ = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ (*) begin
    _zz_85_[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_85_[31 : 0] = execute_RS1;
  end

  always @ (*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_86_ = _zz_29_;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_86_ = {29'd0, _zz_214_};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_86_ = {decode_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_86_ = {27'd0, _zz_215_};
      end
    endcase
  end

  assign _zz_87_ = _zz_216_[11];
  always @ (*) begin
    _zz_88_[19] = _zz_87_;
    _zz_88_[18] = _zz_87_;
    _zz_88_[17] = _zz_87_;
    _zz_88_[16] = _zz_87_;
    _zz_88_[15] = _zz_87_;
    _zz_88_[14] = _zz_87_;
    _zz_88_[13] = _zz_87_;
    _zz_88_[12] = _zz_87_;
    _zz_88_[11] = _zz_87_;
    _zz_88_[10] = _zz_87_;
    _zz_88_[9] = _zz_87_;
    _zz_88_[8] = _zz_87_;
    _zz_88_[7] = _zz_87_;
    _zz_88_[6] = _zz_87_;
    _zz_88_[5] = _zz_87_;
    _zz_88_[4] = _zz_87_;
    _zz_88_[3] = _zz_87_;
    _zz_88_[2] = _zz_87_;
    _zz_88_[1] = _zz_87_;
    _zz_88_[0] = _zz_87_;
  end

  assign _zz_89_ = _zz_217_[11];
  always @ (*) begin
    _zz_90_[19] = _zz_89_;
    _zz_90_[18] = _zz_89_;
    _zz_90_[17] = _zz_89_;
    _zz_90_[16] = _zz_89_;
    _zz_90_[15] = _zz_89_;
    _zz_90_[14] = _zz_89_;
    _zz_90_[13] = _zz_89_;
    _zz_90_[12] = _zz_89_;
    _zz_90_[11] = _zz_89_;
    _zz_90_[10] = _zz_89_;
    _zz_90_[9] = _zz_89_;
    _zz_90_[8] = _zz_89_;
    _zz_90_[7] = _zz_89_;
    _zz_90_[6] = _zz_89_;
    _zz_90_[5] = _zz_89_;
    _zz_90_[4] = _zz_89_;
    _zz_90_[3] = _zz_89_;
    _zz_90_[2] = _zz_89_;
    _zz_90_[1] = _zz_89_;
    _zz_90_[0] = _zz_89_;
  end

  always @ (*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_91_ = _zz_27_;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_91_ = {_zz_88_,decode_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_91_ = {_zz_90_,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_91_ = _zz_26_;
      end
    endcase
  end

  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_218_;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_LightShifterPlugin_isShift = (execute_SHIFT_CTRL != `ShiftCtrlEnum_defaultEncoding_DISABLE_1);
  assign execute_LightShifterPlugin_amplitude = (execute_LightShifterPlugin_isActive ? execute_LightShifterPlugin_amplitudeReg : execute_SRC2[4 : 0]);
  assign execute_LightShifterPlugin_shiftInput = (execute_LightShifterPlugin_isActive ? memory_REGFILE_WRITE_DATA : execute_SRC1);
  assign execute_LightShifterPlugin_done = (execute_LightShifterPlugin_amplitude[4 : 1] == (4'b0000));
  always @ (*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
        _zz_92_ = (execute_LightShifterPlugin_shiftInput <<< 1);
      end
      default : begin
        _zz_92_ = _zz_225_;
      end
    endcase
  end

  always @ (*) begin
    _zz_93_ = 1'b0;
    if(_zz_95_)begin
      if((_zz_96_ == decode_INSTRUCTION[19 : 15]))begin
        _zz_93_ = 1'b1;
      end
    end
    if(_zz_136_)begin
      if(_zz_137_)begin
        if((writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]))begin
          _zz_93_ = 1'b1;
        end
      end
    end
    if(_zz_138_)begin
      if(_zz_139_)begin
        if((memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]))begin
          _zz_93_ = 1'b1;
        end
      end
    end
    if(_zz_140_)begin
      if(_zz_141_)begin
        if((execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]))begin
          _zz_93_ = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _zz_93_ = 1'b0;
    end
  end

  always @ (*) begin
    _zz_94_ = 1'b0;
    if(_zz_95_)begin
      if((_zz_96_ == decode_INSTRUCTION[24 : 20]))begin
        _zz_94_ = 1'b1;
      end
    end
    if(_zz_136_)begin
      if(_zz_137_)begin
        if((writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]))begin
          _zz_94_ = 1'b1;
        end
      end
    end
    if(_zz_138_)begin
      if(_zz_139_)begin
        if((memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]))begin
          _zz_94_ = 1'b1;
        end
      end
    end
    if(_zz_140_)begin
      if(_zz_141_)begin
        if((execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]))begin
          _zz_94_ = 1'b1;
        end
      end
    end
    if((! decode_RS2_USE))begin
      _zz_94_ = 1'b0;
    end
  end

  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_97_ = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_97_ == (3'b000))) begin
        _zz_98_ = execute_BranchPlugin_eq;
    end else if((_zz_97_ == (3'b001))) begin
        _zz_98_ = (! execute_BranchPlugin_eq);
    end else if((((_zz_97_ & (3'b101)) == (3'b101)))) begin
        _zz_98_ = (! execute_SRC_LESS);
    end else begin
        _zz_98_ = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_99_ = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_99_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_99_ = 1'b1;
      end
      default : begin
        _zz_99_ = _zz_98_;
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JALR) ? execute_RS1 : execute_PC);
  assign _zz_100_ = _zz_227_[19];
  always @ (*) begin
    _zz_101_[10] = _zz_100_;
    _zz_101_[9] = _zz_100_;
    _zz_101_[8] = _zz_100_;
    _zz_101_[7] = _zz_100_;
    _zz_101_[6] = _zz_100_;
    _zz_101_[5] = _zz_100_;
    _zz_101_[4] = _zz_100_;
    _zz_101_[3] = _zz_100_;
    _zz_101_[2] = _zz_100_;
    _zz_101_[1] = _zz_100_;
    _zz_101_[0] = _zz_100_;
  end

  assign _zz_102_ = _zz_228_[11];
  always @ (*) begin
    _zz_103_[19] = _zz_102_;
    _zz_103_[18] = _zz_102_;
    _zz_103_[17] = _zz_102_;
    _zz_103_[16] = _zz_102_;
    _zz_103_[15] = _zz_102_;
    _zz_103_[14] = _zz_102_;
    _zz_103_[13] = _zz_102_;
    _zz_103_[12] = _zz_102_;
    _zz_103_[11] = _zz_102_;
    _zz_103_[10] = _zz_102_;
    _zz_103_[9] = _zz_102_;
    _zz_103_[8] = _zz_102_;
    _zz_103_[7] = _zz_102_;
    _zz_103_[6] = _zz_102_;
    _zz_103_[5] = _zz_102_;
    _zz_103_[4] = _zz_102_;
    _zz_103_[3] = _zz_102_;
    _zz_103_[2] = _zz_102_;
    _zz_103_[1] = _zz_102_;
    _zz_103_[0] = _zz_102_;
  end

  assign _zz_104_ = _zz_229_[11];
  always @ (*) begin
    _zz_105_[18] = _zz_104_;
    _zz_105_[17] = _zz_104_;
    _zz_105_[16] = _zz_104_;
    _zz_105_[15] = _zz_104_;
    _zz_105_[14] = _zz_104_;
    _zz_105_[13] = _zz_104_;
    _zz_105_[12] = _zz_104_;
    _zz_105_[11] = _zz_104_;
    _zz_105_[10] = _zz_104_;
    _zz_105_[9] = _zz_104_;
    _zz_105_[8] = _zz_104_;
    _zz_105_[7] = _zz_104_;
    _zz_105_[6] = _zz_104_;
    _zz_105_[5] = _zz_104_;
    _zz_105_[4] = _zz_104_;
    _zz_105_[3] = _zz_104_;
    _zz_105_[2] = _zz_104_;
    _zz_105_[1] = _zz_104_;
    _zz_105_[0] = _zz_104_;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_106_ = {{_zz_101_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_106_ = {_zz_103_,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        _zz_106_ = {{_zz_105_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src2 = _zz_106_;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  always @ (*) begin
    CsrPlugin_privilege = (2'b11);
    if(CsrPlugin_forceMachineWire)begin
      CsrPlugin_privilege = (2'b11);
    end
  end

  assign CsrPlugin_misa_base = (2'b01);
  assign CsrPlugin_misa_extensions = 26'h0000042;
  assign _zz_107_ = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_108_ = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_109_ = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exception = 1'b0;
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(CsrPlugin_hadException)begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  assign CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
  assign CsrPlugin_trapCause = CsrPlugin_interrupt_code;
  always @ (*) begin
    CsrPlugin_xtvec_mode = (2'bxx);
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    CsrPlugin_xtvec_base = 30'h0;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign execute_CsrPlugin_blockedBySideEffects = ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00));
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    if(execute_CsrPlugin_csr_768)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_836)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_772)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_773)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_833)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_834)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_835)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(_zz_142_)begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(((! execute_arbitration_isValid) || (! execute_IS_CSR)))begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)))begin
      if((CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]))begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
    if(_zz_142_)begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(_zz_142_)begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readToWriteData = execute_CsrPlugin_readData;
  always @ (*) begin
    case(_zz_151_)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  always @ (*) begin
    debug_bus_cmd_ready = 1'b1;
    if(debug_bus_cmd_valid)begin
      case(_zz_143_)
        6'b000000 : begin
        end
        6'b000001 : begin
          if(debug_bus_cmd_payload_wr)begin
            debug_bus_cmd_ready = IBusSimplePlugin_injectionPort_ready;
          end
        end
        6'b010000 : begin
        end
        6'b010001 : begin
        end
        6'b010010 : begin
        end
        6'b010011 : begin
        end
        default : begin
        end
      endcase
    end
  end

  always @ (*) begin
    debug_bus_rsp_data = DebugPlugin_busReadDataReg;
    if((! _zz_110_))begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid)begin
      case(_zz_143_)
        6'b000000 : begin
        end
        6'b000001 : begin
          if(debug_bus_cmd_payload_wr)begin
            IBusSimplePlugin_injectionPort_valid = 1'b1;
          end
        end
        6'b010000 : begin
        end
        6'b010001 : begin
        end
        6'b010010 : begin
        end
        6'b010011 : begin
        end
        default : begin
        end
      endcase
    end
  end

  assign IBusSimplePlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign DebugPlugin_allowEBreak = (CsrPlugin_privilege == (2'b11));
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign _zz_30_ = _zz_38_;
  assign _zz_19_ = decode_SHIFT_CTRL;
  assign _zz_17_ = _zz_37_;
  assign _zz_25_ = decode_to_execute_SHIFT_CTRL;
  assign _zz_16_ = decode_ALU_CTRL;
  assign _zz_14_ = _zz_42_;
  assign _zz_32_ = decode_to_execute_ALU_CTRL;
  assign _zz_13_ = decode_ENV_CTRL;
  assign _zz_10_ = execute_ENV_CTRL;
  assign _zz_8_ = memory_ENV_CTRL;
  assign _zz_11_ = _zz_43_;
  assign _zz_21_ = decode_to_execute_ENV_CTRL;
  assign _zz_20_ = execute_to_memory_ENV_CTRL;
  assign _zz_22_ = memory_to_writeBack_ENV_CTRL;
  assign _zz_28_ = _zz_40_;
  assign _zz_6_ = decode_BRANCH_CTRL;
  assign _zz_4_ = _zz_41_;
  assign _zz_23_ = decode_to_execute_BRANCH_CTRL;
  assign _zz_3_ = decode_ALU_BITWISE_CTRL;
  assign _zz_1_ = _zz_39_;
  assign _zz_33_ = decode_to_execute_ALU_BITWISE_CTRL;
  assign decode_arbitration_isFlushed = (({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}} != (3'b000)) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}} != (4'b0000)));
  assign execute_arbitration_isFlushed = (({writeBack_arbitration_flushNext,memory_arbitration_flushNext} != (2'b00)) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}} != (3'b000)));
  assign memory_arbitration_isFlushed = ((writeBack_arbitration_flushNext != (1'b0)) || ({writeBack_arbitration_flushIt,memory_arbitration_flushIt} != (2'b00)));
  assign writeBack_arbitration_isFlushed = (1'b0 || (writeBack_arbitration_flushIt != (1'b0)));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  always @ (*) begin
    IBusSimplePlugin_injectionPort_ready = 1'b0;
    case(_zz_111_)
      3'b000 : begin
      end
      3'b001 : begin
      end
      3'b010 : begin
      end
      3'b011 : begin
      end
      3'b100 : begin
        IBusSimplePlugin_injectionPort_ready = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_112_ = 32'h0;
    if(execute_CsrPlugin_csr_768)begin
      _zz_112_[12 : 11] = CsrPlugin_mstatus_MPP;
      _zz_112_[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_112_[3 : 3] = CsrPlugin_mstatus_MIE;
    end
  end

  always @ (*) begin
    _zz_113_ = 32'h0;
    if(execute_CsrPlugin_csr_836)begin
      _zz_113_[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_113_[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_113_[3 : 3] = CsrPlugin_mip_MSIP;
    end
  end

  always @ (*) begin
    _zz_114_ = 32'h0;
    if(execute_CsrPlugin_csr_772)begin
      _zz_114_[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_114_[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_114_[3 : 3] = CsrPlugin_mie_MSIE;
    end
  end

  always @ (*) begin
    _zz_115_ = 32'h0;
    if(execute_CsrPlugin_csr_773)begin
      _zz_115_[31 : 2] = CsrPlugin_mtvec_base;
      _zz_115_[1 : 0] = CsrPlugin_mtvec_mode;
    end
  end

  always @ (*) begin
    _zz_116_ = 32'h0;
    if(execute_CsrPlugin_csr_833)begin
      _zz_116_[31 : 0] = CsrPlugin_mepc;
    end
  end

  always @ (*) begin
    _zz_117_ = 32'h0;
    if(execute_CsrPlugin_csr_834)begin
      _zz_117_[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_117_[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  always @ (*) begin
    _zz_118_ = 32'h0;
    if(execute_CsrPlugin_csr_835)begin
      _zz_118_[31 : 0] = CsrPlugin_mtval;
    end
  end

  assign execute_CsrPlugin_readData = (((_zz_112_ | _zz_113_) | (_zz_114_ | _zz_115_)) | ((_zz_116_ | _zz_117_) | _zz_118_));
  assign _zz_120_ = 1'b0;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      IBusSimplePlugin_fetchPc_pcReg <= 32'h80000000;
      IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      IBusSimplePlugin_fetchPc_booted <= 1'b0;
      IBusSimplePlugin_fetchPc_inc <= 1'b0;
      _zz_51_ <= 1'b0;
      _zz_52_ <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusSimplePlugin_cmd_s2mPipe_rValid <= 1'b0;
      IBusSimplePlugin_pending_value <= (3'b000);
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (3'b000);
      _zz_79_ <= 1'b1;
      memory_DivPlugin_div_counter_value <= 6'h0;
      execute_LightShifterPlugin_isActive <= 1'b0;
      _zz_95_ <= 1'b0;
      CsrPlugin_mtvec_mode <= (2'b00);
      CsrPlugin_mtvec_base <= 30'h20000000;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= (2'b11);
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      _zz_111_ <= (3'b000);
      memory_to_writeBack_REGFILE_WRITE_DATA <= 32'h0;
      memory_to_writeBack_INSTRUCTION <= 32'h0;
    end else begin
      if(IBusSimplePlugin_fetchPc_correction)begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b1;
      end
      if((IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusSimplePlugin_fetchPc_booted <= 1'b1;
      if((IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_pcRegPropagate))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(((! IBusSimplePlugin_fetchPc_output_valid) && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusSimplePlugin_fetchPc_booted && ((IBusSimplePlugin_fetchPc_output_ready || IBusSimplePlugin_fetchPc_correction) || IBusSimplePlugin_fetchPc_pcRegPropagate)))begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      if(IBusSimplePlugin_iBusRsp_flush)begin
        _zz_51_ <= 1'b0;
      end
      if(_zz_49_)begin
        _zz_51_ <= (IBusSimplePlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if(decode_arbitration_removeIt)begin
        _zz_52_ <= 1'b0;
      end
      if(IBusSimplePlugin_iBusRsp_output_ready)begin
        _zz_52_ <= (IBusSimplePlugin_iBusRsp_output_valid && (! IBusSimplePlugin_externalFlush));
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! (! IBusSimplePlugin_iBusRsp_stages_1_input_ready)))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! (! IBusSimplePlugin_injector_decodeInput_ready)))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= IBusSimplePlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= IBusSimplePlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= IBusSimplePlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= IBusSimplePlugin_injector_nextPcCalc_valids_3;
      end
      if(IBusSimplePlugin_fetchPc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(IBusSimplePlugin_cmd_s2mPipe_ready)begin
        IBusSimplePlugin_cmd_s2mPipe_rValid <= 1'b0;
      end
      if(_zz_144_)begin
        IBusSimplePlugin_cmd_s2mPipe_rValid <= IBusSimplePlugin_cmd_valid;
      end
      IBusSimplePlugin_pending_value <= IBusSimplePlugin_pending_next;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter - _zz_191_);
      if(IBusSimplePlugin_iBusRsp_flush)begin
        IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_pending_value - _zz_193_);
      end
      _zz_79_ <= 1'b0;
      memory_DivPlugin_div_counter_value <= memory_DivPlugin_div_counter_valueNext;
      if(_zz_123_)begin
        if(_zz_126_)begin
          execute_LightShifterPlugin_isActive <= 1'b1;
          if(execute_LightShifterPlugin_done)begin
            execute_LightShifterPlugin_isActive <= 1'b0;
          end
        end
      end
      if(execute_arbitration_removeIt)begin
        execute_LightShifterPlugin_isActive <= 1'b0;
      end
      _zz_95_ <= (_zz_35_ && writeBack_arbitration_isFiring);
      CsrPlugin_interrupt_valid <= 1'b0;
      if(_zz_145_)begin
        if(_zz_146_)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_147_)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_148_)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(CsrPlugin_pipelineLiberator_active)begin
        if((! execute_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
        if((! memory_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_1 <= CsrPlugin_pipelineLiberator_pcValids_0;
        end
        if((! writeBack_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_2 <= CsrPlugin_pipelineLiberator_pcValids_1;
        end
      end
      if(((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt))begin
        CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      end
      if(CsrPlugin_interruptJump)begin
        CsrPlugin_interrupt_valid <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(_zz_129_)begin
        case(CsrPlugin_targetPrivilege)
          2'b11 : begin
            CsrPlugin_mstatus_MIE <= 1'b0;
            CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
            CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
          end
          default : begin
          end
        endcase
      end
      if(_zz_130_)begin
        case(_zz_132_)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= (2'b00);
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= (({_zz_109_,{_zz_108_,_zz_107_}} != (3'b000)) || CsrPlugin_thirdPartyWake);
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
      end
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_31_;
      end
      if(((! execute_arbitration_isStuck) || execute_arbitration_removeIt))begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt)))begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(((! memory_arbitration_isStuck) || memory_arbitration_removeIt))begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt)))begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt))begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt)))begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      case(_zz_111_)
        3'b000 : begin
          if(IBusSimplePlugin_injectionPort_valid)begin
            _zz_111_ <= (3'b001);
          end
        end
        3'b001 : begin
          _zz_111_ <= (3'b010);
        end
        3'b010 : begin
          _zz_111_ <= (3'b011);
        end
        3'b011 : begin
          if((! decode_arbitration_isStuck))begin
            _zz_111_ <= (3'b100);
          end
        end
        3'b100 : begin
          _zz_111_ <= (3'b000);
        end
        default : begin
        end
      endcase
      if(execute_CsrPlugin_csr_768)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
          CsrPlugin_mstatus_MPIE <= _zz_234_[0];
          CsrPlugin_mstatus_MIE <= _zz_235_[0];
        end
      end
      if(execute_CsrPlugin_csr_772)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mie_MEIE <= _zz_237_[0];
          CsrPlugin_mie_MTIE <= _zz_238_[0];
          CsrPlugin_mie_MSIE <= _zz_239_[0];
        end
      end
      if(execute_CsrPlugin_csr_773)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mtvec_base <= execute_CsrPlugin_writeData[31 : 2];
          CsrPlugin_mtvec_mode <= execute_CsrPlugin_writeData[1 : 0];
        end
      end
    end
  end

  always @ (posedge io_mainClk) begin
    if(IBusSimplePlugin_iBusRsp_output_ready)begin
      _zz_53_ <= IBusSimplePlugin_iBusRsp_output_payload_pc;
      _zz_54_ <= IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
      _zz_55_ <= IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
      _zz_56_ <= IBusSimplePlugin_iBusRsp_output_payload_isRvc;
    end
    if(IBusSimplePlugin_injector_decodeInput_ready)begin
      IBusSimplePlugin_injector_formal_rawInDecode <= IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
    end
    if(_zz_144_)begin
      IBusSimplePlugin_cmd_s2mPipe_rData_pc <= IBusSimplePlugin_cmd_payload_pc;
    end
    `ifndef SYNTHESIS
      `ifdef FORMAL
        assert((! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck)))
      `else
        if(!(! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck))) begin
          $display("FAILURE DBusSimplePlugin doesn't allow memory stage stall when read happend");
          $finish;
        end
      `endif
    `endif
    `ifndef SYNTHESIS
      `ifdef FORMAL
        assert((! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck)))
      `else
        if(!(! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck))) begin
          $display("FAILURE DBusSimplePlugin doesn't allow writeback stage stall when read happend");
          $finish;
        end
      `endif
    `endif
    if((memory_DivPlugin_div_counter_value == 6'h20))begin
      memory_DivPlugin_div_done <= 1'b1;
    end
    if((! memory_arbitration_isStuck))begin
      memory_DivPlugin_div_done <= 1'b0;
    end
    if(_zz_125_)begin
      if(_zz_134_)begin
        memory_DivPlugin_rs1[31 : 0] <= memory_DivPlugin_div_stage_0_outNumerator;
        memory_DivPlugin_accumulator[31 : 0] <= memory_DivPlugin_div_stage_0_outRemainder;
        if((memory_DivPlugin_div_counter_value == 6'h20))begin
          memory_DivPlugin_div_result <= _zz_205_[31:0];
        end
      end
    end
    if(_zz_135_)begin
      memory_DivPlugin_accumulator <= 65'h0;
      memory_DivPlugin_rs1 <= ((_zz_84_ ? (~ _zz_85_) : _zz_85_) + _zz_211_);
      memory_DivPlugin_rs2 <= ((_zz_83_ ? (~ execute_RS2) : execute_RS2) + _zz_213_);
      memory_DivPlugin_div_needRevert <= ((_zz_84_ ^ (_zz_83_ && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == 32'h0) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    if(_zz_123_)begin
      if(_zz_126_)begin
        execute_LightShifterPlugin_amplitudeReg <= (execute_LightShifterPlugin_amplitude - 5'h01);
      end
    end
    _zz_96_ <= _zz_34_[11 : 7];
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
    end
    if(_zz_145_)begin
      if(_zz_146_)begin
        CsrPlugin_interrupt_code <= (4'b0111);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
      if(_zz_147_)begin
        CsrPlugin_interrupt_code <= (4'b0011);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
      if(_zz_148_)begin
        CsrPlugin_interrupt_code <= (4'b1011);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
    end
    if(_zz_129_)begin
      case(CsrPlugin_targetPrivilege)
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mepc <= decode_PC;
        end
        default : begin
        end
      endcase
    end
    CsrPlugin_mtval <= 32'h0;
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_18_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_15_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= _zz_26_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= execute_PC;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_12_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ENV_CTRL <= _zz_9_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_ENV_CTRL <= _zz_7_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= decode_FORMAL_PC_NEXT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_45_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1 <= decode_SRC1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2 <= decode_SRC2;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_STORE <= execute_MEMORY_STORE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_STORE <= memory_MEMORY_STORE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_5_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1 <= _zz_29_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_READ_DATA <= memory_MEMORY_READ_DATA;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_2_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_IS_MUL <= memory_IS_MUL;
    end
    if(((! memory_arbitration_isStuck) && (! execute_arbitration_isStuckByOthers)))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_24_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2 <= _zz_27_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if((_zz_111_ != (3'b000)))begin
      _zz_55_ <= IBusSimplePlugin_injectionPort_payload;
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_768 <= (decode_INSTRUCTION[31 : 20] == 12'h300);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_836 <= (decode_INSTRUCTION[31 : 20] == 12'h344);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_772 <= (decode_INSTRUCTION[31 : 20] == 12'h304);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_773 <= (decode_INSTRUCTION[31 : 20] == 12'h305);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_833 <= (decode_INSTRUCTION[31 : 20] == 12'h341);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_834 <= (decode_INSTRUCTION[31 : 20] == 12'h342);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_835 <= (decode_INSTRUCTION[31 : 20] == 12'h343);
    end
    if(execute_CsrPlugin_csr_836)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mip_MSIP <= _zz_236_[0];
      end
    end
    if(execute_CsrPlugin_csr_833)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mepc <= execute_CsrPlugin_writeData[31 : 0];
      end
    end
  end

  always @ (posedge io_mainClk) begin
    DebugPlugin_firstCycle <= 1'b0;
    if(debug_bus_cmd_ready)begin
      DebugPlugin_firstCycle <= 1'b1;
    end
    DebugPlugin_secondCycle <= DebugPlugin_firstCycle;
    DebugPlugin_isPipBusy <= (({writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}} != (4'b0000)) || IBusSimplePlugin_incomingInstruction);
    if(writeBack_arbitration_isValid)begin
      DebugPlugin_busReadDataReg <= _zz_44_;
    end
    _zz_110_ <= debug_bus_cmd_payload_address[2];
    if(debug_bus_cmd_valid)begin
      case(_zz_143_)
        6'b000000 : begin
        end
        6'b000001 : begin
        end
        6'b010000 : begin
          if(debug_bus_cmd_payload_wr)begin
            DebugPlugin_hardwareBreakpoints_0_pc <= debug_bus_cmd_payload_data[31 : 1];
          end
        end
        6'b010001 : begin
          if(debug_bus_cmd_payload_wr)begin
            DebugPlugin_hardwareBreakpoints_1_pc <= debug_bus_cmd_payload_data[31 : 1];
          end
        end
        6'b010010 : begin
          if(debug_bus_cmd_payload_wr)begin
            DebugPlugin_hardwareBreakpoints_2_pc <= debug_bus_cmd_payload_data[31 : 1];
          end
        end
        6'b010011 : begin
          if(debug_bus_cmd_payload_wr)begin
            DebugPlugin_hardwareBreakpoints_3_pc <= debug_bus_cmd_payload_data[31 : 1];
          end
        end
        default : begin
        end
      endcase
    end
    if(_zz_127_)begin
      DebugPlugin_busReadDataReg <= execute_PC;
    end
    DebugPlugin_resetIt_regNext <= DebugPlugin_resetIt;
  end

  always @ (posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if (resetCtrl_systemReset) begin
      DebugPlugin_resetIt <= 1'b0;
      DebugPlugin_haltIt <= 1'b0;
      DebugPlugin_stepIt <= 1'b0;
      DebugPlugin_godmode <= 1'b0;
      DebugPlugin_haltedByBreak <= 1'b0;
      DebugPlugin_hardwareBreakpoints_0_valid <= 1'b0;
      DebugPlugin_hardwareBreakpoints_1_valid <= 1'b0;
      DebugPlugin_hardwareBreakpoints_2_valid <= 1'b0;
      DebugPlugin_hardwareBreakpoints_3_valid <= 1'b0;
    end else begin
      if((DebugPlugin_haltIt && (! DebugPlugin_isPipBusy)))begin
        DebugPlugin_godmode <= 1'b1;
      end
      if(debug_bus_cmd_valid)begin
        case(_zz_143_)
          6'b000000 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_stepIt <= debug_bus_cmd_payload_data[4];
              if(debug_bus_cmd_payload_data[16])begin
                DebugPlugin_resetIt <= 1'b1;
              end
              if(debug_bus_cmd_payload_data[24])begin
                DebugPlugin_resetIt <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[17])begin
                DebugPlugin_haltIt <= 1'b1;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_haltIt <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_haltedByBreak <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_godmode <= 1'b0;
              end
            end
          end
          6'b000001 : begin
          end
          6'b010000 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_0_valid <= _zz_230_[0];
            end
          end
          6'b010001 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_1_valid <= _zz_231_[0];
            end
          end
          6'b010010 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_2_valid <= _zz_232_[0];
            end
          end
          6'b010011 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_3_valid <= _zz_233_[0];
            end
          end
          default : begin
          end
        endcase
      end
      if(_zz_127_)begin
        if(_zz_128_)begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(_zz_131_)begin
        if(decode_arbitration_isValid)begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
    end
  end


endmodule

module StreamFork_3_ (
  input               io_input_valid,
  output reg          io_input_ready,
  input               io_input_payload_wr,
  input      [31:0]   io_input_payload_address,
  input      [31:0]   io_input_payload_data,
  input      [1:0]    io_input_payload_size,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output              io_outputs_0_payload_wr,
  output     [31:0]   io_outputs_0_payload_address,
  output     [31:0]   io_outputs_0_payload_data,
  output     [1:0]    io_outputs_0_payload_size,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output              io_outputs_1_payload_wr,
  output     [31:0]   io_outputs_1_payload_address,
  output     [31:0]   io_outputs_1_payload_data,
  output     [1:0]    io_outputs_1_payload_size,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  reg                 _zz_1_;
  reg                 _zz_2_;

  always @ (*) begin
    io_input_ready = 1'b1;
    if(((! io_outputs_0_ready) && _zz_1_))begin
      io_input_ready = 1'b0;
    end
    if(((! io_outputs_1_ready) && _zz_2_))begin
      io_input_ready = 1'b0;
    end
  end

  assign io_outputs_0_valid = (io_input_valid && _zz_1_);
  assign io_outputs_0_payload_wr = io_input_payload_wr;
  assign io_outputs_0_payload_address = io_input_payload_address;
  assign io_outputs_0_payload_data = io_input_payload_data;
  assign io_outputs_0_payload_size = io_input_payload_size;
  assign io_outputs_1_valid = (io_input_valid && _zz_2_);
  assign io_outputs_1_payload_wr = io_input_payload_wr;
  assign io_outputs_1_payload_address = io_input_payload_address;
  assign io_outputs_1_payload_data = io_input_payload_data;
  assign io_outputs_1_payload_size = io_input_payload_size;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      _zz_1_ <= 1'b1;
      _zz_2_ <= 1'b1;
    end else begin
      if((io_outputs_0_valid && io_outputs_0_ready))begin
        _zz_1_ <= 1'b0;
      end
      if((io_outputs_1_valid && io_outputs_1_ready))begin
        _zz_2_ <= 1'b0;
      end
      if(io_input_ready)begin
        _zz_1_ <= 1'b1;
        _zz_2_ <= 1'b1;
      end
    end
  end


endmodule

module BufferCC_4_ (
  input               io_dataIn,
  output              io_dataOut,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  reg                 buffers_0;
  reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @ (posedge io_mainClk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module JtagBridge (
  input               io_jtag_tms,
  input               io_jtag_tdi,
  output              io_jtag_tdo,
  input               io_jtag_tck,
  output              io_remote_cmd_valid,
  input               io_remote_cmd_ready,
  output              io_remote_cmd_payload_last,
  output     [0:0]    io_remote_cmd_payload_fragment,
  input               io_remote_rsp_valid,
  output              io_remote_rsp_ready,
  input               io_remote_rsp_payload_error,
  input      [31:0]   io_remote_rsp_payload_data,
  input               io_mainClk,
  input               resetCtrl_systemReset 
);
  wire                flowCCByToggle_1__io_output_valid;
  wire                flowCCByToggle_1__io_output_payload_last;
  wire       [0:0]    flowCCByToggle_1__io_output_payload_fragment;
  wire                _zz_2_;
  wire                _zz_3_;
  wire       [0:0]    _zz_4_;
  wire       [3:0]    _zz_5_;
  wire       [1:0]    _zz_6_;
  wire       [3:0]    _zz_7_;
  wire       [1:0]    _zz_8_;
  wire       [3:0]    _zz_9_;
  wire       [0:0]    _zz_10_;
  wire                system_cmd_valid;
  wire                system_cmd_payload_last;
  wire       [0:0]    system_cmd_payload_fragment;
  reg                 system_rsp_valid;
  reg                 system_rsp_payload_error;
  reg        [31:0]   system_rsp_payload_data;
  wire       `JtagState_defaultEncoding_type jtag_tap_fsm_stateNext;
  reg        `JtagState_defaultEncoding_type jtag_tap_fsm_state = `JtagState_defaultEncoding_RESET;
  reg        `JtagState_defaultEncoding_type _zz_1_;
  reg        [3:0]    jtag_tap_instruction;
  reg        [3:0]    jtag_tap_instructionShift;
  reg                 jtag_tap_bypass;
  reg                 jtag_tap_tdoUnbufferd;
  reg                 jtag_tap_tdoUnbufferd_regNext;
  wire                jtag_idcodeArea_instructionHit;
  reg        [31:0]   jtag_idcodeArea_shifter;
  wire                jtag_writeArea_instructionHit;
  reg                 jtag_writeArea_source_valid;
  wire                jtag_writeArea_source_payload_last;
  wire       [0:0]    jtag_writeArea_source_payload_fragment;
  wire                jtag_readArea_instructionHit;
  reg        [33:0]   jtag_readArea_shifter;
  `ifndef SYNTHESIS
  reg [79:0] jtag_tap_fsm_stateNext_string;
  reg [79:0] jtag_tap_fsm_state_string;
  reg [79:0] _zz_1__string;
  `endif


  assign _zz_2_ = (jtag_tap_fsm_state == `JtagState_defaultEncoding_DR_SHIFT);
  assign _zz_3_ = (jtag_tap_fsm_state == `JtagState_defaultEncoding_DR_SHIFT);
  assign _zz_4_ = (1'b1);
  assign _zz_5_ = {3'd0, _zz_4_};
  assign _zz_6_ = (2'b10);
  assign _zz_7_ = {2'd0, _zz_6_};
  assign _zz_8_ = (2'b11);
  assign _zz_9_ = {2'd0, _zz_8_};
  assign _zz_10_ = (1'b1);
  FlowCCByToggle flowCCByToggle_1_ ( 
    .io_input_valid                (jtag_writeArea_source_valid                   ), //i
    .io_input_payload_last         (jtag_writeArea_source_payload_last            ), //i
    .io_input_payload_fragment     (jtag_writeArea_source_payload_fragment        ), //i
    .io_output_valid               (flowCCByToggle_1__io_output_valid             ), //o
    .io_output_payload_last        (flowCCByToggle_1__io_output_payload_last      ), //o
    .io_output_payload_fragment    (flowCCByToggle_1__io_output_payload_fragment  ), //o
    .io_jtag_tck                   (io_jtag_tck                                   ), //i
    .io_mainClk                    (io_mainClk                                    ), //i
    .resetCtrl_systemReset         (resetCtrl_systemReset                         )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(jtag_tap_fsm_stateNext)
      `JtagState_defaultEncoding_RESET : jtag_tap_fsm_stateNext_string = "RESET     ";
      `JtagState_defaultEncoding_IDLE : jtag_tap_fsm_stateNext_string = "IDLE      ";
      `JtagState_defaultEncoding_IR_SELECT : jtag_tap_fsm_stateNext_string = "IR_SELECT ";
      `JtagState_defaultEncoding_IR_CAPTURE : jtag_tap_fsm_stateNext_string = "IR_CAPTURE";
      `JtagState_defaultEncoding_IR_SHIFT : jtag_tap_fsm_stateNext_string = "IR_SHIFT  ";
      `JtagState_defaultEncoding_IR_EXIT1 : jtag_tap_fsm_stateNext_string = "IR_EXIT1  ";
      `JtagState_defaultEncoding_IR_PAUSE : jtag_tap_fsm_stateNext_string = "IR_PAUSE  ";
      `JtagState_defaultEncoding_IR_EXIT2 : jtag_tap_fsm_stateNext_string = "IR_EXIT2  ";
      `JtagState_defaultEncoding_IR_UPDATE : jtag_tap_fsm_stateNext_string = "IR_UPDATE ";
      `JtagState_defaultEncoding_DR_SELECT : jtag_tap_fsm_stateNext_string = "DR_SELECT ";
      `JtagState_defaultEncoding_DR_CAPTURE : jtag_tap_fsm_stateNext_string = "DR_CAPTURE";
      `JtagState_defaultEncoding_DR_SHIFT : jtag_tap_fsm_stateNext_string = "DR_SHIFT  ";
      `JtagState_defaultEncoding_DR_EXIT1 : jtag_tap_fsm_stateNext_string = "DR_EXIT1  ";
      `JtagState_defaultEncoding_DR_PAUSE : jtag_tap_fsm_stateNext_string = "DR_PAUSE  ";
      `JtagState_defaultEncoding_DR_EXIT2 : jtag_tap_fsm_stateNext_string = "DR_EXIT2  ";
      `JtagState_defaultEncoding_DR_UPDATE : jtag_tap_fsm_stateNext_string = "DR_UPDATE ";
      default : jtag_tap_fsm_stateNext_string = "??????????";
    endcase
  end
  always @(*) begin
    case(jtag_tap_fsm_state)
      `JtagState_defaultEncoding_RESET : jtag_tap_fsm_state_string = "RESET     ";
      `JtagState_defaultEncoding_IDLE : jtag_tap_fsm_state_string = "IDLE      ";
      `JtagState_defaultEncoding_IR_SELECT : jtag_tap_fsm_state_string = "IR_SELECT ";
      `JtagState_defaultEncoding_IR_CAPTURE : jtag_tap_fsm_state_string = "IR_CAPTURE";
      `JtagState_defaultEncoding_IR_SHIFT : jtag_tap_fsm_state_string = "IR_SHIFT  ";
      `JtagState_defaultEncoding_IR_EXIT1 : jtag_tap_fsm_state_string = "IR_EXIT1  ";
      `JtagState_defaultEncoding_IR_PAUSE : jtag_tap_fsm_state_string = "IR_PAUSE  ";
      `JtagState_defaultEncoding_IR_EXIT2 : jtag_tap_fsm_state_string = "IR_EXIT2  ";
      `JtagState_defaultEncoding_IR_UPDATE : jtag_tap_fsm_state_string = "IR_UPDATE ";
      `JtagState_defaultEncoding_DR_SELECT : jtag_tap_fsm_state_string = "DR_SELECT ";
      `JtagState_defaultEncoding_DR_CAPTURE : jtag_tap_fsm_state_string = "DR_CAPTURE";
      `JtagState_defaultEncoding_DR_SHIFT : jtag_tap_fsm_state_string = "DR_SHIFT  ";
      `JtagState_defaultEncoding_DR_EXIT1 : jtag_tap_fsm_state_string = "DR_EXIT1  ";
      `JtagState_defaultEncoding_DR_PAUSE : jtag_tap_fsm_state_string = "DR_PAUSE  ";
      `JtagState_defaultEncoding_DR_EXIT2 : jtag_tap_fsm_state_string = "DR_EXIT2  ";
      `JtagState_defaultEncoding_DR_UPDATE : jtag_tap_fsm_state_string = "DR_UPDATE ";
      default : jtag_tap_fsm_state_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_1_)
      `JtagState_defaultEncoding_RESET : _zz_1__string = "RESET     ";
      `JtagState_defaultEncoding_IDLE : _zz_1__string = "IDLE      ";
      `JtagState_defaultEncoding_IR_SELECT : _zz_1__string = "IR_SELECT ";
      `JtagState_defaultEncoding_IR_CAPTURE : _zz_1__string = "IR_CAPTURE";
      `JtagState_defaultEncoding_IR_SHIFT : _zz_1__string = "IR_SHIFT  ";
      `JtagState_defaultEncoding_IR_EXIT1 : _zz_1__string = "IR_EXIT1  ";
      `JtagState_defaultEncoding_IR_PAUSE : _zz_1__string = "IR_PAUSE  ";
      `JtagState_defaultEncoding_IR_EXIT2 : _zz_1__string = "IR_EXIT2  ";
      `JtagState_defaultEncoding_IR_UPDATE : _zz_1__string = "IR_UPDATE ";
      `JtagState_defaultEncoding_DR_SELECT : _zz_1__string = "DR_SELECT ";
      `JtagState_defaultEncoding_DR_CAPTURE : _zz_1__string = "DR_CAPTURE";
      `JtagState_defaultEncoding_DR_SHIFT : _zz_1__string = "DR_SHIFT  ";
      `JtagState_defaultEncoding_DR_EXIT1 : _zz_1__string = "DR_EXIT1  ";
      `JtagState_defaultEncoding_DR_PAUSE : _zz_1__string = "DR_PAUSE  ";
      `JtagState_defaultEncoding_DR_EXIT2 : _zz_1__string = "DR_EXIT2  ";
      `JtagState_defaultEncoding_DR_UPDATE : _zz_1__string = "DR_UPDATE ";
      default : _zz_1__string = "??????????";
    endcase
  end
  `endif

  assign io_remote_cmd_valid = system_cmd_valid;
  assign io_remote_cmd_payload_last = system_cmd_payload_last;
  assign io_remote_cmd_payload_fragment = system_cmd_payload_fragment;
  assign io_remote_rsp_ready = 1'b1;
  always @ (*) begin
    case(jtag_tap_fsm_state)
      `JtagState_defaultEncoding_IDLE : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_DR_SELECT : `JtagState_defaultEncoding_IDLE);
      end
      `JtagState_defaultEncoding_IR_SELECT : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_RESET : `JtagState_defaultEncoding_IR_CAPTURE);
      end
      `JtagState_defaultEncoding_IR_CAPTURE : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_IR_EXIT1 : `JtagState_defaultEncoding_IR_SHIFT);
      end
      `JtagState_defaultEncoding_IR_SHIFT : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_IR_EXIT1 : `JtagState_defaultEncoding_IR_SHIFT);
      end
      `JtagState_defaultEncoding_IR_EXIT1 : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_IR_UPDATE : `JtagState_defaultEncoding_IR_PAUSE);
      end
      `JtagState_defaultEncoding_IR_PAUSE : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_IR_EXIT2 : `JtagState_defaultEncoding_IR_PAUSE);
      end
      `JtagState_defaultEncoding_IR_EXIT2 : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_IR_UPDATE : `JtagState_defaultEncoding_IR_SHIFT);
      end
      `JtagState_defaultEncoding_IR_UPDATE : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_DR_SELECT : `JtagState_defaultEncoding_IDLE);
      end
      `JtagState_defaultEncoding_DR_SELECT : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_IR_SELECT : `JtagState_defaultEncoding_DR_CAPTURE);
      end
      `JtagState_defaultEncoding_DR_CAPTURE : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_DR_EXIT1 : `JtagState_defaultEncoding_DR_SHIFT);
      end
      `JtagState_defaultEncoding_DR_SHIFT : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_DR_EXIT1 : `JtagState_defaultEncoding_DR_SHIFT);
      end
      `JtagState_defaultEncoding_DR_EXIT1 : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_DR_UPDATE : `JtagState_defaultEncoding_DR_PAUSE);
      end
      `JtagState_defaultEncoding_DR_PAUSE : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_DR_EXIT2 : `JtagState_defaultEncoding_DR_PAUSE);
      end
      `JtagState_defaultEncoding_DR_EXIT2 : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_DR_UPDATE : `JtagState_defaultEncoding_DR_SHIFT);
      end
      `JtagState_defaultEncoding_DR_UPDATE : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_DR_SELECT : `JtagState_defaultEncoding_IDLE);
      end
      default : begin
        _zz_1_ = (io_jtag_tms ? `JtagState_defaultEncoding_RESET : `JtagState_defaultEncoding_IDLE);
      end
    endcase
  end

  assign jtag_tap_fsm_stateNext = _zz_1_;
  always @ (*) begin
    jtag_tap_tdoUnbufferd = jtag_tap_bypass;
    case(jtag_tap_fsm_state)
      `JtagState_defaultEncoding_IR_CAPTURE : begin
      end
      `JtagState_defaultEncoding_IR_SHIFT : begin
        jtag_tap_tdoUnbufferd = jtag_tap_instructionShift[0];
      end
      `JtagState_defaultEncoding_IR_UPDATE : begin
      end
      default : begin
      end
    endcase
    if(jtag_idcodeArea_instructionHit)begin
      if(_zz_2_)begin
        jtag_tap_tdoUnbufferd = jtag_idcodeArea_shifter[0];
      end
    end
    if(jtag_readArea_instructionHit)begin
      if(_zz_3_)begin
        jtag_tap_tdoUnbufferd = jtag_readArea_shifter[0];
      end
    end
  end

  assign io_jtag_tdo = jtag_tap_tdoUnbufferd_regNext;
  assign jtag_idcodeArea_instructionHit = (jtag_tap_instruction == _zz_5_);
  assign jtag_writeArea_instructionHit = (jtag_tap_instruction == _zz_7_);
  always @ (*) begin
    jtag_writeArea_source_valid = 1'b0;
    if(jtag_writeArea_instructionHit)begin
      if((jtag_tap_fsm_state == `JtagState_defaultEncoding_DR_SHIFT))begin
        jtag_writeArea_source_valid = 1'b1;
      end
    end
  end

  assign jtag_writeArea_source_payload_last = io_jtag_tms;
  assign jtag_writeArea_source_payload_fragment[0] = io_jtag_tdi;
  assign system_cmd_valid = flowCCByToggle_1__io_output_valid;
  assign system_cmd_payload_last = flowCCByToggle_1__io_output_payload_last;
  assign system_cmd_payload_fragment = flowCCByToggle_1__io_output_payload_fragment;
  assign jtag_readArea_instructionHit = (jtag_tap_instruction == _zz_9_);
  always @ (posedge io_mainClk) begin
    if(io_remote_cmd_valid)begin
      system_rsp_valid <= 1'b0;
    end
    if((io_remote_rsp_valid && io_remote_rsp_ready))begin
      system_rsp_valid <= 1'b1;
      system_rsp_payload_error <= io_remote_rsp_payload_error;
      system_rsp_payload_data <= io_remote_rsp_payload_data;
    end
  end

  always @ (posedge io_jtag_tck) begin
    jtag_tap_fsm_state <= jtag_tap_fsm_stateNext;
    jtag_tap_bypass <= io_jtag_tdi;
    case(jtag_tap_fsm_state)
      `JtagState_defaultEncoding_IR_CAPTURE : begin
        jtag_tap_instructionShift <= jtag_tap_instruction;
      end
      `JtagState_defaultEncoding_IR_SHIFT : begin
        jtag_tap_instructionShift <= ({io_jtag_tdi,jtag_tap_instructionShift} >>> 1);
      end
      `JtagState_defaultEncoding_IR_UPDATE : begin
        jtag_tap_instruction <= jtag_tap_instructionShift;
      end
      default : begin
      end
    endcase
    if(jtag_idcodeArea_instructionHit)begin
      if(_zz_2_)begin
        jtag_idcodeArea_shifter <= ({io_jtag_tdi,jtag_idcodeArea_shifter} >>> 1);
      end
    end
    if((jtag_tap_fsm_state == `JtagState_defaultEncoding_RESET))begin
      jtag_idcodeArea_shifter <= 32'h10001fff;
      jtag_tap_instruction <= {3'd0, _zz_10_};
    end
    if(jtag_readArea_instructionHit)begin
      if((jtag_tap_fsm_state == `JtagState_defaultEncoding_DR_CAPTURE))begin
        jtag_readArea_shifter <= {{system_rsp_payload_data,system_rsp_payload_error},system_rsp_valid};
      end
      if(_zz_3_)begin
        jtag_readArea_shifter <= ({io_jtag_tdi,jtag_readArea_shifter} >>> 1);
      end
    end
  end

  always @ (negedge io_jtag_tck) begin
    jtag_tap_tdoUnbufferd_regNext <= jtag_tap_tdoUnbufferd;
  end


endmodule

module SystemDebugger (
  input               io_remote_cmd_valid,
  output              io_remote_cmd_ready,
  input               io_remote_cmd_payload_last,
  input      [0:0]    io_remote_cmd_payload_fragment,
  output              io_remote_rsp_valid,
  input               io_remote_rsp_ready,
  output              io_remote_rsp_payload_error,
  output     [31:0]   io_remote_rsp_payload_data,
  output              io_mem_cmd_valid,
  input               io_mem_cmd_ready,
  output     [31:0]   io_mem_cmd_payload_address,
  output     [31:0]   io_mem_cmd_payload_data,
  output              io_mem_cmd_payload_wr,
  output     [1:0]    io_mem_cmd_payload_size,
  input               io_mem_rsp_valid,
  input      [31:0]   io_mem_rsp_payload,
  input               io_mainClk,
  input               resetCtrl_systemReset 
);
  wire                _zz_2_;
  wire       [0:0]    _zz_3_;
  reg        [66:0]   dispatcher_dataShifter;
  reg                 dispatcher_dataLoaded;
  reg        [7:0]    dispatcher_headerShifter;
  wire       [7:0]    dispatcher_header;
  reg                 dispatcher_headerLoaded;
  reg        [2:0]    dispatcher_counter;
  wire       [66:0]   _zz_1_;

  assign _zz_2_ = (dispatcher_headerLoaded == 1'b0);
  assign _zz_3_ = _zz_1_[64 : 64];
  assign dispatcher_header = dispatcher_headerShifter[7 : 0];
  assign io_remote_cmd_ready = (! dispatcher_dataLoaded);
  assign _zz_1_ = dispatcher_dataShifter[66 : 0];
  assign io_mem_cmd_payload_address = _zz_1_[31 : 0];
  assign io_mem_cmd_payload_data = _zz_1_[63 : 32];
  assign io_mem_cmd_payload_wr = _zz_3_[0];
  assign io_mem_cmd_payload_size = _zz_1_[66 : 65];
  assign io_mem_cmd_valid = (dispatcher_dataLoaded && (dispatcher_header == 8'h0));
  assign io_remote_rsp_valid = io_mem_rsp_valid;
  assign io_remote_rsp_payload_error = 1'b0;
  assign io_remote_rsp_payload_data = io_mem_rsp_payload;
  always @ (posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if (resetCtrl_systemReset) begin
      dispatcher_dataLoaded <= 1'b0;
      dispatcher_headerLoaded <= 1'b0;
      dispatcher_counter <= (3'b000);
    end else begin
      if(io_remote_cmd_valid)begin
        if(_zz_2_)begin
          dispatcher_counter <= (dispatcher_counter + (3'b001));
          if((dispatcher_counter == (3'b111)))begin
            dispatcher_headerLoaded <= 1'b1;
          end
        end
        if(io_remote_cmd_payload_last)begin
          dispatcher_headerLoaded <= 1'b1;
          dispatcher_dataLoaded <= 1'b1;
          dispatcher_counter <= (3'b000);
        end
      end
      if((io_mem_cmd_valid && io_mem_cmd_ready))begin
        dispatcher_headerLoaded <= 1'b0;
        dispatcher_dataLoaded <= 1'b0;
      end
    end
  end

  always @ (posedge io_mainClk) begin
    if(io_remote_cmd_valid)begin
      if(_zz_2_)begin
        dispatcher_headerShifter <= ({io_remote_cmd_payload_fragment,dispatcher_headerShifter} >>> 1);
      end else begin
        dispatcher_dataShifter <= ({io_remote_cmd_payload_fragment,dispatcher_dataShifter} >>> 1);
      end
    end
  end


endmodule

module Axi4ReadOnlyDecoder (
  input               io_input_ar_valid,
  output              io_input_ar_ready,
  input      [31:0]   io_input_ar_payload_addr,
  input      [3:0]    io_input_ar_payload_cache,
  input      [2:0]    io_input_ar_payload_prot,
  output reg          io_input_r_valid,
  input               io_input_r_ready,
  output     [31:0]   io_input_r_payload_data,
  output reg [1:0]    io_input_r_payload_resp,
  output reg          io_input_r_payload_last,
  output              io_outputs_0_ar_valid,
  input               io_outputs_0_ar_ready,
  output     [31:0]   io_outputs_0_ar_payload_addr,
  output     [3:0]    io_outputs_0_ar_payload_cache,
  output     [2:0]    io_outputs_0_ar_payload_prot,
  input               io_outputs_0_r_valid,
  output              io_outputs_0_r_ready,
  input      [31:0]   io_outputs_0_r_payload_data,
  input      [1:0]    io_outputs_0_r_payload_resp,
  input               io_outputs_0_r_payload_last,
  output              io_outputs_1_ar_valid,
  input               io_outputs_1_ar_ready,
  output     [31:0]   io_outputs_1_ar_payload_addr,
  output     [3:0]    io_outputs_1_ar_payload_cache,
  output     [2:0]    io_outputs_1_ar_payload_prot,
  input               io_outputs_1_r_valid,
  output              io_outputs_1_r_ready,
  input      [31:0]   io_outputs_1_r_payload_data,
  input      [1:0]    io_outputs_1_r_payload_resp,
  input               io_outputs_1_r_payload_last,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  wire                _zz_3_;
  wire                errorSlave_io_axi_ar_ready;
  wire                errorSlave_io_axi_r_valid;
  wire       [31:0]   errorSlave_io_axi_r_payload_data;
  wire       [1:0]    errorSlave_io_axi_r_payload_resp;
  wire                errorSlave_io_axi_r_payload_last;
  reg                 pendingCmdCounter_incrementIt;
  reg                 pendingCmdCounter_decrementIt;
  wire       [2:0]    pendingCmdCounter_valueNext;
  reg        [2:0]    pendingCmdCounter_value;
  wire                pendingCmdCounter_willOverflowIfInc;
  wire                pendingCmdCounter_willOverflow;
  reg        [2:0]    pendingCmdCounter_finalIncrement;
  wire       [1:0]    decodedCmdSels;
  wire                decodedCmdError;
  reg        [1:0]    pendingSels;
  reg                 pendingError;
  wire                allowCmd;
  wire                _zz_1_;
  wire       [0:0]    readRspIndex;
  wire                _zz_2_;

  Axi4ReadOnlyErrorSlave errorSlave ( 
    .io_axi_ar_valid            (_zz_3_                                  ), //i
    .io_axi_ar_ready            (errorSlave_io_axi_ar_ready              ), //o
    .io_axi_ar_payload_addr     (io_input_ar_payload_addr[31:0]          ), //i
    .io_axi_ar_payload_cache    (io_input_ar_payload_cache[3:0]          ), //i
    .io_axi_ar_payload_prot     (io_input_ar_payload_prot[2:0]           ), //i
    .io_axi_r_valid             (errorSlave_io_axi_r_valid               ), //o
    .io_axi_r_ready             (io_input_r_ready                        ), //i
    .io_axi_r_payload_data      (errorSlave_io_axi_r_payload_data[31:0]  ), //o
    .io_axi_r_payload_resp      (errorSlave_io_axi_r_payload_resp[1:0]   ), //o
    .io_axi_r_payload_last      (errorSlave_io_axi_r_payload_last        ), //o
    .io_mainClk                 (io_mainClk                              ), //i
    .resetCtrl_axiReset         (resetCtrl_axiReset                      )  //i
  );
  always @ (*) begin
    pendingCmdCounter_incrementIt = 1'b0;
    if((io_input_ar_valid && io_input_ar_ready))begin
      pendingCmdCounter_incrementIt = 1'b1;
    end
  end

  always @ (*) begin
    pendingCmdCounter_decrementIt = 1'b0;
    if(((io_input_r_valid && io_input_r_ready) && io_input_r_payload_last))begin
      pendingCmdCounter_decrementIt = 1'b1;
    end
  end

  assign pendingCmdCounter_willOverflowIfInc = ((pendingCmdCounter_value == (3'b111)) && (! pendingCmdCounter_decrementIt));
  assign pendingCmdCounter_willOverflow = (pendingCmdCounter_willOverflowIfInc && pendingCmdCounter_incrementIt);
  always @ (*) begin
    if((pendingCmdCounter_incrementIt && (! pendingCmdCounter_decrementIt)))begin
      pendingCmdCounter_finalIncrement = (3'b001);
    end else begin
      if(((! pendingCmdCounter_incrementIt) && pendingCmdCounter_decrementIt))begin
        pendingCmdCounter_finalIncrement = (3'b111);
      end else begin
        pendingCmdCounter_finalIncrement = (3'b000);
      end
    end
  end

  assign pendingCmdCounter_valueNext = (pendingCmdCounter_value + pendingCmdCounter_finalIncrement);
  assign decodedCmdSels = {(((io_input_ar_payload_addr & (~ 32'h03ffffff)) == 32'h40000000) && io_input_ar_valid),(((32'h80000000 <= io_input_ar_payload_addr) && (io_input_ar_payload_addr < 32'h8002c000)) && io_input_ar_valid)};
  assign decodedCmdError = (decodedCmdSels == (2'b00));
  assign allowCmd = ((pendingCmdCounter_value == (3'b000)) || ((pendingCmdCounter_value != (3'b111)) && (pendingSels == decodedCmdSels)));
  assign io_input_ar_ready = ((((decodedCmdSels & {io_outputs_1_ar_ready,io_outputs_0_ar_ready}) != (2'b00)) || (decodedCmdError && errorSlave_io_axi_ar_ready)) && allowCmd);
  assign _zz_3_ = ((io_input_ar_valid && decodedCmdError) && allowCmd);
  assign io_outputs_0_ar_valid = ((io_input_ar_valid && decodedCmdSels[0]) && allowCmd);
  assign io_outputs_0_ar_payload_addr = io_input_ar_payload_addr;
  assign io_outputs_0_ar_payload_cache = io_input_ar_payload_cache;
  assign io_outputs_0_ar_payload_prot = io_input_ar_payload_prot;
  assign io_outputs_1_ar_valid = ((io_input_ar_valid && decodedCmdSels[1]) && allowCmd);
  assign io_outputs_1_ar_payload_addr = io_input_ar_payload_addr;
  assign io_outputs_1_ar_payload_cache = io_input_ar_payload_cache;
  assign io_outputs_1_ar_payload_prot = io_input_ar_payload_prot;
  assign _zz_1_ = pendingSels[1];
  assign readRspIndex = _zz_1_;
  always @ (*) begin
    io_input_r_valid = ({io_outputs_1_r_valid,io_outputs_0_r_valid} != (2'b00));
    if(errorSlave_io_axi_r_valid)begin
      io_input_r_valid = 1'b1;
    end
  end

  assign _zz_2_ = pendingSels[0];
  assign io_input_r_payload_data = (_zz_2_ ? io_outputs_0_r_payload_data : io_outputs_1_r_payload_data);
  always @ (*) begin
    io_input_r_payload_resp = (_zz_2_ ? io_outputs_0_r_payload_resp : io_outputs_1_r_payload_resp);
    if(pendingError)begin
      io_input_r_payload_resp = errorSlave_io_axi_r_payload_resp;
    end
  end

  always @ (*) begin
    io_input_r_payload_last = (_zz_2_ ? io_outputs_0_r_payload_last : io_outputs_1_r_payload_last);
    if(pendingError)begin
      io_input_r_payload_last = errorSlave_io_axi_r_payload_last;
    end
  end

  assign io_outputs_0_r_ready = io_input_r_ready;
  assign io_outputs_1_r_ready = io_input_r_ready;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      pendingCmdCounter_value <= (3'b000);
      pendingSels <= (2'b00);
      pendingError <= 1'b0;
    end else begin
      pendingCmdCounter_value <= pendingCmdCounter_valueNext;
      if(io_input_ar_ready)begin
        pendingSels <= decodedCmdSels;
      end
      if(io_input_ar_ready)begin
        pendingError <= decodedCmdError;
      end
    end
  end


endmodule

module Axi4SharedDecoder (
  input               io_input_arw_valid,
  output              io_input_arw_ready,
  input      [31:0]   io_input_arw_payload_addr,
  input      [2:0]    io_input_arw_payload_size,
  input      [3:0]    io_input_arw_payload_cache,
  input      [2:0]    io_input_arw_payload_prot,
  input               io_input_arw_payload_write,
  input               io_input_w_valid,
  output              io_input_w_ready,
  input      [31:0]   io_input_w_payload_data,
  input      [3:0]    io_input_w_payload_strb,
  input               io_input_w_payload_last,
  output              io_input_b_valid,
  input               io_input_b_ready,
  output reg [1:0]    io_input_b_payload_resp,
  output              io_input_r_valid,
  input               io_input_r_ready,
  output     [31:0]   io_input_r_payload_data,
  output reg [1:0]    io_input_r_payload_resp,
  output reg          io_input_r_payload_last,
  output              io_sharedOutputs_0_arw_valid,
  input               io_sharedOutputs_0_arw_ready,
  output     [31:0]   io_sharedOutputs_0_arw_payload_addr,
  output     [2:0]    io_sharedOutputs_0_arw_payload_size,
  output     [3:0]    io_sharedOutputs_0_arw_payload_cache,
  output     [2:0]    io_sharedOutputs_0_arw_payload_prot,
  output              io_sharedOutputs_0_arw_payload_write,
  output              io_sharedOutputs_0_w_valid,
  input               io_sharedOutputs_0_w_ready,
  output     [31:0]   io_sharedOutputs_0_w_payload_data,
  output     [3:0]    io_sharedOutputs_0_w_payload_strb,
  output              io_sharedOutputs_0_w_payload_last,
  input               io_sharedOutputs_0_b_valid,
  output              io_sharedOutputs_0_b_ready,
  input      [1:0]    io_sharedOutputs_0_b_payload_resp,
  input               io_sharedOutputs_0_r_valid,
  output              io_sharedOutputs_0_r_ready,
  input      [31:0]   io_sharedOutputs_0_r_payload_data,
  input      [1:0]    io_sharedOutputs_0_r_payload_resp,
  input               io_sharedOutputs_0_r_payload_last,
  output              io_sharedOutputs_1_arw_valid,
  input               io_sharedOutputs_1_arw_ready,
  output     [31:0]   io_sharedOutputs_1_arw_payload_addr,
  output     [2:0]    io_sharedOutputs_1_arw_payload_size,
  output     [3:0]    io_sharedOutputs_1_arw_payload_cache,
  output     [2:0]    io_sharedOutputs_1_arw_payload_prot,
  output              io_sharedOutputs_1_arw_payload_write,
  output              io_sharedOutputs_1_w_valid,
  input               io_sharedOutputs_1_w_ready,
  output     [31:0]   io_sharedOutputs_1_w_payload_data,
  output     [3:0]    io_sharedOutputs_1_w_payload_strb,
  output              io_sharedOutputs_1_w_payload_last,
  input               io_sharedOutputs_1_b_valid,
  output              io_sharedOutputs_1_b_ready,
  input      [1:0]    io_sharedOutputs_1_b_payload_resp,
  input               io_sharedOutputs_1_r_valid,
  output              io_sharedOutputs_1_r_ready,
  input      [31:0]   io_sharedOutputs_1_r_payload_data,
  input      [1:0]    io_sharedOutputs_1_r_payload_resp,
  input               io_sharedOutputs_1_r_payload_last,
  output              io_sharedOutputs_2_arw_valid,
  input               io_sharedOutputs_2_arw_ready,
  output     [31:0]   io_sharedOutputs_2_arw_payload_addr,
  output     [2:0]    io_sharedOutputs_2_arw_payload_size,
  output     [3:0]    io_sharedOutputs_2_arw_payload_cache,
  output     [2:0]    io_sharedOutputs_2_arw_payload_prot,
  output              io_sharedOutputs_2_arw_payload_write,
  output              io_sharedOutputs_2_w_valid,
  input               io_sharedOutputs_2_w_ready,
  output     [31:0]   io_sharedOutputs_2_w_payload_data,
  output     [3:0]    io_sharedOutputs_2_w_payload_strb,
  output              io_sharedOutputs_2_w_payload_last,
  input               io_sharedOutputs_2_b_valid,
  output              io_sharedOutputs_2_b_ready,
  input      [1:0]    io_sharedOutputs_2_b_payload_resp,
  input               io_sharedOutputs_2_r_valid,
  output              io_sharedOutputs_2_r_ready,
  input      [31:0]   io_sharedOutputs_2_r_payload_data,
  input      [1:0]    io_sharedOutputs_2_r_payload_resp,
  input               io_sharedOutputs_2_r_payload_last,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  wire                _zz_12_;
  wire                _zz_13_;
  reg        [1:0]    _zz_14_;
  reg        [31:0]   _zz_15_;
  reg        [1:0]    _zz_16_;
  reg                 _zz_17_;
  wire                errorSlave_io_axi_arw_ready;
  wire                errorSlave_io_axi_w_ready;
  wire                errorSlave_io_axi_b_valid;
  wire       [1:0]    errorSlave_io_axi_b_payload_resp;
  wire                errorSlave_io_axi_r_valid;
  wire       [31:0]   errorSlave_io_axi_r_payload_data;
  wire       [1:0]    errorSlave_io_axi_r_payload_resp;
  wire                errorSlave_io_axi_r_payload_last;
  reg        [2:0]    _zz_1_;
  reg        [2:0]    _zz_1__1;
  reg        [2:0]    _zz_1__0;
  wire                cmdAllowedStart;
  reg        [2:0]    pendingCmdCounter;
  wire       [2:0]    _zz_2_;
  reg                 pendingDataCounter_incrementIt;
  reg                 pendingDataCounter_decrementIt;
  wire       [2:0]    pendingDataCounter_valueNext;
  reg        [2:0]    pendingDataCounter_value;
  wire                pendingDataCounter_willOverflowIfInc;
  wire                pendingDataCounter_willOverflow;
  reg        [2:0]    pendingDataCounter_finalIncrement;
  wire       [2:0]    decodedCmdSels;
  wire                decodedCmdError;
  reg        [2:0]    pendingSels;
  reg                 pendingError;
  wire                allowCmd;
  wire                allowData;
  reg                 _zz_3_;
  wire       [2:0]    _zz_4_;
  wire       [2:0]    _zz_5_;
  wire       [2:0]    _zz_6_;
  wire                _zz_7_;
  wire                _zz_8_;
  wire       [1:0]    writeRspIndex;
  wire       [2:0]    _zz_9_;
  wire                _zz_10_;
  wire                _zz_11_;
  wire       [1:0]    readRspIndex;

  Axi4SharedErrorSlave errorSlave ( 
    .io_axi_arw_valid            (_zz_12_                                 ), //i
    .io_axi_arw_ready            (errorSlave_io_axi_arw_ready             ), //o
    .io_axi_arw_payload_addr     (io_input_arw_payload_addr[31:0]         ), //i
    .io_axi_arw_payload_size     (io_input_arw_payload_size[2:0]          ), //i
    .io_axi_arw_payload_cache    (io_input_arw_payload_cache[3:0]         ), //i
    .io_axi_arw_payload_prot     (io_input_arw_payload_prot[2:0]          ), //i
    .io_axi_arw_payload_write    (io_input_arw_payload_write              ), //i
    .io_axi_w_valid              (_zz_13_                                 ), //i
    .io_axi_w_ready              (errorSlave_io_axi_w_ready               ), //o
    .io_axi_w_payload_data       (io_input_w_payload_data[31:0]           ), //i
    .io_axi_w_payload_strb       (io_input_w_payload_strb[3:0]            ), //i
    .io_axi_w_payload_last       (io_input_w_payload_last                 ), //i
    .io_axi_b_valid              (errorSlave_io_axi_b_valid               ), //o
    .io_axi_b_ready              (io_input_b_ready                        ), //i
    .io_axi_b_payload_resp       (errorSlave_io_axi_b_payload_resp[1:0]   ), //o
    .io_axi_r_valid              (errorSlave_io_axi_r_valid               ), //o
    .io_axi_r_ready              (io_input_r_ready                        ), //i
    .io_axi_r_payload_data       (errorSlave_io_axi_r_payload_data[31:0]  ), //o
    .io_axi_r_payload_resp       (errorSlave_io_axi_r_payload_resp[1:0]   ), //o
    .io_axi_r_payload_last       (errorSlave_io_axi_r_payload_last        ), //o
    .io_mainClk                  (io_mainClk                              ), //i
    .resetCtrl_axiReset          (resetCtrl_axiReset                      )  //i
  );
  always @(*) begin
    case(writeRspIndex)
      2'b00 : begin
        _zz_14_ = io_sharedOutputs_0_b_payload_resp;
      end
      2'b01 : begin
        _zz_14_ = io_sharedOutputs_1_b_payload_resp;
      end
      default : begin
        _zz_14_ = io_sharedOutputs_2_b_payload_resp;
      end
    endcase
  end

  always @(*) begin
    case(readRspIndex)
      2'b00 : begin
        _zz_15_ = io_sharedOutputs_0_r_payload_data;
        _zz_16_ = io_sharedOutputs_0_r_payload_resp;
        _zz_17_ = io_sharedOutputs_0_r_payload_last;
      end
      2'b01 : begin
        _zz_15_ = io_sharedOutputs_1_r_payload_data;
        _zz_16_ = io_sharedOutputs_1_r_payload_resp;
        _zz_17_ = io_sharedOutputs_1_r_payload_last;
      end
      default : begin
        _zz_15_ = io_sharedOutputs_2_r_payload_data;
        _zz_16_ = io_sharedOutputs_2_r_payload_resp;
        _zz_17_ = io_sharedOutputs_2_r_payload_last;
      end
    endcase
  end

  always @ (*) begin
    _zz_1_ = _zz_1__1;
    if(((io_input_r_valid && io_input_r_ready) && io_input_r_payload_last))begin
      _zz_1_ = (_zz_1__1 - (3'b001));
    end
  end

  always @ (*) begin
    _zz_1__1 = _zz_1__0;
    if((io_input_b_valid && io_input_b_ready))begin
      _zz_1__1 = (_zz_1__0 - (3'b001));
    end
  end

  always @ (*) begin
    _zz_1__0 = _zz_2_;
    if((io_input_arw_valid && io_input_arw_ready))begin
      _zz_1__0 = (_zz_2_ + (3'b001));
    end
  end

  assign _zz_2_ = pendingCmdCounter;
  always @ (*) begin
    pendingDataCounter_incrementIt = 1'b0;
    if((cmdAllowedStart && io_input_arw_payload_write))begin
      pendingDataCounter_incrementIt = 1'b1;
    end
  end

  always @ (*) begin
    pendingDataCounter_decrementIt = 1'b0;
    if(((io_input_w_valid && io_input_w_ready) && io_input_w_payload_last))begin
      pendingDataCounter_decrementIt = 1'b1;
    end
  end

  assign pendingDataCounter_willOverflowIfInc = ((pendingDataCounter_value == (3'b111)) && (! pendingDataCounter_decrementIt));
  assign pendingDataCounter_willOverflow = (pendingDataCounter_willOverflowIfInc && pendingDataCounter_incrementIt);
  always @ (*) begin
    if((pendingDataCounter_incrementIt && (! pendingDataCounter_decrementIt)))begin
      pendingDataCounter_finalIncrement = (3'b001);
    end else begin
      if(((! pendingDataCounter_incrementIt) && pendingDataCounter_decrementIt))begin
        pendingDataCounter_finalIncrement = (3'b111);
      end else begin
        pendingDataCounter_finalIncrement = (3'b000);
      end
    end
  end

  assign pendingDataCounter_valueNext = (pendingDataCounter_value + pendingDataCounter_finalIncrement);
  assign decodedCmdSels = {((io_input_arw_payload_addr & (~ 32'h03ffffff)) == 32'h40000000),{((32'h80000000 <= io_input_arw_payload_addr) && (io_input_arw_payload_addr < 32'h8002c000)),((io_input_arw_payload_addr & (~ 32'h000fffff)) == 32'hf0000000)}};
  assign decodedCmdError = (decodedCmdSels == (3'b000));
  assign allowCmd = ((pendingCmdCounter == (3'b000)) || ((pendingCmdCounter != (3'b111)) && (pendingSels == decodedCmdSels)));
  assign allowData = (pendingDataCounter_value != (3'b000));
  assign cmdAllowedStart = ((io_input_arw_valid && allowCmd) && _zz_3_);
  assign io_input_arw_ready = ((((decodedCmdSels & {io_sharedOutputs_2_arw_ready,{io_sharedOutputs_1_arw_ready,io_sharedOutputs_0_arw_ready}}) != (3'b000)) || (decodedCmdError && errorSlave_io_axi_arw_ready)) && allowCmd);
  assign _zz_12_ = ((io_input_arw_valid && decodedCmdError) && allowCmd);
  assign _zz_4_ = decodedCmdSels[2 : 0];
  assign io_sharedOutputs_0_arw_valid = ((io_input_arw_valid && _zz_4_[0]) && allowCmd);
  assign io_sharedOutputs_0_arw_payload_addr = io_input_arw_payload_addr;
  assign io_sharedOutputs_0_arw_payload_size = io_input_arw_payload_size;
  assign io_sharedOutputs_0_arw_payload_cache = io_input_arw_payload_cache;
  assign io_sharedOutputs_0_arw_payload_prot = io_input_arw_payload_prot;
  assign io_sharedOutputs_0_arw_payload_write = io_input_arw_payload_write;
  assign io_sharedOutputs_1_arw_valid = ((io_input_arw_valid && _zz_4_[1]) && allowCmd);
  assign io_sharedOutputs_1_arw_payload_addr = io_input_arw_payload_addr;
  assign io_sharedOutputs_1_arw_payload_size = io_input_arw_payload_size;
  assign io_sharedOutputs_1_arw_payload_cache = io_input_arw_payload_cache;
  assign io_sharedOutputs_1_arw_payload_prot = io_input_arw_payload_prot;
  assign io_sharedOutputs_1_arw_payload_write = io_input_arw_payload_write;
  assign io_sharedOutputs_2_arw_valid = ((io_input_arw_valid && _zz_4_[2]) && allowCmd);
  assign io_sharedOutputs_2_arw_payload_addr = io_input_arw_payload_addr;
  assign io_sharedOutputs_2_arw_payload_size = io_input_arw_payload_size;
  assign io_sharedOutputs_2_arw_payload_cache = io_input_arw_payload_cache;
  assign io_sharedOutputs_2_arw_payload_prot = io_input_arw_payload_prot;
  assign io_sharedOutputs_2_arw_payload_write = io_input_arw_payload_write;
  assign io_input_w_ready = ((((pendingSels[2 : 0] & {io_sharedOutputs_2_w_ready,{io_sharedOutputs_1_w_ready,io_sharedOutputs_0_w_ready}}) != (3'b000)) || (pendingError && errorSlave_io_axi_w_ready)) && allowData);
  assign _zz_13_ = ((io_input_w_valid && pendingError) && allowData);
  assign _zz_5_ = pendingSels[2 : 0];
  assign io_sharedOutputs_0_w_valid = ((io_input_w_valid && _zz_5_[0]) && allowData);
  assign io_sharedOutputs_0_w_payload_data = io_input_w_payload_data;
  assign io_sharedOutputs_0_w_payload_strb = io_input_w_payload_strb;
  assign io_sharedOutputs_0_w_payload_last = io_input_w_payload_last;
  assign io_sharedOutputs_1_w_valid = ((io_input_w_valid && _zz_5_[1]) && allowData);
  assign io_sharedOutputs_1_w_payload_data = io_input_w_payload_data;
  assign io_sharedOutputs_1_w_payload_strb = io_input_w_payload_strb;
  assign io_sharedOutputs_1_w_payload_last = io_input_w_payload_last;
  assign io_sharedOutputs_2_w_valid = ((io_input_w_valid && _zz_5_[2]) && allowData);
  assign io_sharedOutputs_2_w_payload_data = io_input_w_payload_data;
  assign io_sharedOutputs_2_w_payload_strb = io_input_w_payload_strb;
  assign io_sharedOutputs_2_w_payload_last = io_input_w_payload_last;
  assign _zz_6_ = pendingSels[2 : 0];
  assign _zz_7_ = _zz_6_[1];
  assign _zz_8_ = _zz_6_[2];
  assign writeRspIndex = {_zz_8_,_zz_7_};
  assign io_input_b_valid = (({io_sharedOutputs_2_b_valid,{io_sharedOutputs_1_b_valid,io_sharedOutputs_0_b_valid}} != (3'b000)) || errorSlave_io_axi_b_valid);
  always @ (*) begin
    io_input_b_payload_resp = _zz_14_;
    if(pendingError)begin
      io_input_b_payload_resp = errorSlave_io_axi_b_payload_resp;
    end
  end

  assign io_sharedOutputs_0_b_ready = io_input_b_ready;
  assign io_sharedOutputs_1_b_ready = io_input_b_ready;
  assign io_sharedOutputs_2_b_ready = io_input_b_ready;
  assign _zz_9_ = pendingSels[2 : 0];
  assign _zz_10_ = _zz_9_[1];
  assign _zz_11_ = _zz_9_[2];
  assign readRspIndex = {_zz_11_,_zz_10_};
  assign io_input_r_valid = (({io_sharedOutputs_2_r_valid,{io_sharedOutputs_1_r_valid,io_sharedOutputs_0_r_valid}} != (3'b000)) || errorSlave_io_axi_r_valid);
  assign io_input_r_payload_data = _zz_15_;
  always @ (*) begin
    io_input_r_payload_resp = _zz_16_;
    if(pendingError)begin
      io_input_r_payload_resp = errorSlave_io_axi_r_payload_resp;
    end
  end

  always @ (*) begin
    io_input_r_payload_last = _zz_17_;
    if(pendingError)begin
      io_input_r_payload_last = errorSlave_io_axi_r_payload_last;
    end
  end

  assign io_sharedOutputs_0_r_ready = io_input_r_ready;
  assign io_sharedOutputs_1_r_ready = io_input_r_ready;
  assign io_sharedOutputs_2_r_ready = io_input_r_ready;
  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      pendingCmdCounter <= (3'b000);
      pendingDataCounter_value <= (3'b000);
      pendingSels <= (3'b000);
      pendingError <= 1'b0;
      _zz_3_ <= 1'b1;
    end else begin
      pendingCmdCounter <= _zz_1_;
      pendingDataCounter_value <= pendingDataCounter_valueNext;
      if(cmdAllowedStart)begin
        pendingSels <= decodedCmdSels;
      end
      if(cmdAllowedStart)begin
        pendingError <= decodedCmdError;
      end
      if(cmdAllowedStart)begin
        _zz_3_ <= 1'b0;
      end
      if(io_input_arw_ready)begin
        _zz_3_ <= 1'b1;
      end
    end
  end


endmodule

module Axi4SharedArbiter (
  input               io_readInputs_0_ar_valid,
  output              io_readInputs_0_ar_ready,
  input      [17:0]   io_readInputs_0_ar_payload_addr,
  input      [2:0]    io_readInputs_0_ar_payload_id,
  input      [7:0]    io_readInputs_0_ar_payload_len,
  input      [2:0]    io_readInputs_0_ar_payload_size,
  input      [1:0]    io_readInputs_0_ar_payload_burst,
  output              io_readInputs_0_r_valid,
  input               io_readInputs_0_r_ready,
  output     [31:0]   io_readInputs_0_r_payload_data,
  output     [2:0]    io_readInputs_0_r_payload_id,
  output     [1:0]    io_readInputs_0_r_payload_resp,
  output              io_readInputs_0_r_payload_last,
  input               io_sharedInputs_0_arw_valid,
  output              io_sharedInputs_0_arw_ready,
  input      [17:0]   io_sharedInputs_0_arw_payload_addr,
  input      [2:0]    io_sharedInputs_0_arw_payload_id,
  input      [7:0]    io_sharedInputs_0_arw_payload_len,
  input      [2:0]    io_sharedInputs_0_arw_payload_size,
  input      [1:0]    io_sharedInputs_0_arw_payload_burst,
  input               io_sharedInputs_0_arw_payload_write,
  input               io_sharedInputs_0_w_valid,
  output              io_sharedInputs_0_w_ready,
  input      [31:0]   io_sharedInputs_0_w_payload_data,
  input      [3:0]    io_sharedInputs_0_w_payload_strb,
  input               io_sharedInputs_0_w_payload_last,
  output              io_sharedInputs_0_b_valid,
  input               io_sharedInputs_0_b_ready,
  output     [2:0]    io_sharedInputs_0_b_payload_id,
  output     [1:0]    io_sharedInputs_0_b_payload_resp,
  output              io_sharedInputs_0_r_valid,
  input               io_sharedInputs_0_r_ready,
  output     [31:0]   io_sharedInputs_0_r_payload_data,
  output     [2:0]    io_sharedInputs_0_r_payload_id,
  output     [1:0]    io_sharedInputs_0_r_payload_resp,
  output              io_sharedInputs_0_r_payload_last,
  output              io_output_arw_valid,
  input               io_output_arw_ready,
  output     [17:0]   io_output_arw_payload_addr,
  output     [3:0]    io_output_arw_payload_id,
  output     [7:0]    io_output_arw_payload_len,
  output     [2:0]    io_output_arw_payload_size,
  output     [1:0]    io_output_arw_payload_burst,
  output              io_output_arw_payload_write,
  output              io_output_w_valid,
  input               io_output_w_ready,
  output     [31:0]   io_output_w_payload_data,
  output     [3:0]    io_output_w_payload_strb,
  output              io_output_w_payload_last,
  input               io_output_b_valid,
  output              io_output_b_ready,
  input      [3:0]    io_output_b_payload_id,
  input      [1:0]    io_output_b_payload_resp,
  input               io_output_r_valid,
  output              io_output_r_ready,
  input      [31:0]   io_output_r_payload_data,
  input      [3:0]    io_output_r_payload_id,
  input      [1:0]    io_output_r_payload_resp,
  input               io_output_r_payload_last,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  reg                 _zz_2_;
  wire                _zz_3_;
  wire                _zz_4_;
  reg                 _zz_5_;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_inputs_1_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [17:0]   cmdArbiter_io_output_payload_addr;
  wire       [2:0]    cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire                cmdArbiter_io_output_payload_write;
  wire       [0:0]    cmdArbiter_io_chosen;
  wire       [1:0]    cmdArbiter_io_chosenOH;
  wire                streamFork_4__io_input_ready;
  wire                streamFork_4__io_outputs_0_valid;
  wire       [17:0]   streamFork_4__io_outputs_0_payload_addr;
  wire       [2:0]    streamFork_4__io_outputs_0_payload_id;
  wire       [7:0]    streamFork_4__io_outputs_0_payload_len;
  wire       [2:0]    streamFork_4__io_outputs_0_payload_size;
  wire       [1:0]    streamFork_4__io_outputs_0_payload_burst;
  wire                streamFork_4__io_outputs_0_payload_write;
  wire                streamFork_4__io_outputs_1_valid;
  wire       [17:0]   streamFork_4__io_outputs_1_payload_addr;
  wire       [2:0]    streamFork_4__io_outputs_1_payload_id;
  wire       [7:0]    streamFork_4__io_outputs_1_payload_len;
  wire       [2:0]    streamFork_4__io_outputs_1_payload_size;
  wire       [1:0]    streamFork_4__io_outputs_1_payload_burst;
  wire                streamFork_4__io_outputs_1_payload_write;
  wire                streamFork_4__io_outputs_1_thrown_translated_fifo_io_push_ready;
  wire                streamFork_4__io_outputs_1_thrown_translated_fifo_io_pop_valid;
  wire       [2:0]    streamFork_4__io_outputs_1_thrown_translated_fifo_io_occupancy;
  wire                _zz_6_;
  wire       [1:0]    _zz_7_;
  wire       [2:0]    _zz_8_;
  wire       [3:0]    _zz_9_;
  wire                inputsCmd_0_valid;
  wire                inputsCmd_0_ready;
  wire       [17:0]   inputsCmd_0_payload_addr;
  wire       [2:0]    inputsCmd_0_payload_id;
  wire       [7:0]    inputsCmd_0_payload_len;
  wire       [2:0]    inputsCmd_0_payload_size;
  wire       [1:0]    inputsCmd_0_payload_burst;
  wire                inputsCmd_0_payload_write;
  wire                inputsCmd_1_valid;
  wire                inputsCmd_1_ready;
  wire       [17:0]   inputsCmd_1_payload_addr;
  wire       [2:0]    inputsCmd_1_payload_id;
  wire       [7:0]    inputsCmd_1_payload_len;
  wire       [2:0]    inputsCmd_1_payload_size;
  wire       [1:0]    inputsCmd_1_payload_burst;
  wire                inputsCmd_1_payload_write;
  wire                _zz_1_;
  reg                 streamFork_4__io_outputs_1_thrown_valid;
  wire                streamFork_4__io_outputs_1_thrown_ready;
  wire       [17:0]   streamFork_4__io_outputs_1_thrown_payload_addr;
  wire       [2:0]    streamFork_4__io_outputs_1_thrown_payload_id;
  wire       [7:0]    streamFork_4__io_outputs_1_thrown_payload_len;
  wire       [2:0]    streamFork_4__io_outputs_1_thrown_payload_size;
  wire       [1:0]    streamFork_4__io_outputs_1_thrown_payload_burst;
  wire                streamFork_4__io_outputs_1_thrown_payload_write;
  wire                streamFork_4__io_outputs_1_thrown_translated_valid;
  wire                streamFork_4__io_outputs_1_thrown_translated_ready;
  wire                writeLogic_routeDataInput_valid;
  wire                writeLogic_routeDataInput_ready;
  wire       [31:0]   writeLogic_routeDataInput_payload_data;
  wire       [3:0]    writeLogic_routeDataInput_payload_strb;
  wire                writeLogic_routeDataInput_payload_last;
  wire                writeLogic_writeRspSels_0;
  wire       [0:0]    readRspIndex;
  wire                readRspSels_0;
  wire                readRspSels_1;

  assign _zz_6_ = (! streamFork_4__io_outputs_1_payload_write);
  assign _zz_7_ = {cmdArbiter_io_chosenOH[1 : 1],cmdArbiter_io_chosenOH[0 : 0]};
  assign _zz_8_ = streamFork_4__io_outputs_0_payload_id;
  assign _zz_9_ = {1'd0, _zz_8_};
  StreamArbiter cmdArbiter ( 
    .io_inputs_0_valid            (inputsCmd_0_valid                        ), //i
    .io_inputs_0_ready            (cmdArbiter_io_inputs_0_ready             ), //o
    .io_inputs_0_payload_addr     (inputsCmd_0_payload_addr[17:0]           ), //i
    .io_inputs_0_payload_id       (inputsCmd_0_payload_id[2:0]              ), //i
    .io_inputs_0_payload_len      (inputsCmd_0_payload_len[7:0]             ), //i
    .io_inputs_0_payload_size     (inputsCmd_0_payload_size[2:0]            ), //i
    .io_inputs_0_payload_burst    (inputsCmd_0_payload_burst[1:0]           ), //i
    .io_inputs_0_payload_write    (inputsCmd_0_payload_write                ), //i
    .io_inputs_1_valid            (inputsCmd_1_valid                        ), //i
    .io_inputs_1_ready            (cmdArbiter_io_inputs_1_ready             ), //o
    .io_inputs_1_payload_addr     (inputsCmd_1_payload_addr[17:0]           ), //i
    .io_inputs_1_payload_id       (inputsCmd_1_payload_id[2:0]              ), //i
    .io_inputs_1_payload_len      (inputsCmd_1_payload_len[7:0]             ), //i
    .io_inputs_1_payload_size     (inputsCmd_1_payload_size[2:0]            ), //i
    .io_inputs_1_payload_burst    (inputsCmd_1_payload_burst[1:0]           ), //i
    .io_inputs_1_payload_write    (inputsCmd_1_payload_write                ), //i
    .io_output_valid              (cmdArbiter_io_output_valid               ), //o
    .io_output_ready              (streamFork_4__io_input_ready             ), //i
    .io_output_payload_addr       (cmdArbiter_io_output_payload_addr[17:0]  ), //o
    .io_output_payload_id         (cmdArbiter_io_output_payload_id[2:0]     ), //o
    .io_output_payload_len        (cmdArbiter_io_output_payload_len[7:0]    ), //o
    .io_output_payload_size       (cmdArbiter_io_output_payload_size[2:0]   ), //o
    .io_output_payload_burst      (cmdArbiter_io_output_payload_burst[1:0]  ), //o
    .io_output_payload_write      (cmdArbiter_io_output_payload_write       ), //o
    .io_chosen                    (cmdArbiter_io_chosen                     ), //o
    .io_chosenOH                  (cmdArbiter_io_chosenOH[1:0]              ), //o
    .io_mainClk                   (io_mainClk                               ), //i
    .resetCtrl_axiReset           (resetCtrl_axiReset                       )  //i
  );
  StreamFork streamFork_4_ ( 
    .io_input_valid                (cmdArbiter_io_output_valid                     ), //i
    .io_input_ready                (streamFork_4__io_input_ready                   ), //o
    .io_input_payload_addr         (cmdArbiter_io_output_payload_addr[17:0]        ), //i
    .io_input_payload_id           (cmdArbiter_io_output_payload_id[2:0]           ), //i
    .io_input_payload_len          (cmdArbiter_io_output_payload_len[7:0]          ), //i
    .io_input_payload_size         (cmdArbiter_io_output_payload_size[2:0]         ), //i
    .io_input_payload_burst        (cmdArbiter_io_output_payload_burst[1:0]        ), //i
    .io_input_payload_write        (cmdArbiter_io_output_payload_write             ), //i
    .io_outputs_0_valid            (streamFork_4__io_outputs_0_valid               ), //o
    .io_outputs_0_ready            (io_output_arw_ready                            ), //i
    .io_outputs_0_payload_addr     (streamFork_4__io_outputs_0_payload_addr[17:0]  ), //o
    .io_outputs_0_payload_id       (streamFork_4__io_outputs_0_payload_id[2:0]     ), //o
    .io_outputs_0_payload_len      (streamFork_4__io_outputs_0_payload_len[7:0]    ), //o
    .io_outputs_0_payload_size     (streamFork_4__io_outputs_0_payload_size[2:0]   ), //o
    .io_outputs_0_payload_burst    (streamFork_4__io_outputs_0_payload_burst[1:0]  ), //o
    .io_outputs_0_payload_write    (streamFork_4__io_outputs_0_payload_write       ), //o
    .io_outputs_1_valid            (streamFork_4__io_outputs_1_valid               ), //o
    .io_outputs_1_ready            (_zz_2_                                         ), //i
    .io_outputs_1_payload_addr     (streamFork_4__io_outputs_1_payload_addr[17:0]  ), //o
    .io_outputs_1_payload_id       (streamFork_4__io_outputs_1_payload_id[2:0]     ), //o
    .io_outputs_1_payload_len      (streamFork_4__io_outputs_1_payload_len[7:0]    ), //o
    .io_outputs_1_payload_size     (streamFork_4__io_outputs_1_payload_size[2:0]   ), //o
    .io_outputs_1_payload_burst    (streamFork_4__io_outputs_1_payload_burst[1:0]  ), //o
    .io_outputs_1_payload_write    (streamFork_4__io_outputs_1_payload_write       ), //o
    .io_mainClk                    (io_mainClk                                     ), //i
    .resetCtrl_axiReset            (resetCtrl_axiReset                             )  //i
  );
  StreamFifoLowLatency_2_ streamFork_4__io_outputs_1_thrown_translated_fifo ( 
    .io_push_valid         (streamFork_4__io_outputs_1_thrown_translated_valid                   ), //i
    .io_push_ready         (streamFork_4__io_outputs_1_thrown_translated_fifo_io_push_ready      ), //o
    .io_pop_valid          (streamFork_4__io_outputs_1_thrown_translated_fifo_io_pop_valid       ), //o
    .io_pop_ready          (_zz_3_                                                               ), //i
    .io_flush              (_zz_4_                                                               ), //i
    .io_occupancy          (streamFork_4__io_outputs_1_thrown_translated_fifo_io_occupancy[2:0]  ), //o
    .io_mainClk            (io_mainClk                                                           ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                                                   )  //i
  );
  always @(*) begin
    case(readRspIndex)
      1'b0 : begin
        _zz_5_ = io_readInputs_0_r_ready;
      end
      default : begin
        _zz_5_ = io_sharedInputs_0_r_ready;
      end
    endcase
  end

  assign inputsCmd_0_valid = io_readInputs_0_ar_valid;
  assign io_readInputs_0_ar_ready = inputsCmd_0_ready;
  assign inputsCmd_0_payload_addr = io_readInputs_0_ar_payload_addr;
  assign inputsCmd_0_payload_id = io_readInputs_0_ar_payload_id;
  assign inputsCmd_0_payload_len = io_readInputs_0_ar_payload_len;
  assign inputsCmd_0_payload_size = io_readInputs_0_ar_payload_size;
  assign inputsCmd_0_payload_burst = io_readInputs_0_ar_payload_burst;
  assign inputsCmd_0_payload_write = 1'b0;
  assign inputsCmd_1_valid = io_sharedInputs_0_arw_valid;
  assign io_sharedInputs_0_arw_ready = inputsCmd_1_ready;
  assign inputsCmd_1_payload_addr = io_sharedInputs_0_arw_payload_addr;
  assign inputsCmd_1_payload_id = io_sharedInputs_0_arw_payload_id;
  assign inputsCmd_1_payload_len = io_sharedInputs_0_arw_payload_len;
  assign inputsCmd_1_payload_size = io_sharedInputs_0_arw_payload_size;
  assign inputsCmd_1_payload_burst = io_sharedInputs_0_arw_payload_burst;
  assign inputsCmd_1_payload_write = io_sharedInputs_0_arw_payload_write;
  assign inputsCmd_0_ready = cmdArbiter_io_inputs_0_ready;
  assign inputsCmd_1_ready = cmdArbiter_io_inputs_1_ready;
  assign io_output_arw_valid = streamFork_4__io_outputs_0_valid;
  assign io_output_arw_payload_addr = streamFork_4__io_outputs_0_payload_addr;
  assign io_output_arw_payload_len = streamFork_4__io_outputs_0_payload_len;
  assign io_output_arw_payload_size = streamFork_4__io_outputs_0_payload_size;
  assign io_output_arw_payload_burst = streamFork_4__io_outputs_0_payload_burst;
  assign io_output_arw_payload_write = streamFork_4__io_outputs_0_payload_write;
  assign _zz_1_ = _zz_7_[1];
  assign io_output_arw_payload_id = (streamFork_4__io_outputs_0_payload_write ? _zz_9_ : {_zz_1_,streamFork_4__io_outputs_0_payload_id});
  always @ (*) begin
    streamFork_4__io_outputs_1_thrown_valid = streamFork_4__io_outputs_1_valid;
    if(_zz_6_)begin
      streamFork_4__io_outputs_1_thrown_valid = 1'b0;
    end
  end

  always @ (*) begin
    _zz_2_ = streamFork_4__io_outputs_1_thrown_ready;
    if(_zz_6_)begin
      _zz_2_ = 1'b1;
    end
  end

  assign streamFork_4__io_outputs_1_thrown_payload_addr = streamFork_4__io_outputs_1_payload_addr;
  assign streamFork_4__io_outputs_1_thrown_payload_id = streamFork_4__io_outputs_1_payload_id;
  assign streamFork_4__io_outputs_1_thrown_payload_len = streamFork_4__io_outputs_1_payload_len;
  assign streamFork_4__io_outputs_1_thrown_payload_size = streamFork_4__io_outputs_1_payload_size;
  assign streamFork_4__io_outputs_1_thrown_payload_burst = streamFork_4__io_outputs_1_payload_burst;
  assign streamFork_4__io_outputs_1_thrown_payload_write = streamFork_4__io_outputs_1_payload_write;
  assign streamFork_4__io_outputs_1_thrown_translated_valid = streamFork_4__io_outputs_1_thrown_valid;
  assign streamFork_4__io_outputs_1_thrown_ready = streamFork_4__io_outputs_1_thrown_translated_ready;
  assign streamFork_4__io_outputs_1_thrown_translated_ready = streamFork_4__io_outputs_1_thrown_translated_fifo_io_push_ready;
  assign writeLogic_routeDataInput_valid = io_sharedInputs_0_w_valid;
  assign writeLogic_routeDataInput_ready = io_sharedInputs_0_w_ready;
  assign writeLogic_routeDataInput_payload_data = io_sharedInputs_0_w_payload_data;
  assign writeLogic_routeDataInput_payload_strb = io_sharedInputs_0_w_payload_strb;
  assign writeLogic_routeDataInput_payload_last = io_sharedInputs_0_w_payload_last;
  assign io_output_w_valid = (streamFork_4__io_outputs_1_thrown_translated_fifo_io_pop_valid && writeLogic_routeDataInput_valid);
  assign io_output_w_payload_data = writeLogic_routeDataInput_payload_data;
  assign io_output_w_payload_strb = writeLogic_routeDataInput_payload_strb;
  assign io_output_w_payload_last = writeLogic_routeDataInput_payload_last;
  assign io_sharedInputs_0_w_ready = ((streamFork_4__io_outputs_1_thrown_translated_fifo_io_pop_valid && io_output_w_ready) && 1'b1);
  assign _zz_3_ = ((io_output_w_valid && io_output_w_ready) && io_output_w_payload_last);
  assign writeLogic_writeRspSels_0 = 1'b1;
  assign io_sharedInputs_0_b_valid = (io_output_b_valid && writeLogic_writeRspSels_0);
  assign io_sharedInputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_sharedInputs_0_b_payload_id = io_output_b_payload_id[2:0];
  assign io_output_b_ready = io_sharedInputs_0_b_ready;
  assign readRspIndex = io_output_r_payload_id[3 : 3];
  assign readRspSels_0 = (readRspIndex == (1'b0));
  assign readRspSels_1 = (readRspIndex == (1'b1));
  assign io_readInputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_readInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_readInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_readInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_readInputs_0_r_payload_id = io_output_r_payload_id[2:0];
  assign io_sharedInputs_0_r_valid = (io_output_r_valid && readRspSels_1);
  assign io_sharedInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_sharedInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_sharedInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_sharedInputs_0_r_payload_id = io_output_r_payload_id[2:0];
  assign io_output_r_ready = _zz_5_;
  assign _zz_4_ = 1'b0;

endmodule

module Axi4SharedArbiter_1_ (
  input               io_readInputs_0_ar_valid,
  output              io_readInputs_0_ar_ready,
  input      [25:0]   io_readInputs_0_ar_payload_addr,
  input      [2:0]    io_readInputs_0_ar_payload_id,
  input      [7:0]    io_readInputs_0_ar_payload_len,
  input      [2:0]    io_readInputs_0_ar_payload_size,
  input      [1:0]    io_readInputs_0_ar_payload_burst,
  output              io_readInputs_0_r_valid,
  input               io_readInputs_0_r_ready,
  output     [31:0]   io_readInputs_0_r_payload_data,
  output     [2:0]    io_readInputs_0_r_payload_id,
  output     [1:0]    io_readInputs_0_r_payload_resp,
  output              io_readInputs_0_r_payload_last,
  input               io_sharedInputs_0_arw_valid,
  output              io_sharedInputs_0_arw_ready,
  input      [25:0]   io_sharedInputs_0_arw_payload_addr,
  input      [2:0]    io_sharedInputs_0_arw_payload_id,
  input      [7:0]    io_sharedInputs_0_arw_payload_len,
  input      [2:0]    io_sharedInputs_0_arw_payload_size,
  input      [1:0]    io_sharedInputs_0_arw_payload_burst,
  input               io_sharedInputs_0_arw_payload_write,
  input               io_sharedInputs_0_w_valid,
  output              io_sharedInputs_0_w_ready,
  input      [31:0]   io_sharedInputs_0_w_payload_data,
  input      [3:0]    io_sharedInputs_0_w_payload_strb,
  input               io_sharedInputs_0_w_payload_last,
  output              io_sharedInputs_0_b_valid,
  input               io_sharedInputs_0_b_ready,
  output     [2:0]    io_sharedInputs_0_b_payload_id,
  output     [1:0]    io_sharedInputs_0_b_payload_resp,
  output              io_sharedInputs_0_r_valid,
  input               io_sharedInputs_0_r_ready,
  output     [31:0]   io_sharedInputs_0_r_payload_data,
  output     [2:0]    io_sharedInputs_0_r_payload_id,
  output     [1:0]    io_sharedInputs_0_r_payload_resp,
  output              io_sharedInputs_0_r_payload_last,
  output              io_output_arw_valid,
  input               io_output_arw_ready,
  output     [25:0]   io_output_arw_payload_addr,
  output     [3:0]    io_output_arw_payload_id,
  output     [7:0]    io_output_arw_payload_len,
  output     [2:0]    io_output_arw_payload_size,
  output     [1:0]    io_output_arw_payload_burst,
  output              io_output_arw_payload_write,
  output              io_output_w_valid,
  input               io_output_w_ready,
  output     [31:0]   io_output_w_payload_data,
  output     [3:0]    io_output_w_payload_strb,
  output              io_output_w_payload_last,
  input               io_output_b_valid,
  output              io_output_b_ready,
  input      [3:0]    io_output_b_payload_id,
  input      [1:0]    io_output_b_payload_resp,
  input               io_output_r_valid,
  output              io_output_r_ready,
  input      [31:0]   io_output_r_payload_data,
  input      [3:0]    io_output_r_payload_id,
  input      [1:0]    io_output_r_payload_resp,
  input               io_output_r_payload_last,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  reg                 _zz_2_;
  wire                _zz_3_;
  wire                _zz_4_;
  reg                 _zz_5_;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_inputs_1_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [25:0]   cmdArbiter_io_output_payload_addr;
  wire       [2:0]    cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire                cmdArbiter_io_output_payload_write;
  wire       [0:0]    cmdArbiter_io_chosen;
  wire       [1:0]    cmdArbiter_io_chosenOH;
  wire                streamFork_4__io_input_ready;
  wire                streamFork_4__io_outputs_0_valid;
  wire       [25:0]   streamFork_4__io_outputs_0_payload_addr;
  wire       [2:0]    streamFork_4__io_outputs_0_payload_id;
  wire       [7:0]    streamFork_4__io_outputs_0_payload_len;
  wire       [2:0]    streamFork_4__io_outputs_0_payload_size;
  wire       [1:0]    streamFork_4__io_outputs_0_payload_burst;
  wire                streamFork_4__io_outputs_0_payload_write;
  wire                streamFork_4__io_outputs_1_valid;
  wire       [25:0]   streamFork_4__io_outputs_1_payload_addr;
  wire       [2:0]    streamFork_4__io_outputs_1_payload_id;
  wire       [7:0]    streamFork_4__io_outputs_1_payload_len;
  wire       [2:0]    streamFork_4__io_outputs_1_payload_size;
  wire       [1:0]    streamFork_4__io_outputs_1_payload_burst;
  wire                streamFork_4__io_outputs_1_payload_write;
  wire                streamFork_4__io_outputs_1_thrown_translated_fifo_io_push_ready;
  wire                streamFork_4__io_outputs_1_thrown_translated_fifo_io_pop_valid;
  wire       [2:0]    streamFork_4__io_outputs_1_thrown_translated_fifo_io_occupancy;
  wire                _zz_6_;
  wire       [1:0]    _zz_7_;
  wire       [2:0]    _zz_8_;
  wire       [3:0]    _zz_9_;
  wire                inputsCmd_0_valid;
  wire                inputsCmd_0_ready;
  wire       [25:0]   inputsCmd_0_payload_addr;
  wire       [2:0]    inputsCmd_0_payload_id;
  wire       [7:0]    inputsCmd_0_payload_len;
  wire       [2:0]    inputsCmd_0_payload_size;
  wire       [1:0]    inputsCmd_0_payload_burst;
  wire                inputsCmd_0_payload_write;
  wire                inputsCmd_1_valid;
  wire                inputsCmd_1_ready;
  wire       [25:0]   inputsCmd_1_payload_addr;
  wire       [2:0]    inputsCmd_1_payload_id;
  wire       [7:0]    inputsCmd_1_payload_len;
  wire       [2:0]    inputsCmd_1_payload_size;
  wire       [1:0]    inputsCmd_1_payload_burst;
  wire                inputsCmd_1_payload_write;
  wire                _zz_1_;
  reg                 streamFork_4__io_outputs_1_thrown_valid;
  wire                streamFork_4__io_outputs_1_thrown_ready;
  wire       [25:0]   streamFork_4__io_outputs_1_thrown_payload_addr;
  wire       [2:0]    streamFork_4__io_outputs_1_thrown_payload_id;
  wire       [7:0]    streamFork_4__io_outputs_1_thrown_payload_len;
  wire       [2:0]    streamFork_4__io_outputs_1_thrown_payload_size;
  wire       [1:0]    streamFork_4__io_outputs_1_thrown_payload_burst;
  wire                streamFork_4__io_outputs_1_thrown_payload_write;
  wire                streamFork_4__io_outputs_1_thrown_translated_valid;
  wire                streamFork_4__io_outputs_1_thrown_translated_ready;
  wire                writeLogic_routeDataInput_valid;
  wire                writeLogic_routeDataInput_ready;
  wire       [31:0]   writeLogic_routeDataInput_payload_data;
  wire       [3:0]    writeLogic_routeDataInput_payload_strb;
  wire                writeLogic_routeDataInput_payload_last;
  wire                writeLogic_writeRspSels_0;
  wire       [0:0]    readRspIndex;
  wire                readRspSels_0;
  wire                readRspSels_1;

  assign _zz_6_ = (! streamFork_4__io_outputs_1_payload_write);
  assign _zz_7_ = {cmdArbiter_io_chosenOH[1 : 1],cmdArbiter_io_chosenOH[0 : 0]};
  assign _zz_8_ = streamFork_4__io_outputs_0_payload_id;
  assign _zz_9_ = {1'd0, _zz_8_};
  StreamArbiter_1_ cmdArbiter ( 
    .io_inputs_0_valid            (inputsCmd_0_valid                        ), //i
    .io_inputs_0_ready            (cmdArbiter_io_inputs_0_ready             ), //o
    .io_inputs_0_payload_addr     (inputsCmd_0_payload_addr[25:0]           ), //i
    .io_inputs_0_payload_id       (inputsCmd_0_payload_id[2:0]              ), //i
    .io_inputs_0_payload_len      (inputsCmd_0_payload_len[7:0]             ), //i
    .io_inputs_0_payload_size     (inputsCmd_0_payload_size[2:0]            ), //i
    .io_inputs_0_payload_burst    (inputsCmd_0_payload_burst[1:0]           ), //i
    .io_inputs_0_payload_write    (inputsCmd_0_payload_write                ), //i
    .io_inputs_1_valid            (inputsCmd_1_valid                        ), //i
    .io_inputs_1_ready            (cmdArbiter_io_inputs_1_ready             ), //o
    .io_inputs_1_payload_addr     (inputsCmd_1_payload_addr[25:0]           ), //i
    .io_inputs_1_payload_id       (inputsCmd_1_payload_id[2:0]              ), //i
    .io_inputs_1_payload_len      (inputsCmd_1_payload_len[7:0]             ), //i
    .io_inputs_1_payload_size     (inputsCmd_1_payload_size[2:0]            ), //i
    .io_inputs_1_payload_burst    (inputsCmd_1_payload_burst[1:0]           ), //i
    .io_inputs_1_payload_write    (inputsCmd_1_payload_write                ), //i
    .io_output_valid              (cmdArbiter_io_output_valid               ), //o
    .io_output_ready              (streamFork_4__io_input_ready             ), //i
    .io_output_payload_addr       (cmdArbiter_io_output_payload_addr[25:0]  ), //o
    .io_output_payload_id         (cmdArbiter_io_output_payload_id[2:0]     ), //o
    .io_output_payload_len        (cmdArbiter_io_output_payload_len[7:0]    ), //o
    .io_output_payload_size       (cmdArbiter_io_output_payload_size[2:0]   ), //o
    .io_output_payload_burst      (cmdArbiter_io_output_payload_burst[1:0]  ), //o
    .io_output_payload_write      (cmdArbiter_io_output_payload_write       ), //o
    .io_chosen                    (cmdArbiter_io_chosen                     ), //o
    .io_chosenOH                  (cmdArbiter_io_chosenOH[1:0]              ), //o
    .io_mainClk                   (io_mainClk                               ), //i
    .resetCtrl_axiReset           (resetCtrl_axiReset                       )  //i
  );
  StreamFork_1_ streamFork_4_ ( 
    .io_input_valid                (cmdArbiter_io_output_valid                     ), //i
    .io_input_ready                (streamFork_4__io_input_ready                   ), //o
    .io_input_payload_addr         (cmdArbiter_io_output_payload_addr[25:0]        ), //i
    .io_input_payload_id           (cmdArbiter_io_output_payload_id[2:0]           ), //i
    .io_input_payload_len          (cmdArbiter_io_output_payload_len[7:0]          ), //i
    .io_input_payload_size         (cmdArbiter_io_output_payload_size[2:0]         ), //i
    .io_input_payload_burst        (cmdArbiter_io_output_payload_burst[1:0]        ), //i
    .io_input_payload_write        (cmdArbiter_io_output_payload_write             ), //i
    .io_outputs_0_valid            (streamFork_4__io_outputs_0_valid               ), //o
    .io_outputs_0_ready            (io_output_arw_ready                            ), //i
    .io_outputs_0_payload_addr     (streamFork_4__io_outputs_0_payload_addr[25:0]  ), //o
    .io_outputs_0_payload_id       (streamFork_4__io_outputs_0_payload_id[2:0]     ), //o
    .io_outputs_0_payload_len      (streamFork_4__io_outputs_0_payload_len[7:0]    ), //o
    .io_outputs_0_payload_size     (streamFork_4__io_outputs_0_payload_size[2:0]   ), //o
    .io_outputs_0_payload_burst    (streamFork_4__io_outputs_0_payload_burst[1:0]  ), //o
    .io_outputs_0_payload_write    (streamFork_4__io_outputs_0_payload_write       ), //o
    .io_outputs_1_valid            (streamFork_4__io_outputs_1_valid               ), //o
    .io_outputs_1_ready            (_zz_2_                                         ), //i
    .io_outputs_1_payload_addr     (streamFork_4__io_outputs_1_payload_addr[25:0]  ), //o
    .io_outputs_1_payload_id       (streamFork_4__io_outputs_1_payload_id[2:0]     ), //o
    .io_outputs_1_payload_len      (streamFork_4__io_outputs_1_payload_len[7:0]    ), //o
    .io_outputs_1_payload_size     (streamFork_4__io_outputs_1_payload_size[2:0]   ), //o
    .io_outputs_1_payload_burst    (streamFork_4__io_outputs_1_payload_burst[1:0]  ), //o
    .io_outputs_1_payload_write    (streamFork_4__io_outputs_1_payload_write       ), //o
    .io_mainClk                    (io_mainClk                                     ), //i
    .resetCtrl_axiReset            (resetCtrl_axiReset                             )  //i
  );
  StreamFifoLowLatency_2_ streamFork_4__io_outputs_1_thrown_translated_fifo ( 
    .io_push_valid         (streamFork_4__io_outputs_1_thrown_translated_valid                   ), //i
    .io_push_ready         (streamFork_4__io_outputs_1_thrown_translated_fifo_io_push_ready      ), //o
    .io_pop_valid          (streamFork_4__io_outputs_1_thrown_translated_fifo_io_pop_valid       ), //o
    .io_pop_ready          (_zz_3_                                                               ), //i
    .io_flush              (_zz_4_                                                               ), //i
    .io_occupancy          (streamFork_4__io_outputs_1_thrown_translated_fifo_io_occupancy[2:0]  ), //o
    .io_mainClk            (io_mainClk                                                           ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                                                   )  //i
  );
  always @(*) begin
    case(readRspIndex)
      1'b0 : begin
        _zz_5_ = io_readInputs_0_r_ready;
      end
      default : begin
        _zz_5_ = io_sharedInputs_0_r_ready;
      end
    endcase
  end

  assign inputsCmd_0_valid = io_readInputs_0_ar_valid;
  assign io_readInputs_0_ar_ready = inputsCmd_0_ready;
  assign inputsCmd_0_payload_addr = io_readInputs_0_ar_payload_addr;
  assign inputsCmd_0_payload_id = io_readInputs_0_ar_payload_id;
  assign inputsCmd_0_payload_len = io_readInputs_0_ar_payload_len;
  assign inputsCmd_0_payload_size = io_readInputs_0_ar_payload_size;
  assign inputsCmd_0_payload_burst = io_readInputs_0_ar_payload_burst;
  assign inputsCmd_0_payload_write = 1'b0;
  assign inputsCmd_1_valid = io_sharedInputs_0_arw_valid;
  assign io_sharedInputs_0_arw_ready = inputsCmd_1_ready;
  assign inputsCmd_1_payload_addr = io_sharedInputs_0_arw_payload_addr;
  assign inputsCmd_1_payload_id = io_sharedInputs_0_arw_payload_id;
  assign inputsCmd_1_payload_len = io_sharedInputs_0_arw_payload_len;
  assign inputsCmd_1_payload_size = io_sharedInputs_0_arw_payload_size;
  assign inputsCmd_1_payload_burst = io_sharedInputs_0_arw_payload_burst;
  assign inputsCmd_1_payload_write = io_sharedInputs_0_arw_payload_write;
  assign inputsCmd_0_ready = cmdArbiter_io_inputs_0_ready;
  assign inputsCmd_1_ready = cmdArbiter_io_inputs_1_ready;
  assign io_output_arw_valid = streamFork_4__io_outputs_0_valid;
  assign io_output_arw_payload_addr = streamFork_4__io_outputs_0_payload_addr;
  assign io_output_arw_payload_len = streamFork_4__io_outputs_0_payload_len;
  assign io_output_arw_payload_size = streamFork_4__io_outputs_0_payload_size;
  assign io_output_arw_payload_burst = streamFork_4__io_outputs_0_payload_burst;
  assign io_output_arw_payload_write = streamFork_4__io_outputs_0_payload_write;
  assign _zz_1_ = _zz_7_[1];
  assign io_output_arw_payload_id = (streamFork_4__io_outputs_0_payload_write ? _zz_9_ : {_zz_1_,streamFork_4__io_outputs_0_payload_id});
  always @ (*) begin
    streamFork_4__io_outputs_1_thrown_valid = streamFork_4__io_outputs_1_valid;
    if(_zz_6_)begin
      streamFork_4__io_outputs_1_thrown_valid = 1'b0;
    end
  end

  always @ (*) begin
    _zz_2_ = streamFork_4__io_outputs_1_thrown_ready;
    if(_zz_6_)begin
      _zz_2_ = 1'b1;
    end
  end

  assign streamFork_4__io_outputs_1_thrown_payload_addr = streamFork_4__io_outputs_1_payload_addr;
  assign streamFork_4__io_outputs_1_thrown_payload_id = streamFork_4__io_outputs_1_payload_id;
  assign streamFork_4__io_outputs_1_thrown_payload_len = streamFork_4__io_outputs_1_payload_len;
  assign streamFork_4__io_outputs_1_thrown_payload_size = streamFork_4__io_outputs_1_payload_size;
  assign streamFork_4__io_outputs_1_thrown_payload_burst = streamFork_4__io_outputs_1_payload_burst;
  assign streamFork_4__io_outputs_1_thrown_payload_write = streamFork_4__io_outputs_1_payload_write;
  assign streamFork_4__io_outputs_1_thrown_translated_valid = streamFork_4__io_outputs_1_thrown_valid;
  assign streamFork_4__io_outputs_1_thrown_ready = streamFork_4__io_outputs_1_thrown_translated_ready;
  assign streamFork_4__io_outputs_1_thrown_translated_ready = streamFork_4__io_outputs_1_thrown_translated_fifo_io_push_ready;
  assign writeLogic_routeDataInput_valid = io_sharedInputs_0_w_valid;
  assign writeLogic_routeDataInput_ready = io_sharedInputs_0_w_ready;
  assign writeLogic_routeDataInput_payload_data = io_sharedInputs_0_w_payload_data;
  assign writeLogic_routeDataInput_payload_strb = io_sharedInputs_0_w_payload_strb;
  assign writeLogic_routeDataInput_payload_last = io_sharedInputs_0_w_payload_last;
  assign io_output_w_valid = (streamFork_4__io_outputs_1_thrown_translated_fifo_io_pop_valid && writeLogic_routeDataInput_valid);
  assign io_output_w_payload_data = writeLogic_routeDataInput_payload_data;
  assign io_output_w_payload_strb = writeLogic_routeDataInput_payload_strb;
  assign io_output_w_payload_last = writeLogic_routeDataInput_payload_last;
  assign io_sharedInputs_0_w_ready = ((streamFork_4__io_outputs_1_thrown_translated_fifo_io_pop_valid && io_output_w_ready) && 1'b1);
  assign _zz_3_ = ((io_output_w_valid && io_output_w_ready) && io_output_w_payload_last);
  assign writeLogic_writeRspSels_0 = 1'b1;
  assign io_sharedInputs_0_b_valid = (io_output_b_valid && writeLogic_writeRspSels_0);
  assign io_sharedInputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_sharedInputs_0_b_payload_id = io_output_b_payload_id[2:0];
  assign io_output_b_ready = io_sharedInputs_0_b_ready;
  assign readRspIndex = io_output_r_payload_id[3 : 3];
  assign readRspSels_0 = (readRspIndex == (1'b0));
  assign readRspSels_1 = (readRspIndex == (1'b1));
  assign io_readInputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_readInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_readInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_readInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_readInputs_0_r_payload_id = io_output_r_payload_id[2:0];
  assign io_sharedInputs_0_r_valid = (io_output_r_valid && readRspSels_1);
  assign io_sharedInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_sharedInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_sharedInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_sharedInputs_0_r_payload_id = io_output_r_payload_id[2:0];
  assign io_output_r_ready = _zz_5_;
  assign _zz_4_ = 1'b0;

endmodule

module Axi4SharedArbiter_2_ (
  input               io_sharedInputs_0_arw_valid,
  output              io_sharedInputs_0_arw_ready,
  input      [19:0]   io_sharedInputs_0_arw_payload_addr,
  input      [3:0]    io_sharedInputs_0_arw_payload_id,
  input      [7:0]    io_sharedInputs_0_arw_payload_len,
  input      [2:0]    io_sharedInputs_0_arw_payload_size,
  input      [1:0]    io_sharedInputs_0_arw_payload_burst,
  input               io_sharedInputs_0_arw_payload_write,
  input               io_sharedInputs_0_w_valid,
  output              io_sharedInputs_0_w_ready,
  input      [31:0]   io_sharedInputs_0_w_payload_data,
  input      [3:0]    io_sharedInputs_0_w_payload_strb,
  input               io_sharedInputs_0_w_payload_last,
  output              io_sharedInputs_0_b_valid,
  input               io_sharedInputs_0_b_ready,
  output     [3:0]    io_sharedInputs_0_b_payload_id,
  output     [1:0]    io_sharedInputs_0_b_payload_resp,
  output              io_sharedInputs_0_r_valid,
  input               io_sharedInputs_0_r_ready,
  output     [31:0]   io_sharedInputs_0_r_payload_data,
  output     [3:0]    io_sharedInputs_0_r_payload_id,
  output     [1:0]    io_sharedInputs_0_r_payload_resp,
  output              io_sharedInputs_0_r_payload_last,
  output              io_output_arw_valid,
  input               io_output_arw_ready,
  output     [19:0]   io_output_arw_payload_addr,
  output     [3:0]    io_output_arw_payload_id,
  output     [7:0]    io_output_arw_payload_len,
  output     [2:0]    io_output_arw_payload_size,
  output     [1:0]    io_output_arw_payload_burst,
  output              io_output_arw_payload_write,
  output              io_output_w_valid,
  input               io_output_w_ready,
  output     [31:0]   io_output_w_payload_data,
  output     [3:0]    io_output_w_payload_strb,
  output              io_output_w_payload_last,
  input               io_output_b_valid,
  output              io_output_b_ready,
  input      [3:0]    io_output_b_payload_id,
  input      [1:0]    io_output_b_payload_resp,
  input               io_output_r_valid,
  output              io_output_r_ready,
  input      [31:0]   io_output_r_payload_data,
  input      [3:0]    io_output_r_payload_id,
  input      [1:0]    io_output_r_payload_resp,
  input               io_output_r_payload_last,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  reg                 _zz_1_;
  wire                _zz_2_;
  wire                _zz_3_;
  wire                cmdArbiter_io_inputs_0_ready;
  wire                cmdArbiter_io_output_valid;
  wire       [19:0]   cmdArbiter_io_output_payload_addr;
  wire       [3:0]    cmdArbiter_io_output_payload_id;
  wire       [7:0]    cmdArbiter_io_output_payload_len;
  wire       [2:0]    cmdArbiter_io_output_payload_size;
  wire       [1:0]    cmdArbiter_io_output_payload_burst;
  wire                cmdArbiter_io_output_payload_write;
  wire       [0:0]    cmdArbiter_io_chosenOH;
  wire                streamFork_4__io_input_ready;
  wire                streamFork_4__io_outputs_0_valid;
  wire       [19:0]   streamFork_4__io_outputs_0_payload_addr;
  wire       [3:0]    streamFork_4__io_outputs_0_payload_id;
  wire       [7:0]    streamFork_4__io_outputs_0_payload_len;
  wire       [2:0]    streamFork_4__io_outputs_0_payload_size;
  wire       [1:0]    streamFork_4__io_outputs_0_payload_burst;
  wire                streamFork_4__io_outputs_0_payload_write;
  wire                streamFork_4__io_outputs_1_valid;
  wire       [19:0]   streamFork_4__io_outputs_1_payload_addr;
  wire       [3:0]    streamFork_4__io_outputs_1_payload_id;
  wire       [7:0]    streamFork_4__io_outputs_1_payload_len;
  wire       [2:0]    streamFork_4__io_outputs_1_payload_size;
  wire       [1:0]    streamFork_4__io_outputs_1_payload_burst;
  wire                streamFork_4__io_outputs_1_payload_write;
  wire                streamFork_4__io_outputs_1_thrown_translated_fifo_io_push_ready;
  wire                streamFork_4__io_outputs_1_thrown_translated_fifo_io_pop_valid;
  wire       [2:0]    streamFork_4__io_outputs_1_thrown_translated_fifo_io_occupancy;
  wire                _zz_4_;
  wire                inputsCmd_0_valid;
  wire                inputsCmd_0_ready;
  wire       [19:0]   inputsCmd_0_payload_addr;
  wire       [3:0]    inputsCmd_0_payload_id;
  wire       [7:0]    inputsCmd_0_payload_len;
  wire       [2:0]    inputsCmd_0_payload_size;
  wire       [1:0]    inputsCmd_0_payload_burst;
  wire                inputsCmd_0_payload_write;
  reg                 streamFork_4__io_outputs_1_thrown_valid;
  wire                streamFork_4__io_outputs_1_thrown_ready;
  wire       [19:0]   streamFork_4__io_outputs_1_thrown_payload_addr;
  wire       [3:0]    streamFork_4__io_outputs_1_thrown_payload_id;
  wire       [7:0]    streamFork_4__io_outputs_1_thrown_payload_len;
  wire       [2:0]    streamFork_4__io_outputs_1_thrown_payload_size;
  wire       [1:0]    streamFork_4__io_outputs_1_thrown_payload_burst;
  wire                streamFork_4__io_outputs_1_thrown_payload_write;
  wire                streamFork_4__io_outputs_1_thrown_translated_valid;
  wire                streamFork_4__io_outputs_1_thrown_translated_ready;
  wire                writeLogic_routeDataInput_valid;
  wire                writeLogic_routeDataInput_ready;
  wire       [31:0]   writeLogic_routeDataInput_payload_data;
  wire       [3:0]    writeLogic_routeDataInput_payload_strb;
  wire                writeLogic_routeDataInput_payload_last;
  wire                writeLogic_writeRspSels_0;
  wire                readRspSels_0;

  assign _zz_4_ = (! streamFork_4__io_outputs_1_payload_write);
  StreamArbiter_2_ cmdArbiter ( 
    .io_inputs_0_valid            (inputsCmd_0_valid                        ), //i
    .io_inputs_0_ready            (cmdArbiter_io_inputs_0_ready             ), //o
    .io_inputs_0_payload_addr     (inputsCmd_0_payload_addr[19:0]           ), //i
    .io_inputs_0_payload_id       (inputsCmd_0_payload_id[3:0]              ), //i
    .io_inputs_0_payload_len      (inputsCmd_0_payload_len[7:0]             ), //i
    .io_inputs_0_payload_size     (inputsCmd_0_payload_size[2:0]            ), //i
    .io_inputs_0_payload_burst    (inputsCmd_0_payload_burst[1:0]           ), //i
    .io_inputs_0_payload_write    (inputsCmd_0_payload_write                ), //i
    .io_output_valid              (cmdArbiter_io_output_valid               ), //o
    .io_output_ready              (streamFork_4__io_input_ready             ), //i
    .io_output_payload_addr       (cmdArbiter_io_output_payload_addr[19:0]  ), //o
    .io_output_payload_id         (cmdArbiter_io_output_payload_id[3:0]     ), //o
    .io_output_payload_len        (cmdArbiter_io_output_payload_len[7:0]    ), //o
    .io_output_payload_size       (cmdArbiter_io_output_payload_size[2:0]   ), //o
    .io_output_payload_burst      (cmdArbiter_io_output_payload_burst[1:0]  ), //o
    .io_output_payload_write      (cmdArbiter_io_output_payload_write       ), //o
    .io_chosenOH                  (cmdArbiter_io_chosenOH                   ), //o
    .io_mainClk                   (io_mainClk                               ), //i
    .resetCtrl_axiReset           (resetCtrl_axiReset                       )  //i
  );
  StreamFork_2_ streamFork_4_ ( 
    .io_input_valid                (cmdArbiter_io_output_valid                     ), //i
    .io_input_ready                (streamFork_4__io_input_ready                   ), //o
    .io_input_payload_addr         (cmdArbiter_io_output_payload_addr[19:0]        ), //i
    .io_input_payload_id           (cmdArbiter_io_output_payload_id[3:0]           ), //i
    .io_input_payload_len          (cmdArbiter_io_output_payload_len[7:0]          ), //i
    .io_input_payload_size         (cmdArbiter_io_output_payload_size[2:0]         ), //i
    .io_input_payload_burst        (cmdArbiter_io_output_payload_burst[1:0]        ), //i
    .io_input_payload_write        (cmdArbiter_io_output_payload_write             ), //i
    .io_outputs_0_valid            (streamFork_4__io_outputs_0_valid               ), //o
    .io_outputs_0_ready            (io_output_arw_ready                            ), //i
    .io_outputs_0_payload_addr     (streamFork_4__io_outputs_0_payload_addr[19:0]  ), //o
    .io_outputs_0_payload_id       (streamFork_4__io_outputs_0_payload_id[3:0]     ), //o
    .io_outputs_0_payload_len      (streamFork_4__io_outputs_0_payload_len[7:0]    ), //o
    .io_outputs_0_payload_size     (streamFork_4__io_outputs_0_payload_size[2:0]   ), //o
    .io_outputs_0_payload_burst    (streamFork_4__io_outputs_0_payload_burst[1:0]  ), //o
    .io_outputs_0_payload_write    (streamFork_4__io_outputs_0_payload_write       ), //o
    .io_outputs_1_valid            (streamFork_4__io_outputs_1_valid               ), //o
    .io_outputs_1_ready            (_zz_1_                                         ), //i
    .io_outputs_1_payload_addr     (streamFork_4__io_outputs_1_payload_addr[19:0]  ), //o
    .io_outputs_1_payload_id       (streamFork_4__io_outputs_1_payload_id[3:0]     ), //o
    .io_outputs_1_payload_len      (streamFork_4__io_outputs_1_payload_len[7:0]    ), //o
    .io_outputs_1_payload_size     (streamFork_4__io_outputs_1_payload_size[2:0]   ), //o
    .io_outputs_1_payload_burst    (streamFork_4__io_outputs_1_payload_burst[1:0]  ), //o
    .io_outputs_1_payload_write    (streamFork_4__io_outputs_1_payload_write       ), //o
    .io_mainClk                    (io_mainClk                                     ), //i
    .resetCtrl_axiReset            (resetCtrl_axiReset                             )  //i
  );
  StreamFifoLowLatency_2_ streamFork_4__io_outputs_1_thrown_translated_fifo ( 
    .io_push_valid         (streamFork_4__io_outputs_1_thrown_translated_valid                   ), //i
    .io_push_ready         (streamFork_4__io_outputs_1_thrown_translated_fifo_io_push_ready      ), //o
    .io_pop_valid          (streamFork_4__io_outputs_1_thrown_translated_fifo_io_pop_valid       ), //o
    .io_pop_ready          (_zz_2_                                                               ), //i
    .io_flush              (_zz_3_                                                               ), //i
    .io_occupancy          (streamFork_4__io_outputs_1_thrown_translated_fifo_io_occupancy[2:0]  ), //o
    .io_mainClk            (io_mainClk                                                           ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                                                   )  //i
  );
  assign inputsCmd_0_valid = io_sharedInputs_0_arw_valid;
  assign io_sharedInputs_0_arw_ready = inputsCmd_0_ready;
  assign inputsCmd_0_payload_addr = io_sharedInputs_0_arw_payload_addr;
  assign inputsCmd_0_payload_id = io_sharedInputs_0_arw_payload_id;
  assign inputsCmd_0_payload_len = io_sharedInputs_0_arw_payload_len;
  assign inputsCmd_0_payload_size = io_sharedInputs_0_arw_payload_size;
  assign inputsCmd_0_payload_burst = io_sharedInputs_0_arw_payload_burst;
  assign inputsCmd_0_payload_write = io_sharedInputs_0_arw_payload_write;
  assign inputsCmd_0_ready = cmdArbiter_io_inputs_0_ready;
  assign io_output_arw_valid = streamFork_4__io_outputs_0_valid;
  assign io_output_arw_payload_addr = streamFork_4__io_outputs_0_payload_addr;
  assign io_output_arw_payload_len = streamFork_4__io_outputs_0_payload_len;
  assign io_output_arw_payload_size = streamFork_4__io_outputs_0_payload_size;
  assign io_output_arw_payload_burst = streamFork_4__io_outputs_0_payload_burst;
  assign io_output_arw_payload_write = streamFork_4__io_outputs_0_payload_write;
  assign io_output_arw_payload_id = (streamFork_4__io_outputs_0_payload_write ? streamFork_4__io_outputs_0_payload_id : streamFork_4__io_outputs_0_payload_id);
  always @ (*) begin
    streamFork_4__io_outputs_1_thrown_valid = streamFork_4__io_outputs_1_valid;
    if(_zz_4_)begin
      streamFork_4__io_outputs_1_thrown_valid = 1'b0;
    end
  end

  always @ (*) begin
    _zz_1_ = streamFork_4__io_outputs_1_thrown_ready;
    if(_zz_4_)begin
      _zz_1_ = 1'b1;
    end
  end

  assign streamFork_4__io_outputs_1_thrown_payload_addr = streamFork_4__io_outputs_1_payload_addr;
  assign streamFork_4__io_outputs_1_thrown_payload_id = streamFork_4__io_outputs_1_payload_id;
  assign streamFork_4__io_outputs_1_thrown_payload_len = streamFork_4__io_outputs_1_payload_len;
  assign streamFork_4__io_outputs_1_thrown_payload_size = streamFork_4__io_outputs_1_payload_size;
  assign streamFork_4__io_outputs_1_thrown_payload_burst = streamFork_4__io_outputs_1_payload_burst;
  assign streamFork_4__io_outputs_1_thrown_payload_write = streamFork_4__io_outputs_1_payload_write;
  assign streamFork_4__io_outputs_1_thrown_translated_valid = streamFork_4__io_outputs_1_thrown_valid;
  assign streamFork_4__io_outputs_1_thrown_ready = streamFork_4__io_outputs_1_thrown_translated_ready;
  assign streamFork_4__io_outputs_1_thrown_translated_ready = streamFork_4__io_outputs_1_thrown_translated_fifo_io_push_ready;
  assign writeLogic_routeDataInput_valid = io_sharedInputs_0_w_valid;
  assign writeLogic_routeDataInput_ready = io_sharedInputs_0_w_ready;
  assign writeLogic_routeDataInput_payload_data = io_sharedInputs_0_w_payload_data;
  assign writeLogic_routeDataInput_payload_strb = io_sharedInputs_0_w_payload_strb;
  assign writeLogic_routeDataInput_payload_last = io_sharedInputs_0_w_payload_last;
  assign io_output_w_valid = (streamFork_4__io_outputs_1_thrown_translated_fifo_io_pop_valid && writeLogic_routeDataInput_valid);
  assign io_output_w_payload_data = writeLogic_routeDataInput_payload_data;
  assign io_output_w_payload_strb = writeLogic_routeDataInput_payload_strb;
  assign io_output_w_payload_last = writeLogic_routeDataInput_payload_last;
  assign io_sharedInputs_0_w_ready = ((streamFork_4__io_outputs_1_thrown_translated_fifo_io_pop_valid && io_output_w_ready) && 1'b1);
  assign _zz_2_ = ((io_output_w_valid && io_output_w_ready) && io_output_w_payload_last);
  assign writeLogic_writeRspSels_0 = 1'b1;
  assign io_sharedInputs_0_b_valid = (io_output_b_valid && writeLogic_writeRspSels_0);
  assign io_sharedInputs_0_b_payload_resp = io_output_b_payload_resp;
  assign io_sharedInputs_0_b_payload_id = io_output_b_payload_id;
  assign io_output_b_ready = io_sharedInputs_0_b_ready;
  assign readRspSels_0 = 1'b1;
  assign io_sharedInputs_0_r_valid = (io_output_r_valid && readRspSels_0);
  assign io_sharedInputs_0_r_payload_data = io_output_r_payload_data;
  assign io_sharedInputs_0_r_payload_resp = io_output_r_payload_resp;
  assign io_sharedInputs_0_r_payload_last = io_output_r_payload_last;
  assign io_sharedInputs_0_r_payload_id = io_output_r_payload_id;
  assign io_output_r_ready = io_sharedInputs_0_r_ready;
  assign _zz_3_ = 1'b0;

endmodule

module Apb3Decoder (
  input      [19:0]   io_input_PADDR,
  input      [0:0]    io_input_PSEL,
  input               io_input_PENABLE,
  output reg          io_input_PREADY,
  input               io_input_PWRITE,
  input      [31:0]   io_input_PWDATA,
  output     [31:0]   io_input_PRDATA,
  output reg          io_input_PSLVERROR,
  output     [19:0]   io_output_PADDR,
  output reg [2:0]    io_output_PSEL,
  output              io_output_PENABLE,
  input               io_output_PREADY,
  output              io_output_PWRITE,
  output     [31:0]   io_output_PWDATA,
  input      [31:0]   io_output_PRDATA,
  input               io_output_PSLVERROR 
);
  wire                _zz_1_;

  assign _zz_1_ = (io_input_PSEL[0] && (io_output_PSEL == (3'b000)));
  assign io_output_PADDR = io_input_PADDR;
  assign io_output_PENABLE = io_input_PENABLE;
  assign io_output_PWRITE = io_input_PWRITE;
  assign io_output_PWDATA = io_input_PWDATA;
  always @ (*) begin
    io_output_PSEL[0] = (((io_input_PADDR & (~ 20'h0ffff)) == 20'h0) && io_input_PSEL[0]);
    io_output_PSEL[1] = (((io_input_PADDR & (~ 20'h00fff)) == 20'h10000) && io_input_PSEL[0]);
    io_output_PSEL[2] = (((io_input_PADDR & (~ 20'h00fff)) == 20'h20000) && io_input_PSEL[0]);
  end

  always @ (*) begin
    io_input_PREADY = io_output_PREADY;
    if(_zz_1_)begin
      io_input_PREADY = 1'b1;
    end
  end

  assign io_input_PRDATA = io_output_PRDATA;
  always @ (*) begin
    io_input_PSLVERROR = io_output_PSLVERROR;
    if(_zz_1_)begin
      io_input_PSLVERROR = 1'b1;
    end
  end


endmodule

module Apb3Router (
  input      [19:0]   io_input_PADDR,
  input      [2:0]    io_input_PSEL,
  input               io_input_PENABLE,
  output              io_input_PREADY,
  input               io_input_PWRITE,
  input      [31:0]   io_input_PWDATA,
  output     [31:0]   io_input_PRDATA,
  output              io_input_PSLVERROR,
  output     [19:0]   io_outputs_0_PADDR,
  output     [0:0]    io_outputs_0_PSEL,
  output              io_outputs_0_PENABLE,
  input               io_outputs_0_PREADY,
  output              io_outputs_0_PWRITE,
  output     [31:0]   io_outputs_0_PWDATA,
  input      [31:0]   io_outputs_0_PRDATA,
  input               io_outputs_0_PSLVERROR,
  output     [19:0]   io_outputs_1_PADDR,
  output     [0:0]    io_outputs_1_PSEL,
  output              io_outputs_1_PENABLE,
  input               io_outputs_1_PREADY,
  output              io_outputs_1_PWRITE,
  output     [31:0]   io_outputs_1_PWDATA,
  input      [31:0]   io_outputs_1_PRDATA,
  input               io_outputs_1_PSLVERROR,
  output     [19:0]   io_outputs_2_PADDR,
  output     [0:0]    io_outputs_2_PSEL,
  output              io_outputs_2_PENABLE,
  input               io_outputs_2_PREADY,
  output              io_outputs_2_PWRITE,
  output     [31:0]   io_outputs_2_PWDATA,
  input      [31:0]   io_outputs_2_PRDATA,
  input               io_outputs_2_PSLVERROR,
  input               io_mainClk,
  input               resetCtrl_axiReset 
);
  reg                 _zz_3_;
  reg        [31:0]   _zz_4_;
  reg                 _zz_5_;
  wire                _zz_1_;
  wire                _zz_2_;
  reg        [1:0]    selIndex;

  always @(*) begin
    case(selIndex)
      2'b00 : begin
        _zz_3_ = io_outputs_0_PREADY;
        _zz_4_ = io_outputs_0_PRDATA;
        _zz_5_ = io_outputs_0_PSLVERROR;
      end
      2'b01 : begin
        _zz_3_ = io_outputs_1_PREADY;
        _zz_4_ = io_outputs_1_PRDATA;
        _zz_5_ = io_outputs_1_PSLVERROR;
      end
      default : begin
        _zz_3_ = io_outputs_2_PREADY;
        _zz_4_ = io_outputs_2_PRDATA;
        _zz_5_ = io_outputs_2_PSLVERROR;
      end
    endcase
  end

  assign io_outputs_0_PADDR = io_input_PADDR;
  assign io_outputs_0_PENABLE = io_input_PENABLE;
  assign io_outputs_0_PSEL[0] = io_input_PSEL[0];
  assign io_outputs_0_PWRITE = io_input_PWRITE;
  assign io_outputs_0_PWDATA = io_input_PWDATA;
  assign io_outputs_1_PADDR = io_input_PADDR;
  assign io_outputs_1_PENABLE = io_input_PENABLE;
  assign io_outputs_1_PSEL[0] = io_input_PSEL[1];
  assign io_outputs_1_PWRITE = io_input_PWRITE;
  assign io_outputs_1_PWDATA = io_input_PWDATA;
  assign io_outputs_2_PADDR = io_input_PADDR;
  assign io_outputs_2_PENABLE = io_input_PENABLE;
  assign io_outputs_2_PSEL[0] = io_input_PSEL[2];
  assign io_outputs_2_PWRITE = io_input_PWRITE;
  assign io_outputs_2_PWDATA = io_input_PWDATA;
  assign _zz_1_ = io_input_PSEL[1];
  assign _zz_2_ = io_input_PSEL[2];
  assign io_input_PREADY = _zz_3_;
  assign io_input_PRDATA = _zz_4_;
  assign io_input_PSLVERROR = _zz_5_;
  always @ (posedge io_mainClk) begin
    selIndex <= {_zz_2_,_zz_1_};
  end


endmodule

module VexRISCVSoftcore (
  output     [12:0]   io_sdram_ADDR,
  output     [1:0]    io_sdram_BA,
  input      [15:0]   io_sdram_DQ_read,
  output     [15:0]   io_sdram_DQ_write,
  output     [15:0]   io_sdram_DQ_writeEnable,
  output     [1:0]    io_sdram_DQM,
  output              io_sdram_CASn,
  output              io_sdram_CKE,
  output              io_sdram_CSn,
  output              io_sdram_RASn,
  output              io_sdram_WEn,
  input               io_externalInterrupt,
  input               io_jtag_tms,
  input               io_jtag_tdi,
  output              io_jtag_tdo,
  input               io_jtag_tck,
  output              io_uart_txd,
  input               io_uart_rxd,
  input               io_asyncReset,
  input               io_mainClk,
  output     [15:0]   io_apbBus_PADDR,
  output     [0:0]    io_apbBus_PSEL,
  output              io_apbBus_PENABLE,
  input               io_apbBus_PREADY,
  output              io_apbBus_PWRITE,
  output     [31:0]   io_apbBus_PWDATA,
  input      [31:0]   io_apbBus_PRDATA,
  input               io_apbBus_PSLVERROR 
);
  wire       [7:0]    _zz_34_;
  wire                _zz_35_;
  wire                _zz_36_;
  wire       [4:0]    _zz_37_;
  wire                _zz_38_;
  wire                _zz_39_;
  wire       [7:0]    _zz_40_;
  wire                _zz_41_;
  wire                _zz_42_;
  wire                _zz_43_;
  reg                 _zz_44_;
  wire       [31:0]   _zz_45_;
  wire       [3:0]    _zz_46_;
  wire       [2:0]    _zz_47_;
  wire                _zz_48_;
  wire                _zz_49_;
  wire                _zz_50_;
  wire       [2:0]    _zz_51_;
  wire       [3:0]    _zz_52_;
  wire       [2:0]    _zz_53_;
  wire       [3:0]    _zz_54_;
  wire                _zz_55_;
  wire                _zz_56_;
  wire                _zz_57_;
  wire                _zz_58_;
  wire                _zz_59_;
  wire                _zz_60_;
  wire       [17:0]   _zz_61_;
  wire       [2:0]    _zz_62_;
  wire       [1:0]    _zz_63_;
  wire       [17:0]   _zz_64_;
  wire       [1:0]    _zz_65_;
  wire                _zz_66_;
  wire       [25:0]   _zz_67_;
  wire       [2:0]    _zz_68_;
  wire       [1:0]    _zz_69_;
  wire       [25:0]   _zz_70_;
  wire       [1:0]    _zz_71_;
  wire                _zz_72_;
  wire       [19:0]   _zz_73_;
  wire       [1:0]    _zz_74_;
  wire                _zz_75_;
  wire                io_asyncReset_buffercc_io_dataOut;
  wire                axi_ram_io_axi_arw_ready;
  wire                axi_ram_io_axi_w_ready;
  wire                axi_ram_io_axi_b_valid;
  wire       [3:0]    axi_ram_io_axi_b_payload_id;
  wire       [1:0]    axi_ram_io_axi_b_payload_resp;
  wire                axi_ram_io_axi_r_valid;
  wire       [31:0]   axi_ram_io_axi_r_payload_data;
  wire       [3:0]    axi_ram_io_axi_r_payload_id;
  wire       [1:0]    axi_ram_io_axi_r_payload_resp;
  wire                axi_ram_io_axi_r_payload_last;
  wire                axi_sdramCtrl_io_axi_arw_ready;
  wire                axi_sdramCtrl_io_axi_w_ready;
  wire                axi_sdramCtrl_io_axi_b_valid;
  wire       [3:0]    axi_sdramCtrl_io_axi_b_payload_id;
  wire       [1:0]    axi_sdramCtrl_io_axi_b_payload_resp;
  wire                axi_sdramCtrl_io_axi_r_valid;
  wire       [31:0]   axi_sdramCtrl_io_axi_r_payload_data;
  wire       [3:0]    axi_sdramCtrl_io_axi_r_payload_id;
  wire       [1:0]    axi_sdramCtrl_io_axi_r_payload_resp;
  wire                axi_sdramCtrl_io_axi_r_payload_last;
  wire       [12:0]   axi_sdramCtrl_io_sdram_ADDR;
  wire       [1:0]    axi_sdramCtrl_io_sdram_BA;
  wire                axi_sdramCtrl_io_sdram_CASn;
  wire                axi_sdramCtrl_io_sdram_CKE;
  wire                axi_sdramCtrl_io_sdram_CSn;
  wire       [1:0]    axi_sdramCtrl_io_sdram_DQM;
  wire                axi_sdramCtrl_io_sdram_RASn;
  wire                axi_sdramCtrl_io_sdram_WEn;
  wire       [15:0]   axi_sdramCtrl_io_sdram_DQ_write;
  wire       [15:0]   axi_sdramCtrl_io_sdram_DQ_writeEnable;
  wire                axi_apbBridge_io_axi_arw_ready;
  wire                axi_apbBridge_io_axi_w_ready;
  wire                axi_apbBridge_io_axi_b_valid;
  wire       [3:0]    axi_apbBridge_io_axi_b_payload_id;
  wire       [1:0]    axi_apbBridge_io_axi_b_payload_resp;
  wire                axi_apbBridge_io_axi_r_valid;
  wire       [31:0]   axi_apbBridge_io_axi_r_payload_data;
  wire       [3:0]    axi_apbBridge_io_axi_r_payload_id;
  wire       [1:0]    axi_apbBridge_io_axi_r_payload_resp;
  wire                axi_apbBridge_io_axi_r_payload_last;
  wire       [19:0]   axi_apbBridge_io_apb_PADDR;
  wire       [0:0]    axi_apbBridge_io_apb_PSEL;
  wire                axi_apbBridge_io_apb_PENABLE;
  wire                axi_apbBridge_io_apb_PWRITE;
  wire       [31:0]   axi_apbBridge_io_apb_PWDATA;
  wire                axi_timerCtrl_io_apb_PREADY;
  wire       [31:0]   axi_timerCtrl_io_apb_PRDATA;
  wire                axi_timerCtrl_io_apb_PSLVERROR;
  wire                axi_timerCtrl_io_interrupt;
  wire                axi_uartCtrl_io_apb_PREADY;
  wire       [31:0]   axi_uartCtrl_io_apb_PRDATA;
  wire                axi_uartCtrl_io_uart_txd;
  wire                axi_uartCtrl_io_interrupt;
  wire                axi_cpu_iBus_cmd_valid;
  wire       [31:0]   axi_cpu_iBus_cmd_payload_pc;
  wire                axi_cpu_debug_bus_cmd_ready;
  wire       [31:0]   axi_cpu_debug_bus_rsp_data;
  wire                axi_cpu_debug_resetOut;
  wire                axi_cpu_dBus_cmd_valid;
  wire                axi_cpu_dBus_cmd_payload_wr;
  wire       [31:0]   axi_cpu_dBus_cmd_payload_address;
  wire       [31:0]   axi_cpu_dBus_cmd_payload_data;
  wire       [1:0]    axi_cpu_dBus_cmd_payload_size;
  wire                streamFork_4__io_input_ready;
  wire                streamFork_4__io_outputs_0_valid;
  wire                streamFork_4__io_outputs_0_payload_wr;
  wire       [31:0]   streamFork_4__io_outputs_0_payload_address;
  wire       [31:0]   streamFork_4__io_outputs_0_payload_data;
  wire       [1:0]    streamFork_4__io_outputs_0_payload_size;
  wire                streamFork_4__io_outputs_1_valid;
  wire                streamFork_4__io_outputs_1_payload_wr;
  wire       [31:0]   streamFork_4__io_outputs_1_payload_address;
  wire       [31:0]   streamFork_4__io_outputs_1_payload_data;
  wire       [1:0]    streamFork_4__io_outputs_1_payload_size;
  wire                axi_externalInterrupt_buffercc_io_dataOut;
  wire                jtagBridge_1__io_jtag_tdo;
  wire                jtagBridge_1__io_remote_cmd_valid;
  wire                jtagBridge_1__io_remote_cmd_payload_last;
  wire       [0:0]    jtagBridge_1__io_remote_cmd_payload_fragment;
  wire                jtagBridge_1__io_remote_rsp_ready;
  wire                systemDebugger_1__io_remote_cmd_ready;
  wire                systemDebugger_1__io_remote_rsp_valid;
  wire                systemDebugger_1__io_remote_rsp_payload_error;
  wire       [31:0]   systemDebugger_1__io_remote_rsp_payload_data;
  wire                systemDebugger_1__io_mem_cmd_valid;
  wire       [31:0]   systemDebugger_1__io_mem_cmd_payload_address;
  wire       [31:0]   systemDebugger_1__io_mem_cmd_payload_data;
  wire                systemDebugger_1__io_mem_cmd_payload_wr;
  wire       [1:0]    systemDebugger_1__io_mem_cmd_payload_size;
  wire                axi4ReadOnlyDecoder_1__io_input_ar_ready;
  wire                axi4ReadOnlyDecoder_1__io_input_r_valid;
  wire       [31:0]   axi4ReadOnlyDecoder_1__io_input_r_payload_data;
  wire       [1:0]    axi4ReadOnlyDecoder_1__io_input_r_payload_resp;
  wire                axi4ReadOnlyDecoder_1__io_input_r_payload_last;
  wire                axi4ReadOnlyDecoder_1__io_outputs_0_ar_valid;
  wire       [31:0]   axi4ReadOnlyDecoder_1__io_outputs_0_ar_payload_addr;
  wire       [3:0]    axi4ReadOnlyDecoder_1__io_outputs_0_ar_payload_cache;
  wire       [2:0]    axi4ReadOnlyDecoder_1__io_outputs_0_ar_payload_prot;
  wire                axi4ReadOnlyDecoder_1__io_outputs_0_r_ready;
  wire                axi4ReadOnlyDecoder_1__io_outputs_1_ar_valid;
  wire       [31:0]   axi4ReadOnlyDecoder_1__io_outputs_1_ar_payload_addr;
  wire       [3:0]    axi4ReadOnlyDecoder_1__io_outputs_1_ar_payload_cache;
  wire       [2:0]    axi4ReadOnlyDecoder_1__io_outputs_1_ar_payload_prot;
  wire                axi4ReadOnlyDecoder_1__io_outputs_1_r_ready;
  wire                axi4SharedDecoder_1__io_input_arw_ready;
  wire                axi4SharedDecoder_1__io_input_w_ready;
  wire                axi4SharedDecoder_1__io_input_b_valid;
  wire       [1:0]    axi4SharedDecoder_1__io_input_b_payload_resp;
  wire                axi4SharedDecoder_1__io_input_r_valid;
  wire       [31:0]   axi4SharedDecoder_1__io_input_r_payload_data;
  wire       [1:0]    axi4SharedDecoder_1__io_input_r_payload_resp;
  wire                axi4SharedDecoder_1__io_input_r_payload_last;
  wire                axi4SharedDecoder_1__io_sharedOutputs_0_arw_valid;
  wire       [31:0]   axi4SharedDecoder_1__io_sharedOutputs_0_arw_payload_addr;
  wire       [2:0]    axi4SharedDecoder_1__io_sharedOutputs_0_arw_payload_size;
  wire       [3:0]    axi4SharedDecoder_1__io_sharedOutputs_0_arw_payload_cache;
  wire       [2:0]    axi4SharedDecoder_1__io_sharedOutputs_0_arw_payload_prot;
  wire                axi4SharedDecoder_1__io_sharedOutputs_0_arw_payload_write;
  wire                axi4SharedDecoder_1__io_sharedOutputs_0_w_valid;
  wire       [31:0]   axi4SharedDecoder_1__io_sharedOutputs_0_w_payload_data;
  wire       [3:0]    axi4SharedDecoder_1__io_sharedOutputs_0_w_payload_strb;
  wire                axi4SharedDecoder_1__io_sharedOutputs_0_w_payload_last;
  wire                axi4SharedDecoder_1__io_sharedOutputs_0_b_ready;
  wire                axi4SharedDecoder_1__io_sharedOutputs_0_r_ready;
  wire                axi4SharedDecoder_1__io_sharedOutputs_1_arw_valid;
  wire       [31:0]   axi4SharedDecoder_1__io_sharedOutputs_1_arw_payload_addr;
  wire       [2:0]    axi4SharedDecoder_1__io_sharedOutputs_1_arw_payload_size;
  wire       [3:0]    axi4SharedDecoder_1__io_sharedOutputs_1_arw_payload_cache;
  wire       [2:0]    axi4SharedDecoder_1__io_sharedOutputs_1_arw_payload_prot;
  wire                axi4SharedDecoder_1__io_sharedOutputs_1_arw_payload_write;
  wire                axi4SharedDecoder_1__io_sharedOutputs_1_w_valid;
  wire       [31:0]   axi4SharedDecoder_1__io_sharedOutputs_1_w_payload_data;
  wire       [3:0]    axi4SharedDecoder_1__io_sharedOutputs_1_w_payload_strb;
  wire                axi4SharedDecoder_1__io_sharedOutputs_1_w_payload_last;
  wire                axi4SharedDecoder_1__io_sharedOutputs_1_b_ready;
  wire                axi4SharedDecoder_1__io_sharedOutputs_1_r_ready;
  wire                axi4SharedDecoder_1__io_sharedOutputs_2_arw_valid;
  wire       [31:0]   axi4SharedDecoder_1__io_sharedOutputs_2_arw_payload_addr;
  wire       [2:0]    axi4SharedDecoder_1__io_sharedOutputs_2_arw_payload_size;
  wire       [3:0]    axi4SharedDecoder_1__io_sharedOutputs_2_arw_payload_cache;
  wire       [2:0]    axi4SharedDecoder_1__io_sharedOutputs_2_arw_payload_prot;
  wire                axi4SharedDecoder_1__io_sharedOutputs_2_arw_payload_write;
  wire                axi4SharedDecoder_1__io_sharedOutputs_2_w_valid;
  wire       [31:0]   axi4SharedDecoder_1__io_sharedOutputs_2_w_payload_data;
  wire       [3:0]    axi4SharedDecoder_1__io_sharedOutputs_2_w_payload_strb;
  wire                axi4SharedDecoder_1__io_sharedOutputs_2_w_payload_last;
  wire                axi4SharedDecoder_1__io_sharedOutputs_2_b_ready;
  wire                axi4SharedDecoder_1__io_sharedOutputs_2_r_ready;
  wire                axi_ram_io_axi_arbiter_io_readInputs_0_ar_ready;
  wire                axi_ram_io_axi_arbiter_io_readInputs_0_r_valid;
  wire       [31:0]   axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_data;
  wire       [2:0]    axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_id;
  wire       [1:0]    axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_resp;
  wire                axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_last;
  wire                axi_ram_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  wire                axi_ram_io_axi_arbiter_io_sharedInputs_0_w_ready;
  wire                axi_ram_io_axi_arbiter_io_sharedInputs_0_b_valid;
  wire       [2:0]    axi_ram_io_axi_arbiter_io_sharedInputs_0_b_payload_id;
  wire       [1:0]    axi_ram_io_axi_arbiter_io_sharedInputs_0_b_payload_resp;
  wire                axi_ram_io_axi_arbiter_io_sharedInputs_0_r_valid;
  wire       [31:0]   axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_data;
  wire       [2:0]    axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_id;
  wire       [1:0]    axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_resp;
  wire                axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_last;
  wire                axi_ram_io_axi_arbiter_io_output_arw_valid;
  wire       [17:0]   axi_ram_io_axi_arbiter_io_output_arw_payload_addr;
  wire       [3:0]    axi_ram_io_axi_arbiter_io_output_arw_payload_id;
  wire       [7:0]    axi_ram_io_axi_arbiter_io_output_arw_payload_len;
  wire       [2:0]    axi_ram_io_axi_arbiter_io_output_arw_payload_size;
  wire       [1:0]    axi_ram_io_axi_arbiter_io_output_arw_payload_burst;
  wire                axi_ram_io_axi_arbiter_io_output_arw_payload_write;
  wire                axi_ram_io_axi_arbiter_io_output_w_valid;
  wire       [31:0]   axi_ram_io_axi_arbiter_io_output_w_payload_data;
  wire       [3:0]    axi_ram_io_axi_arbiter_io_output_w_payload_strb;
  wire                axi_ram_io_axi_arbiter_io_output_w_payload_last;
  wire                axi_ram_io_axi_arbiter_io_output_b_ready;
  wire                axi_ram_io_axi_arbiter_io_output_r_ready;
  wire                axi_sdramCtrl_io_axi_arbiter_io_readInputs_0_ar_ready;
  wire                axi_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_valid;
  wire       [31:0]   axi_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_payload_data;
  wire       [2:0]    axi_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_payload_id;
  wire       [1:0]    axi_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_payload_resp;
  wire                axi_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_payload_last;
  wire                axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  wire                axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_w_ready;
  wire                axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_b_valid;
  wire       [2:0]    axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_b_payload_id;
  wire       [1:0]    axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_b_payload_resp;
  wire                axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_valid;
  wire       [31:0]   axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_payload_data;
  wire       [2:0]    axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_payload_id;
  wire       [1:0]    axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_payload_resp;
  wire                axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_payload_last;
  wire                axi_sdramCtrl_io_axi_arbiter_io_output_arw_valid;
  wire       [25:0]   axi_sdramCtrl_io_axi_arbiter_io_output_arw_payload_addr;
  wire       [3:0]    axi_sdramCtrl_io_axi_arbiter_io_output_arw_payload_id;
  wire       [7:0]    axi_sdramCtrl_io_axi_arbiter_io_output_arw_payload_len;
  wire       [2:0]    axi_sdramCtrl_io_axi_arbiter_io_output_arw_payload_size;
  wire       [1:0]    axi_sdramCtrl_io_axi_arbiter_io_output_arw_payload_burst;
  wire                axi_sdramCtrl_io_axi_arbiter_io_output_arw_payload_write;
  wire                axi_sdramCtrl_io_axi_arbiter_io_output_w_valid;
  wire       [31:0]   axi_sdramCtrl_io_axi_arbiter_io_output_w_payload_data;
  wire       [3:0]    axi_sdramCtrl_io_axi_arbiter_io_output_w_payload_strb;
  wire                axi_sdramCtrl_io_axi_arbiter_io_output_w_payload_last;
  wire                axi_sdramCtrl_io_axi_arbiter_io_output_b_ready;
  wire                axi_sdramCtrl_io_axi_arbiter_io_output_r_ready;
  wire                axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  wire                axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_w_ready;
  wire                axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_valid;
  wire       [3:0]    axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_id;
  wire       [1:0]    axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_resp;
  wire                axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_valid;
  wire       [31:0]   axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_data;
  wire       [3:0]    axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_id;
  wire       [1:0]    axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_resp;
  wire                axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_last;
  wire                axi_apbBridge_io_axi_arbiter_io_output_arw_valid;
  wire       [19:0]   axi_apbBridge_io_axi_arbiter_io_output_arw_payload_addr;
  wire       [3:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_payload_id;
  wire       [7:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_payload_len;
  wire       [2:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_payload_size;
  wire       [1:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_payload_burst;
  wire                axi_apbBridge_io_axi_arbiter_io_output_arw_payload_write;
  wire                axi_apbBridge_io_axi_arbiter_io_output_w_valid;
  wire       [31:0]   axi_apbBridge_io_axi_arbiter_io_output_w_payload_data;
  wire       [3:0]    axi_apbBridge_io_axi_arbiter_io_output_w_payload_strb;
  wire                axi_apbBridge_io_axi_arbiter_io_output_w_payload_last;
  wire                axi_apbBridge_io_axi_arbiter_io_output_b_ready;
  wire                axi_apbBridge_io_axi_arbiter_io_output_r_ready;
  wire                io_apb_decoder_io_input_PREADY;
  wire       [31:0]   io_apb_decoder_io_input_PRDATA;
  wire                io_apb_decoder_io_input_PSLVERROR;
  wire       [19:0]   io_apb_decoder_io_output_PADDR;
  wire       [2:0]    io_apb_decoder_io_output_PSEL;
  wire                io_apb_decoder_io_output_PENABLE;
  wire                io_apb_decoder_io_output_PWRITE;
  wire       [31:0]   io_apb_decoder_io_output_PWDATA;
  wire                apb3Router_1__io_input_PREADY;
  wire       [31:0]   apb3Router_1__io_input_PRDATA;
  wire                apb3Router_1__io_input_PSLVERROR;
  wire       [19:0]   apb3Router_1__io_outputs_0_PADDR;
  wire       [0:0]    apb3Router_1__io_outputs_0_PSEL;
  wire                apb3Router_1__io_outputs_0_PENABLE;
  wire                apb3Router_1__io_outputs_0_PWRITE;
  wire       [31:0]   apb3Router_1__io_outputs_0_PWDATA;
  wire       [19:0]   apb3Router_1__io_outputs_1_PADDR;
  wire       [0:0]    apb3Router_1__io_outputs_1_PSEL;
  wire                apb3Router_1__io_outputs_1_PENABLE;
  wire                apb3Router_1__io_outputs_1_PWRITE;
  wire       [31:0]   apb3Router_1__io_outputs_1_PWDATA;
  wire       [19:0]   apb3Router_1__io_outputs_2_PADDR;
  wire       [0:0]    apb3Router_1__io_outputs_2_PSEL;
  wire                apb3Router_1__io_outputs_2_PENABLE;
  wire                apb3Router_1__io_outputs_2_PWRITE;
  wire       [31:0]   apb3Router_1__io_outputs_2_PWDATA;
  wire                _zz_76_;
  wire                _zz_77_;
  wire                _zz_78_;
  wire                _zz_79_;
  wire                _zz_80_;
  wire                _zz_81_;
  wire                _zz_82_;
  wire                _zz_83_;
  reg                 resetCtrl_systemResetUnbuffered;
  reg        [5:0]    resetCtrl_systemResetCounter = 6'h0;
  wire       [5:0]    _zz_1_;
  reg                 resetCtrl_systemReset;
  reg                 resetCtrl_axiReset;
  reg                 axi_externalInterrupt;
  reg                 _zz_2_;
  reg                 _zz_3_;
  reg        [2:0]    _zz_4_;
  reg        [2:0]    _zz_5_;
  wire                _zz_6_;
  reg                 streamFork_4__io_outputs_1_thrown_valid;
  wire                streamFork_4__io_outputs_1_thrown_ready;
  wire                streamFork_4__io_outputs_1_thrown_payload_wr;
  wire       [31:0]   streamFork_4__io_outputs_1_thrown_payload_address;
  wire       [31:0]   streamFork_4__io_outputs_1_thrown_payload_data;
  wire       [1:0]    streamFork_4__io_outputs_1_thrown_payload_size;
  reg        [3:0]    _zz_7_;
  reg                 axi_cpu_debug_resetOut_regNext;
  reg                 _zz_8_;
  wire                _zz_9_;
  wire                _zz_10_;
  reg                 _zz_11_;
  wire                _zz_12_;
  wire                _zz_13_;
  reg                 _zz_14_;
  wire                _zz_15_;
  wire                _zz_16_;
  reg                 _zz_17_;
  wire                _zz_18_;
  wire                _zz_19_;
  reg                 _zz_20_;
  wire                _zz_21_;
  wire                _zz_22_;
  reg                 _zz_23_;
  wire                axi4SharedDecoder_1__io_input_r_m2sPipe_valid;
  wire                axi4SharedDecoder_1__io_input_r_m2sPipe_ready;
  wire       [31:0]   axi4SharedDecoder_1__io_input_r_m2sPipe_payload_data;
  wire       [1:0]    axi4SharedDecoder_1__io_input_r_m2sPipe_payload_resp;
  wire                axi4SharedDecoder_1__io_input_r_m2sPipe_payload_last;
  reg                 axi4SharedDecoder_1__io_input_r_m2sPipe_rValid;
  reg        [31:0]   axi4SharedDecoder_1__io_input_r_m2sPipe_rData_data;
  reg        [1:0]    axi4SharedDecoder_1__io_input_r_m2sPipe_rData_resp;
  reg                 axi4SharedDecoder_1__io_input_r_m2sPipe_rData_last;
  wire       [2:0]    _zz_24_;
  wire       [7:0]    _zz_25_;
  wire       [2:0]    _zz_26_;
  wire       [7:0]    _zz_27_;
  wire                axi_ram_io_axi_arbiter_io_output_arw_halfPipe_valid;
  wire                axi_ram_io_axi_arbiter_io_output_arw_halfPipe_ready;
  wire       [17:0]   axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_addr;
  wire       [3:0]    axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_id;
  wire       [7:0]    axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_len;
  wire       [2:0]    axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_size;
  wire       [1:0]    axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_burst;
  wire                axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_write;
  reg                 axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_valid;
  reg                 axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_ready;
  reg        [17:0]   axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_addr;
  reg        [3:0]    axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_id;
  reg        [7:0]    axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_len;
  reg        [2:0]    axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_size;
  reg        [1:0]    axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_burst;
  reg                 axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_write;
  wire                axi_ram_io_axi_arbiter_io_output_w_s2mPipe_valid;
  wire                axi_ram_io_axi_arbiter_io_output_w_s2mPipe_ready;
  wire       [31:0]   axi_ram_io_axi_arbiter_io_output_w_s2mPipe_payload_data;
  wire       [3:0]    axi_ram_io_axi_arbiter_io_output_w_s2mPipe_payload_strb;
  wire                axi_ram_io_axi_arbiter_io_output_w_s2mPipe_payload_last;
  reg                 axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rValid;
  reg        [31:0]   axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rData_data;
  reg        [3:0]    axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rData_strb;
  reg                 axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rData_last;
  wire                axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_valid;
  wire                axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_ready;
  wire       [31:0]   axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_data;
  wire       [3:0]    axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_strb;
  wire                axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_last;
  reg                 axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rValid;
  reg        [31:0]   axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rData_data;
  reg        [3:0]    axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rData_strb;
  reg                 axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rData_last;
  wire       [2:0]    _zz_28_;
  wire       [7:0]    _zz_29_;
  wire       [2:0]    _zz_30_;
  wire       [7:0]    _zz_31_;
  wire                axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_valid;
  wire                axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_ready;
  wire       [25:0]   axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_addr;
  wire       [3:0]    axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_id;
  wire       [7:0]    axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_len;
  wire       [2:0]    axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_size;
  wire       [1:0]    axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_burst;
  wire                axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_write;
  reg                 axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_valid;
  reg                 axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_ready;
  reg        [25:0]   axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_addr;
  reg        [3:0]    axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_id;
  reg        [7:0]    axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_len;
  reg        [2:0]    axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_size;
  reg        [1:0]    axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_burst;
  reg                 axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_write;
  wire                axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_valid;
  wire                axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_ready;
  wire       [31:0]   axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_payload_data;
  wire       [3:0]    axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_payload_strb;
  wire                axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_payload_last;
  reg                 axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rValid;
  reg        [31:0]   axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rData_data;
  reg        [3:0]    axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rData_strb;
  reg                 axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rData_last;
  wire                axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_valid;
  wire                axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_ready;
  wire       [31:0]   axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_data;
  wire       [3:0]    axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_strb;
  wire                axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_last;
  reg                 axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rValid;
  reg        [31:0]   axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rData_data;
  reg        [3:0]    axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rData_strb;
  reg                 axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rData_last;
  wire       [3:0]    _zz_32_;
  wire       [7:0]    _zz_33_;
  wire                axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_valid;
  wire                axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_ready;
  wire       [19:0]   axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_addr;
  wire       [3:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_id;
  wire       [7:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_len;
  wire       [2:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_size;
  wire       [1:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_burst;
  wire                axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_write;
  reg                 axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_valid;
  reg                 axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_ready;
  reg        [19:0]   axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_addr;
  reg        [3:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_id;
  reg        [7:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_len;
  reg        [2:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_size;
  reg        [1:0]    axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_burst;
  reg                 axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_write;
  wire                axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_valid;
  wire                axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_ready;
  wire       [31:0]   axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_data;
  wire       [3:0]    axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_strb;
  wire                axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_last;
  reg                 axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_valid;
  reg                 axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_ready;
  reg        [31:0]   axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_payload_data;
  reg        [3:0]    axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_payload_strb;
  reg                 axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_payload_last;

  assign _zz_76_ = (resetCtrl_systemResetCounter != _zz_1_);
  assign _zz_77_ = (! streamFork_4__io_outputs_1_payload_wr);
  assign _zz_78_ = (! axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_valid);
  assign _zz_79_ = (_zz_66_ && (! axi_ram_io_axi_arbiter_io_output_w_s2mPipe_ready));
  assign _zz_80_ = (! axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_valid);
  assign _zz_81_ = (_zz_72_ && (! axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_ready));
  assign _zz_82_ = (! axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_valid);
  assign _zz_83_ = (! axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_valid);
  BufferCC_3_ io_asyncReset_buffercc ( 
    .io_dataIn     (io_asyncReset                      ), //i
    .io_dataOut    (io_asyncReset_buffercc_io_dataOut  ), //o
    .io_mainClk    (io_mainClk                         )  //i
  );
  Axi4SharedOnChipRam axi_ram ( 
    .io_axi_arw_valid            (axi_ram_io_axi_arbiter_io_output_arw_halfPipe_valid                    ), //i
    .io_axi_arw_ready            (axi_ram_io_axi_arw_ready                                               ), //o
    .io_axi_arw_payload_addr     (axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_addr[17:0]       ), //i
    .io_axi_arw_payload_id       (axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_id[3:0]          ), //i
    .io_axi_arw_payload_len      (axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_len[7:0]         ), //i
    .io_axi_arw_payload_size     (axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_size[2:0]        ), //i
    .io_axi_arw_payload_burst    (axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_burst[1:0]       ), //i
    .io_axi_arw_payload_write    (axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_write            ), //i
    .io_axi_w_valid              (axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_valid               ), //i
    .io_axi_w_ready              (axi_ram_io_axi_w_ready                                                 ), //o
    .io_axi_w_payload_data       (axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_data[31:0]  ), //i
    .io_axi_w_payload_strb       (axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_strb[3:0]   ), //i
    .io_axi_w_payload_last       (axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_last        ), //i
    .io_axi_b_valid              (axi_ram_io_axi_b_valid                                                 ), //o
    .io_axi_b_ready              (axi_ram_io_axi_arbiter_io_output_b_ready                               ), //i
    .io_axi_b_payload_id         (axi_ram_io_axi_b_payload_id[3:0]                                       ), //o
    .io_axi_b_payload_resp       (axi_ram_io_axi_b_payload_resp[1:0]                                     ), //o
    .io_axi_r_valid              (axi_ram_io_axi_r_valid                                                 ), //o
    .io_axi_r_ready              (axi_ram_io_axi_arbiter_io_output_r_ready                               ), //i
    .io_axi_r_payload_data       (axi_ram_io_axi_r_payload_data[31:0]                                    ), //o
    .io_axi_r_payload_id         (axi_ram_io_axi_r_payload_id[3:0]                                       ), //o
    .io_axi_r_payload_resp       (axi_ram_io_axi_r_payload_resp[1:0]                                     ), //o
    .io_axi_r_payload_last       (axi_ram_io_axi_r_payload_last                                          ), //o
    .io_mainClk                  (io_mainClk                                                             ), //i
    .resetCtrl_axiReset          (resetCtrl_axiReset                                                     )  //i
  );
  Axi4SharedSdramCtrl axi_sdramCtrl ( 
    .io_axi_arw_valid            (axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_valid                    ), //i
    .io_axi_arw_ready            (axi_sdramCtrl_io_axi_arw_ready                                               ), //o
    .io_axi_arw_payload_addr     (axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_addr[25:0]       ), //i
    .io_axi_arw_payload_id       (axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_id[3:0]          ), //i
    .io_axi_arw_payload_len      (axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_len[7:0]         ), //i
    .io_axi_arw_payload_size     (axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_size[2:0]        ), //i
    .io_axi_arw_payload_burst    (axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_burst[1:0]       ), //i
    .io_axi_arw_payload_write    (axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_write            ), //i
    .io_axi_w_valid              (axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_valid               ), //i
    .io_axi_w_ready              (axi_sdramCtrl_io_axi_w_ready                                                 ), //o
    .io_axi_w_payload_data       (axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_data[31:0]  ), //i
    .io_axi_w_payload_strb       (axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_strb[3:0]   ), //i
    .io_axi_w_payload_last       (axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_last        ), //i
    .io_axi_b_valid              (axi_sdramCtrl_io_axi_b_valid                                                 ), //o
    .io_axi_b_ready              (axi_sdramCtrl_io_axi_arbiter_io_output_b_ready                               ), //i
    .io_axi_b_payload_id         (axi_sdramCtrl_io_axi_b_payload_id[3:0]                                       ), //o
    .io_axi_b_payload_resp       (axi_sdramCtrl_io_axi_b_payload_resp[1:0]                                     ), //o
    .io_axi_r_valid              (axi_sdramCtrl_io_axi_r_valid                                                 ), //o
    .io_axi_r_ready              (axi_sdramCtrl_io_axi_arbiter_io_output_r_ready                               ), //i
    .io_axi_r_payload_data       (axi_sdramCtrl_io_axi_r_payload_data[31:0]                                    ), //o
    .io_axi_r_payload_id         (axi_sdramCtrl_io_axi_r_payload_id[3:0]                                       ), //o
    .io_axi_r_payload_resp       (axi_sdramCtrl_io_axi_r_payload_resp[1:0]                                     ), //o
    .io_axi_r_payload_last       (axi_sdramCtrl_io_axi_r_payload_last                                          ), //o
    .io_sdram_ADDR               (axi_sdramCtrl_io_sdram_ADDR[12:0]                                            ), //o
    .io_sdram_BA                 (axi_sdramCtrl_io_sdram_BA[1:0]                                               ), //o
    .io_sdram_DQ_read            (io_sdram_DQ_read[15:0]                                                       ), //i
    .io_sdram_DQ_write           (axi_sdramCtrl_io_sdram_DQ_write[15:0]                                        ), //o
    .io_sdram_DQ_writeEnable     (axi_sdramCtrl_io_sdram_DQ_writeEnable[15:0]                                  ), //o
    .io_sdram_DQM                (axi_sdramCtrl_io_sdram_DQM[1:0]                                              ), //o
    .io_sdram_CASn               (axi_sdramCtrl_io_sdram_CASn                                                  ), //o
    .io_sdram_CKE                (axi_sdramCtrl_io_sdram_CKE                                                   ), //o
    .io_sdram_CSn                (axi_sdramCtrl_io_sdram_CSn                                                   ), //o
    .io_sdram_RASn               (axi_sdramCtrl_io_sdram_RASn                                                  ), //o
    .io_sdram_WEn                (axi_sdramCtrl_io_sdram_WEn                                                   ), //o
    .io_mainClk                  (io_mainClk                                                                   ), //i
    .resetCtrl_axiReset          (resetCtrl_axiReset                                                           )  //i
  );
  Axi4SharedToApb3Bridge axi_apbBridge ( 
    .io_axi_arw_valid            (axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_valid               ), //i
    .io_axi_arw_ready            (axi_apbBridge_io_axi_arw_ready                                          ), //o
    .io_axi_arw_payload_addr     (axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_addr[19:0]  ), //i
    .io_axi_arw_payload_id       (axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_id[3:0]     ), //i
    .io_axi_arw_payload_len      (axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_len[7:0]    ), //i
    .io_axi_arw_payload_size     (axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_size[2:0]   ), //i
    .io_axi_arw_payload_burst    (axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_burst[1:0]  ), //i
    .io_axi_arw_payload_write    (axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_write       ), //i
    .io_axi_w_valid              (axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_valid                 ), //i
    .io_axi_w_ready              (axi_apbBridge_io_axi_w_ready                                            ), //o
    .io_axi_w_payload_data       (axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_data[31:0]    ), //i
    .io_axi_w_payload_strb       (axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_strb[3:0]     ), //i
    .io_axi_w_payload_last       (axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_last          ), //i
    .io_axi_b_valid              (axi_apbBridge_io_axi_b_valid                                            ), //o
    .io_axi_b_ready              (axi_apbBridge_io_axi_arbiter_io_output_b_ready                          ), //i
    .io_axi_b_payload_id         (axi_apbBridge_io_axi_b_payload_id[3:0]                                  ), //o
    .io_axi_b_payload_resp       (axi_apbBridge_io_axi_b_payload_resp[1:0]                                ), //o
    .io_axi_r_valid              (axi_apbBridge_io_axi_r_valid                                            ), //o
    .io_axi_r_ready              (axi_apbBridge_io_axi_arbiter_io_output_r_ready                          ), //i
    .io_axi_r_payload_data       (axi_apbBridge_io_axi_r_payload_data[31:0]                               ), //o
    .io_axi_r_payload_id         (axi_apbBridge_io_axi_r_payload_id[3:0]                                  ), //o
    .io_axi_r_payload_resp       (axi_apbBridge_io_axi_r_payload_resp[1:0]                                ), //o
    .io_axi_r_payload_last       (axi_apbBridge_io_axi_r_payload_last                                     ), //o
    .io_apb_PADDR                (axi_apbBridge_io_apb_PADDR[19:0]                                        ), //o
    .io_apb_PSEL                 (axi_apbBridge_io_apb_PSEL                                               ), //o
    .io_apb_PENABLE              (axi_apbBridge_io_apb_PENABLE                                            ), //o
    .io_apb_PREADY               (io_apb_decoder_io_input_PREADY                                          ), //i
    .io_apb_PWRITE               (axi_apbBridge_io_apb_PWRITE                                             ), //o
    .io_apb_PWDATA               (axi_apbBridge_io_apb_PWDATA[31:0]                                       ), //o
    .io_apb_PRDATA               (io_apb_decoder_io_input_PRDATA[31:0]                                    ), //i
    .io_apb_PSLVERROR            (io_apb_decoder_io_input_PSLVERROR                                       ), //i
    .io_mainClk                  (io_mainClk                                                              ), //i
    .resetCtrl_axiReset          (resetCtrl_axiReset                                                      )  //i
  );
  PinsecTimerCtrl axi_timerCtrl ( 
    .io_apb_PADDR          (_zz_34_[7:0]                             ), //i
    .io_apb_PSEL           (apb3Router_1__io_outputs_2_PSEL          ), //i
    .io_apb_PENABLE        (apb3Router_1__io_outputs_2_PENABLE       ), //i
    .io_apb_PREADY         (axi_timerCtrl_io_apb_PREADY              ), //o
    .io_apb_PWRITE         (apb3Router_1__io_outputs_2_PWRITE        ), //i
    .io_apb_PWDATA         (apb3Router_1__io_outputs_2_PWDATA[31:0]  ), //i
    .io_apb_PRDATA         (axi_timerCtrl_io_apb_PRDATA[31:0]        ), //o
    .io_apb_PSLVERROR      (axi_timerCtrl_io_apb_PSLVERROR           ), //o
    .io_external_clear     (_zz_35_                                  ), //i
    .io_external_tick      (_zz_36_                                  ), //i
    .io_interrupt          (axi_timerCtrl_io_interrupt               ), //o
    .io_mainClk            (io_mainClk                               ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                       )  //i
  );
  Apb3UartCtrl axi_uartCtrl ( 
    .io_apb_PADDR          (_zz_37_[4:0]                             ), //i
    .io_apb_PSEL           (apb3Router_1__io_outputs_1_PSEL          ), //i
    .io_apb_PENABLE        (apb3Router_1__io_outputs_1_PENABLE       ), //i
    .io_apb_PREADY         (axi_uartCtrl_io_apb_PREADY               ), //o
    .io_apb_PWRITE         (apb3Router_1__io_outputs_1_PWRITE        ), //i
    .io_apb_PWDATA         (apb3Router_1__io_outputs_1_PWDATA[31:0]  ), //i
    .io_apb_PRDATA         (axi_uartCtrl_io_apb_PRDATA[31:0]         ), //o
    .io_uart_txd           (axi_uartCtrl_io_uart_txd                 ), //o
    .io_uart_rxd           (io_uart_rxd                              ), //i
    .io_interrupt          (axi_uartCtrl_io_interrupt                ), //o
    .io_mainClk            (io_mainClk                               ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                       )  //i
  );
  VexRiscv axi_cpu ( 
    .iBus_cmd_valid                   (axi_cpu_iBus_cmd_valid                                      ), //o
    .iBus_cmd_ready                   (axi4ReadOnlyDecoder_1__io_input_ar_ready                    ), //i
    .iBus_cmd_payload_pc              (axi_cpu_iBus_cmd_payload_pc[31:0]                           ), //o
    .iBus_rsp_valid                   (axi4ReadOnlyDecoder_1__io_input_r_valid                     ), //i
    .iBus_rsp_payload_error           (_zz_38_                                                     ), //i
    .iBus_rsp_payload_inst            (axi4ReadOnlyDecoder_1__io_input_r_payload_data[31:0]        ), //i
    .timerInterrupt                   (axi_timerCtrl_io_interrupt                                  ), //i
    .externalInterrupt                (axi_externalInterrupt_buffercc_io_dataOut                   ), //i
    .softwareInterrupt                (_zz_39_                                                     ), //i
    .debug_bus_cmd_valid              (systemDebugger_1__io_mem_cmd_valid                          ), //i
    .debug_bus_cmd_ready              (axi_cpu_debug_bus_cmd_ready                                 ), //o
    .debug_bus_cmd_payload_wr         (systemDebugger_1__io_mem_cmd_payload_wr                     ), //i
    .debug_bus_cmd_payload_address    (_zz_40_[7:0]                                                ), //i
    .debug_bus_cmd_payload_data       (systemDebugger_1__io_mem_cmd_payload_data[31:0]             ), //i
    .debug_bus_rsp_data               (axi_cpu_debug_bus_rsp_data[31:0]                            ), //o
    .debug_resetOut                   (axi_cpu_debug_resetOut                                      ), //o
    .dBus_cmd_valid                   (axi_cpu_dBus_cmd_valid                                      ), //o
    .dBus_cmd_ready                   (_zz_41_                                                     ), //i
    .dBus_cmd_payload_wr              (axi_cpu_dBus_cmd_payload_wr                                 ), //o
    .dBus_cmd_payload_address         (axi_cpu_dBus_cmd_payload_address[31:0]                      ), //o
    .dBus_cmd_payload_data            (axi_cpu_dBus_cmd_payload_data[31:0]                         ), //o
    .dBus_cmd_payload_size            (axi_cpu_dBus_cmd_payload_size[1:0]                          ), //o
    .dBus_rsp_ready                   (axi4SharedDecoder_1__io_input_r_m2sPipe_valid               ), //i
    .dBus_rsp_error                   (_zz_42_                                                     ), //i
    .dBus_rsp_data                    (axi4SharedDecoder_1__io_input_r_m2sPipe_payload_data[31:0]  ), //i
    .io_mainClk                       (io_mainClk                                                  ), //i
    .resetCtrl_axiReset               (resetCtrl_axiReset                                          ), //i
    .resetCtrl_systemReset            (resetCtrl_systemReset                                       )  //i
  );
  StreamFork_3_ streamFork_4_ ( 
    .io_input_valid                  (_zz_43_                                           ), //i
    .io_input_ready                  (streamFork_4__io_input_ready                      ), //o
    .io_input_payload_wr             (axi_cpu_dBus_cmd_payload_wr                       ), //i
    .io_input_payload_address        (axi_cpu_dBus_cmd_payload_address[31:0]            ), //i
    .io_input_payload_data           (axi_cpu_dBus_cmd_payload_data[31:0]               ), //i
    .io_input_payload_size           (axi_cpu_dBus_cmd_payload_size[1:0]                ), //i
    .io_outputs_0_valid              (streamFork_4__io_outputs_0_valid                  ), //o
    .io_outputs_0_ready              (axi4SharedDecoder_1__io_input_arw_ready           ), //i
    .io_outputs_0_payload_wr         (streamFork_4__io_outputs_0_payload_wr             ), //o
    .io_outputs_0_payload_address    (streamFork_4__io_outputs_0_payload_address[31:0]  ), //o
    .io_outputs_0_payload_data       (streamFork_4__io_outputs_0_payload_data[31:0]     ), //o
    .io_outputs_0_payload_size       (streamFork_4__io_outputs_0_payload_size[1:0]      ), //o
    .io_outputs_1_valid              (streamFork_4__io_outputs_1_valid                  ), //o
    .io_outputs_1_ready              (_zz_44_                                           ), //i
    .io_outputs_1_payload_wr         (streamFork_4__io_outputs_1_payload_wr             ), //o
    .io_outputs_1_payload_address    (streamFork_4__io_outputs_1_payload_address[31:0]  ), //o
    .io_outputs_1_payload_data       (streamFork_4__io_outputs_1_payload_data[31:0]     ), //o
    .io_outputs_1_payload_size       (streamFork_4__io_outputs_1_payload_size[1:0]      ), //o
    .io_mainClk                      (io_mainClk                                        ), //i
    .resetCtrl_axiReset              (resetCtrl_axiReset                                )  //i
  );
  BufferCC_4_ axi_externalInterrupt_buffercc ( 
    .io_dataIn             (axi_externalInterrupt                      ), //i
    .io_dataOut            (axi_externalInterrupt_buffercc_io_dataOut  ), //o
    .io_mainClk            (io_mainClk                                 ), //i
    .resetCtrl_axiReset    (resetCtrl_axiReset                         )  //i
  );
  JtagBridge jtagBridge_1_ ( 
    .io_jtag_tms                       (io_jtag_tms                                         ), //i
    .io_jtag_tdi                       (io_jtag_tdi                                         ), //i
    .io_jtag_tdo                       (jtagBridge_1__io_jtag_tdo                           ), //o
    .io_jtag_tck                       (io_jtag_tck                                         ), //i
    .io_remote_cmd_valid               (jtagBridge_1__io_remote_cmd_valid                   ), //o
    .io_remote_cmd_ready               (systemDebugger_1__io_remote_cmd_ready               ), //i
    .io_remote_cmd_payload_last        (jtagBridge_1__io_remote_cmd_payload_last            ), //o
    .io_remote_cmd_payload_fragment    (jtagBridge_1__io_remote_cmd_payload_fragment        ), //o
    .io_remote_rsp_valid               (systemDebugger_1__io_remote_rsp_valid               ), //i
    .io_remote_rsp_ready               (jtagBridge_1__io_remote_rsp_ready                   ), //o
    .io_remote_rsp_payload_error       (systemDebugger_1__io_remote_rsp_payload_error       ), //i
    .io_remote_rsp_payload_data        (systemDebugger_1__io_remote_rsp_payload_data[31:0]  ), //i
    .io_mainClk                        (io_mainClk                                          ), //i
    .resetCtrl_systemReset             (resetCtrl_systemReset                               )  //i
  );
  SystemDebugger systemDebugger_1_ ( 
    .io_remote_cmd_valid               (jtagBridge_1__io_remote_cmd_valid                   ), //i
    .io_remote_cmd_ready               (systemDebugger_1__io_remote_cmd_ready               ), //o
    .io_remote_cmd_payload_last        (jtagBridge_1__io_remote_cmd_payload_last            ), //i
    .io_remote_cmd_payload_fragment    (jtagBridge_1__io_remote_cmd_payload_fragment        ), //i
    .io_remote_rsp_valid               (systemDebugger_1__io_remote_rsp_valid               ), //o
    .io_remote_rsp_ready               (jtagBridge_1__io_remote_rsp_ready                   ), //i
    .io_remote_rsp_payload_error       (systemDebugger_1__io_remote_rsp_payload_error       ), //o
    .io_remote_rsp_payload_data        (systemDebugger_1__io_remote_rsp_payload_data[31:0]  ), //o
    .io_mem_cmd_valid                  (systemDebugger_1__io_mem_cmd_valid                  ), //o
    .io_mem_cmd_ready                  (axi_cpu_debug_bus_cmd_ready                         ), //i
    .io_mem_cmd_payload_address        (systemDebugger_1__io_mem_cmd_payload_address[31:0]  ), //o
    .io_mem_cmd_payload_data           (systemDebugger_1__io_mem_cmd_payload_data[31:0]     ), //o
    .io_mem_cmd_payload_wr             (systemDebugger_1__io_mem_cmd_payload_wr             ), //o
    .io_mem_cmd_payload_size           (systemDebugger_1__io_mem_cmd_payload_size[1:0]      ), //o
    .io_mem_rsp_valid                  (_zz_8_                                              ), //i
    .io_mem_rsp_payload                (axi_cpu_debug_bus_rsp_data[31:0]                    ), //i
    .io_mainClk                        (io_mainClk                                          ), //i
    .resetCtrl_systemReset             (resetCtrl_systemReset                               )  //i
  );
  Axi4ReadOnlyDecoder axi4ReadOnlyDecoder_1_ ( 
    .io_input_ar_valid                (axi_cpu_iBus_cmd_valid                                             ), //i
    .io_input_ar_ready                (axi4ReadOnlyDecoder_1__io_input_ar_ready                           ), //o
    .io_input_ar_payload_addr         (_zz_45_[31:0]                                                      ), //i
    .io_input_ar_payload_cache        (_zz_46_[3:0]                                                       ), //i
    .io_input_ar_payload_prot         (_zz_47_[2:0]                                                       ), //i
    .io_input_r_valid                 (axi4ReadOnlyDecoder_1__io_input_r_valid                            ), //o
    .io_input_r_ready                 (_zz_48_                                                            ), //i
    .io_input_r_payload_data          (axi4ReadOnlyDecoder_1__io_input_r_payload_data[31:0]               ), //o
    .io_input_r_payload_resp          (axi4ReadOnlyDecoder_1__io_input_r_payload_resp[1:0]                ), //o
    .io_input_r_payload_last          (axi4ReadOnlyDecoder_1__io_input_r_payload_last                     ), //o
    .io_outputs_0_ar_valid            (axi4ReadOnlyDecoder_1__io_outputs_0_ar_valid                       ), //o
    .io_outputs_0_ar_ready            (_zz_49_                                                            ), //i
    .io_outputs_0_ar_payload_addr     (axi4ReadOnlyDecoder_1__io_outputs_0_ar_payload_addr[31:0]          ), //o
    .io_outputs_0_ar_payload_cache    (axi4ReadOnlyDecoder_1__io_outputs_0_ar_payload_cache[3:0]          ), //o
    .io_outputs_0_ar_payload_prot     (axi4ReadOnlyDecoder_1__io_outputs_0_ar_payload_prot[2:0]           ), //o
    .io_outputs_0_r_valid             (axi_ram_io_axi_arbiter_io_readInputs_0_r_valid                     ), //i
    .io_outputs_0_r_ready             (axi4ReadOnlyDecoder_1__io_outputs_0_r_ready                        ), //o
    .io_outputs_0_r_payload_data      (axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_data[31:0]        ), //i
    .io_outputs_0_r_payload_resp      (axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_resp[1:0]         ), //i
    .io_outputs_0_r_payload_last      (axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_last              ), //i
    .io_outputs_1_ar_valid            (axi4ReadOnlyDecoder_1__io_outputs_1_ar_valid                       ), //o
    .io_outputs_1_ar_ready            (_zz_50_                                                            ), //i
    .io_outputs_1_ar_payload_addr     (axi4ReadOnlyDecoder_1__io_outputs_1_ar_payload_addr[31:0]          ), //o
    .io_outputs_1_ar_payload_cache    (axi4ReadOnlyDecoder_1__io_outputs_1_ar_payload_cache[3:0]          ), //o
    .io_outputs_1_ar_payload_prot     (axi4ReadOnlyDecoder_1__io_outputs_1_ar_payload_prot[2:0]           ), //o
    .io_outputs_1_r_valid             (axi_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_valid               ), //i
    .io_outputs_1_r_ready             (axi4ReadOnlyDecoder_1__io_outputs_1_r_ready                        ), //o
    .io_outputs_1_r_payload_data      (axi_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_payload_data[31:0]  ), //i
    .io_outputs_1_r_payload_resp      (axi_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_payload_resp[1:0]   ), //i
    .io_outputs_1_r_payload_last      (axi_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_payload_last        ), //i
    .io_mainClk                       (io_mainClk                                                         ), //i
    .resetCtrl_axiReset               (resetCtrl_axiReset                                                 )  //i
  );
  Axi4SharedDecoder axi4SharedDecoder_1_ ( 
    .io_input_arw_valid                      (streamFork_4__io_outputs_0_valid                                     ), //i
    .io_input_arw_ready                      (axi4SharedDecoder_1__io_input_arw_ready                              ), //o
    .io_input_arw_payload_addr               (streamFork_4__io_outputs_0_payload_address[31:0]                     ), //i
    .io_input_arw_payload_size               (_zz_51_[2:0]                                                         ), //i
    .io_input_arw_payload_cache              (_zz_52_[3:0]                                                         ), //i
    .io_input_arw_payload_prot               (_zz_53_[2:0]                                                         ), //i
    .io_input_arw_payload_write              (streamFork_4__io_outputs_0_payload_wr                                ), //i
    .io_input_w_valid                        (streamFork_4__io_outputs_1_thrown_valid                              ), //i
    .io_input_w_ready                        (axi4SharedDecoder_1__io_input_w_ready                                ), //o
    .io_input_w_payload_data                 (streamFork_4__io_outputs_1_thrown_payload_data[31:0]                 ), //i
    .io_input_w_payload_strb                 (_zz_54_[3:0]                                                         ), //i
    .io_input_w_payload_last                 (_zz_55_                                                              ), //i
    .io_input_b_valid                        (axi4SharedDecoder_1__io_input_b_valid                                ), //o
    .io_input_b_ready                        (_zz_56_                                                              ), //i
    .io_input_b_payload_resp                 (axi4SharedDecoder_1__io_input_b_payload_resp[1:0]                    ), //o
    .io_input_r_valid                        (axi4SharedDecoder_1__io_input_r_valid                                ), //o
    .io_input_r_ready                        (_zz_57_                                                              ), //i
    .io_input_r_payload_data                 (axi4SharedDecoder_1__io_input_r_payload_data[31:0]                   ), //o
    .io_input_r_payload_resp                 (axi4SharedDecoder_1__io_input_r_payload_resp[1:0]                    ), //o
    .io_input_r_payload_last                 (axi4SharedDecoder_1__io_input_r_payload_last                         ), //o
    .io_sharedOutputs_0_arw_valid            (axi4SharedDecoder_1__io_sharedOutputs_0_arw_valid                    ), //o
    .io_sharedOutputs_0_arw_ready            (_zz_58_                                                              ), //i
    .io_sharedOutputs_0_arw_payload_addr     (axi4SharedDecoder_1__io_sharedOutputs_0_arw_payload_addr[31:0]       ), //o
    .io_sharedOutputs_0_arw_payload_size     (axi4SharedDecoder_1__io_sharedOutputs_0_arw_payload_size[2:0]        ), //o
    .io_sharedOutputs_0_arw_payload_cache    (axi4SharedDecoder_1__io_sharedOutputs_0_arw_payload_cache[3:0]       ), //o
    .io_sharedOutputs_0_arw_payload_prot     (axi4SharedDecoder_1__io_sharedOutputs_0_arw_payload_prot[2:0]        ), //o
    .io_sharedOutputs_0_arw_payload_write    (axi4SharedDecoder_1__io_sharedOutputs_0_arw_payload_write            ), //o
    .io_sharedOutputs_0_w_valid              (axi4SharedDecoder_1__io_sharedOutputs_0_w_valid                      ), //o
    .io_sharedOutputs_0_w_ready              (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_w_ready               ), //i
    .io_sharedOutputs_0_w_payload_data       (axi4SharedDecoder_1__io_sharedOutputs_0_w_payload_data[31:0]         ), //o
    .io_sharedOutputs_0_w_payload_strb       (axi4SharedDecoder_1__io_sharedOutputs_0_w_payload_strb[3:0]          ), //o
    .io_sharedOutputs_0_w_payload_last       (axi4SharedDecoder_1__io_sharedOutputs_0_w_payload_last               ), //o
    .io_sharedOutputs_0_b_valid              (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_valid               ), //i
    .io_sharedOutputs_0_b_ready              (axi4SharedDecoder_1__io_sharedOutputs_0_b_ready                      ), //o
    .io_sharedOutputs_0_b_payload_resp       (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]   ), //i
    .io_sharedOutputs_0_r_valid              (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_valid               ), //i
    .io_sharedOutputs_0_r_ready              (axi4SharedDecoder_1__io_sharedOutputs_0_r_ready                      ), //o
    .io_sharedOutputs_0_r_payload_data       (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]  ), //i
    .io_sharedOutputs_0_r_payload_resp       (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]   ), //i
    .io_sharedOutputs_0_r_payload_last       (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_last        ), //i
    .io_sharedOutputs_1_arw_valid            (axi4SharedDecoder_1__io_sharedOutputs_1_arw_valid                    ), //o
    .io_sharedOutputs_1_arw_ready            (_zz_59_                                                              ), //i
    .io_sharedOutputs_1_arw_payload_addr     (axi4SharedDecoder_1__io_sharedOutputs_1_arw_payload_addr[31:0]       ), //o
    .io_sharedOutputs_1_arw_payload_size     (axi4SharedDecoder_1__io_sharedOutputs_1_arw_payload_size[2:0]        ), //o
    .io_sharedOutputs_1_arw_payload_cache    (axi4SharedDecoder_1__io_sharedOutputs_1_arw_payload_cache[3:0]       ), //o
    .io_sharedOutputs_1_arw_payload_prot     (axi4SharedDecoder_1__io_sharedOutputs_1_arw_payload_prot[2:0]        ), //o
    .io_sharedOutputs_1_arw_payload_write    (axi4SharedDecoder_1__io_sharedOutputs_1_arw_payload_write            ), //o
    .io_sharedOutputs_1_w_valid              (axi4SharedDecoder_1__io_sharedOutputs_1_w_valid                      ), //o
    .io_sharedOutputs_1_w_ready              (axi_ram_io_axi_arbiter_io_sharedInputs_0_w_ready                     ), //i
    .io_sharedOutputs_1_w_payload_data       (axi4SharedDecoder_1__io_sharedOutputs_1_w_payload_data[31:0]         ), //o
    .io_sharedOutputs_1_w_payload_strb       (axi4SharedDecoder_1__io_sharedOutputs_1_w_payload_strb[3:0]          ), //o
    .io_sharedOutputs_1_w_payload_last       (axi4SharedDecoder_1__io_sharedOutputs_1_w_payload_last               ), //o
    .io_sharedOutputs_1_b_valid              (axi_ram_io_axi_arbiter_io_sharedInputs_0_b_valid                     ), //i
    .io_sharedOutputs_1_b_ready              (axi4SharedDecoder_1__io_sharedOutputs_1_b_ready                      ), //o
    .io_sharedOutputs_1_b_payload_resp       (axi_ram_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]         ), //i
    .io_sharedOutputs_1_r_valid              (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_valid                     ), //i
    .io_sharedOutputs_1_r_ready              (axi4SharedDecoder_1__io_sharedOutputs_1_r_ready                      ), //o
    .io_sharedOutputs_1_r_payload_data       (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]        ), //i
    .io_sharedOutputs_1_r_payload_resp       (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]         ), //i
    .io_sharedOutputs_1_r_payload_last       (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_last              ), //i
    .io_sharedOutputs_2_arw_valid            (axi4SharedDecoder_1__io_sharedOutputs_2_arw_valid                    ), //o
    .io_sharedOutputs_2_arw_ready            (_zz_60_                                                              ), //i
    .io_sharedOutputs_2_arw_payload_addr     (axi4SharedDecoder_1__io_sharedOutputs_2_arw_payload_addr[31:0]       ), //o
    .io_sharedOutputs_2_arw_payload_size     (axi4SharedDecoder_1__io_sharedOutputs_2_arw_payload_size[2:0]        ), //o
    .io_sharedOutputs_2_arw_payload_cache    (axi4SharedDecoder_1__io_sharedOutputs_2_arw_payload_cache[3:0]       ), //o
    .io_sharedOutputs_2_arw_payload_prot     (axi4SharedDecoder_1__io_sharedOutputs_2_arw_payload_prot[2:0]        ), //o
    .io_sharedOutputs_2_arw_payload_write    (axi4SharedDecoder_1__io_sharedOutputs_2_arw_payload_write            ), //o
    .io_sharedOutputs_2_w_valid              (axi4SharedDecoder_1__io_sharedOutputs_2_w_valid                      ), //o
    .io_sharedOutputs_2_w_ready              (axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_w_ready               ), //i
    .io_sharedOutputs_2_w_payload_data       (axi4SharedDecoder_1__io_sharedOutputs_2_w_payload_data[31:0]         ), //o
    .io_sharedOutputs_2_w_payload_strb       (axi4SharedDecoder_1__io_sharedOutputs_2_w_payload_strb[3:0]          ), //o
    .io_sharedOutputs_2_w_payload_last       (axi4SharedDecoder_1__io_sharedOutputs_2_w_payload_last               ), //o
    .io_sharedOutputs_2_b_valid              (axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_b_valid               ), //i
    .io_sharedOutputs_2_b_ready              (axi4SharedDecoder_1__io_sharedOutputs_2_b_ready                      ), //o
    .io_sharedOutputs_2_b_payload_resp       (axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]   ), //i
    .io_sharedOutputs_2_r_valid              (axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_valid               ), //i
    .io_sharedOutputs_2_r_ready              (axi4SharedDecoder_1__io_sharedOutputs_2_r_ready                      ), //o
    .io_sharedOutputs_2_r_payload_data       (axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]  ), //i
    .io_sharedOutputs_2_r_payload_resp       (axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]   ), //i
    .io_sharedOutputs_2_r_payload_last       (axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_payload_last        ), //i
    .io_mainClk                              (io_mainClk                                                           ), //i
    .resetCtrl_axiReset                      (resetCtrl_axiReset                                                   )  //i
  );
  Axi4SharedArbiter axi_ram_io_axi_arbiter ( 
    .io_readInputs_0_ar_valid               (_zz_9_                                                         ), //i
    .io_readInputs_0_ar_ready               (axi_ram_io_axi_arbiter_io_readInputs_0_ar_ready                ), //o
    .io_readInputs_0_ar_payload_addr        (_zz_61_[17:0]                                                  ), //i
    .io_readInputs_0_ar_payload_id          (_zz_24_[2:0]                                                   ), //i
    .io_readInputs_0_ar_payload_len         (_zz_25_[7:0]                                                   ), //i
    .io_readInputs_0_ar_payload_size        (_zz_62_[2:0]                                                   ), //i
    .io_readInputs_0_ar_payload_burst       (_zz_63_[1:0]                                                   ), //i
    .io_readInputs_0_r_valid                (axi_ram_io_axi_arbiter_io_readInputs_0_r_valid                 ), //o
    .io_readInputs_0_r_ready                (axi4ReadOnlyDecoder_1__io_outputs_0_r_ready                    ), //i
    .io_readInputs_0_r_payload_data         (axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_data[31:0]    ), //o
    .io_readInputs_0_r_payload_id           (axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_id[2:0]       ), //o
    .io_readInputs_0_r_payload_resp         (axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_resp[1:0]     ), //o
    .io_readInputs_0_r_payload_last         (axi_ram_io_axi_arbiter_io_readInputs_0_r_payload_last          ), //o
    .io_sharedInputs_0_arw_valid            (_zz_18_                                                        ), //i
    .io_sharedInputs_0_arw_ready            (axi_ram_io_axi_arbiter_io_sharedInputs_0_arw_ready             ), //o
    .io_sharedInputs_0_arw_payload_addr     (_zz_64_[17:0]                                                  ), //i
    .io_sharedInputs_0_arw_payload_id       (_zz_26_[2:0]                                                   ), //i
    .io_sharedInputs_0_arw_payload_len      (_zz_27_[7:0]                                                   ), //i
    .io_sharedInputs_0_arw_payload_size     (axi4SharedDecoder_1__io_sharedOutputs_1_arw_payload_size[2:0]  ), //i
    .io_sharedInputs_0_arw_payload_burst    (_zz_65_[1:0]                                                   ), //i
    .io_sharedInputs_0_arw_payload_write    (axi4SharedDecoder_1__io_sharedOutputs_1_arw_payload_write      ), //i
    .io_sharedInputs_0_w_valid              (axi4SharedDecoder_1__io_sharedOutputs_1_w_valid                ), //i
    .io_sharedInputs_0_w_ready              (axi_ram_io_axi_arbiter_io_sharedInputs_0_w_ready               ), //o
    .io_sharedInputs_0_w_payload_data       (axi4SharedDecoder_1__io_sharedOutputs_1_w_payload_data[31:0]   ), //i
    .io_sharedInputs_0_w_payload_strb       (axi4SharedDecoder_1__io_sharedOutputs_1_w_payload_strb[3:0]    ), //i
    .io_sharedInputs_0_w_payload_last       (axi4SharedDecoder_1__io_sharedOutputs_1_w_payload_last         ), //i
    .io_sharedInputs_0_b_valid              (axi_ram_io_axi_arbiter_io_sharedInputs_0_b_valid               ), //o
    .io_sharedInputs_0_b_ready              (axi4SharedDecoder_1__io_sharedOutputs_1_b_ready                ), //i
    .io_sharedInputs_0_b_payload_id         (axi_ram_io_axi_arbiter_io_sharedInputs_0_b_payload_id[2:0]     ), //o
    .io_sharedInputs_0_b_payload_resp       (axi_ram_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]   ), //o
    .io_sharedInputs_0_r_valid              (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_valid               ), //o
    .io_sharedInputs_0_r_ready              (axi4SharedDecoder_1__io_sharedOutputs_1_r_ready                ), //i
    .io_sharedInputs_0_r_payload_data       (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]  ), //o
    .io_sharedInputs_0_r_payload_id         (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_id[2:0]     ), //o
    .io_sharedInputs_0_r_payload_resp       (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]   ), //o
    .io_sharedInputs_0_r_payload_last       (axi_ram_io_axi_arbiter_io_sharedInputs_0_r_payload_last        ), //o
    .io_output_arw_valid                    (axi_ram_io_axi_arbiter_io_output_arw_valid                     ), //o
    .io_output_arw_ready                    (axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_ready       ), //i
    .io_output_arw_payload_addr             (axi_ram_io_axi_arbiter_io_output_arw_payload_addr[17:0]        ), //o
    .io_output_arw_payload_id               (axi_ram_io_axi_arbiter_io_output_arw_payload_id[3:0]           ), //o
    .io_output_arw_payload_len              (axi_ram_io_axi_arbiter_io_output_arw_payload_len[7:0]          ), //o
    .io_output_arw_payload_size             (axi_ram_io_axi_arbiter_io_output_arw_payload_size[2:0]         ), //o
    .io_output_arw_payload_burst            (axi_ram_io_axi_arbiter_io_output_arw_payload_burst[1:0]        ), //o
    .io_output_arw_payload_write            (axi_ram_io_axi_arbiter_io_output_arw_payload_write             ), //o
    .io_output_w_valid                      (axi_ram_io_axi_arbiter_io_output_w_valid                       ), //o
    .io_output_w_ready                      (_zz_66_                                                        ), //i
    .io_output_w_payload_data               (axi_ram_io_axi_arbiter_io_output_w_payload_data[31:0]          ), //o
    .io_output_w_payload_strb               (axi_ram_io_axi_arbiter_io_output_w_payload_strb[3:0]           ), //o
    .io_output_w_payload_last               (axi_ram_io_axi_arbiter_io_output_w_payload_last                ), //o
    .io_output_b_valid                      (axi_ram_io_axi_b_valid                                         ), //i
    .io_output_b_ready                      (axi_ram_io_axi_arbiter_io_output_b_ready                       ), //o
    .io_output_b_payload_id                 (axi_ram_io_axi_b_payload_id[3:0]                               ), //i
    .io_output_b_payload_resp               (axi_ram_io_axi_b_payload_resp[1:0]                             ), //i
    .io_output_r_valid                      (axi_ram_io_axi_r_valid                                         ), //i
    .io_output_r_ready                      (axi_ram_io_axi_arbiter_io_output_r_ready                       ), //o
    .io_output_r_payload_data               (axi_ram_io_axi_r_payload_data[31:0]                            ), //i
    .io_output_r_payload_id                 (axi_ram_io_axi_r_payload_id[3:0]                               ), //i
    .io_output_r_payload_resp               (axi_ram_io_axi_r_payload_resp[1:0]                             ), //i
    .io_output_r_payload_last               (axi_ram_io_axi_r_payload_last                                  ), //i
    .io_mainClk                             (io_mainClk                                                     ), //i
    .resetCtrl_axiReset                     (resetCtrl_axiReset                                             )  //i
  );
  Axi4SharedArbiter_1_ axi_sdramCtrl_io_axi_arbiter ( 
    .io_readInputs_0_ar_valid               (_zz_12_                                                              ), //i
    .io_readInputs_0_ar_ready               (axi_sdramCtrl_io_axi_arbiter_io_readInputs_0_ar_ready                ), //o
    .io_readInputs_0_ar_payload_addr        (_zz_67_[25:0]                                                        ), //i
    .io_readInputs_0_ar_payload_id          (_zz_28_[2:0]                                                         ), //i
    .io_readInputs_0_ar_payload_len         (_zz_29_[7:0]                                                         ), //i
    .io_readInputs_0_ar_payload_size        (_zz_68_[2:0]                                                         ), //i
    .io_readInputs_0_ar_payload_burst       (_zz_69_[1:0]                                                         ), //i
    .io_readInputs_0_r_valid                (axi_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_valid                 ), //o
    .io_readInputs_0_r_ready                (axi4ReadOnlyDecoder_1__io_outputs_1_r_ready                          ), //i
    .io_readInputs_0_r_payload_data         (axi_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_payload_data[31:0]    ), //o
    .io_readInputs_0_r_payload_id           (axi_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_payload_id[2:0]       ), //o
    .io_readInputs_0_r_payload_resp         (axi_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_payload_resp[1:0]     ), //o
    .io_readInputs_0_r_payload_last         (axi_sdramCtrl_io_axi_arbiter_io_readInputs_0_r_payload_last          ), //o
    .io_sharedInputs_0_arw_valid            (_zz_21_                                                              ), //i
    .io_sharedInputs_0_arw_ready            (axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_arw_ready             ), //o
    .io_sharedInputs_0_arw_payload_addr     (_zz_70_[25:0]                                                        ), //i
    .io_sharedInputs_0_arw_payload_id       (_zz_30_[2:0]                                                         ), //i
    .io_sharedInputs_0_arw_payload_len      (_zz_31_[7:0]                                                         ), //i
    .io_sharedInputs_0_arw_payload_size     (axi4SharedDecoder_1__io_sharedOutputs_2_arw_payload_size[2:0]        ), //i
    .io_sharedInputs_0_arw_payload_burst    (_zz_71_[1:0]                                                         ), //i
    .io_sharedInputs_0_arw_payload_write    (axi4SharedDecoder_1__io_sharedOutputs_2_arw_payload_write            ), //i
    .io_sharedInputs_0_w_valid              (axi4SharedDecoder_1__io_sharedOutputs_2_w_valid                      ), //i
    .io_sharedInputs_0_w_ready              (axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_w_ready               ), //o
    .io_sharedInputs_0_w_payload_data       (axi4SharedDecoder_1__io_sharedOutputs_2_w_payload_data[31:0]         ), //i
    .io_sharedInputs_0_w_payload_strb       (axi4SharedDecoder_1__io_sharedOutputs_2_w_payload_strb[3:0]          ), //i
    .io_sharedInputs_0_w_payload_last       (axi4SharedDecoder_1__io_sharedOutputs_2_w_payload_last               ), //i
    .io_sharedInputs_0_b_valid              (axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_b_valid               ), //o
    .io_sharedInputs_0_b_ready              (axi4SharedDecoder_1__io_sharedOutputs_2_b_ready                      ), //i
    .io_sharedInputs_0_b_payload_id         (axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_b_payload_id[2:0]     ), //o
    .io_sharedInputs_0_b_payload_resp       (axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]   ), //o
    .io_sharedInputs_0_r_valid              (axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_valid               ), //o
    .io_sharedInputs_0_r_ready              (axi4SharedDecoder_1__io_sharedOutputs_2_r_ready                      ), //i
    .io_sharedInputs_0_r_payload_data       (axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]  ), //o
    .io_sharedInputs_0_r_payload_id         (axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_payload_id[2:0]     ), //o
    .io_sharedInputs_0_r_payload_resp       (axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]   ), //o
    .io_sharedInputs_0_r_payload_last       (axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_r_payload_last        ), //o
    .io_output_arw_valid                    (axi_sdramCtrl_io_axi_arbiter_io_output_arw_valid                     ), //o
    .io_output_arw_ready                    (axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_ready       ), //i
    .io_output_arw_payload_addr             (axi_sdramCtrl_io_axi_arbiter_io_output_arw_payload_addr[25:0]        ), //o
    .io_output_arw_payload_id               (axi_sdramCtrl_io_axi_arbiter_io_output_arw_payload_id[3:0]           ), //o
    .io_output_arw_payload_len              (axi_sdramCtrl_io_axi_arbiter_io_output_arw_payload_len[7:0]          ), //o
    .io_output_arw_payload_size             (axi_sdramCtrl_io_axi_arbiter_io_output_arw_payload_size[2:0]         ), //o
    .io_output_arw_payload_burst            (axi_sdramCtrl_io_axi_arbiter_io_output_arw_payload_burst[1:0]        ), //o
    .io_output_arw_payload_write            (axi_sdramCtrl_io_axi_arbiter_io_output_arw_payload_write             ), //o
    .io_output_w_valid                      (axi_sdramCtrl_io_axi_arbiter_io_output_w_valid                       ), //o
    .io_output_w_ready                      (_zz_72_                                                              ), //i
    .io_output_w_payload_data               (axi_sdramCtrl_io_axi_arbiter_io_output_w_payload_data[31:0]          ), //o
    .io_output_w_payload_strb               (axi_sdramCtrl_io_axi_arbiter_io_output_w_payload_strb[3:0]           ), //o
    .io_output_w_payload_last               (axi_sdramCtrl_io_axi_arbiter_io_output_w_payload_last                ), //o
    .io_output_b_valid                      (axi_sdramCtrl_io_axi_b_valid                                         ), //i
    .io_output_b_ready                      (axi_sdramCtrl_io_axi_arbiter_io_output_b_ready                       ), //o
    .io_output_b_payload_id                 (axi_sdramCtrl_io_axi_b_payload_id[3:0]                               ), //i
    .io_output_b_payload_resp               (axi_sdramCtrl_io_axi_b_payload_resp[1:0]                             ), //i
    .io_output_r_valid                      (axi_sdramCtrl_io_axi_r_valid                                         ), //i
    .io_output_r_ready                      (axi_sdramCtrl_io_axi_arbiter_io_output_r_ready                       ), //o
    .io_output_r_payload_data               (axi_sdramCtrl_io_axi_r_payload_data[31:0]                            ), //i
    .io_output_r_payload_id                 (axi_sdramCtrl_io_axi_r_payload_id[3:0]                               ), //i
    .io_output_r_payload_resp               (axi_sdramCtrl_io_axi_r_payload_resp[1:0]                             ), //i
    .io_output_r_payload_last               (axi_sdramCtrl_io_axi_r_payload_last                                  ), //i
    .io_mainClk                             (io_mainClk                                                           ), //i
    .resetCtrl_axiReset                     (resetCtrl_axiReset                                                   )  //i
  );
  Axi4SharedArbiter_2_ axi_apbBridge_io_axi_arbiter ( 
    .io_sharedInputs_0_arw_valid            (_zz_15_                                                              ), //i
    .io_sharedInputs_0_arw_ready            (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_ready             ), //o
    .io_sharedInputs_0_arw_payload_addr     (_zz_73_[19:0]                                                        ), //i
    .io_sharedInputs_0_arw_payload_id       (_zz_32_[3:0]                                                         ), //i
    .io_sharedInputs_0_arw_payload_len      (_zz_33_[7:0]                                                         ), //i
    .io_sharedInputs_0_arw_payload_size     (axi4SharedDecoder_1__io_sharedOutputs_0_arw_payload_size[2:0]        ), //i
    .io_sharedInputs_0_arw_payload_burst    (_zz_74_[1:0]                                                         ), //i
    .io_sharedInputs_0_arw_payload_write    (axi4SharedDecoder_1__io_sharedOutputs_0_arw_payload_write            ), //i
    .io_sharedInputs_0_w_valid              (axi4SharedDecoder_1__io_sharedOutputs_0_w_valid                      ), //i
    .io_sharedInputs_0_w_ready              (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_w_ready               ), //o
    .io_sharedInputs_0_w_payload_data       (axi4SharedDecoder_1__io_sharedOutputs_0_w_payload_data[31:0]         ), //i
    .io_sharedInputs_0_w_payload_strb       (axi4SharedDecoder_1__io_sharedOutputs_0_w_payload_strb[3:0]          ), //i
    .io_sharedInputs_0_w_payload_last       (axi4SharedDecoder_1__io_sharedOutputs_0_w_payload_last               ), //i
    .io_sharedInputs_0_b_valid              (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_valid               ), //o
    .io_sharedInputs_0_b_ready              (axi4SharedDecoder_1__io_sharedOutputs_0_b_ready                      ), //i
    .io_sharedInputs_0_b_payload_id         (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_id[3:0]     ), //o
    .io_sharedInputs_0_b_payload_resp       (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_b_payload_resp[1:0]   ), //o
    .io_sharedInputs_0_r_valid              (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_valid               ), //o
    .io_sharedInputs_0_r_ready              (axi4SharedDecoder_1__io_sharedOutputs_0_r_ready                      ), //i
    .io_sharedInputs_0_r_payload_data       (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_data[31:0]  ), //o
    .io_sharedInputs_0_r_payload_id         (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_id[3:0]     ), //o
    .io_sharedInputs_0_r_payload_resp       (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_resp[1:0]   ), //o
    .io_sharedInputs_0_r_payload_last       (axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_r_payload_last        ), //o
    .io_output_arw_valid                    (axi_apbBridge_io_axi_arbiter_io_output_arw_valid                     ), //o
    .io_output_arw_ready                    (axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_ready       ), //i
    .io_output_arw_payload_addr             (axi_apbBridge_io_axi_arbiter_io_output_arw_payload_addr[19:0]        ), //o
    .io_output_arw_payload_id               (axi_apbBridge_io_axi_arbiter_io_output_arw_payload_id[3:0]           ), //o
    .io_output_arw_payload_len              (axi_apbBridge_io_axi_arbiter_io_output_arw_payload_len[7:0]          ), //o
    .io_output_arw_payload_size             (axi_apbBridge_io_axi_arbiter_io_output_arw_payload_size[2:0]         ), //o
    .io_output_arw_payload_burst            (axi_apbBridge_io_axi_arbiter_io_output_arw_payload_burst[1:0]        ), //o
    .io_output_arw_payload_write            (axi_apbBridge_io_axi_arbiter_io_output_arw_payload_write             ), //o
    .io_output_w_valid                      (axi_apbBridge_io_axi_arbiter_io_output_w_valid                       ), //o
    .io_output_w_ready                      (axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_ready         ), //i
    .io_output_w_payload_data               (axi_apbBridge_io_axi_arbiter_io_output_w_payload_data[31:0]          ), //o
    .io_output_w_payload_strb               (axi_apbBridge_io_axi_arbiter_io_output_w_payload_strb[3:0]           ), //o
    .io_output_w_payload_last               (axi_apbBridge_io_axi_arbiter_io_output_w_payload_last                ), //o
    .io_output_b_valid                      (axi_apbBridge_io_axi_b_valid                                         ), //i
    .io_output_b_ready                      (axi_apbBridge_io_axi_arbiter_io_output_b_ready                       ), //o
    .io_output_b_payload_id                 (axi_apbBridge_io_axi_b_payload_id[3:0]                               ), //i
    .io_output_b_payload_resp               (axi_apbBridge_io_axi_b_payload_resp[1:0]                             ), //i
    .io_output_r_valid                      (axi_apbBridge_io_axi_r_valid                                         ), //i
    .io_output_r_ready                      (axi_apbBridge_io_axi_arbiter_io_output_r_ready                       ), //o
    .io_output_r_payload_data               (axi_apbBridge_io_axi_r_payload_data[31:0]                            ), //i
    .io_output_r_payload_id                 (axi_apbBridge_io_axi_r_payload_id[3:0]                               ), //i
    .io_output_r_payload_resp               (axi_apbBridge_io_axi_r_payload_resp[1:0]                             ), //i
    .io_output_r_payload_last               (axi_apbBridge_io_axi_r_payload_last                                  ), //i
    .io_mainClk                             (io_mainClk                                                           ), //i
    .resetCtrl_axiReset                     (resetCtrl_axiReset                                                   )  //i
  );
  Apb3Decoder io_apb_decoder ( 
    .io_input_PADDR         (axi_apbBridge_io_apb_PADDR[19:0]       ), //i
    .io_input_PSEL          (axi_apbBridge_io_apb_PSEL              ), //i
    .io_input_PENABLE       (axi_apbBridge_io_apb_PENABLE           ), //i
    .io_input_PREADY        (io_apb_decoder_io_input_PREADY         ), //o
    .io_input_PWRITE        (axi_apbBridge_io_apb_PWRITE            ), //i
    .io_input_PWDATA        (axi_apbBridge_io_apb_PWDATA[31:0]      ), //i
    .io_input_PRDATA        (io_apb_decoder_io_input_PRDATA[31:0]   ), //o
    .io_input_PSLVERROR     (io_apb_decoder_io_input_PSLVERROR      ), //o
    .io_output_PADDR        (io_apb_decoder_io_output_PADDR[19:0]   ), //o
    .io_output_PSEL         (io_apb_decoder_io_output_PSEL[2:0]     ), //o
    .io_output_PENABLE      (io_apb_decoder_io_output_PENABLE       ), //o
    .io_output_PREADY       (apb3Router_1__io_input_PREADY          ), //i
    .io_output_PWRITE       (io_apb_decoder_io_output_PWRITE        ), //o
    .io_output_PWDATA       (io_apb_decoder_io_output_PWDATA[31:0]  ), //o
    .io_output_PRDATA       (apb3Router_1__io_input_PRDATA[31:0]    ), //i
    .io_output_PSLVERROR    (apb3Router_1__io_input_PSLVERROR       )  //i
  );
  Apb3Router apb3Router_1_ ( 
    .io_input_PADDR            (io_apb_decoder_io_output_PADDR[19:0]     ), //i
    .io_input_PSEL             (io_apb_decoder_io_output_PSEL[2:0]       ), //i
    .io_input_PENABLE          (io_apb_decoder_io_output_PENABLE         ), //i
    .io_input_PREADY           (apb3Router_1__io_input_PREADY            ), //o
    .io_input_PWRITE           (io_apb_decoder_io_output_PWRITE          ), //i
    .io_input_PWDATA           (io_apb_decoder_io_output_PWDATA[31:0]    ), //i
    .io_input_PRDATA           (apb3Router_1__io_input_PRDATA[31:0]      ), //o
    .io_input_PSLVERROR        (apb3Router_1__io_input_PSLVERROR         ), //o
    .io_outputs_0_PADDR        (apb3Router_1__io_outputs_0_PADDR[19:0]   ), //o
    .io_outputs_0_PSEL         (apb3Router_1__io_outputs_0_PSEL          ), //o
    .io_outputs_0_PENABLE      (apb3Router_1__io_outputs_0_PENABLE       ), //o
    .io_outputs_0_PREADY       (io_apbBus_PREADY                         ), //i
    .io_outputs_0_PWRITE       (apb3Router_1__io_outputs_0_PWRITE        ), //o
    .io_outputs_0_PWDATA       (apb3Router_1__io_outputs_0_PWDATA[31:0]  ), //o
    .io_outputs_0_PRDATA       (io_apbBus_PRDATA[31:0]                   ), //i
    .io_outputs_0_PSLVERROR    (io_apbBus_PSLVERROR                      ), //i
    .io_outputs_1_PADDR        (apb3Router_1__io_outputs_1_PADDR[19:0]   ), //o
    .io_outputs_1_PSEL         (apb3Router_1__io_outputs_1_PSEL          ), //o
    .io_outputs_1_PENABLE      (apb3Router_1__io_outputs_1_PENABLE       ), //o
    .io_outputs_1_PREADY       (axi_uartCtrl_io_apb_PREADY               ), //i
    .io_outputs_1_PWRITE       (apb3Router_1__io_outputs_1_PWRITE        ), //o
    .io_outputs_1_PWDATA       (apb3Router_1__io_outputs_1_PWDATA[31:0]  ), //o
    .io_outputs_1_PRDATA       (axi_uartCtrl_io_apb_PRDATA[31:0]         ), //i
    .io_outputs_1_PSLVERROR    (_zz_75_                                  ), //i
    .io_outputs_2_PADDR        (apb3Router_1__io_outputs_2_PADDR[19:0]   ), //o
    .io_outputs_2_PSEL         (apb3Router_1__io_outputs_2_PSEL          ), //o
    .io_outputs_2_PENABLE      (apb3Router_1__io_outputs_2_PENABLE       ), //o
    .io_outputs_2_PREADY       (axi_timerCtrl_io_apb_PREADY              ), //i
    .io_outputs_2_PWRITE       (apb3Router_1__io_outputs_2_PWRITE        ), //o
    .io_outputs_2_PWDATA       (apb3Router_1__io_outputs_2_PWDATA[31:0]  ), //o
    .io_outputs_2_PRDATA       (axi_timerCtrl_io_apb_PRDATA[31:0]        ), //i
    .io_outputs_2_PSLVERROR    (axi_timerCtrl_io_apb_PSLVERROR           ), //i
    .io_mainClk                (io_mainClk                               ), //i
    .resetCtrl_axiReset        (resetCtrl_axiReset                       )  //i
  );
  always @ (*) begin
    resetCtrl_systemResetUnbuffered = 1'b0;
    if(_zz_76_)begin
      resetCtrl_systemResetUnbuffered = 1'b1;
    end
  end

  assign _zz_1_[5 : 0] = 6'h3f;
  always @ (*) begin
    axi_externalInterrupt = io_externalInterrupt;
    if(axi_uartCtrl_io_interrupt)begin
      axi_externalInterrupt = 1'b1;
    end
  end

  assign io_sdram_ADDR = axi_sdramCtrl_io_sdram_ADDR;
  assign io_sdram_BA = axi_sdramCtrl_io_sdram_BA;
  assign io_sdram_DQ_write = axi_sdramCtrl_io_sdram_DQ_write;
  assign io_sdram_DQ_writeEnable = axi_sdramCtrl_io_sdram_DQ_writeEnable;
  assign io_sdram_DQM = axi_sdramCtrl_io_sdram_DQM;
  assign io_sdram_CASn = axi_sdramCtrl_io_sdram_CASn;
  assign io_sdram_CKE = axi_sdramCtrl_io_sdram_CKE;
  assign io_sdram_CSn = axi_sdramCtrl_io_sdram_CSn;
  assign io_sdram_RASn = axi_sdramCtrl_io_sdram_RASn;
  assign io_sdram_WEn = axi_sdramCtrl_io_sdram_WEn;
  assign _zz_35_ = 1'b0;
  assign _zz_36_ = 1'b1;
  assign io_uart_txd = axi_uartCtrl_io_uart_txd;
  assign _zz_38_ = (! (axi4ReadOnlyDecoder_1__io_input_r_payload_resp == (2'b00)));
  always @ (*) begin
    _zz_2_ = 1'b0;
    if(((axi_cpu_dBus_cmd_valid && _zz_41_) && axi_cpu_dBus_cmd_payload_wr))begin
      _zz_2_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_3_ = 1'b0;
    if((axi4SharedDecoder_1__io_input_b_valid && 1'b1))begin
      _zz_3_ = 1'b1;
    end
  end

  always @ (*) begin
    if((_zz_2_ && (! _zz_3_)))begin
      _zz_5_ = (3'b001);
    end else begin
      if(((! _zz_2_) && _zz_3_))begin
        _zz_5_ = (3'b111);
      end else begin
        _zz_5_ = (3'b000);
      end
    end
  end

  assign _zz_6_ = (! ((((_zz_4_ != (3'b000)) && axi_cpu_dBus_cmd_valid) && (! axi_cpu_dBus_cmd_payload_wr)) || (_zz_4_ == (3'b111))));
  assign _zz_41_ = (streamFork_4__io_input_ready && _zz_6_);
  assign _zz_43_ = (axi_cpu_dBus_cmd_valid && _zz_6_);
  always @ (*) begin
    streamFork_4__io_outputs_1_thrown_valid = streamFork_4__io_outputs_1_valid;
    if(_zz_77_)begin
      streamFork_4__io_outputs_1_thrown_valid = 1'b0;
    end
  end

  always @ (*) begin
    _zz_44_ = streamFork_4__io_outputs_1_thrown_ready;
    if(_zz_77_)begin
      _zz_44_ = 1'b1;
    end
  end

  assign streamFork_4__io_outputs_1_thrown_payload_wr = streamFork_4__io_outputs_1_payload_wr;
  assign streamFork_4__io_outputs_1_thrown_payload_address = streamFork_4__io_outputs_1_payload_address;
  assign streamFork_4__io_outputs_1_thrown_payload_data = streamFork_4__io_outputs_1_payload_data;
  assign streamFork_4__io_outputs_1_thrown_payload_size = streamFork_4__io_outputs_1_payload_size;
  assign streamFork_4__io_outputs_1_thrown_ready = axi4SharedDecoder_1__io_input_w_ready;
  always @ (*) begin
    case(streamFork_4__io_outputs_1_thrown_payload_size)
      2'b00 : begin
        _zz_7_ = (4'b0001);
      end
      2'b01 : begin
        _zz_7_ = (4'b0011);
      end
      default : begin
        _zz_7_ = (4'b1111);
      end
    endcase
  end

  assign _zz_42_ = (! (axi4SharedDecoder_1__io_input_r_m2sPipe_payload_resp == (2'b00)));
  assign _zz_40_ = systemDebugger_1__io_mem_cmd_payload_address[7:0];
  assign io_jtag_tdo = jtagBridge_1__io_jtag_tdo;
  assign _zz_9_ = _zz_11_;
  assign _zz_49_ = (_zz_10_ && _zz_11_);
  assign _zz_10_ = axi_ram_io_axi_arbiter_io_readInputs_0_ar_ready;
  assign _zz_12_ = _zz_14_;
  assign _zz_50_ = (_zz_13_ && _zz_14_);
  assign _zz_13_ = axi_sdramCtrl_io_axi_arbiter_io_readInputs_0_ar_ready;
  assign _zz_45_ = {axi_cpu_iBus_cmd_payload_pc[31 : 2],(2'b00)};
  assign _zz_46_ = (4'b1111);
  assign _zz_47_ = (3'b110);
  assign _zz_48_ = 1'b1;
  assign _zz_15_ = _zz_17_;
  assign _zz_58_ = (_zz_16_ && _zz_17_);
  assign _zz_16_ = axi_apbBridge_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  assign _zz_18_ = _zz_20_;
  assign _zz_59_ = (_zz_19_ && _zz_20_);
  assign _zz_19_ = axi_ram_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  assign _zz_21_ = _zz_23_;
  assign _zz_60_ = (_zz_22_ && _zz_23_);
  assign _zz_22_ = axi_sdramCtrl_io_axi_arbiter_io_sharedInputs_0_arw_ready;
  assign _zz_51_ = {1'd0, streamFork_4__io_outputs_0_payload_size};
  assign _zz_52_ = (4'b1111);
  assign _zz_53_ = (3'b010);
  assign _zz_54_ = (_zz_7_ <<< streamFork_4__io_outputs_1_thrown_payload_address[1 : 0]);
  assign _zz_55_ = 1'b1;
  assign _zz_56_ = 1'b1;
  assign _zz_57_ = ((1'b1 && (! axi4SharedDecoder_1__io_input_r_m2sPipe_valid)) || axi4SharedDecoder_1__io_input_r_m2sPipe_ready);
  assign axi4SharedDecoder_1__io_input_r_m2sPipe_valid = axi4SharedDecoder_1__io_input_r_m2sPipe_rValid;
  assign axi4SharedDecoder_1__io_input_r_m2sPipe_payload_data = axi4SharedDecoder_1__io_input_r_m2sPipe_rData_data;
  assign axi4SharedDecoder_1__io_input_r_m2sPipe_payload_resp = axi4SharedDecoder_1__io_input_r_m2sPipe_rData_resp;
  assign axi4SharedDecoder_1__io_input_r_m2sPipe_payload_last = axi4SharedDecoder_1__io_input_r_m2sPipe_rData_last;
  assign axi4SharedDecoder_1__io_input_r_m2sPipe_ready = 1'b1;
  assign _zz_61_ = axi4ReadOnlyDecoder_1__io_outputs_0_ar_payload_addr[17:0];
  assign _zz_24_[2 : 0] = (3'b000);
  assign _zz_25_[7 : 0] = 8'h0;
  assign _zz_62_ = (3'b010);
  assign _zz_63_ = (2'b01);
  assign _zz_64_ = axi4SharedDecoder_1__io_sharedOutputs_1_arw_payload_addr[17:0];
  assign _zz_26_[2 : 0] = (3'b000);
  assign _zz_27_[7 : 0] = 8'h0;
  assign _zz_65_ = (2'b01);
  assign axi_ram_io_axi_arbiter_io_output_arw_halfPipe_valid = axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_valid;
  assign axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_addr = axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_addr;
  assign axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_id = axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_id;
  assign axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_len = axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_len;
  assign axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_size = axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_size;
  assign axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_burst = axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_burst;
  assign axi_ram_io_axi_arbiter_io_output_arw_halfPipe_payload_write = axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_write;
  assign axi_ram_io_axi_arbiter_io_output_arw_halfPipe_ready = axi_ram_io_axi_arw_ready;
  assign axi_ram_io_axi_arbiter_io_output_w_s2mPipe_valid = (axi_ram_io_axi_arbiter_io_output_w_valid || axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rValid);
  assign _zz_66_ = (! axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rValid);
  assign axi_ram_io_axi_arbiter_io_output_w_s2mPipe_payload_data = (axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rValid ? axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rData_data : axi_ram_io_axi_arbiter_io_output_w_payload_data);
  assign axi_ram_io_axi_arbiter_io_output_w_s2mPipe_payload_strb = (axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rValid ? axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rData_strb : axi_ram_io_axi_arbiter_io_output_w_payload_strb);
  assign axi_ram_io_axi_arbiter_io_output_w_s2mPipe_payload_last = (axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rValid ? axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rData_last : axi_ram_io_axi_arbiter_io_output_w_payload_last);
  assign axi_ram_io_axi_arbiter_io_output_w_s2mPipe_ready = ((1'b1 && (! axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_valid)) || axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_ready);
  assign axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_valid = axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rValid;
  assign axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_data = axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rData_data;
  assign axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_strb = axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rData_strb;
  assign axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_last = axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rData_last;
  assign axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_ready = axi_ram_io_axi_w_ready;
  assign _zz_67_ = axi4ReadOnlyDecoder_1__io_outputs_1_ar_payload_addr[25:0];
  assign _zz_28_[2 : 0] = (3'b000);
  assign _zz_29_[7 : 0] = 8'h0;
  assign _zz_68_ = (3'b010);
  assign _zz_69_ = (2'b01);
  assign _zz_70_ = axi4SharedDecoder_1__io_sharedOutputs_2_arw_payload_addr[25:0];
  assign _zz_30_[2 : 0] = (3'b000);
  assign _zz_31_[7 : 0] = 8'h0;
  assign _zz_71_ = (2'b01);
  assign axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_valid = axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_valid;
  assign axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_addr = axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_addr;
  assign axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_id = axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_id;
  assign axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_len = axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_len;
  assign axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_size = axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_size;
  assign axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_burst = axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_burst;
  assign axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_payload_write = axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_write;
  assign axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_ready = axi_sdramCtrl_io_axi_arw_ready;
  assign axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_valid = (axi_sdramCtrl_io_axi_arbiter_io_output_w_valid || axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rValid);
  assign _zz_72_ = (! axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rValid);
  assign axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_payload_data = (axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rValid ? axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rData_data : axi_sdramCtrl_io_axi_arbiter_io_output_w_payload_data);
  assign axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_payload_strb = (axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rValid ? axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rData_strb : axi_sdramCtrl_io_axi_arbiter_io_output_w_payload_strb);
  assign axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_payload_last = (axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rValid ? axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rData_last : axi_sdramCtrl_io_axi_arbiter_io_output_w_payload_last);
  assign axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_ready = ((1'b1 && (! axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_valid)) || axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_ready);
  assign axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_valid = axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rValid;
  assign axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_data = axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rData_data;
  assign axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_strb = axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rData_strb;
  assign axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_payload_last = axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rData_last;
  assign axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_ready = axi_sdramCtrl_io_axi_w_ready;
  assign _zz_73_ = axi4SharedDecoder_1__io_sharedOutputs_0_arw_payload_addr[19:0];
  assign _zz_32_[3 : 0] = (4'b0000);
  assign _zz_33_[7 : 0] = 8'h0;
  assign _zz_74_ = (2'b01);
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_valid = axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_valid;
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_addr = axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_addr;
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_id = axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_id;
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_len = axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_len;
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_size = axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_size;
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_burst = axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_burst;
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_payload_write = axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_write;
  assign axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_ready = axi_apbBridge_io_axi_arw_ready;
  assign axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_valid = axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_valid;
  assign axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_data = axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_payload_data;
  assign axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_strb = axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_payload_strb;
  assign axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_payload_last = axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_payload_last;
  assign axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_ready = axi_apbBridge_io_axi_w_ready;
  assign io_apbBus_PADDR = apb3Router_1__io_outputs_0_PADDR[15:0];
  assign io_apbBus_PSEL = apb3Router_1__io_outputs_0_PSEL;
  assign io_apbBus_PENABLE = apb3Router_1__io_outputs_0_PENABLE;
  assign io_apbBus_PWRITE = apb3Router_1__io_outputs_0_PWRITE;
  assign io_apbBus_PWDATA = apb3Router_1__io_outputs_0_PWDATA;
  assign _zz_37_ = apb3Router_1__io_outputs_1_PADDR[4:0];
  assign _zz_75_ = 1'b0;
  assign _zz_34_ = apb3Router_1__io_outputs_2_PADDR[7:0];
  assign _zz_39_ = 1'b0;
  always @ (posedge io_mainClk) begin
    if(_zz_76_)begin
      resetCtrl_systemResetCounter <= (resetCtrl_systemResetCounter + 6'h01);
    end
    if(io_asyncReset_buffercc_io_dataOut)begin
      resetCtrl_systemResetCounter <= 6'h0;
    end
  end

  always @ (posedge io_mainClk) begin
    resetCtrl_systemReset <= resetCtrl_systemResetUnbuffered;
    resetCtrl_axiReset <= resetCtrl_systemResetUnbuffered;
    if(axi_cpu_debug_resetOut_regNext)begin
      resetCtrl_axiReset <= 1'b1;
    end
  end

  always @ (posedge io_mainClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      _zz_4_ <= (3'b000);
      _zz_11_ <= 1'b0;
      _zz_14_ <= 1'b0;
      _zz_17_ <= 1'b0;
      _zz_20_ <= 1'b0;
      _zz_23_ <= 1'b0;
      axi4SharedDecoder_1__io_input_r_m2sPipe_rValid <= 1'b0;
      axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_valid <= 1'b0;
      axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_ready <= 1'b1;
      axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rValid <= 1'b0;
      axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rValid <= 1'b0;
      axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_valid <= 1'b0;
      axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_ready <= 1'b1;
      axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rValid <= 1'b0;
      axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rValid <= 1'b0;
      axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_valid <= 1'b0;
      axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_ready <= 1'b1;
      axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_valid <= 1'b0;
      axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_ready <= 1'b1;
    end else begin
      _zz_4_ <= (_zz_4_ + _zz_5_);
      if(axi4ReadOnlyDecoder_1__io_outputs_0_ar_valid)begin
        _zz_11_ <= 1'b1;
      end
      if((_zz_9_ && _zz_10_))begin
        _zz_11_ <= 1'b0;
      end
      if(axi4ReadOnlyDecoder_1__io_outputs_1_ar_valid)begin
        _zz_14_ <= 1'b1;
      end
      if((_zz_12_ && _zz_13_))begin
        _zz_14_ <= 1'b0;
      end
      if(axi4SharedDecoder_1__io_sharedOutputs_0_arw_valid)begin
        _zz_17_ <= 1'b1;
      end
      if((_zz_15_ && _zz_16_))begin
        _zz_17_ <= 1'b0;
      end
      if(axi4SharedDecoder_1__io_sharedOutputs_1_arw_valid)begin
        _zz_20_ <= 1'b1;
      end
      if((_zz_18_ && _zz_19_))begin
        _zz_20_ <= 1'b0;
      end
      if(axi4SharedDecoder_1__io_sharedOutputs_2_arw_valid)begin
        _zz_23_ <= 1'b1;
      end
      if((_zz_21_ && _zz_22_))begin
        _zz_23_ <= 1'b0;
      end
      if(_zz_57_)begin
        axi4SharedDecoder_1__io_input_r_m2sPipe_rValid <= axi4SharedDecoder_1__io_input_r_valid;
      end
      if(_zz_78_)begin
        axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_valid <= axi_ram_io_axi_arbiter_io_output_arw_valid;
        axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_ready <= (! axi_ram_io_axi_arbiter_io_output_arw_valid);
      end else begin
        axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_valid <= (! axi_ram_io_axi_arbiter_io_output_arw_halfPipe_ready);
        axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_ready <= axi_ram_io_axi_arbiter_io_output_arw_halfPipe_ready;
      end
      if(axi_ram_io_axi_arbiter_io_output_w_s2mPipe_ready)begin
        axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rValid <= 1'b0;
      end
      if(_zz_79_)begin
        axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rValid <= axi_ram_io_axi_arbiter_io_output_w_valid;
      end
      if(axi_ram_io_axi_arbiter_io_output_w_s2mPipe_ready)begin
        axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rValid <= axi_ram_io_axi_arbiter_io_output_w_s2mPipe_valid;
      end
      if(_zz_80_)begin
        axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_valid <= axi_sdramCtrl_io_axi_arbiter_io_output_arw_valid;
        axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_ready <= (! axi_sdramCtrl_io_axi_arbiter_io_output_arw_valid);
      end else begin
        axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_valid <= (! axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_ready);
        axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_ready <= axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_ready;
      end
      if(axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_ready)begin
        axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rValid <= 1'b0;
      end
      if(_zz_81_)begin
        axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rValid <= axi_sdramCtrl_io_axi_arbiter_io_output_w_valid;
      end
      if(axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_ready)begin
        axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rValid <= axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_valid;
      end
      if(_zz_82_)begin
        axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_valid <= axi_apbBridge_io_axi_arbiter_io_output_arw_valid;
        axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_ready <= (! axi_apbBridge_io_axi_arbiter_io_output_arw_valid);
      end else begin
        axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_valid <= (! axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_ready);
        axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_ready <= axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_ready;
      end
      if(_zz_83_)begin
        axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_valid <= axi_apbBridge_io_axi_arbiter_io_output_w_valid;
        axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_ready <= (! axi_apbBridge_io_axi_arbiter_io_output_w_valid);
      end else begin
        axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_valid <= (! axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_ready);
        axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_ready <= axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_ready;
      end
    end
  end

  always @ (posedge io_mainClk) begin
    axi_cpu_debug_resetOut_regNext <= axi_cpu_debug_resetOut;
  end

  always @ (posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if (resetCtrl_systemReset) begin
      _zz_8_ <= 1'b0;
    end else begin
      _zz_8_ <= (systemDebugger_1__io_mem_cmd_valid && axi_cpu_debug_bus_cmd_ready);
    end
  end

  always @ (posedge io_mainClk) begin
    if(_zz_57_)begin
      axi4SharedDecoder_1__io_input_r_m2sPipe_rData_data <= axi4SharedDecoder_1__io_input_r_payload_data;
      axi4SharedDecoder_1__io_input_r_m2sPipe_rData_resp <= axi4SharedDecoder_1__io_input_r_payload_resp;
      axi4SharedDecoder_1__io_input_r_m2sPipe_rData_last <= axi4SharedDecoder_1__io_input_r_payload_last;
    end
    if(_zz_78_)begin
      axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_addr <= axi_ram_io_axi_arbiter_io_output_arw_payload_addr;
      axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_id <= axi_ram_io_axi_arbiter_io_output_arw_payload_id;
      axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_len <= axi_ram_io_axi_arbiter_io_output_arw_payload_len;
      axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_size <= axi_ram_io_axi_arbiter_io_output_arw_payload_size;
      axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_burst <= axi_ram_io_axi_arbiter_io_output_arw_payload_burst;
      axi_ram_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_write <= axi_ram_io_axi_arbiter_io_output_arw_payload_write;
    end
    if(_zz_79_)begin
      axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rData_data <= axi_ram_io_axi_arbiter_io_output_w_payload_data;
      axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rData_strb <= axi_ram_io_axi_arbiter_io_output_w_payload_strb;
      axi_ram_io_axi_arbiter_io_output_w_s2mPipe_rData_last <= axi_ram_io_axi_arbiter_io_output_w_payload_last;
    end
    if(axi_ram_io_axi_arbiter_io_output_w_s2mPipe_ready)begin
      axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rData_data <= axi_ram_io_axi_arbiter_io_output_w_s2mPipe_payload_data;
      axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rData_strb <= axi_ram_io_axi_arbiter_io_output_w_s2mPipe_payload_strb;
      axi_ram_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rData_last <= axi_ram_io_axi_arbiter_io_output_w_s2mPipe_payload_last;
    end
    if(_zz_80_)begin
      axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_addr <= axi_sdramCtrl_io_axi_arbiter_io_output_arw_payload_addr;
      axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_id <= axi_sdramCtrl_io_axi_arbiter_io_output_arw_payload_id;
      axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_len <= axi_sdramCtrl_io_axi_arbiter_io_output_arw_payload_len;
      axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_size <= axi_sdramCtrl_io_axi_arbiter_io_output_arw_payload_size;
      axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_burst <= axi_sdramCtrl_io_axi_arbiter_io_output_arw_payload_burst;
      axi_sdramCtrl_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_write <= axi_sdramCtrl_io_axi_arbiter_io_output_arw_payload_write;
    end
    if(_zz_81_)begin
      axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rData_data <= axi_sdramCtrl_io_axi_arbiter_io_output_w_payload_data;
      axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rData_strb <= axi_sdramCtrl_io_axi_arbiter_io_output_w_payload_strb;
      axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_rData_last <= axi_sdramCtrl_io_axi_arbiter_io_output_w_payload_last;
    end
    if(axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_ready)begin
      axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rData_data <= axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_payload_data;
      axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rData_strb <= axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_payload_strb;
      axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_m2sPipe_rData_last <= axi_sdramCtrl_io_axi_arbiter_io_output_w_s2mPipe_payload_last;
    end
    if(_zz_82_)begin
      axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_addr <= axi_apbBridge_io_axi_arbiter_io_output_arw_payload_addr;
      axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_id <= axi_apbBridge_io_axi_arbiter_io_output_arw_payload_id;
      axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_len <= axi_apbBridge_io_axi_arbiter_io_output_arw_payload_len;
      axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_size <= axi_apbBridge_io_axi_arbiter_io_output_arw_payload_size;
      axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_burst <= axi_apbBridge_io_axi_arbiter_io_output_arw_payload_burst;
      axi_apbBridge_io_axi_arbiter_io_output_arw_halfPipe_regs_payload_write <= axi_apbBridge_io_axi_arbiter_io_output_arw_payload_write;
    end
    if(_zz_83_)begin
      axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_payload_data <= axi_apbBridge_io_axi_arbiter_io_output_w_payload_data;
      axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_payload_strb <= axi_apbBridge_io_axi_arbiter_io_output_w_payload_strb;
      axi_apbBridge_io_axi_arbiter_io_output_w_halfPipe_regs_payload_last <= axi_apbBridge_io_axi_arbiter_io_output_w_payload_last;
    end
  end


endmodule

module System (
  input               clk,
  input               reset,
  output     [12:0]   DRAM_ADDR,
  output     [1:0]    DRAM_BA,
  output              DRAM_CAS_N,
  output              DRAM_CKE,
  output              DRAM_CLK,
  output              DRAM_CS_N,
  input      [15:0]   DRAM_DQ_IN,
  output     [15:0]   DRAM_DQ_OUT,
  output     [15:0]   DRAM_DQ_WE,
  output              DRAM_RAS_N,
  output              DRAM_WE_N,
  output     [1:0]    DRAM_DQM,
  input               jtag_tdi,
  input               jtag_tms,
  input               jtag_tck,
  output              jtag_tdo,
  input               uart_rx,
  output              uart_tx,
  input               externalInterrupt,
  output     [15:0]   apbBus_PADDR,
  output     [0:0]    apbBus_PSEL,
  output              apbBus_PENABLE,
  input               apbBus_PREADY,
  output              apbBus_PWRITE,
  output     [31:0]   apbBus_PWDATA,
  input      [31:0]   apbBus_PRDATA,
  input               apbBus_PSLVERROR,
  output              main_clk 
);
  wire                pll_1__c0;
  wire                pll_1__c1;
  wire       [12:0]   core_io_sdram_ADDR;
  wire       [1:0]    core_io_sdram_BA;
  wire                core_io_sdram_CASn;
  wire                core_io_sdram_CKE;
  wire                core_io_sdram_CSn;
  wire       [1:0]    core_io_sdram_DQM;
  wire                core_io_sdram_RASn;
  wire                core_io_sdram_WEn;
  wire       [15:0]   core_io_sdram_DQ_write;
  wire       [15:0]   core_io_sdram_DQ_writeEnable;
  wire                core_io_jtag_tdo;
  wire                core_io_uart_txd;
  wire       [15:0]   core_io_apbBus_PADDR;
  wire       [0:0]    core_io_apbBus_PSEL;
  wire                core_io_apbBus_PENABLE;
  wire                core_io_apbBus_PWRITE;
  wire       [31:0]   core_io_apbBus_PWDATA;
  wire                clk_SDRAM;
  wire                clk_1_;

  PLL pll_1_ ( 
    .inclk0    (clk        ), //i
    .c0        (pll_1__c0  ), //o
    .c1        (pll_1__c1  )  //o
  );
  VexRISCVSoftcore core ( 
    .io_sdram_ADDR              (core_io_sdram_ADDR[12:0]            ), //o
    .io_sdram_BA                (core_io_sdram_BA[1:0]               ), //o
    .io_sdram_DQ_read           (DRAM_DQ_IN[15:0]                    ), //i
    .io_sdram_DQ_write          (core_io_sdram_DQ_write[15:0]        ), //o
    .io_sdram_DQ_writeEnable    (core_io_sdram_DQ_writeEnable[15:0]  ), //o
    .io_sdram_DQM               (core_io_sdram_DQM[1:0]              ), //o
    .io_sdram_CASn              (core_io_sdram_CASn                  ), //o
    .io_sdram_CKE               (core_io_sdram_CKE                   ), //o
    .io_sdram_CSn               (core_io_sdram_CSn                   ), //o
    .io_sdram_RASn              (core_io_sdram_RASn                  ), //o
    .io_sdram_WEn               (core_io_sdram_WEn                   ), //o
    .io_externalInterrupt       (externalInterrupt                   ), //i
    .io_jtag_tms                (jtag_tms                            ), //i
    .io_jtag_tdi                (jtag_tdi                            ), //i
    .io_jtag_tdo                (core_io_jtag_tdo                    ), //o
    .io_jtag_tck                (jtag_tck                            ), //i
    .io_uart_txd                (core_io_uart_txd                    ), //o
    .io_uart_rxd                (uart_rx                             ), //i
    .io_asyncReset              (reset                               ), //i
    .io_mainClk                 (clk_1_                              ), //i
    .io_apbBus_PADDR            (core_io_apbBus_PADDR[15:0]          ), //o
    .io_apbBus_PSEL             (core_io_apbBus_PSEL                 ), //o
    .io_apbBus_PENABLE          (core_io_apbBus_PENABLE              ), //o
    .io_apbBus_PREADY           (apbBus_PREADY                       ), //i
    .io_apbBus_PWRITE           (core_io_apbBus_PWRITE               ), //o
    .io_apbBus_PWDATA           (core_io_apbBus_PWDATA[31:0]         ), //o
    .io_apbBus_PRDATA           (apbBus_PRDATA[31:0]                 ), //i
    .io_apbBus_PSLVERROR        (apbBus_PSLVERROR                    )  //i
  );
  assign clk_SDRAM = pll_1__c0;
  assign clk_1_ = pll_1__c1;
  assign main_clk = clk_1_;
  assign DRAM_CLK = clk_SDRAM;
  assign jtag_tdo = core_io_jtag_tdo;
  assign DRAM_ADDR = core_io_sdram_ADDR;
  assign DRAM_BA = core_io_sdram_BA;
  assign DRAM_DQ_OUT = core_io_sdram_DQ_write;
  assign DRAM_DQ_WE = core_io_sdram_DQ_writeEnable;
  assign DRAM_DQM = core_io_sdram_DQM;
  assign DRAM_CAS_N = core_io_sdram_CASn;
  assign DRAM_CKE = core_io_sdram_CKE;
  assign DRAM_CS_N = core_io_sdram_CSn;
  assign DRAM_RAS_N = core_io_sdram_RASn;
  assign DRAM_WE_N = core_io_sdram_WEn;
  assign uart_tx = core_io_uart_txd;
  assign apbBus_PADDR = core_io_apbBus_PADDR;
  assign apbBus_PSEL = core_io_apbBus_PSEL;
  assign apbBus_PENABLE = core_io_apbBus_PENABLE;
  assign apbBus_PWRITE = core_io_apbBus_PWRITE;
  assign apbBus_PWDATA = core_io_apbBus_PWDATA;

endmodule
