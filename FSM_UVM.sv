`timescale 1ns/1ps

import uvm_pkg::*; 
`include "uvm_macros.svh"

//////////////////////////////////////////// Sequence Item ///////////////////////////////////
 class Sequenceitem0 extends uvm_sequence_item;
bit		   rst;
bit [31:0]	in_data;
bit		   in_valid;
bit [4:0]	disp_sig;
bit		   data_valid;
bit [31:0]	out_data;
`uvm_object_utils_begin(Sequenceitem0) 
`uvm_field_int(rst,UVM_DEFAULT)
`uvm_field_int(in_data,UVM_DEFAULT)
`uvm_field_int(in_valid,UVM_DEFAULT)
`uvm_field_int(disp_sig,UVM_DEFAULT)
`uvm_field_int(data_valid,UVM_DEFAULT)
`uvm_field_int(out_data,UVM_DEFAULT)
`uvm_object_utils_end
function new(input string inst = "SeqItem");
super.new(inst);
endfunction : new

endclass : Sequenceitem0   

//////////////////////////////////////////// Interface ///////////////////////////////////

interface __IF;

logic       clk;
logic			rst;
logic	[31:0]	in_data;
logic			in_valid;
logic	[4:0]	disp_sig;
logic			data_valid;
logic	[31:0]	out_data;

endinterface: __IF

//////////////////////////////////////////// Generic Sequence ///////////////////////////////////
 
class Generic_Sequence extends uvm_sequence#(Sequenceitem0);

`uvm_object_utils(Generic_Sequence)

   function new(input string inst = "GEN");
        super.new(inst);
   endfunction : new

Sequenceitem0 seqitem;     
task body();

      seqitem = Sequenceitem0::type_id::create("TRAN");
  
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd0;               // rst_1
                    seqitem.in_valid =  1'd0;  
                 finish_item(seqitem);   
           /*      `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer); */
                    
                 #20ns;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd0;  
                    seqitem.in_data =  32'd1;            // rst_0
                    seqitem.in_valid =  1'd0;  
                 finish_item(seqitem);    
              /*   `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);   */                  
                 #20ns;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1000;          // Same Bank#
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
           /*      `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);    */                 
                 #20ns;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;           // English 
                    seqitem.in_valid =  1'd1;
                 finish_item(seqitem);    
           /*      `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);      */               
                 #20ns;

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1000;        // PIN Number
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
            /*     `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);          */           
                 #20ns;

            /************************************280:282 - Lang without valid signal**************************/                         
                 start_item(seqitem);       
                    seqitem.rst =  1'd0;  
                    seqitem.in_data =  32'd1;            // rst_0
                    seqitem.in_valid =  1'd0;  
                 finish_item(seqitem);    
              /*   `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);   */                  
                 #20ns;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1000;          // Same Bank#
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
           /*      `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);    */                 
                 #20ns;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;           // English
                    seqitem.in_valid =  1'd0;  
                 finish_item(seqitem);    
           /*      `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);      */               
                 #20ns;  

            /************************************306 - pin number without valid signal**************************/
                 start_item(seqitem);       
                    seqitem.rst =  1'd0;  
                    seqitem.in_data =  32'd1;            // rst_0
                    seqitem.in_valid =  1'd0;  
                 finish_item(seqitem);    
              /*   `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);   */                  
                 #20ns;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1000;          // Same Bank#
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
           /*      `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);    */                 
                 #20ns;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;           // English
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
           /*      `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);      */               
                 #20ns; 

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1000;        // PIN Number
                    seqitem.in_valid =  1'd0;  
                 finish_item(seqitem);    
            /*     `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);          */           
                 #20ns;   

            /************************************322:323 - option without valid signal**************************/  
                 start_item(seqitem);       
                    seqitem.rst =  1'd0;  
                    seqitem.in_data =  32'd1;            // rst_0
                    seqitem.in_valid =  1'd0;  
                 finish_item(seqitem);    
              /*   `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);   */                  
                 #20ns;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1000;          // Same Bank#
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
           /*      `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);    */                 
                 #20ns;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;           // English
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
           /*      `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);      */               
                 #20ns; 

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1000;        // PIN Number
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
            /*     `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);          */           
                 #20ns;  

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd2;          //Deposit
                    seqitem.in_valid =  1'd0;  
                 finish_item(seqitem);    
        /*         `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);    */
                 #20; 
 
                 `uvm_info("Virtual Sequence","Generic Sequence has finished",UVM_NONE) 
                                        
endtask : body  

endclass : Generic_Sequence 

//////////////////////////////////////////// Deposit Sequence ///////////////////////////////////
class deposit_sequence extends uvm_sequence#(Sequenceitem0);

`uvm_object_utils(deposit_sequence)

   function new(input string inst = "GEN");
        super.new(inst);
   endfunction : new

