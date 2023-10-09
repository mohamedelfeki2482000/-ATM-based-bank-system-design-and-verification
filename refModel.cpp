#include <iostream>
#include <svdpi.h>

enum states {
IDLE,
LANG,
PIN,
OPTION,
ANTHR_OP,
CARD_EXIT,
};

enum options_states {
MAIN,
WITHDRAW,
DEPOSIT,
BALANCE_INQUIRY,
PIN_CHANGE,
};

enum deposit_states {
//IDLE_DEPOSIT,
INSERT_CASH=1, //for fast cash
CONFIRM,
RETURN_CASH,
UPDATE_BALANCE,
FINISH_DEPOSIT,
};

enum withdraw_states{
//IDLE_WITHDRAW,
WITHDRAW_TYPE=1,
CONFIRM_AMOUNT,
AMOUNT_CHECKS,
Money_Dispense_Delay,
Receipt,
Receipt_Print_Delay,
FINISH_WITHDRAW,
};

enum pin_states{
//IDLE_PIN,
ENTER_PIN=1,
RE_ENTER_PIN,
};

enum balance_inq_states{
//IDLE_INQ,
DISP_BALANCE=1, //0 no_receipt -- 1 receipt
RECEIPT_ASK,
RECEIPT_OUT,
FINISH_INQ,
};
//-----------------------------------------------------------------//
extern "C" struct ATMout {
    int disp_sig;
    int out_data;
    bool out_valid;

};
//-----------------------------------------------------------------//

states current_main_state=IDLE;
options_states current_options_state=MAIN;
deposit_states current_deposit_state=INSERT_CASH;
withdraw_states current_withdraw_state=WITHDRAW_TYPE;
pin_states current_pin_state=ENTER_PIN;
balance_inq_states current_balance_state=DISP_BALANCE;

bool same_bank;
//-----------------------------------------------------------------//
int memo_account1=1000;
int memo_pin1=2000;
int memo_balance=1000;
int temp_pin = memo_pin1;
int temp_deposit;
int temp_withdraw;
int temp_receipt;
int bank_withdrawal_limit=1000;
int counter=0;

//-----------------------------------------------------------------//
//-----------------------------------------------------------------//
//-----------------------------------------------------------------//