Sequenceitem0 seqitem;     
task body();

      seqitem = Sequenceitem0::type_id::create("TRAN");
  
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                        //rst = 1
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);   
          /*      `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);  */
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd0;  
                    seqitem.in_data =  32'd1;                         //rst = 0     
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
          /*       `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);       */              
                 #20;    
                          
                 start_item(seqitem);                                //rst = 1
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1000;                      //Bank
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
          /*       `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);    */
                 #40;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                       //English
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
           /*      `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);    */
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd2000;                  //Correct PIN
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
            /*     `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);    */
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd2;                     //Deposit
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
        /*         `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);    */
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd500;                 //Cash
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
       /*          `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);    */
                 #(20 * 9);    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd0;                  //Wrong CASH
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
         /*        `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);    */
                 #(20 * 10);    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd300;                 //Cash
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
          /*       `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);    */
                 #(20 * 9);   

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                  //Correct CASH
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
           /*      `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);    */
                 #20;

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd0;                  //No anthr option
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
        /*         `uvm_info("SEQ","Trans Generated",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);    */
                 #20;   

                 #100;

                 `uvm_info("Virtual Sequence","Deposit Sequence has finished",UVM_NONE)
                                        

endtask : body  

endclass : deposit_sequence

//////////////////////////////////////////// Balance Sequence ///////////////////////////////////
class balance_sequence extends uvm_sequence#(Sequenceitem0);

`uvm_object_utils(balance_sequence)

   function new(input string inst = "GEN");
        super.new(inst);
   endfunction : new

Sequenceitem0 seqitem;     
task body();

      seqitem = Sequenceitem0::type_id::create("TRAN");
  
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;            //rst1
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd0;  
                    seqitem.in_data =  32'd1;            //rst0
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1000;         //bank
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #40;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd0;            //arabic
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd2000;         //pin
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd3;            //balance check
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #40;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd0;          //without receipt
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;          //anthr opt
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20; 

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd3;            //balance check
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #40;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;          //with receipt
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #(20*10);  

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd0;          //no anthr opt
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;                                   

                 #100;  

                 `uvm_info("Virtual Sequence","Balance Sequence has finished",UVM_NONE) 
                                        
endtask : body  

endclass : balance_sequence 

//////////////////////////////////////////// Pin Change Sequence ///////////////////////////////////
class pinchange_sequence extends uvm_sequence#(Sequenceitem0);

`uvm_object_utils(pinchange_sequence)

   function new(input string inst = "GEN");
        super.new(inst);
   endfunction : new

Sequenceitem0 seqitem;     
task body();

      seqitem = Sequenceitem0::type_id::create("TRAN");
  
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;    //rst = 1
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd0;  
                    seqitem.in_data =  32'd1;      //rst = 0
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1000;   //bank
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #40;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd0;       //arabic
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd2000;     //pin
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;     
                    seqitem.in_data =  32'd4;        //pin change 
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd2001;      //new pin
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd2001;      //same new pin
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #(20*10);    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;          // anthr opt
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20; 
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;     
                    seqitem.in_data =  32'd4;        //pin change 
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd2001;      //new pin
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;   

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd2002;      //diff new pin
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #40;   

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd2003;      //new pin
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;                                   
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd2003;      //same new pin
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #(20*10);    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd0;          // no anthr opt
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;                   

                 #100;
                 `uvm_info("Virtual Sequence","Pin change Sequence has finished",UVM_NONE)
                                        
endtask : body  

endclass : pinchange_sequence

//////////////////////////////////////////// withdraw Sequence ///////////////////////////////////

class withdraw_sequence extends uvm_sequence#(Sequenceitem0);

`uvm_object_utils(withdraw_sequence)

   function new(input string inst = "GEN");
        super.new(inst);
   endfunction : new

Sequenceitem0 seqitem;     
task body();

      seqitem = Sequenceitem0::type_id::create("TRAN");
  
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                  //rst_1
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd0;  
                    seqitem.in_data =  32'd1;                  //rst_0               
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'hFFFFFFFF;           //diff bank 
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #40;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                  //English       
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd2000;               //PIN 
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                  //withdraw               
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd0;                  //regular 
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd200;               //amount        
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #(20*11);    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                  //receipt  
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #(20*10);    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                  //there is anthr option  
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;  

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                  //withdraw               
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20; 

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd0;                  //regular 
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;   

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd3000;               //amount exceeds the balance      
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #40;  

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd300;               //correct amount     
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #(20*11);     

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd0;                //without receipt  
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #40;  

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                //there is anthr operation 
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20; 

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                  //withdraw               
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20; 

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                  //fast cash 
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd0;               // amount = 100 L.E    
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #(20*11);  

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd0;                //without receipt  
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;  

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                //no anthr operation 
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;                                                                                                                                                  

            /**************************   Fast Cash : 200 L.E    **********************************/
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                  //withdraw               
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20; 

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                  //fast cash 
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;               // amount = 200 L.E    
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #(20*11);  

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd0;                //without receipt  
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;  

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                // anthr operation 
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20; 
            /**************************   Fast Cash : 500 L.E    **********************************/
                 start_item(seqitem);       
                    seqitem.rst =  1'd0;  
                    seqitem.in_data =  32'd1;                  //rst_0               
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'hFFFFFFFF;           //diff bank 
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #40;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                  //English       
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd2000;               //PIN 
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                  //withdraw               
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;                
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                  //Fast cash 
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20; 

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd2;               // amount = 500 L.E    
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #(20*11);  

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd0;                //without receipt  
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;  

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                // anthr operation 
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20; 

            /**************************   Fast Cash : 1000 L.E    **********************************/
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                  //withdraw               
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20; 

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                  //fast cash 
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd3;               // amount = 1000 L.E    
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #(20*11);  

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd0;                //without receipt  
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;  

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;                // anthr operation 
                    seqitem.in_valid =  1'd0;  
                 finish_item(seqitem);    
                    
                 #20;                 



                 `uvm_info("Virtual Sequence","Withdraw Sequence has finished",UVM_NONE)
                                        
endtask : body  

endclass : withdraw_sequence 
//////////////////////////////////////////// Cross Sequence /////////////////////////////////
class cross_sequence extends uvm_sequence#(Sequenceitem0);

`uvm_object_utils(cross_sequence)

   function new(input string inst = "GEN");
        super.new(inst);
   endfunction : new

Sequenceitem0 seqitem;     
task body();

      seqitem = Sequenceitem0::type_id::create("TRAN");
  
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;             //rst_1
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd0;  
                    seqitem.in_data =  32'd1;             //rst_0  
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1000;         //Same bank card number
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #40;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;            //English    
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd2000;        //PIN
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd2;           //Deposit
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd15000;      //Cash
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #(20 * 9);    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;         //True Cash
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #40;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;        //anthr operation
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd3;       //Balance
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #40;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;      //with receipt
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #(20*10);    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;      //anthr operation 
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20; 

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd1;      //withdraw
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;                     
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd0;       //regular
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd12000;    //amount exceeds bank limit
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #40;  

                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd20000;    //amount exceeds balance limit
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #40;                     
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd500;    //correct amount
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #(20*11);    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd0;      //no receipt
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;    
                          
                 start_item(seqitem);       
                    seqitem.rst =  1'd1;  
                    seqitem.in_data =  32'd0;   // no operation
                    seqitem.in_valid =  1'd1;  
                 finish_item(seqitem);    
                    
                 #20;   
                  
                 `uvm_info("Virtual Sequence","Cross Sequence has finished",UVM_NONE)
                                        
endtask : body  

endclass : cross_sequence

//////////////////////////////////////////// Driver ///////////////////////////////////

class Driver0 extends uvm_driver#(Sequenceitem0);
`uvm_component_utils(Driver0)
function new(string name = "DRIV" ,  uvm_component parent = null);
 	 super.new(name,parent);
 endfunction: new