extern "C" int test(bool rst, bool valid_in, int data_in){
    struct ATMout x;
 //-----------------------------------------------------------------//
    if (!(rst))
    {
        std::cout << "reset!" << std::endl;
        current_main_state=IDLE;
        current_options_state=MAIN;
        current_deposit_state=INSERT_CASH;
        current_withdraw_state=WITHDRAW_TYPE;
        current_pin_state=ENTER_PIN;
        current_balance_state=DISP_BALANCE;
        counter=0;
        temp_receipt=0;

        x.disp_sig=0;
        std::cout << "Entry Message" << std::endl;
        x.out_data=0;
        x.out_valid=false;
    }
//-----------------------------------------------------------------//
//-----------------------------------------------------------------//
    else
    {
        switch (current_main_state) {

          case 0: //idle
            std::cout << "Bank Number!" << std::endl;
            x.disp_sig=0;
            std::cout << "Entry Message" << std::endl;
            if(valid_in){
            	        counter = counter + 1;
            	        if ( counter == 2 )
            	        {
                            current_main_state=LANG;
            	        	counter = 0;
            	        }
                        unsigned  mask;
                        int want_last_bits = 2 ;
                        int lastXbits ;
                        mask = (1 << want_last_bits) - 1;
                        lastXbits = data_in & mask;
                        same_bank = lastXbits > 0 ? false : true;          //CHECK
                        //x.disp_sig=1;
                        //std::cout << "Language select" << std::endl;
                        x.out_data=0;
                        x.out_valid=false;
                        }
            else{
                current_main_state=IDLE;
                //x.disp_sig=0;
                //std::cout << "Entry Message" << std::endl;
                x.out_data=0;
                x.out_valid=false;
                std::cout << "idle! no card" << std::endl;
            }

            break;

        //-----------------------------------------------------------------//
          case 1: //language
            std::cout << "language!" << std::endl;
            x.disp_sig=1;
            std::cout << "Language select" << std::endl;
            if(valid_in){
                //x.disp_sig=2;
                //std::cout << "Enter PIN" << std::endl;
                x.out_data= data_in==1 ? 1 : 0;
                x.out_valid=true;
                current_main_state=PIN;

            }
            else{
                current_main_state=LANG;
                //x.disp_sig=1;
                //std::cout << "Language select" << std::endl;
                x.out_data=0;
                x.out_valid=false;

            }

            break;

        //-----------------------------------------------------------------//
          case 2: //pin
            std::cout << "pin!" << std::endl;
            x.disp_sig=2;
            std::cout << "Enter PIN" << std::endl;
             if(valid_in){
               		std:: cout<<data_in<<std::endl;
                    if(data_in==memo_pin1){
                        current_main_state=OPTION;
                        //x.disp_sig=3;
                        //std::cout << "Select option" << std::endl;
                        x.out_data=0;
                        x.out_valid=false;
                    }
                    else{
                        current_main_state=CARD_EXIT;
                        x.disp_sig=6;
                        std::cout << "Invalid PIN" << std::endl;
                        x.out_data=0;
                        x.out_valid=false;
                    }

            }
            else{
                current_main_state=PIN;
                //x.disp_sig=2;
                //std::cout << "Enter PIN" << std::endl;
                x.out_data=0;
                x.out_valid=false;
            }

            break;

        //-----------------------------------------------------------------//
          case 3: //option choice
            std::cout << "option!" << std::endl;
            //bool done;
            switch(current_options_state){
                case 0: //MAIN
                    std::cout << "main option!" << std::endl;
                    current_options_state=static_cast<options_states>(data_in);
                    x.disp_sig=3;
                    std::cout << "Select option" << std::endl;

                    break;

                //-----------------------------------------------------------------//
                case 1: //WITHDRAW
                    std::cout << "withdraw option!" << std::endl;
                    switch(current_withdraw_state){
                    case 1: //WITHDRAW_TYPE
                        std::cout << "WITHDRAW_TYPE!" << std::endl;
                        x.disp_sig=14;
                        std::cout << "Choose regular or fast cash" << std::endl;
                        x.out_valid=0;
                        x.out_data=0;
                        if(valid_in){
                            current_withdraw_state=CONFIRM_AMOUNT;
                        }
                        else {
                            current_withdraw_state=WITHDRAW_TYPE;
                        }

                        break;
                    case 2: //CONFIRM_AMOUNT
                        std::cout << "CONFIRM_AMOUNT!" << std::endl;
                        x.out_valid=0;
                        x.out_data=0;
                        std:: cout << data_in << std::endl;
                        if(data_in){
                            x.disp_sig=16;
                            std::cout << "Enter the number corresponding to your chosen amount:" << std::endl;
                            if(valid_in){
                                current_withdraw_state=AMOUNT_CHECKS;
                            }
                            else {
                                current_withdraw_state=CONFIRM_AMOUNT;
                            }

                        }
                        else {
                            x.disp_sig=15;
                            std::cout << "Enter the amount" << std::endl;
                               if(valid_in){
                                current_withdraw_state=AMOUNT_CHECKS;
                            }
                            else {
                                current_withdraw_state=CONFIRM_AMOUNT;
                            }

                        }

                        break;
                    case 3: //AMOUNT_CHECKS
                        std::cout << "AMOUNT_CHECKS!" << std::endl;
                        temp_withdraw=data_in;
                        if(same_bank){
                            if(temp_withdraw>memo_balance){
                                x.out_data=0;
                                x.out_valid=0;
                                x.disp_sig=20;
                                std::cout << "Exceeds Balance's Withdrawal Limit" << std::endl;
                                current_withdraw_state=CONFIRM_AMOUNT;
                            }
                            else if(temp_withdraw>bank_withdrawal_limit){
                                x.out_data=0;
                                x.out_valid=0;
                                x.disp_sig=21;
                                std::cout << "Exceeds Bank's Withdrawal Limit" << std::endl;
                                current_withdraw_state=CONFIRM_AMOUNT;
                            }
                            else {
                                x.out_data=temp_withdraw;
                                x.out_valid=1;
                                x.disp_sig=13;
                                std::cout << "Transaction being processed" << std::endl;
                                current_withdraw_state=Money_Dispense_Delay;
                            }
                        }
                        else {
                            if(temp_withdraw+5>memo_balance){
                                x.out_data=0;
                                x.out_valid=0;
                                x.disp_sig=20;
                                std::cout << "Exceeds Balance's Withdrawal Limit" << std::endl;
                                current_withdraw_state=CONFIRM_AMOUNT;
                            }
                            else if(temp_withdraw+5>bank_withdrawal_limit){
                                x.out_data=0;
                                x.out_valid=0;
                                x.disp_sig=21;
                                std::cout << "Exceeds Bank's Withdrawal Limit" << std::endl;
                                current_withdraw_state=CONFIRM_AMOUNT;
                            }
                            else {
                                x.out_data=temp_withdraw;
                                x.out_valid=1;
                                x.disp_sig=13;
                                std::cout << "Transaction being processed" << std::endl;
                                current_withdraw_state=Money_Dispense_Delay;
                            }

                        }
                        break;
                    case 4: //Money_Dispense_Delay
                        std::cout << "Money_Dispense_Delay!" << std::endl;
                        x.out_data=0;
                        x.out_valid=0;
                        x.disp_sig=13;
                        std::cout << "Transaction being processed" << std::endl;
                        counter=counter+1;
                        if(counter==9){
                            current_withdraw_state=Receipt;
                            counter=0;
                        }
                        else{
                            current_withdraw_state=Money_Dispense_Delay;
                        }
                        //counter=counter+1;

                        break;
                    case 5: //Receipt
                        std::cout << "Receipt!" << std::endl;
                        x.out_data=0;
                        x.out_valid=0;
                        x.disp_sig=17;
                        std::cout << "Do you want a receipt ?" << std::endl;
                        if(valid_in){
                           current_withdraw_state=Receipt_Print_Delay;
                           temp_receipt=data_in;
                        }
                        else{
                           current_withdraw_state=Receipt;
                        }
                        break;
                    case 6: //Receipt_Print_Delay
                        std::cout << "Receipt_Print_Delay!" << std::endl;
                        if(temp_receipt){
                            x.out_data=temp_withdraw;
                            x.out_valid=1;
                            if(same_bank){
                                x.disp_sig=18;
                                std::cout << "Withdrawn Amount is: (withdrawn_amount)" << std::endl;
                            }
                            else {
                                x.disp_sig=19;
                                std::cout << "Withdrawn Amount is: (withdrawn_amount), Tax is: 5" << std::endl;
                            }

                            counter=counter+1;
                            if(counter==8){
                                current_withdraw_state=FINISH_WITHDRAW;
                                counter=0;
                            }
                            else{
                                current_withdraw_state=Receipt_Print_Delay;
                            }
                        }
                        else{
                            x.out_data=temp_withdraw;
                            x.out_valid=1;
                            if(same_bank){
                                x.disp_sig=18;
                                std::cout << "Withdrawn Amount is: (withdrawn_amount)" << std::endl;
                            }
                            else {
                                x.disp_sig=19;
                                std::cout << "Withdrawn Amount is: (withdrawn_amount), Tax is: 5" << std::endl;
                            }
                            current_withdraw_state=FINISH_WITHDRAW;
                        }


                        break;
                    case 7: //FINISH_WITHDRAW
                        std::cout << "FINISH_WITHDRAW!" << std::endl;
                            x.out_data=temp_withdraw;
                            x.out_valid=1;
                            if(same_bank){
                                x.disp_sig=18;
                                std::cout << "Withdrawn Amount is: (withdrawn_amount)" << std::endl;
                            }
                            else {
                                x.disp_sig=19;
                                std::cout << "Withdrawn Amount is: (withdrawn_amount), Tax is: 5" << std::endl;
                            }
                            current_withdraw_state=WITHDRAW_TYPE;
                            current_main_state=ANTHR_OP;
                        break;

                    default:
                        std::cout << "Invalid withdraw input!" << std::endl;
                        break;
                    }

                    break;

                //-----------------------------------------------------------------//
                case 2: //DEPOSIT
                    std::cout << "deposit option!" << std::endl;
                    //current_deposit_state=static_cast<deposit_states>(data_in);
                    switch(current_deposit_state){
                    /*case 0: //IDLE_DEPOSIT

                        break;*/
                    case 1: //INSERT_CASH
                        std::cout << "Insert cash!" << std::endl;
                        x.disp_sig=8;
                        std::cout << "Enter cash to the door" << std::endl;
                        x.out_data=0;
                        x.out_valid=0;

                        temp_deposit=data_in;
                        counter=counter+1;
                            if(counter==8){
                                current_deposit_state=CONFIRM;
                                counter=0;
                            }
                            else{
                                current_deposit_state=INSERT_CASH;
                            }
                        break;
                    case 2: //CONFIRM
                        std::cout << "Confirm cash!" << std::endl;
                        x.disp_sig=9;
                        std::cout << "Confirm amount" << std::endl;
                        x.out_data=temp_deposit;
                        x.out_valid=1;
                        if(valid_in){
                            if(data_in){
                                current_deposit_state=UPDATE_BALANCE;
                            }
                            else {
                                current_deposit_state=RETURN_CASH;
                            }
                        }
                        else{
                            current_deposit_state=CONFIRM;
                        }
                        break;
                    case 3: //RETURN_CASH
                        std::cout << "Return cash!" << std::endl;
                        x.disp_sig=10;
                        std::cout << "Please take your cash" << std::endl;
                        x.out_data=temp_deposit;
                        x.out_valid=1;
                        counter=counter+1;
                        if(counter==8){
                             current_deposit_state=INSERT_CASH;
                             counter=0;
                          }
                        else{
                             current_deposit_state=RETURN_CASH;
                        }
                        break;
                    case 4: //UPDATE_BALANCE
                        std::cout << "Update balance!" << std::endl;
                        x.disp_sig=11;
                        std::cout << "Your deposit has been accepted your balance = (money here $)" << std::endl;
                        memo_balance=memo_balance+temp_deposit;
                        x.out_data=memo_balance;
                        x.out_valid=1;
                        current_deposit_state=FINISH_DEPOSIT;
                        break;
                    case 5: //FINISH_DEPOSIT
                        std::cout << "Finish deposit!" << std::endl;
                        x.disp_sig=11;
                        std::cout << "Your deposit has been accepted your balance = (money here $)" << std::endl;
                        x.out_data=memo_balance;
                        x.out_valid=1;
                        current_deposit_state=INSERT_CASH;
                        current_main_state=ANTHR_OP;
                        break;
                    default:
                        std::cout << "Invalid deposit input!" << std::endl;
                        break;
                    }

                break;

            //-----------------------------------------------------------------//
            case 3: //BALANCE_INQUIRY
                std::cout << "balance inquiry option!" << std::endl;
                switch(current_balance_state){
                /*case 0: //IDLE_INQ
                    current_balance_state=DISP_BALANCE;
                    x.disp_sig=0;
                    x.out_data=0;
                    x.out_valid=false;
                    break;*/
                case 1: //DISP_BALANCE, //0 no_receipt -- 1 receipt
                    std::cout << "display balance!" << std::endl;
                    current_balance_state=RECEIPT_ASK;
                    x.disp_sig=12;
                    std::cout << "Current balance = ()" << std::endl;
                    x.out_data=memo_balance;
                    x.out_valid=true;
                    break;

                case 2: //RECEIPT_ASK
                    std::cout << "receipt ask!" << std::endl;
                    x.disp_sig=17;
                    std::cout << "Do you want a receipt?" << std::endl;
                    x.out_data=0;
                    x.out_valid=false;
                    if(valid_in){
                        if(data_in){
                            current_balance_state=RECEIPT_OUT;
                        }
                        else {
                            current_balance_state=FINISH_INQ;
                        }
                    }
                    else {
                        current_balance_state=RECEIPT_ASK;
                    }

                    break;
                case 3: //RECEIPT_OUT
                    std::cout << "receipt out!" << std::endl;
                    x.disp_sig=13;
                    std::cout << "Transaction being processed" << std::endl;
                    x.out_data=memo_balance;
                    x.out_valid=true;
                    counter=counter+1;
                    if(counter==8){
                       current_balance_state=FINISH_INQ;
                       counter=0;
                    }
                    else{
                       current_balance_state=RECEIPT_OUT;
                    }
                    break;
                case 4: //FINISH_INQ
                    std::cout << "finish inquiry!" << std::endl;
                    current_balance_state=DISP_BALANCE;
                    current_main_state=ANTHR_OP;
                    x.disp_sig=4;
                    std::cout << "Another transaction" << std::endl;
                    x.out_data=0;
                    x.out_valid=false;

                    break;


                default:
                    std::cout << "Invalid balance inquiry input!" << std::endl;
                    break;
                }
                break;

            //-----------------------------------------------------------------//
            case 4: //PIN_CHANGE
                std::cout << "pin change option!" << std::endl;
               // temp_pin=memo_pin1;
                switch(current_pin_state){
                /*case 0: //IDLE_PIN
                    current_pin_state=ENTER_PIN;
                    x.disp_sig=2;
                    x.out_data=0;
                    x.out_valid=0;
                    break;*/
                case 1: //ENTER_PIN
                    x.disp_sig=25;
                    std::cout << "enter new pin" << std::endl;
                    x.out_data=0;
                    x.out_valid=0;
                    if(valid_in){
                        current_pin_state=RE_ENTER_PIN;

                        temp_pin=data_in;
                    }
                    else{
                        current_pin_state=ENTER_PIN;
                    }

                    break;
                case 2: //RE_ENTER_PIN
                    x.disp_sig=23;
                    std::cout << "re-enter new pin" << std::endl;
                    if(valid_in){
                            std::cout <<temp_pin<<std::endl;
                            std::cout <<data_in<<std::endl;
                            if(data_in==temp_pin){
                                memo_pin1=temp_pin;
                                //current_main_state=ANTHR_OP;
                                //current_pin_state=ENTER_PIN;
                                //x.disp_sig=13;
                                //sleep_for(100ns);
                                //x.disp_sig=24;
                                x.out_data=0;
                                x.out_valid=0;
                                counter=counter+1;
                                if(counter==10){
                                    current_main_state=ANTHR_OP;
                                    current_pin_state=ENTER_PIN;
                                    x.disp_sig=24;
                                    std::cout << "PIN had changed" << std::endl;
                                    counter=0;
                                }
                                else{
                                    current_balance_state=RECEIPT_OUT;
                                    if(counter > 1)
                                    	x.disp_sig=13;
                                    std::cout << "Transaction being processed" << std::endl;
                                }
                            }
                            else {
                                current_pin_state=ENTER_PIN;
                                temp_pin=memo_pin1;
                                x.disp_sig=6;
                                std::cout << "Invalid PIN" << std::endl;
                                x.out_data=0;
                                x.out_valid=0;
                            }

                    }
                    else {
                       current_pin_state=RE_ENTER_PIN;
                        x.disp_sig=23;
                        std::cout << "RE-Enter PIN" << std::endl;
                        x.out_data=0;
                        x.out_valid=0;
                    }
                    break;
                default:
                    std::cout << "Invalid pin change input!" << std::endl;
                    break;
                }
                break;

            default: //default of options
                current_main_state=OPTION;
                x.disp_sig=3;
                x.out_data=0;
                x.out_valid=false;
                break;
            }
            break;

          //-----------------------------------------------------------------//
          case 4: //another option
            std::cout << "another option!" << std::endl;
            x.disp_sig=4;
            std::cout << "Another transaction?" << std::endl;
            if(valid_in){
                    if(data_in){
                        current_main_state=OPTION;
                        //x.disp_sig=3;
                        //std::cout << "Select option" << std::endl;
                        x.out_data=0;
                        x.out_valid=false;
                    }
                    else{
                        current_main_state=CARD_EXIT;
                        //x.disp_sig=5;
                        //std::cout << "Thank you for you service" << std::endl;
                        x.out_data=0;
                        x.out_valid=false;
                    }

            }
            else{
                current_main_state=ANTHR_OP;
                //x.disp_sig=4;
                //std::cout << "Another transaction?" << std::endl;
                x.out_data=0;
                x.out_valid=false;
            }

            break;

          //-----------------------------------------------------------------//
          case 5: //card exit
            std::cout << "card exit!" << std::endl;
            current_main_state=IDLE;
            x.disp_sig=5;
            std::cout << "Thank you for you service" << std::endl;
            x.out_data=0;
            x.out_valid=false;
            break;

          //-----------------------------------------------------------------//
          default:
            std::cout << "Invalid main input!" << std::endl;
            break;

         //-----------------------------------------------------------------//
    }
}
return x.disp_sig;
};