virtual __IF vif;
 function void build_phase(uvm_phase phase);
 	 if(!(uvm_config_db #(virtual __IF)::get(this, "","vif", vif)))
 	 	 `uvm_fatal("NOVIF","Interface Not Found");
endfunction : build_phase

task run_phase(uvm_phase phase);
 	 Sequenceitem0 seqitem;
 	 forever begin
 	 	 seq_item_port.get_next_item(seqitem);
	 	 	vif.rst = seqitem.rst;
	 	 	vif.in_data = seqitem.in_data;
	 	 	vif.in_valid = seqitem.in_valid;
    /*  `uvm_info("DRV","Trans DRIVEN",UVM_NONE)
                        seqitem.print(uvm_default_line_printer); */
 	 	 seq_item_port.item_done();
 	 end
 endtask : run_phase

endclass : Driver0

//////////////////////////////////////////// Sequencer ///////////////////////////////////
class Sequencer0 extends uvm_sequencer#(Sequenceitem0);

`uvm_component_utils(Sequencer0)

function new(input string inst = "SEQR", uvm_component parent);
super.new(inst,parent);
endfunction : new

endclass
//////////////////////////////////////////// Virtual Sequence //////////////////////////
class virtual_sequence extends uvm_sequence;

`uvm_object_utils(virtual_sequence)

Generic_Sequence   gen_sequence;
deposit_sequence   dep_sequence;
balance_sequence   bal_sequence;
pinchange_sequence pin_sequence;
withdraw_sequence draw_sequence;
cross_sequence     crs_sequence;

Sequencer0 sequencer;

 task pre_body();
gen_sequence = Generic_Sequence::type_id::create("GEN");
dep_sequence = deposit_sequence::type_id::create("GEN");
bal_sequence = balance_sequence::type_id::create("GEN");
pin_sequence = pinchange_sequence::type_id::create("GEN");
draw_sequence = withdraw_sequence::type_id::create("GEN");
crs_sequence = cross_sequence::type_id::create("GEN");
endtask : pre_body


task body();

gen_sequence.start(sequencer);
dep_sequence.start(sequencer);
bal_sequence.start(sequencer);
pin_sequence.start(sequencer);
draw_sequence.start(sequencer);
crs_sequence.start(sequencer);

endtask : body

endclass : virtual_sequence

//////////////////////////////////////////// Monitor ///////////////////////////////////

class Monitor0 extends uvm_monitor;

`uvm_component_utils(Monitor0)

//Interface Handler
virtual __IF vif;
//Analysis Port Handler
uvm_analysis_port #(Sequenceitem0) item_collected_port;
//Sequence Item Handler
Sequenceitem0 seqitem;

  //starting build phase
virtual function void build_phase (uvm_phase phase);
super.build_phase(phase);
   
   //Interface
   if(!uvm_config_db#(virtual __IF)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF","Interface Not Found");

   //Sequence Item
   seqitem = Sequenceitem0::type_id::create("seqItem",this);

  //end build phase
endfunction : build_phase


  //starting run phase
virtual task run_phase (uvm_phase phase);
    forever begin   
        @(negedge vif.clk);

        //monitoring
        seqitem.rst = vif.rst;
        seqitem.in_data = vif.in_data;
        seqitem.in_valid = vif.in_valid;        
        seqitem.disp_sig = vif.disp_sig;
        seqitem.data_valid = vif.data_valid;
        seqitem.out_data = vif.out_data;


        // write into port
        item_collected_port.write(seqitem);

    /*    `uvm_info("MON","Trans Received",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);*/
    
    end

  //end run phase
endtask : run_phase


function new(input string inst = "MON", uvm_component parent);
super.new(inst,parent);
item_collected_port = new("item_collected_port", this);
endfunction : new

endclass: Monitor0 

//////////////////////////////////////////// Monitor1 ///////////////////////////////////

class CoverageMonitor extends uvm_monitor;

`uvm_component_utils(CoverageMonitor)

//Interface Handler
virtual __IF vif;
//Analysis Port Handler
uvm_analysis_port #(Sequenceitem0) item_collected_port;
//Sequence Item Handler
Sequenceitem0 seqitem;

  //starting build phase
virtual function void build_phase (uvm_phase phase);
super.build_phase(phase);
   
   //Interface
   if(!uvm_config_db#(virtual __IF)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF","Interface Not Found");

   //Sequence Item
   seqitem = Sequenceitem0::type_id::create("seqItem",this);

  //end build phase
endfunction : build_phase


  //starting run phase
virtual task run_phase (uvm_phase phase);
    forever begin   
        @(negedge vif.clk);

        //monitoring
        seqitem.rst = vif.rst;
        seqitem.in_data = vif.in_data;
        seqitem.in_valid = vif.in_valid;        

        // write into port
        item_collected_port.write(seqitem);

     /*   `uvm_info("COV_MON","Trans Received",UVM_NONE)
                        seqitem.print(uvm_default_line_printer);*/
    end

  //end run phase
endtask : run_phase

function new(input string inst = "COV_MON", uvm_component parent);
super.new(inst,parent);
item_collected_port = new("item_collected_port", this);
endfunction : new

endclass: CoverageMonitor 

//////////////////////////////////////////// Agent ///////////////////////////////////
class Agent0 extends uvm_agent;

`uvm_component_utils(Agent0)

  //declaring agent components
  Driver0    drv;
  Sequencer0 seqr;
  Monitor0   mon;
  CoverageMonitor cov_mon;

  //starting build phase
virtual function void build_phase (uvm_phase phase);
super.build_phase(phase);

    //check if Agent is ACTIVE
if(get_is_active() == UVM_ACTIVE) begin
      drv = Driver0::type_id::create("drv", this);
      seqr = Sequencer0::type_id::create("seqr", this);
    end
    mon = Monitor0::type_id::create("mon", this);
    cov_mon = CoverageMonitor::type_id::create("cov_mon", this);


  //end build phase
endfunction : build_phase


  //starting connect phase
function void connect_phase(uvm_phase phase);

    //check if Agent is ACTIVE
    if(get_is_active() == UVM_ACTIVE) begin
      drv.seq_item_port.connect(seqr.seq_item_export);
    end

  //end connect phase
endfunction : connect_phase

function new(input string inst = "AGT", uvm_component parent);
super.new(inst,parent);
endfunction : new

endclass: Agent0 

//////////////////////////////////////////// Scoreboard ///////////////////////////////////

class Scoreboard0 extends uvm_scoreboard;

    `uvm_component_utils(Scoreboard0)
    
    uvm_analysis_imp #(Sequenceitem0,Scoreboard0) analysis_export;
    
    function new (string name = "Scoreboard0" , uvm_component parent = null);
        super.new(name,parent);  
        analysis_export = new("READ",this);    
    endfunction

    function void write(Sequenceitem0 t);

         /*Define Reference Model*/

        /*    `uvm_info("SCR","Trans Received",UVM_NONE)
                        t.print(uvm_default_line_printer);*/

    endfunction : write

endclass : Scoreboard0

//////////////////////////////////////////// Coverage //////////////////////////////////////
class Coverage0 extends uvm_subscriber #(Sequenceitem0);
	`uvm_component_utils(Coverage0)

	logic	[31:0]	in_data;
	logic				in_valid;

	 covergroup G1;
		 cov_in_data: coverpoint in_data { 
			 bins b0 = {0};
			 bins b1 = {1};
          bins b_sameBank = {32'd1000};
          bins b_diffBank = {32'hFFFFFFFF};
			 bins b_deposit ={2};
			 bins b_balance = {3};
			 bins b_pinChange = {4};          
			 bins b_password = {2000};
          bins b_depositAmount = {15000};

			}
		 cov_in_valid: coverpoint in_valid { 
          bins b_invalid0 = {0};
			 bins b_invalid1 = {1};
			}
	endgroup


	function new(string name = "Coverage0" ,  uvm_component parent = null);
		 super.new(name,parent);
		 // Covergroups Instantiation
		 G1 = new();
	endfunction: new

	function void write(Sequenceitem0 t);
		 in_data =  t.in_data;
		 in_valid =  t.in_valid;

		 G1.sample();
	endfunction : write

endclass : Coverage0

//////////////////////////////////////////// Environment ///////////////////////////////////
class Environment0 extends uvm_env;
	`uvm_component_utils(Environment0)

	function new(string name = "Environment0" ,  uvm_component parent = null);
		 super.new(name,parent);
	 endfunction: new

	Agent0			  ag;
	Scoreboard0		  scbd;
   Coverage0        cov;

	function void build_phase(uvm_phase phase);
 		 scbd = Scoreboard0::type_id::create("scbd",this);
 		 ag = Agent0::type_id::create("ag",this);
       cov = Coverage0::type_id::create("cov",this);
 		 set_config_int("ag", "is_active", UVM_ACTIVE);
	endfunction : build_phase

	function void connect_phase(uvm_phase phase);
 		 ag.mon.item_collected_port.connect(scbd.analysis_export);
       ag.cov_mon.item_collected_port.connect(cov.analysis_export);
	endfunction : connect_phase

endclass : Environment0

//////////////////////////////////////////// Generic Test ///////////////////////////////////
class Generic_Test extends uvm_test;

    `uvm_component_utils(Generic_Test)

    function new(string inst ="TEST",uvm_component c);
            super.new(inst,c);
    endfunction : new 
    
    Environment0 env;
    Generic_Sequence seq;

    virtual function void build_phase (uvm_phase phase);
        super.build_phase(phase);
         env   = Environment0::type_id::create("ENV",this);
    endfunction : build_phase

    virtual function void end_of_elaboration_phase(uvm_phase phase);
        uvm_top.print_topology();
    endfunction : end_of_elaboration_phase

    virtual task run_phase (uvm_phase phase);
        seq = Generic_Sequence::type_id::create("GEN",this);
        super.run_phase(phase);
        phase.raise_objection(this);
        seq.start(env.ag.seqr);
        phase.drop_objection(this);
    endtask: run_phase    

endclass: Generic_Test

//////////////////////////////////////////// Deposit Test ///////////////////////////////////
class deposit_test extends uvm_test;

    `uvm_component_utils(deposit_test)

    function new(string inst ="TEST",uvm_component c);
            super.new(inst,c);
    endfunction : new 
    
    Environment0 env;
    deposit_sequence seq;

    virtual function void build_phase (uvm_phase phase);
        super.build_phase(phase);
         env   = Environment0::type_id::create("ENV",this);
    endfunction : build_phase

    virtual function void end_of_elaboration_phase(uvm_phase phase);
        uvm_top.print_topology();
    endfunction : end_of_elaboration_phase

    virtual task run_phase (uvm_phase phase);
        seq = deposit_sequence::type_id::create("GEN",this);
        super.run_phase(phase);
        phase.raise_objection(this);
        seq.start(env.ag.seqr);
        phase.drop_objection(this);
    endtask: run_phase    

endclass: deposit_test

//////////////////////////////////////////// balance test  ///////////////////////////////////
class balance_test extends uvm_test;

    `uvm_component_utils(balance_test)

    function new(string inst ="TEST",uvm_component c);
            super.new(inst,c);
    endfunction : new 
    
    Environment0 env;
    balance_sequence seq;

    virtual function void build_phase (uvm_phase phase);
        super.build_phase(phase);
         env   = Environment0::type_id::create("ENV",this);
    endfunction : build_phase

    virtual function void end_of_elaboration_phase(uvm_phase phase);
        uvm_top.print_topology();
    endfunction : end_of_elaboration_phase

    virtual task run_phase (uvm_phase phase);
        seq = balance_sequence::type_id::create("GEN",this);

        super.run_phase(phase);
        phase.raise_objection(this);
        seq.start(env.ag.seqr);
        phase.drop_objection(this);
    endtask: run_phase    

endclass: balance_test

//////////////////////////////////////////// pinchange test  ////////////////////////////////////
class pinchange_test extends uvm_test;

    `uvm_component_utils(pinchange_test)

    function new(string inst ="TEST",uvm_component c);
            super.new(inst,c);
    endfunction : new 
    
    Environment0 env;
    pinchange_sequence seq;

    virtual function void build_phase (uvm_phase phase);
        super.build_phase(phase);
         env   = Environment0::type_id::create("ENV",this);
    endfunction : build_phase

    virtual function void end_of_elaboration_phase(uvm_phase phase);
        uvm_top.print_topology();
    endfunction : end_of_elaboration_phase

    virtual task run_phase (uvm_phase phase);
        seq = pinchange_sequence::type_id::create("GEN",this);

        super.run_phase(phase);
        phase.raise_objection(this);
        seq.start(env.ag.seqr);
        phase.drop_objection(this);
    endtask: run_phase    

endclass: pinchange_test

//////////////////////////////////////////// withdraw test  ////////////////////////////////////
class withdraw_test extends uvm_test;

    `uvm_component_utils(withdraw_test)

    function new(string inst ="TEST",uvm_component c);
            super.new(inst,c);
    endfunction : new 
    
    Environment0 env;
    withdraw_sequence seq;

    virtual function void build_phase (uvm_phase phase);
        super.build_phase(phase);
         env   = Environment0::type_id::create("ENV",this);
    endfunction : build_phase

    virtual function void end_of_elaboration_phase(uvm_phase phase);
        uvm_top.print_topology();
    endfunction : end_of_elaboration_phase

    virtual task run_phase (uvm_phase phase);
        seq = withdraw_sequence::type_id::create("GEN",this);

        super.run_phase(phase);
        phase.raise_objection(this);
        seq.start(env.ag.seqr);
        phase.drop_objection(this);
    endtask: run_phase    

endclass: withdraw_test
//////////////////////////////////////////// Cross test  ////////////////////////////////////
class cross_test extends uvm_test;

    `uvm_component_utils(cross_test)

    function new(string inst ="TEST",uvm_component c);
            super.new(inst,c);
    endfunction : new 
    
    Environment0 env;
    cross_sequence seq;

    virtual function void build_phase (uvm_phase phase);
        super.build_phase(phase);
         env   = Environment0::type_id::create("ENV",this);
    endfunction : build_phase

    virtual function void end_of_elaboration_phase(uvm_phase phase);
        uvm_top.print_topology();
    endfunction : end_of_elaboration_phase

    virtual task run_phase (uvm_phase phase);
        seq = cross_sequence::type_id::create("GEN",this);

        super.run_phase(phase);
        phase.raise_objection(this);
        seq.start(env.ag.seqr);
        phase.drop_objection(this);
    endtask: run_phase    

endclass: cross_test
//////////////////////////////////////////// Virtual sequence test  ////////////////////////////////////
class virtual_sequence_test extends uvm_test;

    `uvm_component_utils(virtual_sequence_test)

    function new(string inst ="TEST",uvm_component c);
            super.new(inst,c);
    endfunction : new 
    
    Environment0 env;
    virtual_sequence seq;

    virtual function void build_phase (uvm_phase phase);
        super.build_phase(phase);
         env   = Environment0::type_id::create("ENV",this);
    endfunction : build_phase

    virtual function void end_of_elaboration_phase(uvm_phase phase);
        uvm_top.print_topology();
    endfunction : end_of_elaboration_phase

    virtual task run_phase (uvm_phase phase);
        seq = virtual_sequence::type_id::create("GEN",this);

        super.run_phase(phase);
        phase.raise_objection(this);
        seq.sequencer = env.ag.seqr;
        seq.start(null);
        phase.drop_objection(this);
    endtask: run_phase    

endclass: virtual_sequence_test

//////////////////////////////////////////// Test Module ///////////////////////////////////
//`include "ATM_FSM_Final.sv"
module Top;
   
   __IF vif();

   ATM_FSM_Final DUT(

    .clk(vif.clk),
   
    .rst(vif.rst),
    
    .in_data(vif.in_data),
    
    .in_valid(vif.in_valid),
    
    .disp_sig(vif.disp_sig),
    
    .data_valid(vif.data_valid),
                             
    .out_data(vif.out_data)
                                       
   );
     
   initial begin  
        
        vif.clk = 1; //posedge
        
   end
   
        always #10.0 vif.clk = ~vif.clk;
        
        
      initial
        begin
                $dumpfile("ART_PRJ.vcd") ;       
                $dumpvars; 
                uvm_config_db#(virtual __IF)::set(null,"*","vif",vif);
                run_test("Generic_Test"); 
        end

endmodule

   
        
   